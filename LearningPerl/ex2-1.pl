#!/usr/bin/perl -w
$pi = 3.141592654;
$radius = <STDIN>;
if ($radius>0)
{
	$circ = 2 * $pi * $radius;
}
else
{	
	$circ=0;
}
	
print "$circ \n";