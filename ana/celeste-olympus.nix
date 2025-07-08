{ pkgs-olympus, ... }:

{
  home = {
    packages = [
      pkgs-olympus.olympus
    ];
    
    sessionVariables = {
      OLYMPUS_CELESTE_WRAPPER = "steam-run";
    };
  };
  
  xdg.desktopEntries."Celeste" = {
    name = "Celeste";
    icon = "Celeste";
    exec = "steam-run /home/ana/musi/ale/Celeste/Celeste";
    categories = [ "Game" ];
  };
}
