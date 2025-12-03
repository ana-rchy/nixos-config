{ pkgs, ... }:

{
  hardware.ckb-next = {
    enable = true;
    
    package = pkgs.ckb-next.overrideAttrs (old: {
      cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DUSE_DBUS_MENU=0" ];
    });
  };
}
