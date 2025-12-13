// https://adventofcode.com/2015/day/3

\cd /Users/charleshcl
\cd github/advent-of-code/2015

instrs:read0 `:d03.txt
instr:instrs[0]

"part 1"
initPos:(0 0)   // initial position
visited:enlist initPos

process:{[curr;dir]
  dirs:"^<>v"!((-1 0);(0 -1);(0 1);(1 0));
  pos:curr+dirs dir;
  visited::visited, enlist pos;
  pos
 }

nextPos:process\[initPos; instr]
freq: count each group visited
count freq where freq >= 1
