// https://adventofcode.com/2015/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2015

cmd:read0 `:d01ex.txt
instr:cmd[0]
cnt: count instr
exitFloor:{
  subInstr:x$instr;
  (sum subInstr="(") - sum subInstr=")"
 }

"part 1"
exitFloor cnt // last position

"part 2"
(exitFloor each til cnt)?-1