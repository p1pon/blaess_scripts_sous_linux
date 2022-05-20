#! /bin/sed -f

# Insérer la première partie du message de réponse
1i\
Bonjour,\
\
Vous nous avez envoyé le message suivant.\
Soyez assurés que le service concerné s'en occupera dès que possible.\
Merci de votre confiance.\
\

# Supprimer l'en-tête en effaçant toutes les lignes jusqu'à
# la première entièrement blanche.
1,/^$/d

# Recopier toutes les lignes du corps du message original, en insérant
# un symbole de citation en début de ligne.
s/^/> /

# Ajouter la seconde partie du message de réponse
$a\
Cordialement,
