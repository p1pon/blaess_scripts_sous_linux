#! /bin/ksh

while true ; do
  echo -n "? "
  read ligne
  if [ -z "$ligne" ] ; then
    break;
  fi
  eval $ligne
done
