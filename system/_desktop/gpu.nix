{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      
      intel-compute-runtime
    ];
  };
  
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  
  services.xserver.videoDrivers = [ "modesetting" ];
  
  boot.kernelParams = [ "module_blacklist=amdgpu" ];
}


