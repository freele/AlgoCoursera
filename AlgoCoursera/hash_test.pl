#!usr/bin/perl -w
use strict;

my @array = (0, 2, 8, 4, 16);
my %hash = ();

for my $i ( 0..$#array )
{
	$hash{$i} = $array[ $i ];
}

my @indexes = sort {  $hash{ $a } <=> $hash{ $b }} keys (%hash);

print "@array \n@indexes \n";

my %provisions = (
'The Skipper' => [qw(blue_shirt hat jacket )],
'The Professor' => [('zero', 0, 'one', 1)],
'Gilligan'=> [10, 20, 30],
);

 my @test_hash;
 $test_hash[0] {"123"} = "qwerty";
 $test_hash[1] {23} = "asdfg";
  print $test_hash[0]{"123"};
  
my @test = (0, 1, 2, 3);
print @test;
print "\n";
my $string = "@test";
print $string . "\n";



push $provisions{'The Professor'}, 5;
@indexes = %provisions;
print "$provisions{'The Professor'}[2] \n";
