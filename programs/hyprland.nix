{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      ## Variables
      "$mod" = "SUPER";

      ## Keybinds
      bind = [
        "$mod, Enter, exec, kitty"
        "$mod, Return, exit"
        "$mod, Q, killactive"
      ];
      # Move and resize windows with the mouse
      bindm = [
        "$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

      ## Debug
      debug = {
        disable_logs = false;
      };
    };
  };
}
