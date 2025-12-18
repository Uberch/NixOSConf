{
	services.zapret = let
		lists = {
			exclude = [
				"pusher.com"
				"live-video.net"
				"ttvnw.net"
				"twitch.tv"
				"mail.ru"
				"citilink.ru"
				"yandex.com"
				"nvidia.com"
				"donationalerts.com"
				"vk.com"
				"yandex.kz"
				"mts.ru"
				"multimc.org"
				"ya.ru"
				"dns-shop.ru"
				"habr.com"
				"3dnews.ru"
				"sberbank.ru"
				"ozon.ru"
				"wildberries.ru"
				"microsoft.com"
				"msi.com"
				"akamaitechnologies.com"
				"2ip.ru"
				"yandex.ru"
			];
			google = ''
				yt3.ggpht.com
				yt4.ggpht.com
				yt3.googleusercontent.com
				googlevideo.com
				jnn-pa.googleapis.com
				stable.dl2.discordapp.net
				wide-youtube.l.google.com
				youtube-nocookie.com
				youtube-ui.l.google.com
				youtube.com
				youtubeembeddedplayer.googleapis.com
				youtubekids.com
				youtubei.googleapis.com
				youtu.be
				yt-video-upload.l.google.com
				ytimg.com
				ytimg.l.google.com
			'';
			discord = ''
				dis.gd
				discord-attachments-uploads-prd.storage.googleapis.com
				discord.app
				discord.co
				discord.com
				discord.design
				discord.dev
				discord.gift
				discord.gifts
				discord.gg
				discord.media
				discord.new
				discord.store
				discord.status
				discord-activities.com
				discordactivities.com
				discordapp.com
				discordapp.net
				discordcdn.com
				discordmerch.com
				discordpartygames.com
				discordsays.com
				discordsez.com
			'';
			nixos = ''
				nixos.ort
				extranix.com
			'';
			general = ''
				cloudflare-ech.com
				encryptedsni.com
				cloudflareaccess.com
				cloudflareapps.com
				cloudflarebolt.com
				cloudflareclient.com
				cloudflareinsights.com
				cloudflareok.com
				cloudflarepartners.com
				cloudflareportal.com
				cloudflarepreview.com
				cloudflareresolve.com
				cloudflaressl.com
				cloudflarestatus.com
				cloudflarestorage.com
				cloudflarestream.com
				cloudflaretest.com
				frankerfacez.com
				ffzap.com
				betterttv.net
				7tv.app
				7tv.io
			'';
		};

		# ip sets
		ipsets = {
			all = ''
				203.0.113.113/32
			'';
			exclude = ''
				0.0.0.0/8
				10.0.0.0/8
				127.0.0.0/8
				172.16.0.0/12
				192.168.0.0/16
				169.254.0.0/16
				224.0.0.0/4
				100.64.0.0/10
				::1
				fc00::/7
				fe80::/10
			'';
		};

		# Strategies of DPI fooling
		strategies = {
			simple = [
				"--filter-tcp=80 <HOSTLIST>"
				"--dpi-desync=fake,fakedsplit"
				"--dpi-desync-autottl=2"
				"--dpi-desync-fooling=md5sig"
				"--new"
				"--filter-tcp=443"
				"--hostlist ${lists.plain}"
				"--dpi-desync=fake,multidisorder"
				"--dpi-desync-fooling=badseq"
				"--dpi-desync-split-pos=midsld"
				"--dpi-desync-fake-tls=0x00000000"
			];

		};
	in {
		enable = true;
		whitelist = lists.hostlist;
		params = strategies.simple;
	};
}
