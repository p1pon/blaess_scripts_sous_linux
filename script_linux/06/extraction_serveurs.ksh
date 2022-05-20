#! /bin/ksh

ligne_path=$(grep "Path: ")
liste_serveurs=${ligne_path##Path: }
while [ -n "$liste_serveurs" ] ; do
  serveur=${liste_serveurs%%!*}
  liste_serveurs=${liste_serveurs#$serveur}
  liste_serveurs=${liste_serveurs#!}
  echo $serveur
done
