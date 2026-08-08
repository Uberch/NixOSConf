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
		iso = {
			disko.devices.disk.main = {
				type = "disk";
				content = {
					type = "gpt";
					partitions = {
						ESP = {
							priority = 1;
							name = "ESP";
							size = "512M";
							type = "EF00";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot/efi";
								mountOptions = [ "umask=0077" ];
							};
						};
						root = {
							name = "root";
							size = "100%";
							content = {
								type = "filesystem";
								format = "ext4";
								mountpoint = "/";
								mountOptions = [ "noatime" "nodiratime" "commit=60" ];
							};
						};
					};
				};
			};
		};
	};
}
