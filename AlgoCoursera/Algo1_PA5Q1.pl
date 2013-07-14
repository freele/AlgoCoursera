#!usr/bin/perl -w
use strict;
use Graph;

my $source = 1;

my $InG = Graph::Undirected->new();
open InputGraph, "<Algo1_PA5Q1_input.txt";

while (<InputGraph>){
	my @temp = split /\s+|,|\t/;
	my $from = $temp[0];
#	for (@temp){
#		print "$_\n";
#	}	
	  for my $edge(1..$#temp/2){
		 $InG->add_weighted_edge($from, $temp[2*$edge-1], $temp[2*$edge]);
	    }
}
	
my @edges = $InG->edges();
my @nodes = $InG->vertices();
my @pathes = ();
my %compG = ();
$compG{$source} = 1;
$pathes [$source] = 0;
my $counter = 0;
for my $node (@nodes){
	print $counter;
	$counter++;
#	print "Node = $node \n";
	my $min = 999999;
	my $min_dest = 0;
	
	for my $edge (@edges){
		
		if ( defined($compG{$$edge[0]}) && !defined($compG{$$edge[1]}) ){
			my $dist = $pathes[$$edge[0]] + $InG->get_edge_weight($$edge[0], $$edge[1]);
			if ( $dist < $min ){
				$min = $dist;
				$min_dest = $$edge[1];
#				print "min $min, min_dest $min_dest  first\n";
			}
		} elsif ( !defined($compG{$$edge[0]}) && defined($compG{$$edge[1]}) ) {
			my $dist = $pathes[$$edge[1]] + $InG->get_edge_weight($$edge[0], $$edge[1]);
			if ( $dist < $min ){
				$min = $dist;
				$min_dest = $$edge[0];
#				print "min $min, min_dest $min_dest second\n"
			}
		}
#		print $$edge[1];
#		print "$$edge[0] - $$edge[1] \n";
	}
	$compG{$min_dest} = 1;
	$pathes [$min_dest] = $min;
	
}

#7,37,59,82,99,115,133,165,188,197

print "\n";
for my $num (7,37,59,82,99,115,133,165,188,197)
{
	print "$pathes[$num],"
}
for (@pathes){
#print "$_ \n";	
	}


#print "$InG \n";
