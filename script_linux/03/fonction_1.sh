#! /bin/sh

function trois_arg ()
{
	# Cette routine attend trois arguments
	if [ $# -ne 3 ] ; then
		echo "Nombre d'arguments erronés dans trois_arg()"
		return
	fi
	echo "Traitement des arguments de trois_arg ()"
}

	trois_arg
	trois_arg un deux trois quatre
	trois_arg un deux trois


