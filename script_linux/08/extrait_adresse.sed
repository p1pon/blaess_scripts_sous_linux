#! /bin/sed -f

1,/^$/{
	/^From: */{
		# Supprimer le descriptif 'From: '
		s///
		# Supprimer l'éventuel nom entre parenthèses
		s/ *(.*)//
		# Supprimer tout ce qui suit l'adresse
		s/>.*//
		# Supprimer tout ce qui précède l'adresse
		s/.*[:<] *//
		# Afficher finalement l'adresse
		p
	}
}
# Supprimer toutes les autres lignes
d
