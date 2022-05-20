#! /usr/local/bin/ruby

# On utilise ext/tk
require "tk"

# Titre de la fenêtre
TkRoot . new { title "Exemple de Ruby/Tk" }

# La bordure de la fenêtre complète, avec un relief sortant
f = TkFrame . new {
	relief	"raised"
	bd	2
	pack
}

# Une frame en haut, pour saisir le nom du péripérique
fh = TkFrame.new(f) {
	relief	"groove"
	bd	2
	pack ("padx" => 5, "pady" => 5, "fill" => "x", "ipady" => 8)
}

# Etiquette décrivant la zone de saisie
TkLabel.new(fh) {
	text "Périphérique : "
	pack ("side" => "left", "padx" => 5)
}

# Variable correspondant à la zone de saisie
nom_peripherique = TkVariable . new ("/dev/ttyS0")
TkEntry.new(fh) {
	textvariable nom_peripherique
	pack ("side" => "left", "padx" => 5)
}

# Frame invisible au milieu (verticalement) contenant d'autres frames
fm = TkFrame . new(f) . pack ("padx" => 3, "pady" => 3)

# Une frame à gauche, avec les vitesses de transmission
fmg = TkFrame.new(fm) {
	relief	"sunken"
	bd	2
	pack ("side" => "left", "padx" => 2, "pady" => 3)
}

# Les boutons radio créés pour chaque vitesse de la table
vitesse = TkVariable.new (28800)
vitesses = [4800, 9600, 19200, 28800, 38400, 57600, 115200]
vitesses.each { |v|
	TkRadioButton .new (fmg) {
		text  		v
		value		v
		variable	vitesse
		pack ( "anchor" => "w")
	}
}

# Une frame au centre avec les parités
fmc = TkFrame.new(fm) {
	relief	"sunken"
	bd	2
	pack ("side" => "left", "padx" => 2, "pady" => 3, "fill" => "y")
}

# Les boutons radio des diverses parités
parite = TkVariable . new ("Parité paire")
parites = ["Parité paire", "Parité impaire", "Parité nulle", "Parité fixe"]
parites.each { |p|
	TkRadioButton .new (fmc) {
		text  		p
		value		p
		variable	parite
		pack ( "anchor" => "w")
	}
}

# Une frame invisible à droite, en contenant deux autres
fmd = TkFrame . new(fm) . pack ("side" => "left", "fill" => "y", "padx" => 2)

# Une première frame en haut, avec les bits de données
fmdh = TkFrame . new (fmd) {
	relief	"sunken"
	bd	2
	pack ("expand" => 1, "fill" => "both", "pady" => 3)
}

bits = TkVariable . new (8)
TkRadioButton . new (fmdh) {
	variable	bits
	value		7
	text		"7 bits données"
	pack ("anchor" => "w")
}
TkRadioButton . new (fmdh) {
	variable	bits
	value		8
	text		"8 bits données"
	pack ("anchor" => "w")
}


# Une seconde frame en bas avec les bits d'arrêt
fmdb = TkFrame . new (fmd) {
	relief	"sunken"
	bd	2
	pack ("expand" => 1, "fill" => "both", "pady" => 3)
}

stop = TkVariable . new (1)
TkRadioButton . new (fmdb) {
	variable	stop
	value		1
	text		"1 bit d'arrêt"
	pack ("anchor" => "w")
}
TkRadioButton . new (fmdb) {
	variable	stop
	value		2
	text		"2 bits d'arrêt"
	pack ("anchor" => "w")
}

# Une frame invisible en bas de la fenêtre, regroupant les boutons
fb = TkFrame . new (f) . pack ("pady" => 5)

TkButton . new (fb) {
	text	"Ok"
	command	{ exit }
	pack ("side" => "left", "padx" => 10)
}
TkButton . new (fb) {
	text	"Annuler"
	command	{ exit }
	pack ("side" => "left", "padx" => 10)
}

Tk . mainloop
