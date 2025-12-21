// https://adventofcode.com/2025/day/1
cmds:read0 `:d01ex.txt //commands in string
// input: start state: a list of start position and number of times on zero
//        the command, e.g. L48, R3
// output: end state: a list of end position and number of times on zero

"part 1"
// development
// inState:`pos`zeros!(50;0)
// cmd:"L60"

doRotate:{[inState;cmd]
  dir:cmd[0];
  val:"J"$1 _ cmd;
  inPos:inState[`pos];
  inZeros:inState[`zeros];
  outZeros:inZeros;
  outPos:$[dir="L";inPos-val mod 100;inPos+val];
  outPos:outPos mod 100;
  if[outPos=0;outZeros:inZeros+1];
  `pos`zeros!(outPos;outZeros)
 }

state0:`pos`zeros!(50;0)
res:state0 doRotate/ cmds
res[`zeros]

"part 2"