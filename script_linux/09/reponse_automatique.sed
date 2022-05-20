#! /bin/sed -f

# Ins�rer la premi�re partie du message de r�ponse
1i\
Bonjour,\
\
Vous nous avez envoy� le message suivant.\
Soyez assur�s que le service concern� s'en occupera d�s que possible.\
Merci de votre confiance.\
\

# Supprimer l'en-t�te en effa�ant toutes les lignes jusqu'�
# la premi�re enti�rement blanche.
1,/^$/d

# Recopier toutes les lignes du corps du message original, en ins�rant
# un symbole de citation en d�but de ligne.
s/^/> /

# Ajouter la seconde partie du message de r�ponse
$a\
Cordialement,
