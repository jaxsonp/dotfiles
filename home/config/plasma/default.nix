# KDE plasma configuration
{...}: {
	imports = [
		./input.nix
		./panels.nix
	];

	programs.plasma.enable = true;

	programs.plasma.workspace.lookAndFeel = "org.kde.breezedark.desktop";

	# virtual desktops
	programs.plasma.kwin.virtualDesktops = {
		rows = 2;
		names = [ "TL" "TC" "TR" "BL" "BC" "BR" ];
	};
}
