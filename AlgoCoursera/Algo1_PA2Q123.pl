#!usr/bin/perl -w

use strict;

my $comp_n;

open Input ,"<Algo1_PA2Q123_input.txt";

my @input;
while (<Input>){
	push @input, split (/\s+/, $_);
}
my @input_copy = @input;
my $last_n = $#input;
#print @input;
sub med_of_three{
	my $from = shift;
	my $to = shift;
	my $med = $from + int(($to - $from)/2);
	my %hash = (
		 $input[$from] => $from,
		 $input[$med] => $med,
		 $input[$to] => $to,
	 );
	 
	 my @temp = sort { $a <=> $b } keys %hash;
#	 print @temp;
#	 print "median $hash{$temp[1]}\n";
	 return $hash{$temp[1]};
}

sub choose_pivot{
	#INPUT: from, to, type
	my $from = shift;
	my $to = shift;
	my $type = shift;
	if ($type == 0){
		return $from;
	} elsif ($type == 1){
		return $to;
	}  elsif ($type == 2){
		return &med_of_three ($from, $to);
	} 
}

sub partition{
	#INPUT: from, to, pivot

	
	my $from = shift;
	my $to = shift;
	my $pivot = shift;
#	print "part $from - $to \n";
		
	( $input[$from], $input[$pivot] ) = ( $input[$pivot], $input[$from] ); 
	
	my $p = $input[$from];
	my $i = $from + 1;
	
	for my $j ( $i .. $to){
		if ( $input[$j] < $p ){
			( $input[$i], $input[$j] ) = ( $input[$j], $input[$i] ); 
			$i++;
		}
	}
	
	( $input[$from], $input[$i-1] ) = ( $input[$i-1], $input[$from] );
#	print "pivot pos $i \n";
	return ($i-1); 
}

my $rec = 0;
sub QS{	
	$rec++;
	#INPUT: from, to, pivot_type/
	my $from = shift;
	my $to = shift;
	my $pivot_type = shift;
	
	if ($to>$last_n) {return;}
	if ($to<0) {return;}
	if ($from >= $to) {return;}
	
#	print "LAST = $last_n \n";
#	print "rec = $rec, $from - $to \n";
		
	$comp_n += $to - $from;
	
	my $pivot = &choose_pivot ($from, $to,  $pivot_type );
	my $pivot_pos = &partition ( $from, $to, $pivot );
#	print "pivot_pos = $pivot_pos \n";
	
	&QS ($from, $pivot_pos-1, $pivot_type);
	&QS ($pivot_pos+1, $to, $pivot_type);
	
	$rec--;
}

$comp_n = 0;
&QS ( 0, $#input, 0 );
print "pivot - first:\n$comp_n \n";

@input = @input_copy;
$comp_n = 0;
&QS ( 0, $#input, 1 );
print "pivot - last:\n$comp_n \n";

@input = @input_copy;
$comp_n = 0;
&QS ( 0, $#input, 2 );
print "pivot - median:\n$comp_n \n";

print "end\n";


