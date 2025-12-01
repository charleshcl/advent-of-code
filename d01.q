// https://adventofcode.com/2025/day/1
cmds:read0 `:d01.txt //commands in string
// input: start state: a list of start position and number of times on zero
//        the command, e.g. L48, R3
// output: end state: a list of end position and number of times on zero

doRotate:{[inState;cmd]
  dir:cmd[0];
  val:"J"$1 _ cmd;
  inPos:inState[0];
  inZeros:inState[1];
  outZeros:inZeros;
  outPos:$[dir="L";inPos-val mod 100;inPos+val];
  outPos:outPos mod 100;
  if[outPos=0;outZeros:inZeros+1];
  res:(outPos;outZeros)}

// unit test 1: doRotate[(52;1);"R48"]

(50;0) doRotate/ cmds
