#! /usr/bin/wish

frame .boutons -relief ridge -bd 3 

button .boutons.start -text "Démarrer" -command {bt_start}
button .boutons.pause -text "Pause"    -command {bt_pause}
button .boutons.quit  -text "Quitter"  -command {exit}

pack .boutons -ipady 5
pack .boutons.start -side left -padx 5
pack .boutons.pause -side left -padx 5
pack .boutons.quit  -side left -padx 5

.boutons.pause configure -state disabled

proc bt_start {} {
	if {[string compare [.boutons.start cget -text] "Démarrer"] == 0} {
		.boutons.start configure -text "Arrêter"
		.boutons.pause configure -state normal
		puts "Démarrage..."
	} else {
		.boutons.start configure -text "Démarrer"
		.boutons.pause configure -state disabled
		puts "Arrêt !"
	}
}

proc bt_pause {} {
	if {[string compare [.boutons.pause cget -text] "Pause"] == 0} {
		puts "Mise en pause"
		.boutons.pause configure -text "Continuer"
	} else {
		puts "Reprise..."
		.boutons.pause configure -text "Pause"
	}
}

