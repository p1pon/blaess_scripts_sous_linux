#! /bin/sed -f

1,/^$/{
	/^From: */{
		# Supprimer le descriptif 'From: '
		s///
		# Supprimer l'�ventuel nom entre parenth�ses
		s/ *(.*)//
		# Supprimer tout ce qui suit l'adresse
		s/>.*//
		# Supprimer tout ce qui pr�c�de l'adresse
		s/.*[:<] *//
		# Afficher finalement l'adresse
		p
	}
}
# Supprimer toutes les autres lignes
d
