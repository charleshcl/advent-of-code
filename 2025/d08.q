// https://adventofcode.com/2025/day/8

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code/2025

jbox:"J"$"," vs/: read0 `:./d08ex.txt
lineCount:count jbox

// source: https://stackoverflow.com/questions/29381796/how-to-implement-combinations-of-a-list 
comb:{[N;l]$[N=1;l;raze .z.s[N-1;l]{x,/:y where y>max x}\:l]}
line:comb[2;til 4]

distance:{[pointIdx]
  a:jbox[pointIdx[0]];
  b:jbox[pointIdx[1]];
  sqrt sum (a-b) xexp 2
 }

dist:distance each line

state:`line`dist!(line;dist)

minIdx:where dist = min dist
endPoints:raze line[minIdx]
// remove line at minIdx
// remove dist at minIdx

// circuit:((2,1))

circuit:((-1 -1);(1 2 3);(4 5))

(3 6) in each circuit

x:((-1 -1);(1 2 3);(4 5))
p:3 6

{$[any p in x; x,p except x; x]}[;p] each x

circuit:circuit, endPoints

circuit?2

// x: 33 44 55
// x?0

sTable:flip state

l:select line from sTable where dist = min dist

l[0]

delete from sTable where line = l

distance[(0 1)]

min dist

// still in draft