{ lib, ... }:

{
    services.postgresql = {
        enable = true;

        ensureDatabases = [ "kulupu" ];
        authentication = lib.mkForce ''
          #type database  DBuser  auth-method
          local all       all     trust
        '';
    };
}
