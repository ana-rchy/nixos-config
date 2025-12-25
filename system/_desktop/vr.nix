{ pkgs, ... }:

{
  services.monado = {
    enable = true;
    
    defaultRuntime = true;
    forceDefaultRuntime = true;
    
    highPriority = true;
  };

  environment.systemPackages = with pkgs; [
    opencomposite
    wlx-overlay-s
  ];
}
