#!usr/bin/perl -w


#input file format:
#[number_of_nodes]
#[edge 1 node 1] [edge 1 node 2] [edge 1 cost]
#[edge 2 node 1] [edge 2 node 2] [edge 2 cost]

use strict;
use Graph::UnionFind;
use Graph::Undirected;
use Heap::Simple;


open InputGraph ,'<Algo2_PA2Q1_input.txt';

my $number_of_nodes = <InputGraph>;
my $k_number_of_clusters = 4;

print "number_of_nodes = $number_of_nodes";

my $inputGraphG = Graph::Undirected->new;
my $UnionFind = Graph::UnionFind->new;

my @input_string = split (/]s+/, <InputGraph>);
my @node1;
my @node2;
my $cost;
print @input_string;

my $heap = Heap::Simple->new (order => "<", elements => "Any");

#Building a heap from input data
my $i = 0;
while (<InputGraph>)
{
	@input_string = split (/\s+/, $_);
	$node1[$i] = $input_string [0];
	$node2[$i] = $input_string [1];
	$cost = $input_string [2];
	#$cost = $input_string[2];
	
#	print "cost = ". "$cost \n";
#	print @input_string;
#	print "cost = " . "$cost" . "   number = " . "$i \n";
	$heap->key_insert($cost, $i);
	$i++;
#	print @input_string;
}

#building UF with data in the heap

$i = 0;
my $j;
while ($i <=  $number_of_nodes - $k_number_of_clusters  -1 )
{
	my $dist = $heap->top_key;
	$j = $heap->extract_top;
	
#	print "i= $i, j= $j, dist = $dist  \n";
	
	if ( !$UnionFind->same($node1[$j], $node2[$j]))
	{
		$UnionFind->union($node1[$j], $node2[$j]);
		$i++;
	}
}

my $Result = $heap->top_key;
while ($UnionFind->same($node1[$j], $node2[$j]))
{
	$Result = $heap->top_key;
	$j = $heap->extract_top;
}

print "Result = " . "$Result";
















