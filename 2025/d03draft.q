// https://adventofcode.com/2025/day/3

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

bank:read0 `:./d03.txt //data type of string

// unit test 1
// inBank:"987654321111111"

// idxOfMax: find the position of max number of input string

// 1. find the index of max number of initial string (but minus the last character)
// 2. substring it from the character after the max number
// 3. find the index of max number of the substring string
// 4. concat the number for two indexes, and convert to integer

// version 1
largestJoltage:{[inBank]
  phase1:-1_inBank;
  idx1:phase1 ss max phase1;
  digit1:phase1[idx1[0]];

  phase2:(idx1[0]+1)_inBank;
  idx2:phase2 ss max phase2;
  digit2:phase2[idx2[0]];
  numstr:digit1,digit2;
  res:"J"$numstr
  }

sum largestJoltage each bank

// version 2

// input: inBank; a list of (n-th iteration; init pos)

inBank:"811111111111119" // the bank
//   012345

// global variable
// startIdx:-1
// joltage:""

// draft 1
getNthJoltage:{[numBatteries;inBank;n;startIdx] // n-th digit
  phase1:(n-numBatteries)_inBank;
  phase1:(startIdx+1)_phase1;
  idx1:phase1 ss max phase1;
  digit1:phase1[idx1[0]];
  res:(idx1[0]+startIdx+1;digit1)
  }

numBatteries:3
getNthJoltage[numBatteries;inBank;1;-1]
getNthJoltage[numBatteries;inBank;2;0]
getNthJoltage[numBatteries;inBank;3;1]

// draft 2
getNthJoltage:{
  numBatteries: x[`numBatteries];
  inBank:       x[`inBank];
  startIdx:     x[`startIdx];
  n:            y;               // new digit index
  phase1:(n-numBatteries)_inBank;
  phase1:(startIdx+1)_phase1;
  idx1:phase1 ss max phase1;
  digit1:phase1[idx1[0]];
  // res:(idx1[0]+startIdx+1;digit1)
  x[`startIdx]: idx1[0] + startIdx + 1;
  x[`digit]:    digit1;
  x
  }

// unit test
// numBatteries:2
// inBank:"811111111111119"
// state0:(`numBatteries`inBank`startIdx`digit)!(numBatteries;inBank;-1;"")
// state1:(`numBatteries`inBank`startIdx`digit)!(numBatteries;inBank;0;"8")
// resultStates: state0 getNthJoltage\ 1+til numBatteries
// digits: resultStates[`digit]

// part 2
numBatteries:12

getJoltage:{
  [inBank]
  state0:(`numBatteries`inBank`startIdx`digit)!(numBatteries;inBank;-1;"")
  ;resultStates: state0 getNthJoltage\ 1+til numBatteries
  ;digits: resultStates[`digit]
  ;res:"J"$digits
  }

// unit test
// getJoltage "811111111111119"

sum getJoltage each bank
