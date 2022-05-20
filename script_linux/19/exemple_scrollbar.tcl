#! /usr/bin/wish

pack [frame .f -relief groove -bd 2] -padx 5 -pady 5

set sujets(0)  "Bash"	; set chapitres(0)  "2 3 4 5 6"
set sujets(1)  "Tcsh"	; set chapitres(1)  "7"
set sujets(2)  "Pdksh"	; set chapitres(2)  "7"
set sujets(3)  "Grep"	; set chapitres(3)  "8"
set sujets(4)  "Sed"	; set chapitres(4)  "9 10"
set sujets(5)  "Awk"	; set chapitres(5)  "11 12 13"
set sujets(6)  "Perl"	; set chapitres(6)  "14 15 16 17"
set sujets(7)  "Tcl"	; set chapitres(7)  "18"
set sujets(8)  "Tk"	; set chapitres(8)  "19"
set sujets(9)  "Python"	; set chapitres(9)  "20"
set sujets(10) "Ruby"	; set chapitres(10) "21"

pack [frame .f.h] -padx 5 -pady 5
listbox .f.h.box	-selectmode extended		\
			-height 5 			\
			-yscroll {.f.h.sc set}
scrollbar .f.h.sc 	-command {.f.h.box yview}
pack .f.h.box .f.h.sc -side left -fill y
for {set i 0} {$i < 11} {incr i 1} {
	.f.h.box insert end $sujets($i)
}

pack [frame .f.b] -padx 5 -pady 5
text .f.b.txt 		-height 5 			\
			-width 20 			\
			-yscroll {.f.b.vsc set} 	\
			-xscroll {.f.b.hsc set} 	\
			-wrap none
scrollbar .f.b.vsc -command {.f.b.txt yview}
scrollbar .f.b.hsc -command {.f.b.txt xview} -orient horizontal
grid .f.b.txt -row 0 -column 0 -sticky nsew
grid .f.b.vsc -row 0 -column 1 -sticky nsew
grid .f.b.hsc -row 1 -column 0 -sticky nsew

button .f.bt -text "Quitter"    -command {exit}
pack .f.bt -padx 5 -pady 5 

