{ lib, config, ... }: {
config = lib.mkIf config.hyprland.enable {
	wayland.windowManager.hyprland.settings = {
		binds = {
			workspace_back_and_forth = true;
			workspace_center_on = 1;
			movefocus_cycles_fullscreen = true;
		};

		"$sup" = "SUPER";
		"$ret" = "RETURN";
		"$sft" = "SHIFT";
		"$ctl" = "CTRL";

		bind = [
			# Worspace navigation
			"$sup, 1, workspace, 1"
			"$sup, 2, workspace, 2"
			"$sup, 3, workspace, 3"
			"$sup, 4, workspace, 4"
			"$sup, 5, workspace, 5"
			"$sup, 6, workspace, 6"
			"$sup, 7, workspace, 7"
			"$sup, 8, workspace, 8"
			"$sup, 9, workspace, 9"
			"$sup, 0, workspace, 0"
			"$sup, Tab, workspace, m+1"
			"$sup $sft, Tab, workspace, m-1"

			# Move window to workspace n
			"$sup $sft, 1, movetoworkspace, 1"
			"$sup $sft, 2, movetoworkspace, 2"
			"$sup $sft, 3, movetoworkspace, 3"
			"$sup $sft, 4, movetoworkspace, 4"
			"$sup $sft, 5, movetoworkspace, 5"
			"$sup $sft, 6, movetoworkspace, 6"
			"$sup $sft, 7, movetoworkspace, 7"
			"$sup $sft, 8, movetoworkspace, 8"
			"$sup $sft, 9, movetoworkspace, 9"
			"$sup $sft, 0, movetoworkspace, 0"

			# Applications
			"$sup, $ret, exec, kitty"
			"$sup, T, exec, telegram-desktop"
			"$sup, B, exec, firefox"
			"$sup, D, exec, rofi -show drun -replace -i"

			# Windows
			"$sup, Q, killactive"
			"$sup, F, fullscreen"
			"$sup $sft $ctl, K, exit"

			# Resize
			"$sup, W, resizeactive, 100, 0"
			"$sup, E, resizeactive, 0, 100"
			"$sup $sft, W, resizeactive, -100, 0"
			"$sup $sft, E, resizeactive, 0, -100"
			

			# Focus movement
			"$sup, H, movefocus, l"
			"$sup, J, movefocus, d"
			"$sup, K, movefocus, u"
			"$sup, L, movefocus, r"

			"$sup $sft, J, togglesplit"
			"$sup $sft, K, swapsplit"
			
		];
	};
};
}
