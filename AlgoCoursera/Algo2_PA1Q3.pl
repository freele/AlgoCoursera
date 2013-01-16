#!usr/bin/perl -w

#input file format:
#[number_of_nodes] [number_of_edges]
#[one_node_of_edge_1] [other_node_of_edge_1] [edge_1_cost]
#[one_node_of_edge_2] [other_node_of_edge_2] [edge_2_cost]

use strict;
use Graph::Undirected;
use Heap::Simple;

open INPUTJOBS, '<Algo2_PA1Q3_input.txt';
my $number_of_nodes;
my $number_of_edges;

my @temp = split (/\s+/, <INPUTJOBS>);
$number_of_nodes = $temp[0];
$number_of_edges = $temp[1];

my $inputGraphG = Graph::Undirected->new;
my $primsMST = Graph::Undirected->new;

my $in_weight = 0;
my $out_weight = 0;

foreach my $node_number (0..$number_of_edges-1)
{
	@temp = split (/\s+/, <INPUTJOBS>);
	my $node_from = $temp[0];
	my $node_to = $temp[1];
	my $weight = $temp[2];
	
	$in_weight += $weight;
	$inputGraphG ->add_weighted_edge ($node_from, $node_to, $weight);
}

my $current_vertex= ($inputGraphG->vertices)[0];
my $heap = Heap::Simple->new ( order => "<", elements=>"Any"  );
foreach my $i (0..$number_of_nodes-2)
{
	my @neighbours = $inputGraphG->neighbours( $current_vertex );

	foreach my $current_neighbour ( @neighbours )
	{
		print "cur_neighb:	" . $current_neighbour . "\n";
		my $weight = $inputGraphG->get_edge_weight( $current_vertex, $current_neighbour);
		$heap->key_insert( $weight, $current_neighbour );
	}
	
	while ( $primsMST->has_vertex( $heap->top ) )
	{
		$heap->extract_top;
	}
		
	my $weight = $heap->top_key;
	my $destination = $heap->extract_top;
	$primsMST ->add_weighted_edge ( $current_vertex, $destination, $weight);
	print "FROM:	" . $current_vertex . "\n";
	print "TO:	" . $destination. "\n";
	$out_weight += $weight;
	$current_vertex = $destination;
	print "cur_vert:	" . $current_vertex . "\n";
}

my @vertices = $primsMST->vertices;
my @temp_out = $inputGraphG->neighbours( $current_vertex );
print @vertices;
print "\n";
print @temp_out;
print "\n";

print "in_weight:	" . $in_weight . "\n";
print "out_weight:	" . $out_weight . "\n";