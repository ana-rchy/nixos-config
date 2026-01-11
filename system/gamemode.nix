_:

{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    
    settings.gpu = {
      apply_gpu_optimisations = "accept-responsibility";
      gpu_device = 0;
    };
  };
}
