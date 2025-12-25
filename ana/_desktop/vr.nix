{ pkgs, ... }:

{
  # xdg.configFile."openxr/1/active_runtime.json".source = "${pkgs.monado}/share/openxr/1/openxr_monado.json";
  #
  # xdg.configFile."openvr/openvrpaths.vrpath".text = ''
  #   {
  #     "config" :
  #     [
  #       "/home/ana/.local/share/Steam/config"
  #     ],
  #     "external_drivers" : null,
  #     "jsonid" : "vrpathreg",
  #     "log" :
  #     [
  #       "/home/ana/.local/share/Steam/logs"
  #     ],
  #     "runtime" :
  #     [
  #       "${pkgs.opencomposite}/lib/opencomposite"
  #     ],
  #     "version" : 1
  #   }
  # '';
}
