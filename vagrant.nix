{config, pkgs, lib, ...}:
let
  # Essentially grab the state of the final settings of the user module actually has for defined thingg
   cfg = config.services.vagrant;
in
{
  # Create options for the module
  options.services.vagrant = {
    enable = lib.mkEnableOption "Vagrant setup";
    username = lib.mkOption {
      type = lib.types.str;
      description = "username of the actual user";
    };
  };

  config = lib.mkIf cfg.enable {
    # https://discourse.nixos.org/t/set-up-vagrant-with-libvirt-qemu-kvm-on-nixos/14653
    virtualisation.libvirtd.enable = true;
    boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

    # User now needs to be apart of libvirtd group (and maybe to the qemu-libvirtd as well)
    users.users.${cfg.username} = {
      extraGroups = [ "qemu-libvirtd" "libvirtd" ];
      packages = with pkgs; [ vagrant ];
    };
  };
}
