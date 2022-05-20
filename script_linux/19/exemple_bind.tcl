#! /usr/bin/wish

pack [frame .f -relief raised -bd 2] -expand 1 -fill both

canvas .f.canvas -relief sunken -bd 1 -height 180 -width 320
pack .f.canvas -padx 5 -pady 5

bind .f.canvas <Enter> {canvas_enter %x %y %s}
bind .f.canvas <Leave> {canvas_leave %x %y %S}
bind .f.canvas <Motion> {canvas_motion %x %y %s}
bind .f.canvas <ButtonPress> {canvas_buttonpress %x %y %b}
bind .f.canvas <ButtonRelease> {canvas_buttonrelease %x %y %b}

pack [label .f.l -relief sunken -bd 1] -padx 5 -pady 5 -fill x
pack [button .f.bt -text "Quitter" -command {exit} ] -pady 5

proc canvas_enter {x y s} {
	.f.l configure -text "Enter : position ($x, $y), état : $s"
}

proc canvas_leave {x y s} {
	.f.l configure -text "Leave : position ($x, $y), état : $s"
}

proc canvas_motion {x y s} {
	.f.l configure -text "Motion : position ($x $y), état : $s"
}

proc canvas_buttonpress {x y b} {
	.f.l configure -text "ButtonPress : position ($x, $y), bt : $b"
}

proc canvas_buttonrelease {x y b} {
	.f.l configure -text "ButtonRelease : position ($x, $y), bt $b"
}
