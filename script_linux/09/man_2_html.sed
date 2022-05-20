#! /bin/sed -f

# Ajouter les balises sur la première ligne
1i\
<HTML><HEAD><TITLE>Manuel Linux</TITLE></HEAD><BODY><PRE>

# Ajouter les balises finales
$a\
</PRE></BODY></HTML>

# Si on rencontre une ligne vide, lire la suivante
/^$/ {
	N
	# Si elle est également vide, supprimer la première
	/^\n$/D
}

# Remplacer les signes inférieurs par une séquence HTML
s/</\&lt;/g

# Remplacer les séquences caractère-backspace-caractère par
# <B>caractere</B>, avec le cas particulier du signe inférieur
s/\(.\)\1/<B>\1<\/B>/g
s/\&lt;\&lt;/<B>\&lt;<\/B>/g

# Remplacer les séquences underscore-backspace-caractère par
# <I>caractère</I>, avec le cas particulier du signe inférieur
s/_\(.\)/<I>\1<\/I>/g
s/_\&lt;/<I>\&lt;<\/I>/g

# Regrouper les caractères italiques successifs en supprimant
# les paires </I><I> même si elles contiennent des espaces.
s/<\/I>\( *\)<I>/\1/g

# Regrouper les caractères gras successifs en supprimant
# les paires </B><B> même si elles contiennent des espaces.
s/<\/B>\( *\)<B>/\1/g

# Remplacer les séquences <B>phrase</B> en début de ligne par
# des titres <H2>
s/^\n?<B>\(.*\)<\/B>$/<H2>\1<\/H2>/g

# Supprimer les lignes ne commençant pas par un blanc ou un
# inférieur (ce qui élimine les entêtes et pieds de page)
/^\n[^< ]/d

