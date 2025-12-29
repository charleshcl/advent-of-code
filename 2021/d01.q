// https://adventofcode.com/2021/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2021

input:read0 `:d01.txt

"part 1"
i:"J"$/:input
r:1_deltas i
sum r>0