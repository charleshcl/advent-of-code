// https://adventofcode.com/2016/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2016

cmd:", " vs/: read0 `:d01.txt
cmd:cmd[0]

posX:`E`W`S`N!((0;1);(0;-1);(1;0);(-1;0))

dirE:"LR"!`N`S
dirW:"LR"!`S`N
dirS:"LR"!`E`W
dirN:"LR"!`W`E
dirs:`E`S`W`N!(dirE;dirS;dirW;dirN)

state0:`pos`dir!((0;0);0N)
// instr:"R3"

traverse:{[state;instr]
  pos:state[`pos];
  dir:state[`dir];
  turning:instr[0];
  val:"J"$1_instr;
  if[not null dir;dirLookup:dirs dir;newDir:dirLookup turning];
  if[(null dir) and turning = "L";dir:newDir:`W;dirLookup:dirs dir];
  if[(null dir) and turning = "R";dir:newDir:`E;dirLookup:dirs dir];
  newDir;
  newPos:pos+val * posX newDir;
  newState:`pos`dir!(newPos;newDir)
 }

// traverse[ traverse[state;"R3"]; "L3"]
finalState: traverse/[state0; cmd]

"part 1"
sum abs finalState[`pos]

// unit test
// state:`pos`dir!((3;0);`E)
// traverse[state;"R3"]

// state:traverse[state;"R3"]

// state:`pos`dir!((11;22);`W)
// traverse[state;"R3"]
