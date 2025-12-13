// https://adventofcode.com/2015/day/2

\cd /Users/charleshcl
\cd github/advent-of-code/2015

box:"J"$"x" vs/: read0 `:d02.txt

calcArea:{
  pos:(0 1;0 2;1 2);
  area1:2 * sum prd each x pos;
  area2:min prd each x pos;
  area1+area2
 }

res:calcArea each box

"part 1"
sum res

// t:([] vv: res)
// save `:t.csv

// "part 2"
