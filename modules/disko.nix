_: {
	flake.diskoConfigurations = {
		basic = { device ? "/dev/vda", ... }: {
			disko.devices.disk.main = {
				inherit device;
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							type = "EF00";
							size = "256M";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077" ];
							};
						};

						root = {
							size = "100%";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
							};
						};
					};
				};
			};
		};
		swap = { device ? "/dev/vda", ... }: {
			disko.devices.disk.main = {
				inherit device;
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							type = "EF00";
							size = "256M";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077" ];
							};
						};

						swap = {
							size = "8G";
							content = {
								type = "swap";
								resumeDevice = true;
							};
						};

						root = {
							size = "100%";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
							};
						};
					};
				};
			};
		};
	};
}
