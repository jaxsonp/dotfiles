# dotfiles

My dotfiles repo, managed by [Home Manager](https://github.com/nix-community/home-manager).

## Installation

Clone this repo into your home directory.

### Home config

Have Nix installed, then [install Home Manager](https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone). Then build the home configuration using:

```sh
~/dotfiles/home/dotfiles/bin/rebuild-home
```

### System config

To setup the system config, create the following symlink:

```sh
ln -s $HOME/dotfiles/system/configuration.nix /etc/nixos/configuration.nix
```

