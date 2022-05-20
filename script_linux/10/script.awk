#! /usr/bin/awk -f

BEGIN { print "**** début ****" }
END { print "**** fin ****" }

# Les instructions sans motif de sélection s'appliquent
# à toutes les lignes de l'entrée standard.
{ print "* " $0 }
