{
  hardware.display.edid.enable = true;
  
  services.autorandr = {
    enable = true;
    
    profiles."meow" = {
      fingerprint = {
        DP4 = "<EDID>";
        DP0 = "<EDID>";
      };
      
      config = {
        DP4 = {
          primary = true;
          
          mode = "1920x1080";
          rate = "240";
          position = "0x0";
        };
        
        DP0 = {
          mode = "1920x1080";
          rate = "144";
          position = "1920x0"; 
        };
      };
    };
  };
}
