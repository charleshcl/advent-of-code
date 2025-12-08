// https://adventofcode.com/2025/day/3

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code/2025

bank:read0 `:./d03ex.txt

getNthJoltage:{[x;n]
  startIdx:     x[`startIdx];
  searchsubstr:(n-x[`numBatteries])_x[`inBank]; // drop tail
  searchsubstr:(startIdx+1)_searchsubstr;       // drop head
  idx1:searchsubstr ss max searchsubstr;
  digit1:searchsubstr[idx1[0]];
  x[`startIdx]: idx1[0] + startIdx + 1;
  x[`digit]:    digit1;
  x
 }

getJoltage:{[numBatteries;inBank]
  state0:(`numBatteries`inBank`startIdx`digit)!(numBatteries;inBank;-1;"");
  resultStates: state0 getNthJoltage\ 1+til numBatteries;
  digits: resultStates[`digit];
  res:"J"$digits
 }

"part 1:"
sum getJoltage[2] each bank
"part 2:"
sum getJoltage[12] each bank