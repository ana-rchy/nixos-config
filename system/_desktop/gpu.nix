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
  
  services.xserver.videoDrivers = [ "modesetting"  ];
  
  hardware.nvidia = {
    open = true;
    # modesetting = true;
    
    # prime = {
    #   offload.enable = true;
    #   offload.enableOffloadCmd = true;
    #
    #   # amdgpuBusId = "PCI:82@0:0:0";
    #   intelBusId = "PCI:3@0:0:0";
    #   nvidiaBusId = "PCI:5@0:0:0";
    # };
  };
}


