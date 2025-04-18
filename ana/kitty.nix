{ pkgs, ...}:

let
  red-pink = "#ff005c";
  dark-red-pink = "#821a3d";
  very-dark-red-pink = "#170007";

  pastel-yellow = "#fffca9";
  yellow = "#fffe57";
  
  teal = "#00ffa3";

  kitty_mod = "alt";
in
{
  programs.kitty = {
    font.name = "Terminus (TTF)";

    settings = {
      background = very-dark-red-pink;
      foreground = pastel-yellow;

      cursor = red-pink;
      cursor_text_color = dark-red-pink;

      selection_foreground = yellow;
      selection_background = red-pink;

      url_style = "curly";
      url_color = teal;

      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.3";

      window_padding_width = "5 10";
      window_border_width = 0;
      hide_window_decorations = "yes";

      confirm_os_window_close = 0;
      wheel_scroll_multiplier = 2.0;
      strip_trailing_spaces = "smart";
      enable_audio_bell = false;

      ###: black
      color0 = "#573e4b";
      color8 = "#30111d";
      
      ###: red
      color1 = "#f9689b";
      color9 = "#ff005c";
      
      ###: green
      color2 = "#7bfeb4";
      color10  = "#38eb75";
      
      ###: yellow
      color3  = "#fffe8b";
      color11 = "#fffe32";
      
      ###: blue
      color4 = "#639cf1";
      color12  = "#4545e4";
      
      ###: magenta
      color5 = "#af8ff4";
      color13  = "#9253fe";
      
      ###: cyan
      color6  = "#72e0ff";
      color14 = "#24deff";
      
      ###: white
      color7  = "#ffffff";
      color15 = "#ffffcd";
    };

    extraConfig = ''
      modify_font cell_width 105%

      mouse_map kitty_mod+left press ungrabbed mouse_selection rectangle
      mouse_map kitty_mod_left triplepress ungrabbed mouse_selection line_from_point
    '';

    keybindings = {
      "${kitty_mod}+c" = "copy_to_clipboard";
      "${kitty_mod}+v" = "paste_from_clipboard";
      "${kitty_mod}+s" = "paste_from_selection";

      "${kitty_mod}+up" = "scroll_line_up";
      "${kitty_mod}+down" = "scroll_line_down";
      "${kitty_mod}+page_up" = "scroll_page_up";
      "${kitty_mod}+page_down" = "scroll_page_down";

      "${kitty_mod}+plus" = "change_font_size current +1.0";
      "${kitty_mod}+underscore" = "change_font_size current -1.0";
      "${kitty_mod}+shift+backspace" = "change_font_size current 0";
    };
  };
}
