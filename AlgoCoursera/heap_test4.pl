  #!usr/bin/perl -w
  #use strict;
  
  use Heap;
  use Heap::Elem;
  
  my $heap = Heap->new;
  my $elem;

  use Heap::Elem::Num(NumElem);

  foreach my $i ( 1..100 ) {
      $elem = NumElem( $i );
      $heap->add( $elem );
  }

  while( defined( $elem = $heap->extract_top ) ) {
      print "Smallest is $elem->val \n";
  }