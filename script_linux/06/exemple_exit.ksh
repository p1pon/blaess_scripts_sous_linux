#! /bin/ksh

function verifie_fichier
{
	if [ ! -f $1 ] ; then
		echo "$1 n'existe pas !"
		exit 1
	fi
}

if [ $# -ne 1 ]; then
	echo "Syntaxe : $0 fichier"
	exit 1
fi

verifie_fichier $1
file $1
exit 0
