#! /usr/bin/awk -f

BEGIN { nb_lignes = 0 }
{ nb_lignes = nb_lignes + 1 }
END { print "Nombre de lignes = " nb_lignes }
