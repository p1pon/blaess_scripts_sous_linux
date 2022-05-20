#! /bin/sh

OPTERR=0
while getopts "abc:d:" option ; do
	case $option in
		a ) echo "Option -a" ;;
		b ) echo "Option -b" ;;
		c ) echo "Option -c, argument $OPTARG" ;;
		d ) echo "Option -d, argument $OPTARG" ;;
		? ) echo "Option inconnue" ;;
	esac
done
