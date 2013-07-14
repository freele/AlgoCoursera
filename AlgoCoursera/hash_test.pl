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

my @test = (1, 1, 1, 2, 11, 14, 15);
for (sort {$a < $b} @test) {print "$_ \n"};

my %SCC = (0,1,2,3,4,5,6,7,8,9, 10, 11, 11, 11, 12, 150, 13, 155);
my @SCC_sizes = ( reverse sort {$a <=> $b} values %SCC);
my @SCC_sizes_deb = ( reverse sort values %SCC);

for (0..4){
	print "$SCC_sizes[$_],";
}
print "\n";
for (0..4){
	print "$SCC_sizes_deb[$_],";
}
