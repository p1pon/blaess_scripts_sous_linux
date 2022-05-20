#! /bin/sed -f

# Toujours afficher la première ligne
1n

# Supprimer les lignes de commentaires
 # (contenant éventuellement des espaces
	# ou des tabulations avant le dièse)
/^[ 	]*#/d

