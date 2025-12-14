// https://adventofcode.com/2015/day/3

\cd /Users/charleshcl
\cd github/advent-of-code/2015

instrs:read0 `:d03ex.txt
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

nextPos:process\[initPos; instr]  // ** useful idomatic q
freq: count each group visited
count freq where freq >= 1

// rewrite in vectorized version
dirs:"^<>v"!((-1 0);(0 -1);(0 1);(1 0));
offset:sums dirs each instr
initPos:(0 0)   // initial position
/ generate all positions including start
positions: initPos +/: offset
positions: (enlist initPos) , positions

freq: count each group positions
count freq where freq >= 1

"part 2"
santaInstr:instr where til[count instr] mod 2
robotInstr:instr where not til[count instr] mod 2

santaOffset:sums dirs each santaInstr
santaPositions: initPos +/: santaOffset
santaPositions: (enlist initPos) , santaPositions

robotOffset:sums dirs each robotInstr
robotPositions: initPos +/: robotOffset
robotPositions: (enlist initPos) , robotPositions

res1:distinct santaPositions
res2:distinct robotPositions
count res1 union res2