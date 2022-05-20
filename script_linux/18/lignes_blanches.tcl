#! /usr/bin/tcl

proc nb_lignes_blanches {fichier} {
	set lignes_blanches 0
	while {[gets $fichier ligne] >= 0} {
		if {[string length $ligne] == 0} {
			incr lignes_blanches 1
		}
	}
	return $lignes_blanches
}


foreach arg $argv {
	puts -nonewline "$arg : "
	if [catch { set fichier [open $arg "r"] } code_erreur ] {
		puts "$code_erreur"
		continue
	}
	puts [nb_lignes_blanches $fichier]
	close $fichier;
} 
