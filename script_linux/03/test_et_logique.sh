#! /bin/sh

  echo -n "Fichier � examiner : " &&
  read F &&
  echo -n "Texte recherch� : " &&
  read T && 
  grep $T $F > /dev/null &&
  echo "Le texte $T a �t� trouv�"
