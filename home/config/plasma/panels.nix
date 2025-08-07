# Find values at ~/.config/plasma-org.kde.plasma.desktop-appletsrc
{...}: {

	programs.plasma.panels = [
		{ # main panel
			height = 34;
			location = "bottom";
			floating = true;
			alignment = "center";
			lengthMode = "fill";
			opacity = "adaptive";

			widgets = [
				{
					name = "org.kde.plasma.kickoff";  # application launcher
					config = {
						General.icon = "nix-snowflake-white";
						General.systemFavorites = "suspend\\,hibernate\\,reboot\\,shutdown";
					};
				}
				{
					name = "org.kde.plasma.pager";
					config = {
						General.currentDesktopSelected = "ShowDesktop";
					};
				}
				{
					iconTasks = {
						launchers = [
							"applications:brave-browser.desktop"
							"applications:org.kde.dolphin.desktop"
							"applications:org.kde.konsole.desktop"
						];
						appearance.fill = false;
					};
				}
				"org.kde.plasma.panelspacer"
				{
					digitalClock = {
						calendar.firstDayOfWeek = "sunday";
						time.format = "12h";
						timeZone.format = "offset";
					};
				}
				"org.kde.plasma.panelspacer"
				{
					systemTray = {
						items = {
							shown = [ # always shown
								"org.kde.plasma.volume"
								"org.kde.plasma.networkmanagement"
								"org.kde.plasma.battery"
							];
							hidden = [ # always hidden
								"org.kde.plasma.brightness"
								"org.kde.plasma.clipboard"
							];
							extra = [ # all widgets?
								"org.kde.plasma.volume"
								"org.kde.plasma.networkmanagement"
								"org.kde.plasma.battery"
								"org.kde.plasma.brightness"
								"org.kde.plasma.clipboard"
								"org.kde.plasma.cameraindicator"
								"org.kde.plasma.notifications"
								"org.kde.plasma.devicenotifier"
								"org.kde.plasma.manage-inputmethod"
								"org.kde.plasma.mediacontroller"
								"org.kde.kscreen"
								"org.kde.plasma.printmanager"
								"org.kde.plasma.keyboardlayout"
								"org.kde.plasma.keyboardindicator"
							];
							configs = {
								battery.showPercentage = true;
							};
						};
						icons.scaleToFit = true;
					};
				}
			];
		}
	];
}
