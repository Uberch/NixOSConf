{
	services.kanata = {
		enable = true;
		keyboards.homeMods = {
			extraDefCfg = "process-unmapped-keys yes";
			config = ''
				(defsrc
					a s d f
					j k l ;
				)

				(defvar
					tap-time 200
					hold-time 200
				)

				(defalias
					a-mod (tap-hold $tap-time $hold-time a alt)
					s-mod (tap-hold $tap-time $hold-time s ctl)
					d-mod (tap-hold $tap-time $hold-time d met)
					f-mod (tap-hold $tap-time $hold-time f sft)

					j-mod (tap-hold $tap-time $hold-time j sft)
					k-mod (tap-hold $tap-time $hold-time k met)
					l-mod (tap-hold $tap-time $hold-time l ctl)
					;-mod (tap-hold $tap-time $hold-time ; alt)
				)

				(deflayer base
					@a-mod
					@s-mod
					@d-mod
					@f-mod
					@j-mod
					@k-mod
					@l-mod
					@;-mod
				)
			'';
		};
	};
}
