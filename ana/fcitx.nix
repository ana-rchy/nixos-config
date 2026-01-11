{ pkgs, ... }:

{
  programs.zsh.envExtra = ''
    GTK_IM_MODULE="fcitx"
    QT_IM_MODULE="fcitx"
    SDL_IM_MODULE="fcitx"
    XMODIFIERS="@im=fcitx"
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
