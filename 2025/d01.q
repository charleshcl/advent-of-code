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
cmd:"L5"
cmd:"R5"
cmd:"R59"
cmd:"L60"
cmd:"L61"

cmd:"L139"
cmd:"L140"
cmd:"L141"

doRotate2:{[inState;cmd]
  dir:cmd[0];
  val:"J"$1 _ cmd;
  inPos:inState[`pos];
  inZeros:inState[`zeros];
  outPos:$[dir="L";inPos-val mod 100;inPos+val];
  outPos:outPos mod 100;
  // calc number of zeros
  if[(dir="L") and inPos<>0;zeros:1+floor (val-inPos)%100];
  if[(dir="L") and inPos=0 ;zeros:floor (val-inPos)%100];
  if[dir="R";zeros:floor (val+inPos)%100];
  outZeros:inZeros+zeros;
  // result
  `pos`zeros!(outPos;outZeros)
 }

// development
// state0:`pos`zeros!(0;0)
// doRotate2[state0;"L99"]
// doRotate2[state0;"L100"]
// doRotate2[state0;"L101"]
// doRotate2[state0;"L199"]
// doRotate2[state0;"L200"]
// doRotate2[state0;"L201"]

// doRotate2[state0;"R99"]
// doRotate2[state0;"R100"]
// doRotate2[state0;"R101"]
// doRotate2[state0;"R199"]
// doRotate2[state0;"R200"]
// doRotate2[state0;"R201"]

// state0:`pos`zeros!(40;0)
// doRotate2[state0;"L39"]
// doRotate2[state0;"L40"]
// doRotate2[state0;"L41"]
// doRotate2[state0;"L149"]
// doRotate2[state0;"L150"]
// doRotate2[state0;"L151"]

// doRotate2[state0;"R49"]
// doRotate2[state0;"R50"]
// doRotate2[state0;"R51"]
// doRotate2[state0;"R149"]
// doRotate2[state0;"R150"]
// doRotate2[state0;"R151"]
// doRotate2[state0;"R249"]
// doRotate2[state0;"R250"]
// doRotate2[state0;"R251"]

state0:`pos`zeros!(50;0)
res:state0 doRotate2/ cmds
res[`zeros]