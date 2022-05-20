#! /bin/ksh

function fonct
{
  echo "  Dans la fonction : "
  echo "  0 : $0"
  echo "  1 : $1"
  echo "  2 : $2"
}

  echo "Dans le script : "
  echo 0 : $0
  echo 1 : $1
  echo 2 : $2
  echo "Appel de : fonct un deux"
  fonct un deux
 
