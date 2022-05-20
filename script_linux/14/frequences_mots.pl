#! /usr/bin/perl -w

%html_2_latin = (
	"&Agrave;"	=> "À",	"&Aacute;"	=> "Á",
	"&Acirc;"	=> "Â",	"&Atilde;"	=> "Ã",
	"&Auml;"	=> "Ä",	"&Aring;"	=> "Å",
	"&AElig;"	=> "Æ",	"&Ccedil;"	=> "Ç",
	"&Egrave;"	=> "È",	"&Eacute;"	=> "É",
	"&Ecirc;"	=> "Ê",	"&Euml;"	=> "Ë",
	"&Igrave;"	=> "Ì",	"&Iacute;"	=> "Í",
	"&Icirc;"	=> "Î",	"&Iuml;"	=> "Ï",
	"&ETH;"		=> "Ð",	"&Ntilde;"	=> "Ñ",
	"&Ograve;"	=> "Ò",	"&Oacute;"	=> "Ó",
	"&Ocirc;"	=> "Ô",	"&Otilde;"	=> "Õ",
	"&Ouml;"	=> "Ö",	"&Oslash;"	=> "Ø",
	"&Ugrave;"	=> "Ù",	"&Uacute;"	=> "Ú",
	"&Ucirc;"	=> "Û",	"&Uuml;"	=> "Ü",
	"&Yacute;"	=> "Ý",	"&THORN;"	=> "Þ",
	"&szlig;"	=> "ß",	"&agrave;"	=> "à",
	"&aacute;"	=> "á",	"&acirc;"	=> "â",
	"&atilde;"	=> "ã",	"&auml;"	=> "ä",
	"&aring;"	=> "å",	"&aelig;"	=> "æ",
	"&ccedil;"	=> "ç",	"&egrave;"	=> "è",
	"&eacute;"	=> "é",	"&ecirc;"	=> "ê",
	"&euml;"	=> "ë",	"&igrave;"	=> "ì",
	"&iacute;"	=> "í",	"&icirc;"	=> "î",
	"&iuml;"	=> "ï",	"&eth;"		=> "ð",
	"&ntilde;"	=> "ñ",	"&ograve;"	=> "ò",
	"&oacute;"	=> "ó",	"&ocirc;"	=> "ô",
	"&otilde;"	=> "õ",	"&ouml;"	=> "ö",
	"&oslash;"	=> "ø",	"&ugrave;"	=> "ù",
	"&uacute;"	=> "ú",	"&ucirc;"	=> "û",
	"&uuml;"	=> "ü",	"&yacute;"	=> "ý",
	"&thorn;"	=> "þ"
);

%html_2_ascii = (
	"&nbsp;" =>  " ",
	"&amp;"  =>  "&",
	"&lt;"   =>  "<",
	"&gt;"   =>  ">"
	);

while (<>) {
	s/<[^>]*>//g;
	foreach $entite (keys %html_2_latin) {
		s/$entite/$html_2_latin{$entite}/ge;
	}
	foreach $entite (keys %html_2_ascii) {
		s/$entite/$html_2_ascii{$entite}/ge;
	}
	@mots = m/[^ \t\n]*/g;
	foreach $mot (@mots) {
		$frequence {lc $mot} ++;
	}
}
open STDOUT, "|sort -r";
foreach $mot (keys %frequence) {
	printf "%05d %s\n", $frequence{$mot}, $mot;
}
close STDOUT;
