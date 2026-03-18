{
    services.i2pd = {
        enable = true;
        upnp.enable = true;
        
        proto = {
            http.enable = true;
            httpProxy.enable = true;
            socksProxy.enable = true;
        };
    };
}
