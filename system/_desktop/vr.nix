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
    # wayvr
  ];
  
  systemd.user.services.monado.environment = {
    WMR_HANDTRACKING = "0";
  };
}
