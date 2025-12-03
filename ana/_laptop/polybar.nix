{
  services.polybar = {
    settings."bar/all" = {
      modules-right = "tray pulseaudio battery";
      font = [ "Terminus:style=Bold:size=18;0" ];
    };
    
    script = "killall polybar; polybar all &";
  };
}
