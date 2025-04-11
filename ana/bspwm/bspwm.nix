{
  xsession.windowManager.bspwm = {
    enable = true;
    
    settings = {
      border_width = 0;
      window_gap = 12;
      split_ratio = 0.5;
      borderless_monocle = true;
      gapless_monocle = true;
    };
    
    startupPrograms = [
      "feh --bg-fill /home/ana/sitelen/sinpin/refuge_extended.png"
      "polybar all"
      "picom"
    ];
  };
}
