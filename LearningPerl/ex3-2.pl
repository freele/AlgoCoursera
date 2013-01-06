#!usr/bin/perl -w
@names = qw /name1 name2 name3/;
@numbers = <STDIN>;
foreach (@numbers) 
{
	print $names[$_], "\n";
}
	