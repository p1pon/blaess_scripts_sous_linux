#! /bin/sh

i=$(uname -r)
i=${1:-$i}

case "$i" in
	2.4.* | 2.5.* ) Type_noyau="2.4" ;;
	2.2.* | 2.3.* ) Type_noyau="2.2" ;;
	2.[01].* )	Type_noyau="2.0" ;;
	1.* | 0.* )	 echo "Noyau trop ancien ; impossible de continuer"
			 exit 1 ;;
	* )		 Type_noyau="Inconnu"
			 echo "Noyau inconnu ; continuer l'installation ?"
			 read Reponse
			 case "$Reponse" in
			 	O* | o* | Y* | y* )
					echo Ok ;;
				* )	exit 1 ;;
			esac ;;
esac
echo "Installation pour noyau de type $Type_noyau"
