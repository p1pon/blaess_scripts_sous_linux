#! /usr/bin/perl -w

sub produit_vectoriel
{
	(@u[0..2], @v[0..2]) = @_;
	$w [0] = $u[1] * $v[2] - $u[2] * $v[1];
	$w [1] = $u[2] * $v[0] - $u[0] * $v[2];
	$w [2] = $u[0] * $v[1] - $u[1] * $v[0];
	return (@w);
}

sub affiche_vecteur
{
	($x, $y, $z) = @_;
	return ("($x, $y, $z)");
}

@i = (1, 0, 0);
@j = (0, 1, 0);
@k = produit_vectoriel (@i, @j);

print affiche_vecteur (@i);
print " x ";
print affiche_vecteur (@j);
print " = ";
print affiche_vecteur (@k);
print "\n";
