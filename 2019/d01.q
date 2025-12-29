// https://adventofcode.com/2019/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2019

input:read0 `:d01.txt

"part 1"
mass:"J"$/:input
f:{-2+floor x%3}
sum f each mass