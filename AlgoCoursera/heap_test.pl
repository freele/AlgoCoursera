#!usr/bin/perl

use Heap::Elem::Num (NumElem);
use Heap::Fibonacci;

my $heap = Heap::Fibonacci->new;
my $elem;

foreach $i (0, 4, 2, 8, 16) {
	$elem = NumElem ($i);
	$heap->add ( $elem );
}

while (defined ( $elem = $heap->extract_top ) ){
		print "min value = " . $elem->val . "\n";
}
