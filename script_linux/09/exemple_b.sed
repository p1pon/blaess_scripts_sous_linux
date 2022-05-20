#! /bin/sed -f

2{
	b ligne_1
}

1{
	: ligne_1
	=
	p
}
d
