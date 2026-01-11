// https://adventofcode.com/2016/day/3

\cd /Users/charleshcl
\cd github/advent-of-code/2016
// \cd C:\Users\charl\SynologyDrive\Documents\advent-of-code\advent-of-code\2016

cmd:read0 `:d03.txt
replaceSpace:{ssr[x;"  ";" "]}
triangle:"J"$" " vs/: ltrim replaceSpace each replaceSpace each cmd
triangle

"part 1"
isValidTriangle:{[sides]
  a:sides[0];
  b:sides[1];
  c:sides[2];
  res:$[(c<a+b) and (a<b+c) and (b<c+a);1;0]
 }

sum isValidTriangle each triangle

"part 2"
rawData:flip triangle
numOfgrp:"i"$(count rawData[0])%3
indexes:3*til numOfgrp

getTriangle:{
  // y 3 sublist x  // <- This syntax does not work
  (y;3) sublist x
 }

getAllLines:{getTriangle[x] each indexes}
part2Triangle:raze getAllLines each rawData
sum isValidTriangle each part2Triangle