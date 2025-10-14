{ pkgs, ... }:

{
  # GPU
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  environment.variables.AMD_VULKAN_ICD = "RADV";
  environment.systemPackages = with pkgs; [ amdgpu_top ];
  services.lact.enable = true;
  
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  
  # overclock
  hardware.amdgpu.overdrive.enable = true;
}
