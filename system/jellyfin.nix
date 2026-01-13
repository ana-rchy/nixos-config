{ pkgs, ... }:

{
  services.jellyfin = {
    enable = true;
    
    openFirewall = true;
    user = "ana";
  };
  
  environment.systemPackages = [
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
