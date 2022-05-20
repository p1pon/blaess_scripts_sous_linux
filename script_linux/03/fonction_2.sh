#! /bin/sh

function additionne ()
{
	# Cette routine additionne tous ces arguments, et
	# affiche le résultat sur la sortie standard
	local somme
	local i
	somme=0
	for i in "$@" ; do
		somme=$((somme + i))
	done
	echo $somme
}

# On invoque la fonction avec les arguments de la ligne de commande
	additionne "$@"
