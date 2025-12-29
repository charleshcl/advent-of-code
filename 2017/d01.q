// https://adventofcode.com/2017/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2017

input:read0 `:d01ex.txt

"part 1"
int:"J"$/:input[0]
int:int,int[0]      // add first character to the end
mask:(=':) int      // use prior
sum int where mask

"part 2"
int:"J"$/:input[0]
half:"i"$(count int)%2
candidate:((-1*half) sublist int), half sublist int // swap first half with second half
mask:candidate=int
sum int where mask