#! /bin/sed -f

# Initialisation entete=1
1{
	x
	s/.*/<entete=1>/
	x
}

# Ligne vide -> entete=0
/^$/ {
	x
	s/<entete=.*>/<entete=0>/
	x
}

# Si entete = 1, supprimer la ligne
x
/<entete=1>/{
	x
	d
	x
}
x
