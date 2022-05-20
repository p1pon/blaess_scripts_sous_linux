#! /bin/sh

eval "exec /usr/bin/awk -f $0 \"$@\" < $0" && echo {}

BEGIN {
	
	PI = atan2(0,-1)
	
	# Longitude négative à l'est de Greenwich - Par défaut : Paris
	longitude_obs = - deg_min_sec_en_decimales(2,  20, 14) / 180 * PI
	latitude_obs  =   deg_min_sec_en_decimales(48, 50, 14) / 180 * PI
	
	heure_calcul = systime()
	
	# Jours juliens écoulés depuis le 1er Janvier 1900
	jour_julien = int (heure_calcul / 86400) + 25203

	temps_sideral  =  1.7273 + 1.72027914e-2 * jour_julien
	temps_sideral += 2 * PI * (heure_calcul % 86400) / 86400
	temps_sideral -= longitude_obs
	while (temps_sideral > 2 * PI)
		temps_sideral -= 2 * PI
	while (temps_sideral < 0)
		temps_sideral += 2 * PI
	printf "\nCalcul des positions planétaires\n"
	printf "le %s, ", strftime ("%d/%m/%Y", heure_calcul)
	printf "jour julien = %d\n", jour_julien
	printf " à %s (heure locale), ", strftime ("%T", heure_calcul)
	printf "temps sidéral = %s\n", radians_en_heures(temps_sideral)

	nb_astres = 0
	indice_soleil = -1
}

# Les données sont contenues sur des lignes commençant par deux dièses,
# les autres lignes constituant le script ne nous intéressent pas.
!/^##/ { next }

# Chargement des tableaux avec les valeurs des lignes de données
{
	nom_astre           [nb_astres] = $2
	if ($2 == "Soleil")
		indice_soleil = nb_astres
	longitude_perihelie [nb_astres] = $3 + $4 * jour_julien
	longitude_moyenne   [nb_astres] = $5 + $6 * jour_julien
	longitude_noeud     [nb_astres] = $7 + $8 * jour_julien
	excentricite        [nb_astres] = $9
	inclinaison         [nb_astres] = $10
	demi_grand_axe      [nb_astres] = $11
	nb_astres ++
}

## Soleil   4.8689  1.72027914e-2  4.9085  8.1856e-7  0.0      0.0        0.016751  0.0        1.00000023
## Mercure  4.0117  7.14254534e-2  1.3249  7.4229e-7  0.82304  5.6618e-7  0.205615  1.2220e-1  0.387098
## Vénus    3.6086  2.796311e-2    2.2716  6.5572e-7  1.3229   4.3668e-7  0.006816  5.9230e-2  0.723333
## Mars     2.1776  9.14676584e-3  5.8338  8.793e-7   0.8516   3.712e-7   0.093309  3.2294e-2  1.523678
## Jupiter  4.6879  1.4509868e-3   0.2289  8.57e-7    1.7358   4.83e-7    0.048376  2.284e-2   5.202799
## Saturne  4.8567  5.8484028e-4   1.5974  4.12e-7    1.9686   4.17e-7    0.054311  4.35e-2    9.552098
## Uranus   4.3224  2.05424e-4     2.9523  7.62e-7    1.2825   2.3824e-7  0.047319  1.3482e-2  19.21694
## Neptune  1.5223  1.05061e-4     0.7637  3.93e-7    2.281    5.25e-7    0.008262  3.1054e-2  30.112912
## Pluton   1.6406  7.01214e-5     3.8978  6.672e-7   1.9034   6.672e-7   0.250236  2.9968e-1  39.438712

END {
	if (indice_soleil < 0) {
		print "Données concernant le Soleil introuvables"
		exit 1
	}
	for (astre = 0; astre < nb_astres; astre ++) {
		# Formule de Képler
		anomalie_moyenne = longitude_perihelie[astre]           \
		                 - longitude_moyenne[astre]
		anomalie = 0
		for (i = 0; i < 100; i ++)
			anomalie = anomalie_moyenne                     \
			         + excentricite [astre] * sin (anomalie);
		anomalie_moyenne = anomalie
		anomalie_vraie   = 2 * atan(tan(anomalie_moyenne / 2)   \
				     * sqrt(  (1 + excentricite[astre]) \
				            / (1 - excentricite[astre])))
		arg_latitude  = anomalie_vraie                          \
		                   + longitude_moyenne[astre]           \
				   - longitude_noeud[astre]
		# Longitudes et rayon-vecteur
		if (abs(cos(arg_latitude)) < 0.01) {
		        # Tangente -> infini
			longitude_ecliptique[astre] = arg_latitude
		} else {
			longitude_ecliptique[astre] = atan(             \
			                 tan(arg_latitude)              \
			               * cos(inclinaison[astre]))
			if (cos(arg_latitude) < 0)
				longitude_ecliptique[astre] += PI
		}
		longitude_helio[astre] = longitude_ecliptique[astre]    \
		                       + longitude_noeud[astre]
		rayon_vecteur = demi_grand_axe[astre]                   \
		              * (1 - excentricite[astre]                \
			             * cos(anomalie_moyenne))
		# Coordonnées cartésiennes héliocentriques
		bs = atan(sin(longitude_ecliptique[astre])              \
		        * tan(inclinaison[astre]))
		x[astre] = rayon_vecteur * cos(bs)                      \
		         * cos(longitude_helio[astre])
		y[astre] = rayon_vecteur * cos(bs)                      \
		         * sin(longitude_helio[astre])
		z[astre] = rayon_vecteur * sin(bs)
	}
	for (astre = 0; astre < nb_astres; astre ++) {
		# Coordonnées cartésiennes géocentriques
		if (astre != indice_soleil) { 
			x[astre] += x[indice_soleil]
			y[astre] += y[indice_soleil]
		}
		# Latitude et longitude géocentriques
		latitude[astre]  = atan2(z[astre] ,                     \
		                         hypot(x[astre], y[astre]))
		longitude[astre] = atan2(y[astre], x[astre])
		# Ascension droite et déclinaison
		declinaison[astre] = asin(0.917408                      \
		                            * sin(latitude[astre])      \
					  + 0.397949                    \
					    * cos(latitude[astre])      \
					    * sin(longitude[astre]))
		asc_droite[astre] = atan((0.917408                      \
		                           * cos (latitude[astre])      \
					   * sin (longitude[astre])     \
					  - 0.397949                    \
					   * sin (latitude[astre]))     \
		                         / cos(latitude[astre])         \
		                         / cos(longitude[astre]))
		if (cos(latitude [astre]) * cos(longitude[astre]) < 0)
			asc_droite[astre] += PI
		if (asc_droite[astre] < 0)
			asc_droite[astre] += 2 * PI
		# Heures de lever, culminance, coucher
		difference_asc = - 8.72654e-3 - tan(latitude_obs)       \
					      * tan(declinaison[astre])
		if (difference_asc >= 1) {
			heure_culminante[astre]=-1
			heure_lever[astre]=-1
			heure_coucher[astre]=-1
		} else {
			demi_duree[astre] = PI / 2 - asin(difference_asc)
			heure_culminante[astre] = asc_droite [astre]    \
			                          - temps_sideral       \
			         + ((heure_calcul%86400) / 86400) * 2*PI
			if (heure_culminante [astre] < 0)
				heure_culminante[astre] += 2 * PI
			heure_lever[astre] =   heure_culminante[astre]  \
			                       - demi_duree[astre]
			heure_coucher[astre] = heure_culminante[astre]  \
			                       + demi_duree[astre]
		}
	}
	# Affichage des résultats
	printf "\n"
	printf "         | Ascension |             |"
	printf "  Heure   |  Heure   |  Heure    \n"
	printf "  Nom    |  Droite   | Déclinaison |"
	printf "  Lever   | Sommet   | Coucher   \n" 
	printf "         | hh:mm:ss  | °°°:mm:ss   |"
	printf "  (T.U.)  |  (T.U.)  |  (T.U.)   \n"
	printf "---------+-----------+-------------+"
	printf "----------+----------+---------- \n"
 	for (astre = 0; astre < nb_astres; astre ++) {
		printf "%-8s | ",   nom_astre[astre]
		printf "%-8s  | ",  radians_en_heures(asc_droite [astre])
		printf "%-10s  | ", radians_en_degres(declinaison[astre])

		if (heure_culminante[astre]>= 0) {
			printf "%-8s | %-8s | %-8s",
			  radians_en_heures(heure_lever[astre]),
			  radians_en_heures(heure_culminante[astre]),
			  radians_en_heures(heure_coucher[astre])
		} else {
			printf "        pas observable"
		}
		printf "\n"
	}
	printf "\n"
}


function abs (x)
{
	return (sqrt(x *x))
}

function asin (x)
{
	return (atan2(x, sqrt(1 - x*x)))
}

function atan (x)
{
	return (atan2(x, 1))
}

function hypot (x, y)
{
	return (sqrt( x * x + y *y))
}

function tan (x)
{
	return (sin(x) / cos(x))
}



function radians_en_degres (r,        dr, d, dd, mm, ss)
{
	dr = r * 180 / PI
	while (dr > 180)
		dr -= 360
	while (dr < -180)
		dr += 360
	d=abs(dr)
	dd=int(d)
	mm=int((d - dd) * 60)
	ss=int((((d - dd) * 60) - mm) * 60)
	if (dr < 0)
		signe="-"
	else
		signe=""
	return (signe dd ":" mm ":" ss)
}

function radians_en_heures (r,        h, hh, mm, ss)
{
	h = r * 12 / PI
	while (h > 24)
		h -= 24
	while (h < -0)
		h += 24
	hh=int(h)
	mm=int((h - hh) * 60)
	ss=int((((h - hh) * 60) - mm) * 60)
	return (hh ":" mm ":" ss)
}

function deg_min_sec_en_decimales (d, m, s)
{
	return (d + m / 60 + s / 3600)
}
