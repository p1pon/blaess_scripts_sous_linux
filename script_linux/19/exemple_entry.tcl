#! /usr/bin/wish

pack [frame .f -relief ridge -bd 2] -padx 5 -pady 5

label .f.l -text "Identification"
pack .f.l -pady 5

pack [frame .f.h] -padx 5 -pady 5 -fill x
label .f.h.l -text "Utilisateur : "
entry .f.h.e
.f.h.e insert end $env(USER)
pack .f.h.l -side left
pack .f.h.e -side right

pack [frame .f.b] -padx 5 -pady 5 -fill x
label .f.b.l -text "Mot de passe : "
entry .f.b.e -show 0
pack .f.b.l -side left
pack .f.b.e -side right

pack [button .f.bt -text "Ok" -command {bt_ok} ] -pady 5

proc bt_ok {} {
	set login [.f.h.e get]
	set passwd [.f.b.e get]
	puts "login : $login"
	puts "passwd : $passwd"
	exit 0
}

