#!usr/bin/perl -w
use strict;

#[knapsack_size][number_of_items]
#[value_1] [weight_1]
#[value_2] [weight_2]

open InputInfo, 'Algo2_PA3Q1_input.txt';
 
 my @SizeAndNumber = split (/\s+/, <InputInfo>);
 
 my $knapsack_size = $SizeAndNumber[0];
 my $number_of_items = $SizeAndNumber[1];
 print "size = $knapsack_size, number 0f items = $number_of_items  \n";
 
 #Subroutines
 sub max {
	my ($max, @vars) = @_;
	for (@vars) {
		$max = $_ if $_ > $max;
	}
	return $max;
}

 #Reading input
 my @weights;
 my @values;
 
 foreach ( 1..$number_of_items)
 {
 	my @temp = split (/\s+/, <InputInfo> );

	$values[$_] = $temp[0];
	$weights[$_] = $temp[1];
 }
 
 #Main algorithm
my @A;
foreach ( 0..$knapsack_size){
	$A[0][$_] = 0;
}

foreach my $i  ( 1..$number_of_items){
	foreach my $temp_w ( 0..$knapsack_size){
		if ( $temp_w >= $weights[$i]){
#			print "case1 \n";
			$A[$i][$temp_w] = &max ( $A[$i-1][$temp_w], ($A[$i-1][$temp_w - $weights[$i]] + $values[$i]) )
		}
		else{
#			print "case2 \n";
			$A[$i][$temp_w] = $A[$i-1][$temp_w];
		}
#		print "i=$i, w=$temp_w, A=$A[$i][$temp_w] \n";
	}
 }
 print "A=$A[-1][-1] \n";