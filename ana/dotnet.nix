{ pkgs, ... }:

let
  dotnet = with pkgs.dotnetCorePackages; combinePackages [ dotnet_8.sdk ];
in
{
  home.packages = [
    dotnet
  ];
}
