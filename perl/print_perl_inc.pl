#!/usr/bin/env perl
# print_perl_inc.pl --> Print out the @INC paths used by perl

$"="\n"; # Set list separator to \n
print join($", @INC) . "\n";
