_: {
	flake.nixosModules.utils = { pkgs, ...}: {
		hardware.graphics = {
			enable = true;
			enable32Bit = true;
		};

		time.timeZone = "Europe/Moscow";
		i18n.defaultLocale = "en_US.UTF-8";
		i18n.extraLocaleSettings = {
			LC_ADDRESS = "ru_RU.UTF-8";
			LC_IDENTIFICATION = "ru_RU.UTF-8";
			LC_MEASUREMENT = "ru_RU.UTF-8";
			LC_MONETARY = "ru_RU.UTF-8";
			LC_NAME = "ru_RU.UTF-8";
			LC_NUMERIC = "ru_RU.UTF-8";
			LC_PAPER = "ru_RU.UTF-8";
			LC_TELEPHONE = "ru_RU.UTF-8";
			LC_TIME = "ru_RU.UTF-8";
		};

		environment.systemPackages = with pkgs; [
			man-pages
			man-pages-posix
		];

		documentation = {
			enable = true;
			dev.enable = true;
			man.enable = true;
		};

		nix = {
			settings.experimental-features = [
				"nix-command"
				"flakes"
			];
			gc = {
				automatic = true;
				dates = "daily";
				options = "--delete-older-than 7d";
				randomizedDelaySec = "15m";
				persistent = true;
			};
		};

		services.logind.settings.Login = {
			HandleLidSwitch = "ignore";
			HandleLidSwitchDocked = "ignore";
			HandleLidSwitchExternalPower = "ignore";
		};
	};
}
