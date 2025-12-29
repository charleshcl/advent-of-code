// https://adventofcode.com/2017/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2017

input:read0 `:d01.txt
int:"J"$/:input[0]
int:int,int[0]      // add first character to the end

"part 1"
mask:(=':) int
sum int where mask