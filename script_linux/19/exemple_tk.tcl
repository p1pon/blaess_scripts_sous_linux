#! /usr/bin/wish

pack [frame .f -relief raised -bd 2]

button .f.bt1 -text "Fenêtre 1" -command {fenetre_1}
pack   .f.bt1 -pady 5 -padx 5

button .f.bt2 -text "Message Box" -command {
	set reponse [tk_messageBox					\
		-parent .f						\
		-message "Voulez-vous répondre à cette question"	\
		-type	yesnocancel					\
		-default yes						\
		-title	Interrogation					\
		-icon 	question ]
	tk_messageBox							\
		-parent .f						\
		-message "La réponse était $reponse"			\
		-type ok						\
		-title Réponse
}
pack .f.bt2 -pady 5 -padx 5

button .f.bt3 -text "Open File" -command {
	set reponse [tk_getOpenFile					\
		-parent .f						\
		-filetypes {
			{ "Scripts Tcl"   ".tcl"}
			{ "Scripts shell" ".sh"}
			{ "Scripts Sed"   ".sed"}
			{ "Scripts Awk"   ".awk"}
			{ "Scripts Perl"  ".pl"}
			{ "Modules Perl"  ".pm"}
			{ "Tous fichiers" {*}}} ]
	tk_messageBox							\
		-parent .f						\
		-message "La sélection est : $reponse"			\
		-type ok						\
		-title Fichier
}
pack .f.bt3 -padx 5 -pady 5		
			

proc fenetre_1 {} {
	set fen .fen_1
	catch {destroy $fen}
	toplevel $fen
	wm title $fen "Titre de la fenêtre 1"
	frame $fen.f -relief raised -bd 2
	pack $fen.f
	label $fen.f.l -text "Ceci est la fenêtre numéro 1"
	pack $fen.f.l -padx 5 -pady 5
	frame $fen.f.bt
	button $fen.f.bt.1 -text "Fermer" -command "destroy $fen"
	button $fen.f.bt.2 -text "Quitter" -command {exit}
	pack $fen.f.bt.1 $fen.f.bt.2 -side left -padx 5
	pack $fen.f.bt -pady 5
}

