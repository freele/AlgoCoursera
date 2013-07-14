#!usr/bin/perl

use Heap::Elem::Num (NumElem);
use Heap::Binary;

my $heap = Heap::Binary->new;
my $elem;

foreach $i (0, 4, 2, 8, 16) {
	$elem = NumElem ($i);
#	$elem->val(123);
	$heap->add ( $elem );
}

while (defined ( $elem = $heap->extract_top ) ){
		print "min value = " . $elem->val. "\n";
}
5