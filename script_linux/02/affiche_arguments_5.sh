#! /bin/sh

i=0
while [ $i -le $# ]; do
  echo -n $i :
  eval echo \$$i
  : $((i += 1))
done
