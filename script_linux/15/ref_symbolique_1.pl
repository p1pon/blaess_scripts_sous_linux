#! /usr/bin/perl -w

sub somme
{
	my $resultat = shift;
	foreach $i (@_) {
		$resultat += $i;
	}
	return ($resultat);
}

sub produit
{
	my $resultat = shift;
	foreach $i (@_) {
		$resultat *= $i;
	}
	return ($resultat);
}

sub difference
{
	my $resultat = shift;
	foreach $i (@_) {
		$resultat -= $i;
	}
	return ($resultat);
}

sub quotient
{
	my $resultat = shift;
	foreach $i (@_) {
		$resultat /= $i;
	}
	return ($resultat);
}

%operation=(	"+" => "somme",
		"-" => "difference",
		"*" => "produit",
		"/" => "quotient");

@_=@ARGV;
$_ = shift;
my $op = $operation{$_};
die "Opération inconnue\n" if (! defined($op));
print &$op(@ARGV);
print "\n";

