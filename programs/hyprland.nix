
{ inputs, pkgs, ... }:
{
	imports = [
		inputs.hyprland.homeManagerModules.default
	];

	home.packages = with pkgs; [
		wayland
		glib
	];

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		systemd.enable = true;
		settings = {
			## MONITORS
			monitor = ",preferred,auto,auto";

			## PROGRAMS
			"$terminal" = "kitty";

			## KEYBINDS
			"$mod" = "SUPER";
			bind = [
				"$mod, Return, exec, $terminal"
				"$mod, Escape, exit"
				"$mod, Q, killactive"
			] ++ builtins.genList (n: "$mod, ${builtins.toString (n + 1)}, workspace, ${builtins.toString (n + 1)}") 8;
			# Move and resize windows with the mouse
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];

			debug = {
				disable_logs = false;
			};
		};
	};
}
