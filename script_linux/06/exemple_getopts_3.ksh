#! /bin/bash2

while getopts ":abc:d:" option ; do
	case $option in
		a ) echo "Option -a" ;;
		b ) echo "Option -b" ;;
		c ) echo "Option -c, argument $OPTARG" ;;
		d ) echo "Option -d, argument $OPTARG" ;;
		: ) echo "Argument manquant pour l'option -$OPTARG" ;;
		? ) echo "Option -$OPTARG inconnue" ;;
	esac
done
