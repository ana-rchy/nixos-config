{
  programs.zsh = {
    enable = true;
    
    autosuggestions = {
      enable = true;
      highlightStyle = "fg=#7d5662";
    };

    # shellInit = ''
    #   bindkey "^[[1;5C" forward-word
    #   bindkey "^[[1;5D" backward-word
    # '';

    # dotDir = "/home/ana/.config/zsh/";
    
    shellAliases = {
      cd = "z";
    };
  }; 

  environment.pathsToLink = [ "/share/zsh" ];
}
