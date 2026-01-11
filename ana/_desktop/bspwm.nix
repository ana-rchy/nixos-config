{
  xsession.windowManager.bspwm = {
    monitors = {
      DP-2 = [ "o" "n" "e" "s" "h" "o" "t" "n" "i" "k" "o" ];
      DP-3 = [ "w​" "o​" "a​" "h​" ];
    };
    
    startupPrograms = [
      "xrandr --output DP-2 --mode 1920x1080 --rate 240 --output DP-3 --mode 1920x1080 --rate 144 --right-of DP-2"
      "polybar all"
      "polybar second-monitor"
    ];
  };
}
