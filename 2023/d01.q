// https://adventofcode.com/20213day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2023

input:read0 `:d01ex.txt

"part 1"
extractDigit:{x inter .Q.n}
e:extractDigit each input 
f:first each e
l:last each e
sum "J"$(f ,' l)