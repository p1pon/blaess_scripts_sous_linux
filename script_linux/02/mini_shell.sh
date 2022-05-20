#! /bin/sh

while true ; do
  echo -n "? "
  read ligne
  if [ -z "$ligne" ] ; then
    break;
  fi
  eval $ligne
done
