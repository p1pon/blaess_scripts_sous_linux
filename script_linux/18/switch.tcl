#! /usr/bin/tcl

proc comparaison {option chaine} {

	puts "Comparaison avec option $option"

	switch $option $chaine {
		"A.*F" {
			puts "A.*F acceptée"
			}
		"ABC?EF" {
			puts "ABC?EF acceptée"
			}
		"ABCDEF" {
			puts "ABCDEF acceptée"
			}
	}
}

comparaison {-exact}  ABCDEF
comparaison {-regexp} ABCDEF
comparaison {-glob}  ABCDEF
