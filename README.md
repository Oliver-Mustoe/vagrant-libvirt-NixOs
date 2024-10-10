# vagrant-libvirt-NixOs
Module for setting up Libvirt/Vagrant on your NixOS system

## Module Options
- `enable` - whether or not to enable the module
- `username` - the module sets up the users permissions and installs vagrant under the users packages, needs the name of the user you intend to do that with
## Setup
First move the vagrant.nix file into wherever you store your .nix files (like /etc/nixos).  

Then import the module and configure:
```bash
# Inside you .nix configuration file (like configuration.nix) import the module
  imports = [
    ./vagrant.nix
  ];

# Settings for the module
  services.vagrant = {
    enable = true;
    username = "user";
  };
```

