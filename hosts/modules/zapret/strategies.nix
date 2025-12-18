{
	services.zapret.params = let
		list-general = ./lists/general.txt;
		list-google = ./lists/google.txt;
		list-exclude = ./lists/exclude.txt;

		ipset-all = ./ipsets/all.txt;
		ipset-exclude = ./ipsets/exclude.txt;

		quic-google = ./bin/quic_google.bin;

		tls-4pda = ./bin/tls_4pda.bin;
		tls-google = ./bin/tls_google.bin;
		tls-max = ./bin/tls_max.bin;

		simple = [
			"--filter-tcp=80 <HOSTLIST>"
			"--dpi-desync=fake,fakedsplit"
			"--dpi-desync-autottl=2"
			"--dpi-desync-fooling=md5sig"
			"--new"
			"--filter-tcp=443"
			"--dpi-desync=fake,multidisorder"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-split-pos=midsld"
			"--dpi-desync-fake-tls=0x00000000"
			"--new"
		];
		general-strategy = [
			"--filter-udp=443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fake"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fake-quic=${quic-google}"

			"--new"
			"--filter-udp=19294-19344,50000-50100"
			"--filter-l7=discord,stun"
			"--dpi-desync=fake"
			"--dpi-desync-repeats=6"
			"--new"

			"--filter-udp=443"
			"--ipset=${ipset-all}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fake"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fake-quic=${quic-google}"
			"--new"
		];
		orig = [
			"--filter-tcp=2053,2083,2087,2096,8443"
			"--hostlist-domains=discord.media"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=568"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-split-seqovl-pattern=${tls-4pda}"
			"--new"

			"--filter-tcp=443"
			"--hostlist=${list-google}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=681"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-split-seqovl-pattern=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=568"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-split-seqovl-pattern=${tls-4pda}"
			"--new"

			"--filter-tcp=80,443"
			"--ipset=${ipset-all}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=568"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-split-seqovl-pattern=${tls-4pda}"
			"--new"
		];
		alt1 = [
			"--filter-tcp=2053,2083,2087,2096,8443"
			"--hostlist-domains=discord.media"
			"--dpi-desync=fake,fakedsplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=ts"
			"--dpi-desync-fakedsplit-pattern=0x00"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"

			"--filter-tcp=443"
			"--hostlist=${list-google}"
			"--ip-id=zero"
			"--dpi-desync=fake,fakedsplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=ts"
			"--dpi-desync-fakedsplit-pattern=0x00"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fake,fakedsplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=ts"
			"--dpi-desync-fakedsplit-pattern=0x00"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"
		];
		alt2 = [
			"--filter-tcp=2053,2083,2087,2096,8443"
			"--hostlist-domains=discord.media"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=652"
			"--dpi-desync-split-pos=2"
			"--dpi-desync-split-seqovl-pattern=${tls-google}"
			"--new"

			"--filter-tcp=443"
			"--hostlist=${list-google}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=652"
			"--dpi-desync-split-pos=2"
			"--dpi-desync-split-seqovl-pattern=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=652"
			"--dpi-desync-split-pos=2"
			"--dpi-desync-split-seqovl-pattern=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--ipset=${ipset-all}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=multisplit"
			"--dpi-desync-split-seqovl=652"
			"--dpi-desync-split-pos=2"
			"--dpi-desync-split-seqovl-pattern=${tls-google}"
			"--new"
		];
		alt3 = [
			"--filter-tcp=2053,2083,2087,2096,8443"
			"--hostlist-domains=discord.media"
			"--dpi-desync=fakedsplit"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-autottl"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-repeats=8"
			"--new"

			"--filter-tcp=443"
			"--hostlist=${list-google}"
			"--dpi-desync=fakedsplit"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-autottl"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-repeats=8"
			"--new"

			"--filter-tcp=80,443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fakedsplit"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-autottl"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-repeats=8"
			"--new"

			"--filter-tcp=80,443"
			"--ipset=${ipset-all}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fakedsplit"
			"--dpi-desync-split-pos=1"
			"--dpi-desync-autottl"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-repeats=8"
			"--new"
		];
		alt4 = [
			"--filter-tcp=2053,2083,2087,2096,8443"
			"--hostlist-domains=discord.media"
			"--dpi-desync=fake,multisplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-badseq-increment=1000"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"

			"--filter-tcp=443"
			"--hostlist=${list-google}"
			"--dpi-desync=fake,multisplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-badseq-increment=1000"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--hostlist=${list-general}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fake,multisplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-badseq-increment=1000"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"

			"--filter-tcp=80,443"
			"--ipset=${ipset-all}"
			"--hostlist-exclude=${list-exclude}"
			"--ipset-exclude=${ipset-exclude}"
			"--dpi-desync=fake,multisplit"
			"--dpi-desync-repeats=6"
			"--dpi-desync-fooling=badseq"
			"--dpi-desync-badseq-increment=1000"
			"--dpi-desync-fake-tls=${tls-google}"
			"--new"
		];
		alt5 = [
		];
		alt6 = [
		];
		alt7 = [
		];
		alt8 = [
		];
		alt9 = [
		];
		alt10 = [
		];
		fta0 = [
		];
		fta1 = [
		];
		fta2 = [
		];
		fta3 = [
		];
		sf0 = [
		];
		sf1 = [
		];
	in general-strategy
		# ;
		# ++ orig;
		# ++ alt1;
		# ++ alt2;
		# ++ alt3;
		++ alt4;			# Finally fixing access to nixos.org sites (I killed whole day for this)
}
