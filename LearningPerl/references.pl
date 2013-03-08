#!usr/bin/perl -w
use strict;

my @required = qw /preserver sunscreen water_bottle jacket/;
my %skipper = map {$_, 1} qw /jacket hat preserver/;

for my $item (@required){
	unless ($skipper{$item}){
		print "skipper missed $item \n";
	}
}

my $var1 = 0;
my $var2 = 1;
my @test = (\$var1, \$var2);
print @test . "\n";
print ${ $test[0] } . "\n";
$var1 = 123;
print ${ $test[0] };

my @real_numbers = ();                                 

 my $pointers_to_nums = \@real_numbers; 
 $real_numbers[3] = 1;
 print $$pointers_to_nums[3];
