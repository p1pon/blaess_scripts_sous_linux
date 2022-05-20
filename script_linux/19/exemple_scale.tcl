#! /usr/bin/wish

pack [frame .f -relief groove -bd 2] -padx 5 -pady 5

scale .f.sc	-label "Température :"	\
		-orient horizontal	\
		-showvalue	1	\
		-from	36.0		\
		-to	42.0		\
		-resolution 0.1		\
		-digits		3	\
		-command {changement_scale}

proc changement_scale {temperature} {
	.f.lb configure -text "Température indiquée : $temperature"
}

pack .f.sc -padx 5 -pady 5 -fill x
pack [label .f.lb] -padx 5 -pady 5 -fill x

.f.sc set 37.5
