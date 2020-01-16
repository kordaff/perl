#!C:\Perl\bin\perl.exe
# $Id$  $Revision$  $HeadURL$  $Date$
#
# replace line 1 with #!/usr/bin/perl on Linux/Unix  
#
# Previous version was incorrect.  It wasn't adding new primes to @primes
# Fixed that.
#
# v1.1 holds all the primes it calculates in memory.  I set it to calculate
# primes up to 100,000,000 but by 1.5 million primes, it was using 4300 MB of
# memory
#
# Need to make a change in next version to only hold up to $max of highest 
# number it will be factoring/checking for primeness.
#
# Starting with the first 9 prime numbers, this program calculates whether
# a number is prime, or what its prime factors are, up to 100,000,000.
#
# should be named something like primes_and_factors.pl instead eh
#
# I did modify it in v1.1 to output two files, one with primes, one with
# factored non-primes.
#
# pi(1000)       = 168
# pi(10_000_000) = 664579
#
# ie: there are 168 primes from 1-1000 and 664,579 from 1-10,000,000
# Now verified to calculate correct number of primes.
#
use strict;
use warnings;
our $VERSION=1.1;

my %factor;
my @primes=(2,3,5,7,9,11,13,17,19);

my $n=2;
my $count=0;
my $p=1000;
my $t0=time();

open(my $fh1,">","primes.txt") or die $!;
open(my $fh2,">","factors.txt") or die $!;
while( $n <=  100_000_000 )
  {
  check_number($n);
  $n++;
  }
close $fh1;
close $fh2;

sub check_number
  {
  my $num=shift;
  my $max=sqrt($num);
  my $flag=0;
  for my $i (0..int($max))
    {
#     print "checking $num/$primes[$i]";
    my $this=$primes[$i];
    if ($this > $max){last;}
    if (! ($num % $this) )
      {
      $flag=1;
      my $div=$num/$this;
      print $fh2 "factors of $num: $this,$factor{$div}\n";
      $factor{$num}="$this,$factor{$div}";
      last;
      }
    }
  if (!$flag)
    {
    $count++;
    print $fh1 "$num\n";
    if ($num > $primes[$#primes] )
      {
      @primes[$#primes+1]=$num;
      # print "$num is prime - added to array\n";
      }
    else
      {
      # print "$num is prime - already in array\n";
      }
    $factor{$num}="$num";
    if ($count/$p == int($count/$p))
      {
      my $elapsed = time() - $t0;
      print "$count prime numbers recorded in $elapsed seconds   $num\n";
      }
    }
}
