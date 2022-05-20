#! /usr/bin/wish

pack [frame .f -relief ridge -bd 2] -padx 5 -pady 5

checkbutton .f.ck	-text "Autorisation"	\
			-offvalue 'non'		\
			-onvalue 'oui'		\
			-variable autorisation	\
			-command {
	.f.lb configure -text "Etat actuel : $autorisation"
			}

label .f.lb -text "Etat actuel : $autorisation" -relief sunken -bd 1

button .f.bt -text "Quitter" -command { exit }

pack .f.ck -padx 5 -pady 5
pack .f.lb -padx 5 -pady 5 -ipadx 5 -ipady 5
pack .f.bt -padx 5 -pady 5

