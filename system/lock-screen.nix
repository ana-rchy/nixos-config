{ pkgs, ... }:

{
  programs = {
    i3lock = {
      enable = true;
      package = pkgs.i3lock-color;
    };
    
    xss-lock = {
      enable = true;
      lockerCommand = ''
        ${pkgs.i3lock-color}/bin/i3lock-color \
          -e --composite \
          -i /etc/nixos/images/lock-screen.png \
          \
          --bar-indicator \
          --force-clock \
          \
          --bar-color=090909 --keyhl-color=00ffa3 --bshl-color=ff005c --ringver-color=f3e54b --ringwrong-color=7c5bff \
          --time-color=ffffff --date-color=ffffff --verif-color=ffffff --wrong-color=ffffff \
          ''+/******************************************************/''
          --timeoutline-color=bababa66 --dateoutline-color=bababa66 \
          --verifoutline-color=bababa66 --wrongoutline-color=bababa66 \
          \
          --noinput-text='meow?' \
          \
          --time-font='Terminus (TTF):style=Bold' --date-font='Terminus (TTF):style=Bold' \
          --verif-font='Terminus (TTF):style=Bold' --wrong-font='Terminus (TTF):style=Bold' \
          \
          --time-size=55 --date-size=20 --verif-size=50 --wrong-size=50 \
          --timeoutline-width=3 --dateoutline-width=2 --verifoutline-width=3 --wrongoutline-width=3 \
          \
          --ind-pos='w/2:80' --time-pos='w/2:h-12' --date-pos='w/2:ty-50'
        '';
    };
  };
}
