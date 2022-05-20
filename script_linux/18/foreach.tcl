#! /usr/bin/tcl

foreach argument $argv {
	if [file exist $argument] {
		puts "Le fichier $argument existe"
	} else {
		puts "Pas de fichier $argument"
	}
}
