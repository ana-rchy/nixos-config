{ pkgs, ... }:

let
  transparent = "#00000000";
  yellow = "#f3e54b";
  blue = "#00ffa3";
  red-pink = "#ff005c";
in
{
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      pulseSupport = true;
    };
    
    settings = {
      settings.pseudo-transparency = true;

      "bar/all" = {
        bottom = false;
        fixed-center = true;

        width = "100%";
        offset-y = 6;
        padding = 2;

        background = transparent;
        foreground = yellow;

        modules-left = "cpu memory";
        modules-center = "date bspwm";

        module-margin = 1;

        wm-restack = "bspwm";
      };

      
      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;

        format = "<label>";
        label = "cpu %percentage%% -";
        label-warn = "HOT %percentage%% -";
      };
      
      "module/memory" = {
        type = "internal/memory";
        interval = 2;

        format = "<label>";
        label = "- ram %gb_used%/%gb_free%";
        label-warn = "- FUC %gb_used%/%gb_free%";
      };


      "module/date" = {
        type = "internal/date";
        interval = 1.0;
        
        date = "%d/%m/%Y";
        time = "%I:%M %P";
        
        date-alt = "%A, %d %B %Y";
        time-alt = "%r";
        
        format = "<label>";
        label = "%time% | %date%";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        pin-workspaces = true;
        
        enable-click = true;
        enable-scroll = true;
        reverse-scroll = false;
        occupied-scroll = false;
        
        label-focused = "%name%";
        label-focused-foreground = blue;
        label-focused-padding = 2;
        
        label-occupied = "%name%";
        label-occupied-foreground = yellow;
        label-occupied-padding = 1;
        
        label-urgent = "!";
        label-urgent-background = red-pink;
        label-urgent-padding = 1;
        
        label-empty = "%name%";
        label-empty-foreground = red-pink;
        label-empty-padding = 1;
      };


      "module/tray" = {
        type = "internal/tray";

        tray-size = 20;
        tray-spacing = 2;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        use-ui-max = false;
        interval = 1;
        
        format-volume = "<label-volume> <bar-volume>";
        format-muted = "<label-muted>";
        
        label-volume = "%percentage%%";
        
        label-muted = "muted";
        label-muted-foreground = red-pink;
        
        bar-volume-width = 10;
        bar-volume-empty = "-";
        bar-volume-fill = "-";
        bar-volume-indicator = "|";
        
        click-right = "pavucontrol";
      };

      "module/battery" = {
        type = "internal/battery";

        battery = "BAT0";
        adapter = "ADP1";

        label-charging-foreground = blue;
        label-discharging-foreground = yellow;
        label-low = red-pink;

        poll-interval = 1;
      };
    };

    script = "killall polybar; polybar all &";
  };
}
