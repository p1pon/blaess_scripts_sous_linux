#! /bin/sed -f

# Une ligne Reply-To est d�finitivement la bonne, on termine le
# script (apr�s l'avoir affich�).
/Reply-To:/q

# Une ligne From: sera m�moris�e temporairement
/From:/h

# Toutes les lignes non vides sont supprim�es
/./d

# Arriv� � la premi�re ligne vide (fin de l'ent�te),
# on affiche le contenu de la m�moire seondaire, et on quitte
g
q

