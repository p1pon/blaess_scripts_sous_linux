#! /usr/bin/awk -f

function atan(x)
{
	return (atan2(x, 1))
}

function asin(x)
{
	if ((x < -1) || (x > 1))
		return;
	return (atan2(x, sqrt(1 - x ^ 2)))
}

function acos(x)
{
	if ((x < -1) || (x > 1))
		return;
	return (atan2(sqrt(1 - x ^ 2), x))
}

function tan(x)
{
	return (sin(x) / cos (x))
}

function log10(x)
{
	return (log(x) / log(10))
}

function log2(x)
{
	return (log(x) / log(2))
}

function E(x)
{
	if (x < 0)
		return (int(x - 1))
	return (int(x))
}

function round(x)
{
	if (x > 0)
		return (int(x + 0.5))
	return (int (x - 0.5))
}

{
	x = $0 + 0
	print "x = " x
	print "  atan(x) = " atan(x)
	print "  asin(x) = " asin(x)
	print "  acos(x) = " acos(x)
	print "  tan(x)  = " tan(x)
	print "  log10(x)= " log10(x)
	print "  log2(x) = " log2(x)
	print "  E(x)    = " E(x)
	print "  round(x)= " round(x)
}
