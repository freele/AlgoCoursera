#!usr/bin/perl -w
use strict;

my $n1 = '11 0 0 1';
my $n2 = '10101';

print ($n1. " \n");
$n1 =~ s/\s+//g;
print "$n1 \n";

#Unpack does checksums, and the bit-count 
#can be seen as a checksum of a string of one bit data. Since we are only 
#interested in the bit count, we don't have to worry about endian-ness -- 
#any integer format can be used to pack the bit string.

my $setbits = unpack '%32b*', pack 'I', $n1;
print $setbits;

#my $n = ($n1 ^ $n2) | ('0' x length($n1));
#print $n;