#!usr/bin/perl -w

use strict;

my $min = 999;
foreach (1..2000)
{
	open InputGraph ,'<Algo1_PA3Q1_input.txt';

	my %edges = ();
	my @nodes = ();
	my $node_counter = 1;
	while (<InputGraph>)
	{
		my @input = split (/\s+/, $_);
		$nodes[$node_counter]= $_;
		$node_counter++;
		
		my $cur_node = $input[0];
		shift (@input);
		
		foreach my $destination_node(@input)
		{
			my $from = $cur_node;
			my $to = $destination_node;
			if ($from > $to){
				($from, $to) = ($to, $from);
			}
	#		print "from $from, to $to \n";
			$edges{"$from $to"} = 1;
		}
	}

	my @keys = keys (%edges);
#	print @keys;
#	print "\n";
	my $counter = 0;
	my %deleted_nodes;
	my $temp = $#keys;
	while ( $#keys >= 1)
	{
#		my @keys = keys (%edges);
#		print @keys;
#		print "\n";
			
		my $random_edge = int(rand($#keys));
		
		my @cur_nodes = split (/\s+/, $keys[$random_edge]);
		
#		print "DELETING edge $keys[$random_edge] \n";
		delete $edges{$keys[$random_edge]};
	#	splice @keys, $random_edge, 1;
			
		my @nodes_to_rebuild = split (/\s+/, $nodes[$cur_nodes [1]]);
		
#		print "nodes to rebuild = $nodes[$cur_nodes [1]] \n";
		my $node_to_delete = $nodes_to_rebuild[0];
		
		
		$deleted_nodes{$node_to_delete} = 1;
		shift (@nodes_to_rebuild);
		foreach my $node_to_rebuild (@nodes_to_rebuild)
		{
			####
			my @temp = split (/\s+/, $nodes[$node_to_rebuild]);
			if ( $cur_nodes[0] != $node_to_rebuild){
#				print "push to node $node_to_rebuild node $cur_nodes[0] \n";
				push @temp, $cur_nodes[0];
				
				my @temp2 = split (/\s+/, $nodes[$cur_nodes[0]]);
				push @temp2, $node_to_rebuild;
				$nodes[$cur_nodes[0]] = "@temp2";
			}
			$nodes[$node_to_rebuild] = "@temp";
			####
				
			if (!exists $deleted_nodes{$node_to_rebuild}){
#				print "node to rebuild = $node_to_rebuild \n";
				my $from = $node_to_rebuild;
				my $to = $node_to_delete;
				if ($from > $to){
					($from, $to) = ($to, $from);
				}		
#				print "DEL EDGE  $from $to \n";
				

				my $count_of_deleted_edges;			
				if (exists $edges{"$from $to"}){
					$count_of_deleted_edges = $edges{"$from $to"};
				}else{
					$count_of_deleted_edges = 1;
				}
				delete $edges{"$from $to"};

				$from = $node_to_rebuild;
				$to = $cur_nodes[0];
				if ($from > $to){
					($from, $to) = ($to, $from);
				}
				if ($from != $to){
					if (exists $edges{"$from $to"}){
	#					print "increment key  $from $to \n";
						$edges{"$from $to"} += $count_of_deleted_edges;
					}else{
	#					print "ADDing key  $from $to \n";
						$edges{"$from $to"} =  $count_of_deleted_edges;
					}
				}
			}
		}
	#	unshift @nodes_to_rebuild, 
#		print "\n";
		@keys = keys (%edges);
		
		my $key;
		my $value;
		while ( ($key, $value) = each %edges )	{
#			print "$key => $value \n";
		}	
	}


#	print @keys;
##	print "\n";
#	print "final number =  $edges{$keys[0]} \n";
	if ($min > $edges{$keys[0]}){
		$min =$edges{$keys[0]};
	}
	@keys = keys (%edges);	
	

	
}
print "min = $min";
#print @keys;


