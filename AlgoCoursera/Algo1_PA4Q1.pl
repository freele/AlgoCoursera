#!usr/bin/perl -w
use strict;
use Graph;

my $source = 1;

my $InG = Graph->new;
#open InputGraph, "<Algo1_PA4Q1_input.txt";
open InputGraph, "<SCC.txt";

my $edge_count = 0;
while (<InputGraph>){
	$edge_count++;
	my @temp = split /\s+|,|\t/;

	$InG->add_edge($temp[0], $temp[1]);
#	print "$edge_count \n";
}

my @nodes = $InG->vertices();
#for (@nodes){print "$_ \n";};
my @test = $InG->predecessors(1);
#for (@test){print "r $_ \n";};

my %InG_visited;
my @ordered;
my %SCC;

my $count;

sub BFS1_rev{
	my $start_v = $_[0];
#	print "BFS1_rev enter $start_v \n";
	if ( !(exists $InG_visited{ $start_v }) ){
#		print "BFS1_rev $start_v \n";
		
		$InG_visited{ $start_v } = 1;	
#		$count--;
		
		my @in = $InG->predecessors($start_v);
	#	for (@in){print "pred $_ \n";};
		for (  @in ){
			 &BFS1_rev( $_  );
		} 
		push @ordered, $start_v;		
	}
}

sub BFS2{
	my $start_v = $_[0];
	my $leader = $_[1];
		
	if ( !(exists $InG_visited{ $start_v }) ){
	#	print "BFS2 $start_v \n";
		
		 $InG_visited{ $start_v } = 1;

		for ( $InG->successors($start_v) ){
			 &BFS2( $_, $leader );
		} 
		if (exists $SCC{$leader}){
			$SCC{$leader}++;
		}else{
			$SCC{$leader}=1;
		}
	}
}

my $t = 0;

%InG_visited = ();
$count = $InG->vertices;
while ($count){
	$count--;
	my $cur_v = pop @nodes;
	&BFS1_rev($cur_v);
}

%InG_visited = ();
$count = $InG->vertices;
while ($count){
	$count--;
	my $cur_v = pop @ordered;
	&BFS2($cur_v, $cur_v);
}

my @SCC_sizes = ( reverse sort {$a <=> $b} values %SCC);
my @SCC_sizes_deb = ( reverse sort values %SCC);

for (0..4){
	print "$SCC_sizes[$_],";
}
print "\n";
for (0..4){
	print "$SCC_sizes_deb[$_],";
}
print "\n";

print "end \n";
#print "$InG \n";
	