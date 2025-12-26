// https://adventofcode.com/2018/day/1

\cd /Users/charleshcl
\cd github/advent-of-code/2018

cmd:"J"$", " vs/: read0 `:d01.txt

"part 1"
sum cmd

"part 2"
cmdLen:count cmd;
state:`freqLog`lastFreq`idx`twice!(enlist 0;0;0;0N)
process:{[state]
  idx:state[`idx];
  chg:cmd[idx][0];
  newFreq:state[`lastFreq]+chg;
  freqLog:state[`freqLog];
  twice:state[`twice];
  if[newFreq in freqLog;twice:newFreq];
  newFreqLog:state[`freqLog],newFreq;
  nextIdx:(idx+1) mod cmdLen;
  newState:`freqLog`lastFreq`idx`twice!(newFreqLog;newFreq;nextIdx;twice)
 }

process/[{null x[`twice]};state] // continue criteria; lambda

// 20 process\ state // call 10 times