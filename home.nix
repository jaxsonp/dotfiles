{ config, pkgs, ... }: {
  imports = [
    ./config/plasma
    ./config/dotfiles.nix
    ./config/vscode.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jaxson";
  home.homeDirectory = "/home/jaxson";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # apps
    brave
    vscode
    spotify
    discord

    # dev
    gcc
    python314
	nodejs_24

    # cl binaries
    tree
    fzf
    ripgrep
    imagemagick
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };
  
  # home manager
  programs.home-manager.enable = true;

  programs.neovim.enable = true;
}

