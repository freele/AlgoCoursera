#!usr/bin/perl -w
use strict;

use Graph;

my $temp = Graph::Undirected->new( countedged => 1 );
open InputGraph, "<Algo1_PA3Q1_input.txt";

while (<InputGraph>){
	my @temp = split /\s+/;
	my $from = shift @temp;
	
	  for my $to(@temp){
		if ( !$temp->has_edge($from, $to) ){
			 $temp->add_edge($from, $to);
		}
	    }
}
	
my $temp1 = Graph::Undirected->new( countedged => 1 );
for (0..10){
	my $rand = int( rand (2) );
#	print $rand . "\n";
}


#for (0..100){
		my @edges = $temp1->edges();
		my $edges = $temp1->edges();
#		my $from = $$rand_edge[0];
#		my $to = $$rand_edge[1];
#		print "$from-$to \n";

#}

my $min = 999;
for (0..100){
	my $input = $temp->copy_graph;
#	print "G:	$input \n";

	my $size = $input->vertices();
#	print $size . "\n";
	while ($input->unique_edges != 1){
		my @edges = $input->edges();
		my $edges_c = $input->edges();
		my $rand = rand ($edges_c);
		
		my $rand_edge = $edges[ $rand ];
		my $from = $$rand_edge[0];
		my $to = $$rand_edge[1];
#		print "EDGE $from-$to \n";
		my %neighbours = map {$_, 1} $input->neighbours($from);
		delete $neighbours{ $to };
		
		for my $n(keys %neighbours){
			my $count = $input->get_edge_count( $n, $from );
			for	( 1..$count ){
				$input->delete_edge( $n, $from );
				$input->add_edge( $n, $to );
			}
#			print "delete $n-$from 	add $n-$to	Count=$count \n";
			
		}
		for ( 1..$input->get_edge_count( $from, $to ) ){
			$input->delete_edge( $from, $to );
#			print "delete $from-$to		Deleting chosen edge\n";
		}
#		print "delete edge $from-$to \n";
#		print "G:	$input \n";
		
	}

	my $e = $input->random_edge;
#	print "$$e[0], $$e[1]  \n";
	my $result = $input->get_edge_count( $$e[0], $$e[1] );

	if ( $min>$result){
		$min = $result;
	}
#	print "\n";
	print "RESULT = $result \n";
}


print "MIN RESULT = $min \n";

