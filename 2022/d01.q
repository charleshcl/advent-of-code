// https://adventofcode.com/2022/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2022

input:read0 `:d01ex.txt

"part 1"
x:"J"$/:input   // numbers are separated by null values (ON)
i: where null x // indexes of null values
cutPoints: 0, i - til count i   
calories:cutPoints _ x where not null x
max sum each calories