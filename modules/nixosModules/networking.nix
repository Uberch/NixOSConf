_: {
	flake.nixosModules.networking = { pkgs, ... }: {
		systemd.services.wpa_supplicant.environment.OPENSSL_CONF =
			pkgs.writeText "openssl.cnf"
		''
			openssl_conf = openssl_init
			[openssl_init]
			ssl_conf = ssl_sect
			[ssl_sect]
			system_default = system_default_sect
			[system_default_sect]
			Options = UnsafeLegacyRenegotiation
			[system_default_sect]
			CipherString = Default:@SECLEVEL=0
		'';
		networking.networkmanager = {
			enable = true;
			ensureProfiles = {
				environmentFiles = [
					"/root/network-manager.env"
				];
				profiles = {
					phone = {
						connection = {
							id = "phone";
							type = "wifi";
							uuid = "60ae425f-0131-4656-9421-bacf7f9a0fc5";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = -1;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						proxy = { };
						wifi = {
							mode = "infrastructure";
							ssid = "POCO X5 Pro 5G";
						};
						wifi-security = {
							auth-alg = "open";
							key-mgmt = "wpa-psk";
							psk = "$PHONE_WIFI_PSWD";
						};
					};
					luba = {
						connection = {
							id = "luba";
							type = "wifi";
							uuid = "c945b956-8681-4330-b51b-a09f29e04d25";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = 0;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						proxy = { };
						wifi = {
							mode = "infrastructure";
							ssid = "luba";
						};
						wifi-security = {
							auth-alg = "open";
							key-mgmt = "wpa-psk";
							psk = "$LUBA_WIFI_PSWD";
						};
					};
					maa = {
						connection = {
							id = "maa";
							type = "wifi";
							uuid = "ab42de0b-e80c-4535-be3c-09f7a60afd43";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = 0;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						proxy = { };
						wifi = {
							mode = "infrastructure";
							ssid = "maa";
						};
						wifi-security = {
							auth-alg = "open";
							key-mgmt = "wpa-psk";
							psk = "$MAA_WIFI_PSWD";
						};
					};
					stud = {
						"802-1x" = {
							eap = "peap;";
							identity = "$STUD_WIFI_IDNT";
							password = "$STUD_WIFI_PSWD";
							phase2-auth = "mschapv2";
						};
						connection = {
							id = "stud";
							type = "wifi";
							uuid = "b5e4d428-79bc-4b7f-ab62-6be0213ffdd0";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = 0;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						proxy = { };
						wifi = {
							mode = "infrastructure";
							ssid = "UniversityStudent";
						};
						wifi-security = {
							key-mgmt = "wpa-eap";
						};
					};
					dacha = {
						connection = {
							id = "dacha";
							type = "wifi";
							uuid = "be205a3d-5b21-4191-80ac-94658f0a350d";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = 0;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						wifi = {
							mode = "infrastructure";
							ssid = "TP-Link_2AA6";
						};
						wifi-security = {
							auth-alg = "open";
							key-mgmt = "wpa-psk";
							psk = "$DACHA_WIFI_PSWD";
						};
					};
					dacha5g = {
						connection = {
							id = "dacha5g";
							type = "wifi";
							uuid = "fec5db45-a96a-4e74-9592-b15eefdef399";
							autoconnect = true;
							autoconnect-retries = 0;
							autoconnect-priority = 1;
						};
						ipv4 = {
							method = "auto";
						};
						ipv6 = {
							addr-gen-mode = "default";
							method = "auto";
						};
						wifi = {
							mode = "infrastructure";
							ssid = "TP-Link_2AA6_5G";
						};
						wifi-security = {
							auth-alg = "open";
							key-mgmt = "wpa-psk";
							psk = "$DACHA_WIFI_PSWD";
						};
					};
				};
			};
		};
	};
}
