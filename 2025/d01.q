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
// still in draft

inState:`pos`zeros!(0;0)
cmd:"L"

doRotate2:{[inState;cmd]
  dir:cmd[0];
  val:"J"$1 _ cmd;
  inPos:inState[`pos];
  inZeros:inState[`zeros];
  outPos:$[dir="L";inPos-val mod 100;inPos+val];
  outPos:outPos mod 100;
  // calc number of zeros
  offset:$[dir="L";inPos-val;inPos+val];
  zeros:0;
  if[inPos=0;offset:offset-1];
  // zeros:0;
  if[(dir="L") and (offset=0);  zeros:zeros+1];
  if[(dir="L") and (offset<0);  zeros:zeros+1+floor (abs offset) % 100];
  if[(dir="R") and (offset=100);zeros:zeros+1];
  if[(dir="R") and (offset>100);zeros:zeros+1+floor (offset-100) % 100];
  zeros;
  outZeros:inZeros+zeros;
  // result
  `pos`zeros!(outPos;outZeros)
 }

state0:`pos`zeros!(0;0)
doRotate2[state0;"L99"]
doRotate2[state0;"L100"]
doRotate2[state0;"L101"]
doRotate2[state0;"L199"]
doRotate2[state0;"L200"]
doRotate2[state0;"L201"]

doRotate2[state0;"R99"]
doRotate2[state0;"R100"]
doRotate2[state0;"R101"]
doRotate2[state0;"R199"]
doRotate2[state0;"R200"]
doRotate2[state0;"R201"]

state0:`pos`zeros!(50;0)
doRotate2[state0;"L49"]
doRotate2[state0;"L50"]
doRotate2[state0;"L51"]
doRotate2[state0;"L149"]
doRotate2[state0;"L150"]
doRotate2[state0;"L151"]

doRotate2[state0;"R49"]
doRotate2[state0;"R50"]
doRotate2[state0;"R51"]
doRotate2[state0;"R149"]
doRotate2[state0;"R150"]
doRotate2[state0;"R151"]
doRotate2[state0;"R249"]
doRotate2[state0;"R250"]
doRotate2[state0;"R251"]

res:state0 doRotate2\ cmds
res[`zeros]