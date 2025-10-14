{
  services.logind.settings.Login = {
    HandlePowerKey = "ignore"; # short presses of power key do nothing
    # HandleLidSwitch = "suspend";
    # HandleLidSwitchExternalPower = "suspend";
  };
}
