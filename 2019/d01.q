// https://adventofcode.com/2019/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2019

input:read0 `:d01ex.txt

"part 1"
mass:"J"$/:input
f:{max(0;-2+floor x%3)}
sum f each mass

"part 2"
g:{[mass] sum 1_f\[{x>0};mass]}
sum g each mass