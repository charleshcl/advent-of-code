// https://adventofcode.com/2015/day/25

\cd /Users/charleshcl
\cd github/advent-of-code/2015

"part 1"
r:5
c:2
idx:{[r;c] 
  v1:1+sum 1+til -1+r;
  v2:sum r+1+til -1+c;
  v1+v2
 }
n:idx[r;c]
nextCode:{(x*252533) mod 33554393}
// nextCode nextCode 20151125           -> 2 nextCode/ 20151125
// nextCode nextCode nextCode 20151125  -> 3 nextCode/ 20151125
(n-1) nextCode/ 20151125
