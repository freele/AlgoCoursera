#!usr/bin/perl -w
use strict;

use Heap::Simple;

#test

my $heap = Heap::Simple->new( elements => "Any");

$heap->key_insert (5, 12);
$heap->key_insert (5, 12);
$heap->key_insert (3, 13);
my $test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
$test = $heap->extract_top;
print $test;
