#!C:\Perl\bin\perl.exe
# $Id$  $Revision$  $HeadURL$  $Date$
#
# Starting with the first 9 prime numbers, this program calculates whether
# a number is prime, or what its prime factors are, up to 10,000,000.
#
# should be named something like prime_factors.pl instead eh
#
use strict;
use warnings;
our $VERSION=1.0;
use File::Slurp qw(read_file);

my %factor;
my @primes=(2,3,5,7,9,11,13,17,19);

my $n=2;
my $count=0;
my $p=1000;
my $t0=time();

open(my $fh,">","primes_and_factors.txt") or die $!;
while( $n <= (10000000) )
  {
  check_number($n);
  $n++;
  }
close $fh;

sub check_number
  {
  my $num=shift;
  my $max=sqrt($num);
  my $flag=0;
  for my $i (0..$#primes)
    {
#     print "checking $num/$primes[$i]";
    my $this=$primes[$i];
    if ($this > $max){last;}
    if (! ($num % $this) )
      {
      $flag=1;
      my $div=$num/$this;
      print $fh "factors of $num: $this,$factor{$div}\n";
      $factor{$num}="$this,$factor{$div}";
      last;
      }
    }
  if (!$flag)
    {
    $count++;
    print $fh "$num\n";
    # print "$num is prime\n";
    $factor{$num}="$num";
    if ($count/$p == int($count/$p))
      {
      my $elapsed = time() - $t0;
      print "$count prime numbers recorded in $elapsed seconds   $num\n";
      }
    }
  }
