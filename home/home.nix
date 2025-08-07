{ config, pkgs, ... }: {
	imports = [
		./config/plasma
		./config/dotfiles.nix
		./config/vscode.nix
	];

	home.username = "jaxson";
	home.homeDirectory = "/home/jaxson";

	home.stateVersion = "25.05"; # DON'T CHANGE

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
		rustup

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

