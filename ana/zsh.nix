{
  programs.zsh = {
    enable = true;

    autosuggestion = {
      enable = true;
      highlight = "fg=#7d5662";
    };

    envExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';

    dotDir = "/home/ana/.config/zsh/";
    
    shellAliases = {
      cd = "z";
    };
  };
}
