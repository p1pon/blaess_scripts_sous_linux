#! /bin/ksh

cat << FIN
	**********************
	* titre du programme *
	**********************

	1 - Première option
	2 - Seconde option

	0 - Fin
FIN

while [ "$REPLY" != "0" ] ; do
	echo -n "Votre choix : "
	read
	case "$REPLY" in
		1 ) echo "Option numéro 1" ;;
		2 ) echo "Option numéro 2" ;;
		0 ) echo "Au revoir" ;;
		* ) echo "Option invalide !" ;;
	esac
done
