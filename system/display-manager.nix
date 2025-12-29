{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember";
        user = "greeter";
      };
    };
  };
  
  services.xserver.displayManager.startx.enable = true;
}
