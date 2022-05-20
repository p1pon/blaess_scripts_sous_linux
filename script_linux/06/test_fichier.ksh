#! /bin/ksh

for i in "$@" ; do
	echo "$i : "
	if [ -L "$i" ] ; then echo "  (lien symbolique) " ; fi
	if [ -e "$i" ] ; then 
		echo -n "  type = "
		if [ -b "$i" ] ; then echo "sp�cial bloc " ; fi
		if [ -c "$i" ] ; then echo "sp�cial caract�re " ; fi
		if [ -d "$i" ] ; then echo "r�pertoire " ; fi
		if [ -f "$i" ] ; then echo "fichier r�gulier " ; fi
		if [ -p "$i" ] ; then echo "tube nomm� " ; fi
		if [ -S "$i" ] ; then echo "socket " ; fi
		echo -n "  bits = "
		if [ -g "$i" ] ; then echo -n "Set-GID " ; fi
		if [ -u "$i" ] ; then echo -n "Set-UID " ; fi
		if [ -k "$i" ] ; then echo -n "Sticky " ; fi
		echo ""
		echo -n "  acc�s = "
		if [ -r "$i" ] ; then echo -n "lecture " ; fi
		if [ -w "$i" ] ; then echo -n "�criture " ; fi
		if [ -x "$i" ] ; then echo -n "ex�cution " ; fi
		echo ""
		if [ -G "$i" ] ; then echo "  appartient � notre GID" ; fi
		if [ -O "$i" ] ; then echo "  appartient � notre UID" ; fi
	else
		echo "  n'existe pas"
	fi
done

