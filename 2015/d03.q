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

// rewrite in vectorized version

// instrs: read0 `:d03.txt
// instr: instrs[0]
dirs:"^<>v"!((-1 0);(0 -1);(0 1);(1 0));
offset:sums dirs each instr
initPos:(0 0)   // initial position
/ generate all positions including start
positions: initPos +/: offset
positions: (enlist initPos) , positions

freq: count each group positions
count freq where freq >= 1

"part 2"
// count instr
// instrLen:0.5 * count instr
// instrLen:"i"$instrLen

// santa:1+2*til instrLen
// robot:last 2*til instrLen
