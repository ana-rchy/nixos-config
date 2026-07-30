{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
  
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];
}
