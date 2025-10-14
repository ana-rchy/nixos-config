{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      olympus
    ];
  };
  
  xdg.desktopEntries."Celeste" = {
    name = "Celeste";
    icon = "Celeste";
    exec = "steam-run /home/ana/musi/ale/Celeste/Celeste";
    categories = [ "Game" ];
  };
}
