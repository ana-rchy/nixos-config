{ pkgs, ... }:

{
  services.monado = {
    enable = true;
    defaultRuntime = true;
    highPriority = true;
  };
  
  environment.systemPackages = with pkgs; [
    wlx-overlay-s
  ];
}
