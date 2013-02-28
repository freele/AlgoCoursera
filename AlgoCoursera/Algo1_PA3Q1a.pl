#!usr/bin/perl -w
use strict;


 my $result = 999;
 
 for (1..100000)
 {
 open InputGraph, '<Algo1_PA3Q1_input.txt';
 my @real_numbers = ();                                 

 my $vertices = \@real_numbers; 
 
 my %edges = ();
  
    
while (<InputGraph>){
        my @input = split /\s+/;
        my $node_number = shift @input;
        $real_numbers[$node_number] = $node_number;
      
          for (@input){
          	my @pair = sort($node_number, $_); 
          	$edges {"$pair[0] $pair[1]"} = 1;
            };
  }
  
  my @all_edges = keys (%edges);
  my $cycle_counter = $#real_numbers;
  #print "nodes = $cycle_counter \n";
  while ($cycle_counter!=2){
  	my $cur_rand = rand($#all_edges-1)+1;
        my @cur_edge = split /\s+/, $all_edges[$cur_rand];
  	while ( $real_numbers[$cur_edge[0]] == $real_numbers[$cur_edge[1]] ){
#  		print "deleting edge $all_edges[$cur_rand] \n";
  		splice @all_edges, $cur_rand, 1;
                $cur_rand = rand($#all_edges);
                @cur_edge = split /\s+/, $all_edges[$cur_rand];
  	}
  	
  	$real_numbers[$cur_edge[0]] = $real_numbers[$cur_edge[1]];
  #  	print "deleting edge $all_edges[$cur_rand] \n";
  	splice @all_edges, $cur_rand, 1;
  	$cycle_counter--;
  }
  my @temp;
  push @temp, @all_edges;
   my $i = 0;
    for (@temp) {
		my @cur_edge = split /\s+/;
		if ($real_numbers[$cur_edge[0]] == $real_numbers[$cur_edge[1]] ){
#			print "deleting edge 2 $_ \n";
			splice @all_edges, $i, 1;
			$i++;
		}
  	}
  
    for (@real_numbers) {
		if ($_){
		#	print "$_ ";
		}else{
		#	print "u ";
		}
  	}
#  print "\n";
  	
  for (@all_edges) {
  #  		print "edge: $_ \n";
  	}
  
  my $temp = $#all_edges+1;
  print "RESULT = $temp \n";
  if ($result > $temp){
  	$result = $temp;
  }
  }
  
  print "\nFINAL RESULT = $result\n\n";
  
  my $key;
  my $value;
   # while ( ($key, $value) = each %edges ){
     #       print "$key => $value \n";
    #}	
  #$real_numbers[5] = 123;
  #print  $$vertices[5];