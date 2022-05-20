#! /usr/local/bin/ruby

table = [1, 2, 3, 4, 5, 6]
print "Table initiale : "
print table.join(", "), "\n"

print "Copie erron‚e copie=table...\n"
copie = table
print "  Copie : "
print copie.join(", "), "\n"
print "  Modification de la copie...\n"
copie[0..2] = ["A", "B", "C"]
print "  Copie : "
print copie.join(", "), "\n"
print "  Table : "
print table.join(", "), "\n"

print "Copie correcte copie=table[0..-1]...\n"
copie = table[0..-1]
print "  Copie : "
print copie.join(", "), "\n"
print "  Modification de la copie...\n"
copie[0..2] = ["X", "Y", "Z"]
print "  Copie : "
print copie.join(", "), "\n"
print "  Table : "
print table.join(", "), "\n"

