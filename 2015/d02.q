// https://adventofcode.com/2015/day/2

\cd /Users/charleshcl
\cd github/advent-of-code/2015

box:"J"$"x" vs/: read0 `:d02ex.txt
 
pos:(0 1;0 2;1 2);
x:2 3 4
2 * min sum each x pos

calcArea:{
  area1:2 * sum prd each x pos;
  area2:min prd each x pos;
  area1+area2
 }

res1:calcArea each box

"part 1"
sum res1

// t:([] vv: res)
// save `:t.csv

"part 2"
calcRibbon:{
  ribbon1: 2 * min sum each x pos;
  ribbon2: prd x;
  ribbon1+ribbon2
 }

calcRibbon x

// 2 * min sum each x pos;

res2:calcRibbon each box
sum res2
// 93532: too low