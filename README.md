perl
====

Updated primes.pl to function correctly.  I think a previous version I didn't share was using a file to load N thousand primes.  Switching that to an in memory array was ok, but the array has be be updated as the primes are calculated.   Verified that pi(10_000_000) now is correct =)  ie: the number of primes it calculates up to 10,000,000.   168 is pi(1000)   Various websites list the pi(x) for various limits.  At pi(~25_000_000) this program had over 1.5 million primes and was using 4300 MB of memory.   Needless to say, it needs an improvement, to stop saving primes in the array once the sqrt of X is reached.   The prime factorization of non-primes is the real memory hog as it saves each non-primes factors in the hash and gets new factors by adding the prime that a new number was divisible by to the factors of the result.

Ie:  16 is checked and when it's divided by 2, we get 8, append ,2 to the factors of 8 (2,2,2) and we have 2,2,2,2

After five years, that bit was nearly too clever for me to figure out, before having breakfast today lol.
