#! /bin/sed -f

# Initialisation : entete <- 1
1{
	x
	s/.*/<entete=1>/
	x
}

# Ligne vide : entete <- 0
/^$/ {
	x
	s/<entete=.*>/<entete=0>/
	x
}

# Si entete = 0, sauter à la fin
t nop
: nop
x
s/<entete=0>/&/
x
t fin

# Sinon effacer la ligne
d

# Afficher la ligne
: fin

