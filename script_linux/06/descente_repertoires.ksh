#! /bin/ksh

function explore_repertoire
{
	local f
	local i
	# Pr�c�der le nom du r�pertoire transmis en premier argument
	# par autant de blancs que la valeur du second argument.
	i=0
	while [ $i -lt $2 ] ; do
		echo -n " "
		i=$((i + 1))
	done
	echo "$1"
	# Se d�placer dans le premier r�pertoire. Si �chec -> abandon
	if ! cd "$1" ; then return ; fi
	# Balayer tout le contenu du r�pertoire
	for f in * ; do
		# Sauter les liens symboliques
		if [ -L "$f" ] ; then
			continue
		fi
		# Si on a trouv� un sous-r�pertoire, l'explorer en
		# incr�mentant sa position (de 4 pour faire plus joli)
		if [ -d "$f" ] ; then
			explore_repertoire "$f" $(($2 + 4))
		fi
	done
	# Revenir dans le r�pertoire initial
	cd ..
}

# Lancer l'exploration � partir de l'argument
explore_repertoire "$1" 0 
