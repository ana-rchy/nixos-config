{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    terminus_font
    terminus_font_ttf
    nerd-fonts.terminess-ttf
  ];
}
