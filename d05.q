// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

inFile:read0 `:./d05.txt //data type of string

separatorLineNum:inFile?(enlist "")[0]
items:"J" $(separatorLineNum+1) _ inFile
freshRanges:"J" $ "-" vs/:separatorLineNum sublist inFile 

checkOneRangeFreshness:{[i;freshRange]
  $[(freshRange[0]<=i) and (i<=freshRange[1]);1;0]
 }

// unit test
// checkOneRangeFreshness[3] each ((3;5);(11;16))
// checkOneRangeFreshness[3] each ((3;5);(1;4);(11;16))
// checkOneRangeFreshness[5] each ((3;5);(10;14);(16;20);(12;18))

checkAllRangeFreshness:{[freshRanges;i]
  $[(sum checkOneRangeFreshness[i] each freshRanges)>=1;1;0]
 }

// unit test
// checkAllRangeFreshness[((3;5);(4;7);(10;14))] 5
// checkAllRangeFreshness[((3;5);(4;7);(10;14))] each (3;5;7)
// checkAllRangeFreshness[((3;5);(10;14);(16;20);(12;18))] 5
// checkAllRangeFreshness[freshRanges] 1
// checkAllRangeFreshness[freshRanges] 5
// checkAllRangeFreshness[freshRanges] 8
// checkAllRangeFreshness[freshRanges] 11
// checkAllRangeFreshness[freshRanges] 7
// checkAllRangeFreshness[freshRanges] 32

sum checkAllRangeFreshness[freshRanges] each items