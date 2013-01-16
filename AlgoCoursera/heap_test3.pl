#!usr/bin/perl -w
use strict;

use Heap::Simple;

#test

my $heap = Heap::Simple->new(order => "<", elements => "Any");

$heap->key_insert (5, 101);
$heap->key_insert (3, 102);
$heap->key_insert (4, 103);
my $test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
