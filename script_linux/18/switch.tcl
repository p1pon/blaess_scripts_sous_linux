#! /usr/bin/tcl

proc comparaison {option chaine} {

	puts "Comparaison avec option $option"

	switch $option $chaine {
		"A.*F" {
			puts "A.*F accept�e"
			}
		"ABC?EF" {
			puts "ABC?EF accept�e"
			}
		"ABCDEF" {
			puts "ABCDEF accept�e"
			}
	}
}

comparaison {-exact}  ABCDEF
comparaison {-regexp} ABCDEF
comparaison {-glob}  ABCDEF
