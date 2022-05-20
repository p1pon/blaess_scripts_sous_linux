#! /bin/ksh

annee=${1:-$(date +%Y)}
echo "Calcul de la date de Pâques pour" $annee
: $((G = $annee % 19 + 1))
: $((H = $annee / 100))
: $((C = -$H + $H/4 + (8 * ($H + 11)) / 25))
: $((J = 50 - (11 * $G + $C) % 30))
if [ $(($J == 50)) = 1 ] ; then
	J=49
fi
if [ $((($J == 49) && ($G >= 12))) = 1 ] ; then
	J=48
fi
# Pâques tombe le dimanche immédiatement après le
# J Mars (J pouvant aller jusqu'à 49, c'est à dire
# le 18 Avril).
Jour_Semaine=$(date -d "03/$J/$annee" +%w)
: $((Jour_Paques = $J + (7 - $Jour_Semaine) % 7))
	
date -d "03/$Jour_Paques/$annee" +%x


