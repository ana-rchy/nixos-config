{
  programs.rofi = {
    enable = true;

    font = "Terminus bold 17";
    location = "center";

    extraConfig = {
      modi = "window,drun";
      lines = 12;
      padding = 5;
      fixed-num-lines = true;
      sort = true;
      case-sensitive = false;
      cycle = true;
      sidebar-mode = false;
      eh = 1;
      combi-modi = "window,drun";
      line-margin = 1;
      line-padding = 2;
      scroll-method = 1;
      normalize-match = true;

      dpi = 120;
    };

    theme = "/etc/nixos/ana/rofi/oneshot.rasi";
  };
}
