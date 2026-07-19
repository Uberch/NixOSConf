_: {
	flake.nixosModules.pipewire = {
		services.pipewire = {
			enable = true;
			pulse.enable = true; # This provides the PulseAudio API compatibility
			jack.enable = true;
			alsa = {
				enable = true;
				support32Bit = true;
			};
		};
	};
}
