#! /usr/bin/awk -f

function eval (expression,      commande, ligne, retour)
{
	retour = ""
	commande="/usr/bin/awk 'BEGIN{ print "   expression  "}' 2>/dev/null"
	if ((commande | getline ligne) > 0)
		retour = ligne
	close (commande)
	return retour
}

BEGIN {
	for (i = 1; i < ARGC ; i ++)
		print ARGV[i] " = " eval(ARGV[i])
}
