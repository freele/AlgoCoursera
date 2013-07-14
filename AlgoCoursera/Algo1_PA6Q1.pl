#!usr/bin/perl -w

use strict;

my @interval = (2500, 4000);

my @input;

open InputFile, "Algo1_PA6Q1_input.txt";
while (<InputFile>){
	my $in = (split /\s+|\t/)[0];
	if ($in <= $interval[1]){
		print "in = $in \n";
		push @input, $in;
	}
}
print "Active size = $#input \n";

my %hash = map  { $_, 1 } @input;
my %check;

my $counter;
my $result = 0;
for my $in(@input)
{
	$counter ++;
	if ( ($counter % 10000) == 0){
		print $counter;
	}
#	print "$counter \n";
	
	delete $hash{ $in };
	for my $sum ($interval[0] .. $interval[1]){
		my $res = $sum - $in;
#		if ($res != $in)
		{
			if ( (exists $hash{ $res }) && !(exists $check{ "$sum" }) )
			{
				$check{"$sum" } = 1;
				$result++;
			}
		}
	}
}

print "Result: \n";
print $result;
print "\n";