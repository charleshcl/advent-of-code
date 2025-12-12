// https://adventofcode.com/2015/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2015

cmd:read0 `:d01ex.txt //commands in string
openP:sum cmd[0]="("
closeP:sum cmd[0]=")"
"part 1"
openP-closeP