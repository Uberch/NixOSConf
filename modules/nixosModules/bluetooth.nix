_: {
	flake.nixosModules.bluetooth = {
		boot = {
			kernelParams = [
				"usbcore.autosuspend=-1"
			];
			extraModprobeConfig = ''
				options btusb enable_autosuspend=0 disable_msft_evt=1
				options iwlwifi power_save=0 uapsd_disable=1
				options iwlmvm power_scheme=3
			'';
		};
		hardware.bluetooth = {
			enable = true;
			powerOnBoot = true;
			settings = {
				General = {
					ContollerMode = "dual";
					AutoConnect = true;
					FastConnectable = false;
				};
			};
		};
		services.pipewire.wireplumber = {
			enable = true;
				extraConfig = {
				"10-bluetooth-policy"."wireplumber.settings" = {
					"bluez5.autoswitch-profile" = false;
				};
				"11-bluetooth-prevent-drop"."monitor.bluez.properties" = {
					"bluez5.roles" = [ "a2dp_sink" "a2dp_source" ];
					"seesion.suspend-timeout-seconds" = 0;
				};
			};
		};
		services.blueman.enable = true;
	};
}
