#! /bin/sed -f

# Toujours afficher la premi�re ligne
1n

# Supprimer les lignes de commentaires
 # (contenant �ventuellement des espaces
	# ou des tabulations avant le di�se)
/^[ 	]*#/d

