{ pkgs, ... }:

{
  programs.zsh.shellInit = ''
    export GTK_IM_MODULE="fcitx"
    export QT_IM_MODULE="fcitx"
    export SDL_IM_MODULE="fcitx"
    export XMODIFIERS="@im=fcitx"
  '';
  
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
}
