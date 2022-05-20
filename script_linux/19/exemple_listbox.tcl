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

listbox .f.box -selectmode extended -height 5
pack .f.box -padx 5 -pady 5
for {set i 0} {$i < 11} {incr i 1} {.f.box insert end $sujets($i)}

pack [frame .f.bt] -padx 5 -pady 5
button .f.bt.1 -text "Rechercher" -command {rechercher}
button .f.bt.2 -text "Quitter"    -command {exit}
pack .f.bt.1 .f.bt.2 -padx 5 -pady 5 -side left

pack [label .f.lbl] -padx 5 -pady 5 -fill x

proc rechercher {} {
	global chapitres
	global sujets
	.f.lbl configure -text ""
	foreach s [.f.box curselection] {
		.f.lbl configure -text \
		"[.f.lbl cget -text]\n$sujets($s) : $chapitres($s)"
	}
}
