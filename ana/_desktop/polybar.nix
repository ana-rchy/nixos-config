let
  transparent = "#00000000";
  yellow = "#f3e54b";
in
{
  services.polybar.settings = {
    "bar/all" = {
      monitor = "DP-4";
      
      modules-right = "tray pulseaudio";
      font = [ "Terminus:style=Bold:size=18;0" ];
    };
    
    "bar/second-monitor" = {
      monitor = "DP-0";
      
      font = [ "Terminus:style=Bold:size=18;0" ];
      
      bottom = false;
      fixed-center = true;

      width = "100%";
      offset-y = 6;
      padding = 2;

      background = transparent;
      foreground = yellow;

      modules-left = "date";
      modules-center = "bspwm";

      module-margin = 1;

      wm-restack = "bspwm";
    };
  };
}
