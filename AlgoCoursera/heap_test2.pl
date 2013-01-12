#!usr/bin/perl

use Heap::Fibonacci::Fast;

my $heap = Heap::Fibonacci::Fast->new();
my $elem;

my $number = 0;
foreach $i (0, 4, 2, 8, 16) {
	print $number;
	$heap->key_insert($i, $number);
	$number++;
	#$heap->add ( $elem );
}

while (defined ( $elem = $heap->extract_top() ) ){
		print "min value = " . $elem . "\n";
}
