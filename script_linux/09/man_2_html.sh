#! /bin/sh

TMP_PAGE=/tmp/$$.txt
LATIN1_2_HTML=../09/latin1_2_html.sed

while [ -n "$1" ] ; do

	PAGE=$1
	shift

	SECTION=${PAGE##*(}
	SECTION=${SECTION%)*}
	PAGE=${PAGE%%(*}

	if ! man $SECTION $PAGE > $TMP_PAGE 2>/dev/null ; then
		echo "Page de manuel pour $PAGE introuvable" >&2
		continue
	fi

	if [ -n "$SECTION" ] ; then
		FICHIER=${PAGE}.${SECTION}.html
		TITRE="Manuel Linux - ${PAGE} (${SECTION})"
	else
		FICHIER=${PAGE}.html
		TITRE="Manuel Linux - ${PAGE}"
	fi

	echo "$PAGE $SECTION -> $FICHIER"

	SCRIPT=$(echo '
		1i\
		<HTML><HEAD><TITLE>' $TITRE '</TITLE></HEAD><BODY><PRE>
 
		$a\
		</PRE></BODY></HTML>
 
		/^$/ {
        		N
        		/^\n$/D
		}
 
		s/</\&lt;/g
		s/\(.\)\1/<B>\1<\/B>/g
		s/\&lt;\&lt;/<B>\&lt;<\/B>/g
		s/_\(.\)/<I>\1<\/I>/g
		s/_\&lt;/<I>\&lt;<\/I>/g
		s/<\/I>\( *\)<I>/\1/g
		s/<\/B>\( *\)<B>/\1/g
		s/^\n?<B>\(.*\)<\/B>$/<H2>\1<\/H2>/g
		/^\n[^< ]/d
	')

	sed -e "$SCRIPT" < $TMP_PAGE | $LATIN1_2_HTML > $FICHIER
done

rm -f $TMP_PAGE

