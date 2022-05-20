#! /usr/bin/python

import sys

liste = sys.stdin.readlines()
liste.sort()
liste.reverse()
sys.stdout.writelines(liste)
sys.stderr.write ("%d lignes ‚crites\n" % len(liste))
