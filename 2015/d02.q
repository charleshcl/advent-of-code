// https://adventofcode.com/2015/day/2

\cd /Users/charleshcl
\cd github/advent-of-code/2015

box:"J"$"x" vs/: read0 `:d02ex.txt

"part 1"
calcArea:{
  area1:2 * sum prd each x pos;
  area2:min prd each x pos;
  area1+area2
 }
sum calcArea each box

"part 2"
calcRibbon:{
  ribbon1: 2 * min sum each x pos;
  ribbon2: prd x;
  ribbon1+ribbon2
 }
sum calcRibbon each box