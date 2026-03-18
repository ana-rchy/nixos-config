{ pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    
    openFirewall = true;
    user = "ana";
    
    logDir = "/home/ana/.jellyfin/logs/";
    cacheDir = "/home/ana/.jellyfin/cache/";
    dataDir = "/home/ana/.jellyfin/data/";
    # configDir = "/home/ana/.jellyfin/config/";
  };
  
  environment.systemPackages = [
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
