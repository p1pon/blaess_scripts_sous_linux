#! /bin/sed -f

# Une ligne Reply-To est définitivement la bonne, on termine le
# script (après l'avoir affiché).
/Reply-To:/q

# Une ligne From: sera mémorisée temporairement
/From:/h

# Toutes les lignes non vides sont supprimées
/./d

# Arrivé à la première ligne vide (fin de l'entête),
# on affiche le contenu de la mémoire seondaire, et on quitte
g
q

