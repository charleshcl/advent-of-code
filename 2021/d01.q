// https://adventofcode.com/2021/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2021

input:read0 `:d01ex.txt

"part 1"
i:"J"$/:input
r:1_deltas i
sum r>0

"part 2"
w:3*2_(3 mavg i)
r:1_deltas w
sum r>0