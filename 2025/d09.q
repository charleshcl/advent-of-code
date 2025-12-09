// https://adventofcode.com/2025/day/9

\cd /Users/charleshcl
\cd github/advent-of-code/2025

point:"J"$ "," vs/: read0 `:./d09ex.txt
numPoints:count point

// area:{abs prd 1 + x-y}
// unit test: area[(2 5);(11 1)]

// source: https://stackoverflow.com/questions/29381796/how-to-implement-combinations-of-a-list 
comb:{[N;l]$[N=1;l;raze .z.s[N-1;l]{x,/:y where y>max x}\:l]}
// unit test: comb[2;0 1 2 3]

idx:comb[2;til numPoints]
getArea:{abs prd 1 + point[x[0]]-point[x[1]]}
getArea[(0;1)]
"part 1"
max getArea each idx