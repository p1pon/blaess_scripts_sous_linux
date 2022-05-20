#! /bin/ksh

for i in "$@" ; do
	echo "$i : "
	if [ -L "$i" ] ; then echo "  (lien symbolique) " ; fi
	if [ -e "$i" ] ; then 
		echo -n "  type = "
		if [ -b "$i" ] ; then echo "spécial bloc " ; fi
		if [ -c "$i" ] ; then echo "spécial caractère " ; fi
		if [ -d "$i" ] ; then echo "répertoire " ; fi
		if [ -f "$i" ] ; then echo "fichier régulier " ; fi
		if [ -p "$i" ] ; then echo "tube nommé " ; fi
		if [ -S "$i" ] ; then echo "socket " ; fi
		echo -n "  bits = "
		if [ -g "$i" ] ; then echo -n "Set-GID " ; fi
		if [ -u "$i" ] ; then echo -n "Set-UID " ; fi
		if [ -k "$i" ] ; then echo -n "Sticky " ; fi
		echo ""
		echo -n "  accès = "
		if [ -r "$i" ] ; then echo -n "lecture " ; fi
		if [ -w "$i" ] ; then echo -n "écriture " ; fi
		if [ -x "$i" ] ; then echo -n "exécution " ; fi
		echo ""
		if [ -G "$i" ] ; then echo "  appartient à notre GID" ; fi
		if [ -O "$i" ] ; then echo "  appartient à notre UID" ; fi
	else
		echo "  n'existe pas"
	fi
done

