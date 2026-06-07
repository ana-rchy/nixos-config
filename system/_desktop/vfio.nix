{ pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
    ];
    
    kernelParams = [
      "amd_iommu=on"
      "vfio-pci.ids=10de:2489,10de:228b"
    ];
  };

  virtualisation.libvirtd.qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true; 
  };
}
