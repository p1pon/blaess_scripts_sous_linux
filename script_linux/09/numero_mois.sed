#! /bin/sed -f

s/$/@1 Janvier@2 F�vrier@3 Mars@4 Avril@5 Mai@6 Juin@7 Juillet@8 Ao�t@9 Septembre@10 Octobre@11 Novembre@12 D�cembre/
s/\([^@]*\)\([0-9][0-9]*\)\(.*\)@\2 \([^@]*\)/\1\4\3@\2 \4/g
s/\([^@]*\).*$/\1/

