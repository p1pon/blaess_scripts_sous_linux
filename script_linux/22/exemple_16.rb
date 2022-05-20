#! /usr/local/bin/ruby

# On utilise ext/tk
require "tk"

# Titre de la fen�tre
TkRoot . new { title "Exemple de Ruby/Tk" }

# La bordure de la fen�tre compl�te, avec un relief sortant
f = TkFrame . new {
	relief	"raised"
	bd	2
	pack
}

# Une frame en haut, pour saisir le nom du p�rip�rique
fh = TkFrame.new(f) {
	relief	"groove"
	bd	2
	pack ("padx" => 5, "pady" => 5, "fill" => "x", "ipady" => 8)
}

# Etiquette d�crivant la zone de saisie
TkLabel.new(fh) {
	text "P�riph�rique : "
	pack ("side" => "left", "padx" => 5)
}

# Variable correspondant � la zone de saisie
nom_peripherique = TkVariable . new ("/dev/ttyS0")
TkEntry.new(fh) {
	textvariable nom_peripherique
	pack ("side" => "left", "padx" => 5)
}

# Frame invisible au milieu (verticalement) contenant d'autres frames
fm = TkFrame . new(f) . pack ("padx" => 3, "pady" => 3)

# Une frame � gauche, avec les vitesses de transmission
fmg = TkFrame.new(fm) {
	relief	"sunken"
	bd	2
	pack ("side" => "left", "padx" => 2, "pady" => 3)
}

# Les boutons radio cr��s pour chaque vitesse de la table
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

# Une frame au centre avec les parit�s
fmc = TkFrame.new(fm) {
	relief	"sunken"
	bd	2
	pack ("side" => "left", "padx" => 2, "pady" => 3, "fill" => "y")
}

# Les boutons radio des diverses parit�s
parite = TkVariable . new ("Parit� paire")
parites = ["Parit� paire", "Parit� impaire", "Parit� nulle", "Parit� fixe"]
parites.each { |p|
	TkRadioButton .new (fmc) {
		text  		p
		value		p
		variable	parite
		pack ( "anchor" => "w")
	}
}

# Une frame invisible � droite, en contenant deux autres
fmd = TkFrame . new(fm) . pack ("side" => "left", "fill" => "y", "padx" => 2)

# Une premi�re frame en haut, avec les bits de donn�es
fmdh = TkFrame . new (fmd) {
	relief	"sunken"
	bd	2
	pack ("expand" => 1, "fill" => "both", "pady" => 3)
}

bits = TkVariable . new (8)
TkRadioButton . new (fmdh) {
	variable	bits
	value		7
	text		"7 bits donn�es"
	pack ("anchor" => "w")
}
TkRadioButton . new (fmdh) {
	variable	bits
	value		8
	text		"8 bits donn�es"
	pack ("anchor" => "w")
}


# Une seconde frame en bas avec les bits d'arr�t
fmdb = TkFrame . new (fmd) {
	relief	"sunken"
	bd	2
	pack ("expand" => 1, "fill" => "both", "pady" => 3)
}

stop = TkVariable . new (1)
TkRadioButton . new (fmdb) {
	variable	stop
	value		1
	text		"1 bit d'arr�t"
	pack ("anchor" => "w")
}
TkRadioButton . new (fmdb) {
	variable	stop
	value		2
	text		"2 bits d'arr�t"
	pack ("anchor" => "w")
}

# Une frame invisible en bas de la fen�tre, regroupant les boutons
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
