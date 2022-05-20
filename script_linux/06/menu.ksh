#! /bin/ksh

cat << FIN
	**********************
	* titre du programme *
	**********************

	1 - Premi�re option
	2 - Seconde option

	0 - Fin
FIN

while [ "$REPLY" != "0" ] ; do
	echo -n "Votre choix : "
	read
	case "$REPLY" in
		1 ) echo "Option num�ro 1" ;;
		2 ) echo "Option num�ro 2" ;;
		0 ) echo "Au revoir" ;;
		* ) echo "Option invalide !" ;;
	esac
done
