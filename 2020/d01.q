// https://adventofcode.com/2020/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2020

input:read0 `:d01ex.txt

"part 1"
i:"J"$/:input
pair:i cross i
s:sum each pair
r:pair where s=2020
prd r[0]

"part 2"
tuple:i cross i cross i
s:sum each tuple
r:tuple where s=2020
prd r[0]

"generalized version"
f:{
  s:sum each x;
  r:x where s=2020;
  prd r[0]
 }

"part 1"
f i cross i

"part 2"
f i cross i cross i