#! /usr/bin/perl -w

my $nom_fonction="factorielle";

my $resultat=&$nom_fonction(5);

print "$resultat\n";

sub factorielle
{
	my ($val) = @_;
	return 1 if ($val <= 1);
	return $val * factorielle($val -1);
}

