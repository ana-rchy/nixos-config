{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["ana"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
