#! /usr/bin/python

def fonct_1 (a, b, * args) :
    print "Fonction 1 :"
    print "  a =", a
    print "  b =", b
    for arg in args:
        print " ", arg

def fonct_2 (g, h, i="", j="", **args) :
    print "Fonction 2 :"
    print "  g =", g
    print "  h =", h
    print "  i =", i
    print "  j =", j
    for cle in args.keys():
        print " ", cle, "=", args[cle]

def fonct_3 (**args) :
    print "Fonction 3 :"
    liste = args.keys()
    liste . sort()
    for cle in liste:
        print " ", cle, "=", args[cle]

fonct_1 ("alpha", "bravo", "charlie", "delta", "echo", "fox-trot")
fonct_2 ("golf", "hotel", j="juliet", i="india", k="kilo", l="lima")
fonct_3 (n="november", m="mike", p="papa", o="oscar", q="quebec",
        z="zulu", y="yankee", x="x-ray", r="romeo", t="tango",
        s="sierra", v="victor", u="uniform", w="whisky")


