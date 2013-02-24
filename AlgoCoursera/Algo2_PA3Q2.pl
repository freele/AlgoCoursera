#!usr/bin/perl -w
use strict;

#[knapsack_size][number_of_items]
#[value_1] [weight_1]
#[value_2] [weight_2]

open InputInfo, 'Algo2_PA3Q2_input.txt';
 
 my @SizeAndNumber = split (/\s+/, <InputInfo>);
 
 my $knapsack_size = $SizeAndNumber[0];
 my $number_of_items = $SizeAndNumber[1];
 my %BVFW = ();
 print "size = $knapsack_size, number 0f items = $number_of_items  \n";
 
 
 #Reading input
 my @weights;
 my @values;
 foreach ( 1..$number_of_items)
 {
 	my @temp = split (/\s+/, <InputInfo> );

	$values[$_] = $temp[0];
	$weights[$_] = $temp[1];
 }
 
 #Subroutines
 sub max {
	my ($max, @vars) = @_;
	for (@vars) {
		$max = $_ if $_ > $max;
	}
	return $max;
}

sub best_value_for_weight{
	my ( $item, $weight ) = @_;
	print "weight = $weight item = $item\n";
	if ( !exists $BVFW{"$weight $item"} ){
		if ($weight >= $weights[$item]){
			if ($item == 1){
				$BVFW{"$weight $item"} = &max ($BVFW{"$weight"}, $values[$item]);
			}
			else{
				$BVFW{"$weight $item"} = &max ( best_value_for_weight ($item - 1, $weight), best_value_for_weight ($item - 1, $weight - $weights[$item]) + $values[$item] );
			}
		}
		else{
			if ($item == 1){
				$BVFW{"$weight $item"} = 0;dŗ
			}
			else{
				$BVFW{"$weight $item"} = &best_value_for_weight ($item - 1, $weight);
			}
		}
	}
	my $temp = "$weight $item";
	print "$BVFW{$temp} \n";
	return $BVFW{"$temp"};
}


 
 #Main algorithm
my @A;
foreach ( 0..$knapsack_size){
	$A[0][$_] = 0;
}

best_value_for_weight ($number_of_items, $knapsack_size);
print "A=$A[-1][-1] \n";