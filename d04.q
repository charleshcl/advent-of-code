// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

roll:read0 `:./d04.txt //data type of string

// support functon
replace:{step1:ssr[x;".";"0"];step2:ssr[step1;"@";"1"]}

addDummyBorder:{[roll]
  rowLen:count roll[0];
  dummyRow:rowLen?"000";
  rollMap:(enlist dummyRow),roll,(enlist dummyRow);
  flipRollMap:flip rollMap;
  rowLen:count flipRollMap[0];
  dummyRow:rowLen?"000";
  rollMap:(enlist dummyRow),flipRollMap,(enlist dummyRow);
  res:replace each rollMap;
  flip res
 }

augmentedRoll:addDummyBorder roll

idx:{[mat]
  r:1+til count mat;
  c:1+til count first mat;
  r cross c
 } roll

checkIt:{[rmap;idx]
  r:idx[0];c:idx[1];
  rollCount:("J"$rmap[r-1;c-1])+("J"$rmap[r-1;c])+("J"$rmap[r-1;c+1])+("J"$rmap[r;c-1])+("J"$rmap[r;c+1])+("J"$rmap[r+1;c-1])+("J"$rmap[r+1;c])+("J"$rmap[r+1;c+1])
  ;res:$[(rmap[r;c]="1") and (rollCount<4);1;0]
 }

// checkIt[augmentedRoll] (1 1)
// checkIt[augmentedRoll] each idx

sum checkIt[augmentedRoll] each idx
// too high: 2133