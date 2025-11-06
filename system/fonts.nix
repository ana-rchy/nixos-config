{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    terminus_font
    terminus_font_ttf
    nerd-fonts.terminess-ttf
  ];
  
  # hack fix for bitmap fonts not being included by default
  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <description>Accept bitmap fonts</description>
    <!-- Accept bitmap fonts -->
     <selectfont>
      <acceptfont>
       <pattern>
         <patelt name="outline"><bool>false</bool></patelt>
       </pattern>
      </acceptfont>
     </selectfont>
    </fontconfig>
  '';
}
