{
	disko.devices = {
		disk = {
			my-disk = {
				device = path_to_disk;
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
