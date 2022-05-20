package Cercle;

sub zoom ($$)
{
	my $cercle = shift;
	my $zoom = shift;
	$cercle -> r ($cercle -> r() * $zoom);
}

	return 1;
