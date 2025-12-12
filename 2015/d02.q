// https://adventofcode.com/2015/day/2

\cd /Users/charleshcl
\cd github/advent-of-code/2015

box:"J"$"x" vs/: read0 `:d02ex.txt

calcArea:{
  pos:(0 1;0 2;1 2);
  area1:2 * sum prd each x pos;
  area2:prd x where x <> (max x);
  area1+area2
 }

"part 1"
sum calcArea each box

// "part 2"
// (exitFloor each til cnt)?-1