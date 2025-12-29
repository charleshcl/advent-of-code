// https://adventofcode.com/2020/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2020

input:read0 `:d01.txt

"part 1"
i:"J"$/:input
pair:i cross i
s:sum each pair
r:pair where s=2020
prd r[0]