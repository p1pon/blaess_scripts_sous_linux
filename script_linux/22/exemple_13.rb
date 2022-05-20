#! /usr/local/bin/ruby

table = [1, 2, 3]
print "Table : "
print table.join(", "), "\n"

print "Modification par collect! : "
table . collect! {|x| x + 3}
print table.join(", "), "\n"

print "Modification par each_index : "
table . each_index { |i| table[i] -= 3 }
print table.join(", "), "\n"

