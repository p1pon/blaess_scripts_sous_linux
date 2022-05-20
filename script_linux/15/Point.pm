################################################
# Point.pm - Implémentation de la classe Point #
################################################

package Point;

sub new ($;$$$)
{
	my $pkg = shift;
	my $point = { "x" => 0, "y" => 0, "z" => 0 };
	bless $point, $pkg;
	return ($point) if (! defined ($_[0]));
	if (ref($_[0]) eq $pkg) {
		%{$point} = %{$_[0]};
		return ($point);
	}
	$point -> {"x"} = shift;
	$point -> {"y"} = shift if (defined ($_[0]));
	$point -> {"z"} = shift if (defined ($_[0]));
	return ($point);
}

sub x ($;$)
{
	my $point = shift;
	return ($point -> {"x"}) if (! defined ($_[0]));
	$point -> {"x"} = shift;
}

sub y ($;$)
{
	my $point = shift;
	return ($point -> {"y"}) if (! defined ($_[0]));
	$point -> {"y"} = shift;
}

sub z ($;$)
{
	my $point = shift;
	return ($point -> {"z"}) if (! defined ($_[0]));
	$point -> {"z"} = shift;
}

sub translate ($$$$)
{
	my $point = shift;
	$point -> x ($point -> x () + shift);
	$point -> y ($point -> y () + shift);
	$point -> z ($point -> z () + shift);
}

sub affiche ($)
{
	my $point = shift;
	print "(" . $point -> x() . ", "
		  . $point -> y() . ", "
		  . $point -> z() . ") ";
}

	return 1;
