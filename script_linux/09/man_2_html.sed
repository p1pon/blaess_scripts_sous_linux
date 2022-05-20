#! /bin/sed -f

# Ajouter les balises sur la premi�re ligne
1i\
<HTML><HEAD><TITLE>Manuel Linux</TITLE></HEAD><BODY><PRE>

# Ajouter les balises finales
$a\
</PRE></BODY></HTML>

# Si on rencontre une ligne vide, lire la suivante
/^$/ {
	N
	# Si elle est �galement vide, supprimer la premi�re
	/^\n$/D
}

# Remplacer les signes inf�rieurs par une s�quence HTML
s/</\&lt;/g

# Remplacer les s�quences caract�re-backspace-caract�re par
# <B>caractere</B>, avec le cas particulier du signe inf�rieur
s/\(.\)\1/<B>\1<\/B>/g
s/\&lt;\&lt;/<B>\&lt;<\/B>/g

# Remplacer les s�quences underscore-backspace-caract�re par
# <I>caract�re</I>, avec le cas particulier du signe inf�rieur
s/_\(.\)/<I>\1<\/I>/g
s/_\&lt;/<I>\&lt;<\/I>/g

# Regrouper les caract�res italiques successifs en supprimant
# les paires </I><I> m�me si elles contiennent des espaces.
s/<\/I>\( *\)<I>/\1/g

# Regrouper les caract�res gras successifs en supprimant
# les paires </B><B> m�me si elles contiennent des espaces.
s/<\/B>\( *\)<B>/\1/g

# Remplacer les s�quences <B>phrase</B> en d�but de ligne par
# des titres <H2>
s/^\n?<B>\(.*\)<\/B>$/<H2>\1<\/H2>/g

# Supprimer les lignes ne commen�ant pas par un blanc ou un
# inf�rieur (ce qui �limine les ent�tes et pieds de page)
/^\n[^< ]/d

