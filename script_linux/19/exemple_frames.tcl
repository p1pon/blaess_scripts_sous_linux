#! /usr/bin/wish

# Titre de la fen�tre
wm title . "Port s�rie"

# La bordure de la fen�tre compl�te, avec un relief sortant
pack [frame .f -relief raised -bd 3] 

# Une frame en haut, pour saisir le nom du p�rip�rique
frame .f.h -relief groove -bd 2
pack .f.h -padx 5 -pady 5 -fill x -ipady 8
label .f.h.lbl -text "P�riph�rique : "
entry .f.h.txt
.f.h.txt insert 0 "/dev/ttyS0"
pack .f.h.lbl -side left -padx 5
pack .f.h.txt -side left -padx 5

# Frame invisible au milieu (verticalement) contenant d'autres frames
pack [frame .f.m] -padx 3 -pady 3

# Une frame � gauche, avec les vitesses de transmission
pack [frame .f.m.g -relief sunken -bd 2] -side left -padx 2 -pady 3
set vitesses "4800 9600 19200 28800 38400 57600 115200"
set vitesse 28800
for {set i 0} {$i < [llength $vitesses] } {incr i 1} {
        set l [lindex $vitesses $i]
        radiobutton .f.m.g.v$i -text $l -value $l -variable vitesse
	pack .f.m.g.v$i -anchor w
}

# Une frame au centre avec les parit�s
frame .f.m.c -relief sunken -bd 2
pack .f.m.c -side left -fill y -padx 2 -pady 3
set pars "{Parit� paire} {Parit� impaire} {Parit� nulle} {Parit� fixe}"
set parite "Parit� paire"
for {set i 0} {$i < [llength $pars] } {incr i 1} {
        set l [lindex $pars $i]
        radiobutton .f.m.c.p$i -text $l -value $l -variable parite
	pack .f.m.c.p$i -anchor w
}

# Une frame invisible � droite, en contenant deux autres
pack [frame .f.m.d ] -side left -fill y -padx 2

# Une premi�re frame en haut, avec les bits de donn�es
frame .f.m.d.h -relief sunken -bd 2
pack .f.m.d.h -expand 1 -fill both -pady 3
set bits 8
radiobutton .f.m.d.h.b0 -variable bits -value 7 -text "7 bits donn�es"
radiobutton .f.m.d.h.b1 -variable bits -value 8 -text "8 bits donn�es"
pack .f.m.d.h.b0 .f.m.d.h.b1 -anchor w

# Une seconde frame en bas avec les bits d'arr�t
pack [frame .f.m.d.b -relief sunken -bd 2] -expand 1 -fill both -pady 3
set stop 1
radiobutton .f.m.d.b.s0 -variable stop -value 1 -text "1 bit d'arr�t "
radiobutton .f.m.d.b.s1 -variable stop -value 2 -text "2 bits d'arr�t"
pack .f.m.d.b.s0 .f.m.d.b.s1 -anchor w

# Une frame invisible en bas de la fen�tre, regroupant les boutons
pack [frame .f.b ] -pady 5
button .f.b.ok -text "Ok" -command {exit}
button .f.b.annuler -text "Annuler" -command {exit}
pack .f.b.ok .f.b.annuler -side left -padx 10

