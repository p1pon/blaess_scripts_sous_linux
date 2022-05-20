#! /usr/bin/wish

pack [frame .bar -relief raised -bd 1] -fill x


menubutton .bar.fic	-text "Fichier" 			\
			-underline 0				\
			-menu .bar.fic.mnu
pack .bar.fic -side left
menu .bar.fic.mnu -tearoff 0 -bd 1
.bar.fic.mnu add command	-label "Ouvrir..."		\
 				-underline 0			\
				-command {ouvrir}
.bar.fic.mnu add command	-label "Enregistrer"		\
				-underline 0			\
				-command {enregistrer}
.bar.fic.mnu add command	-label "Enregistrer sous..."	\
				-underline 2			\
				-command {enregistrer_sous}
.bar.fic.mnu add separator
.bar.fic.mnu add command	-label "Imprimer..."		\
				-underline 0			\
				-command {imprimer}
.bar.fic.mnu add separator
.bar.fic.mnu add command	-label "Quitter"		\
				-underline 0			\
				-command {exit}

.bar.fic.mnu entryconfigure "Enregistrer" -state disabled
.bar.fic.mnu entryconfigure "Enregistrer sous..." -state disabled
.bar.fic.mnu entryconfigure "Imprimer..." -state disabled

menubutton .bar.edit	-text "Edition"				\
			-underline 0				\
			-menu .bar.edit.mnu
pack .bar.edit -side left
menu .bar.edit.mnu -tearoff 0 -bd 1
.bar.edit.mnu add command	-label "Annuler"		\
				-underline 0			\
				-command {couper}
.bar.edit.mnu add separator
.bar.edit.mnu add command	-label "Couper"			\
				-underline 0			\
				-command {couper}
.bar.edit.mnu add command	-label "Copier"			\
				-underline 2			\
				-command {copier}
.bar.edit.mnu add command 	-label "Coller"			\
				-underline 1			\
				-command {coller}


menubutton .bar.aff	-text "Affichage"			\
			-underline 0				\
			-menu .bar.aff.mnu
pack .bar.aff -side left
menu .bar.aff.mnu -bd 1
set barre_outils_visible 1
.bar.aff.mnu add checkbutton	-label "Barre d'outils"		\
				-underline 8			\
				-variable barre_outils_visible	\
				-command {barre_outils}
set barre_etat_visible 0
.bar.aff.mnu add checkbutton	-label "Barre d'état"		\
				-underline 10			\
				-variable barre_etat_visible	\
				-command {barre_etat}


menubutton .bar.aide	-text "?" 				\
			-underline 0				\
			-menu .bar.aide.mnu
pack .bar.aide -side right
menu .bar.aide.mnu -tearoff 0 -bd 1
.bar.aide.mnu add cascade	-label "Aide"			\
				-underline 0			\
				-menu .bar.aide.mnu.aide	
.bar.aide.mnu add separator
.bar.aide.mnu add command 	-label "A propos..."	 	\
				-underline 2			\
				-command {a_propos}

menu .bar.aide.mnu.aide -tearoff 0 -bd 1
.bar.aide.mnu.aide add command	-label "Contexte"		\
				-underline 0			\
				-command {aide_contexte}
.bar.aide.mnu.aide add command	-label "Sommaire..."		\
				-underline 0			\
				-command {aide_sommaire}
.bar.aide.mnu.aide add command	-label "Rechercher..."		\
				-underline 0			\
				-command {aide_rechercher}


pack [frame .vide -width 200 -height 150]
