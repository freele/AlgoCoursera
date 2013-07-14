#!usr/bin/perl -w

use strict;
use Heap::Simple;

my @input;

open InputFile, "Algo1_PA6Q2_input.txt";
while (<InputFile>){
	my $in = (split /\s+|\t/)[0];
	push @input, $in;
}

my $hLow = Heap::Simple->new ( order => ">"  );
my $hHigh = Heap::Simple->new ( order => "<"  );

my $heap = Heap::Simple->new ( order => ">"  );
$heap->insert(0, 1, 2, 3);


my $MEDSUMM = 0;

##### pre init
$hLow->insert (shift @input);
my $min = $hLow->top;
$MEDSUMM+=$min;
my $in = shift @input;
if ($in < $min){
	$hLow->insert ($in);
	$hHigh->insert($hLow->extract_top);
}else{
	$hHigh->insert ($in);
}
$min = $hLow->top;
$MEDSUMM+=$min;
#############

my $even = 1;
for my $in (@input)
{
	if ($even){
#add to low
		$even = 0;
		my $max = $hHigh->top;
		if ($in > $max){
			$hHigh->insert ($in);
			$hLow->insert($hHigh->extract_top);
		}else{
			$hLow->insert ($in);
		}
	}else{
#add to high
		$even = 1;
		my $min = $hLow->top;
		if ($in < $min){
			$hLow->insert ($in);
			$hHigh->insert($hLow->extract_top);
		}else{
			$hHigh->insert ($in);
		}
	}
	
	my $med = $hLow->top;
#	print "increasing median: $med \n";
	$MEDSUMM+= $med;
}

print "result\n$MEDSUMM \n";

print "end \n";
