#! /bin/ksh

while getopts "abc:d:" option ; do
	echo -n "Analyse argument numéro $OPTIND : "
	case $option in
		a ) echo "Option A" ;;
		b ) echo "Option B" ;;
		c ) echo "Option C, argument $OPTARG" ;;
		d ) echo "Option D, argument $OPTARG" ;;
		? ) echo "Inconnu" ;;
	esac
done
shift $((OPTIND - 1))
while [ $# -ne 0 ] ; do
	echo "Argument suivant : " $1
	shift
done
