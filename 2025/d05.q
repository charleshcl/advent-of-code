// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

inFile:read0 `:./d05.txt //data type of string

"part 1"

separatorLineNum:inFile?(enlist "")[0]
items:"J" $(separatorLineNum+1) _ inFile
freshIntervals:"J" $ "-" vs/:separatorLineNum sublist inFile 

checkOneIntervalFreshness:{[i;freshInterval]
  $[(freshInterval[0]<=i) and (i<=freshInterval[1]);1;0]
 }

// unit test
// checkOneIntervalFreshness[3] each ((3;5);(11;16))
// checkOneIntervalFreshness[3] each ((3;5);(1;4);(11;16))
// checkOneIntervalFreshness[5] each ((3;5);(10;14);(16;20);(12;18))

checkAllIntervalFreshness:{[freshIntervals;i]
  $[(sum checkOneIntervalFreshness[i] each freshIntervals)>=1;1;0]
 }

// unit test
// checkAllIntervalFreshness[((3;5);(4;7);(10;14))] 5
// checkAllIntervalFreshness[((3;5);(4;7);(10;14))] each (3;5;7)
// checkAllIntervalFreshness[((3;5);(10;14);(16;20);(12;18))] 5
// checkAllIntervalFreshness[freshIntervals] 1
// checkAllIntervalFreshness[freshIntervals] 5
// checkAllIntervalFreshness[freshIntervals] 8
// checkAllIntervalFreshness[freshIntervals] 11
// checkAllIntervalFreshness[freshIntervals] 7
// checkAllIntervalFreshness[freshIntervals] 32

sum checkAllIntervalFreshness[freshIntervals] each items

"part 2"

// not free to implement it today

// idea:
// 1. to consolidate all entries to non-overlapping fresh intervals
//    a. for each interval, merge it to existing consolidated intervals.
// 2. then calculate the length of each interval, then sum them all.

nonOverlappingIntervals:(`startIdx`endIdx)!freshIntervals[0];

addFreshnessInterval:{[oldInterval;newInterval]
  //  for each oldInterval
  //    if oldInterval.startIdx<newInterval and 
 }