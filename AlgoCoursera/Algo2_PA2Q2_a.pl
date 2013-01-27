#!usr/bin/perl -w


#input file format:
#[# of nodes] [# of bits for each node's label]
#[first bit of node 1] ... [last bit of node 1]
#[first bit of node 2] ... [last bit of node 2]

use strict;
use Graph::UnionFind;
use Graph::Undirected;
use Heap::Simple;


open InputGraph ,'<Algo2_PA2Q2_input.txt';

my $UnionFind = Graph::UnionFind->new;

my @input_string = split (/\s+/, <InputGraph>);
my $number_of_nodes = $input_string[0];

my $bits_per_node = $input_string[1];
my $cost;
#print @input_string;

my $heap = Heap::Simple->new (order => "<", elements => "Any");

#Building a heap from input data
my @input_nodes;
my $i = 0;
while (<InputGraph>)
{
	print "cur node = $i\n";	
	$_ =~ s/\s+//g;
	$_ = oct ( "0b$_");

#	$input_nodes[i] = unpack '%32b*', pack 'I', $_;
#	print $_ . "\n";
#	print "$input_nodes[$i] \n";
	my $repeat = 0;
#	foreach my $j (1..$i)
#	{
#		if ($input_nodes[$j-1] == $_)
#		{
#			$repeat = 1;
#		}
#	}
	if (!$repeat)
	{
		$input_nodes[$i] = $_;
#		print "node N$i = $_ \n";
		$i++;
	}
}

my $number_of_clusters =  $number_of_nodes;

$i = 0;
foreach my $current_node (@input_nodes)
{
	print "cur node = $i\n";	
	$i++;	
	foreach my $cur_num ($i .. $#input_nodes)
	{
		my $cur_neig = $input_nodes[$cur_num];

		my $temp = ($current_node  ^ $cur_neig);
		my $length = unpack '%32b*', pack 'I', $temp;
		if ($length < 3)
		{
			if ( !$UnionFind->same($i-1, $cur_num))
			{
				$UnionFind->union($i-1, $cur_num);
#				print "$number_of_clusters from $i=$current_node to $cur_num=$cur_neig \n";
				$number_of_clusters--;
			}
		}
#		print "from $current_node to $cur_neig is $length\n ";
	}

}

print "Number of clusters  = $number_of_clusters";
















