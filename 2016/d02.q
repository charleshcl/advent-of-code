// https://adventofcode.com/2016/day/2

\cd /Users/charleshcl
\cd github/advent-of-code/2016

line:", " vs/: read0 `:d02ex.txt
cmd:raze each line  // flattne the cmd

keypad:(1 2 3;4 5 6;7 8 9)
lkup:`U`D`L`R!((-1 0);(1 0);(0 -1);(0 1))

"part 1"
state:`button`dir`res!((1 1);cmd0[0];0N)
mv:{[state;dir] 
  button:state[`button];
  // dir:state[`dir];
  newButton:button+lkup[`$dir];
  // if index is outside the range (0,1,2) then limit it to the border value
  // e.g. 0, -1 -> 0, 0
  if[newButton[0]<0;newButton[0]:0]; 
  if[newButton[0]>2;newButton[0]:2]; 
  if[newButton[1]<0;newButton[1]:0]; 
  if[newButton[1]>2;newButton[1]:2];
  newState:`button`dir`res!(newButton;dir;state[`res]) 
 }

// unit test
// state1: mv/[state;cmd[0]];
// state2: mv/[state1;cmd[1]];
// state3: mv/[state2;cmd[2]];
// state4: mv/[state3;cmd[3]];

getFinalKey:{[startState;cmd]
  finalState: mv/[startState;cmd];
  finalButton:finalState[`button];
  finalState[`res]:finalState[`res], keypad[finalButton[0];finalButton[1]];
  finalState
 }

// unit test
// state1:getFinalKey[state;"ULL"]
// state2:getFinalKey[state1;"RRDDD"]
// state3:getFinalKey[state2;"LURDL"]
// state4:getFinalKey[state3;"UUUUD"]

res:getFinalKey/[state;cmd]
res[`res]