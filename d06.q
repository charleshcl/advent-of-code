// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

inFile:read0 `:./d06.txt //data type of string

"part 1"
parseOperand:{
  elem:"J"$" " vs x;
  elem where not null elem
 }

parseOperator:{
  elem:" " vs x;
  elem where count each elem > 0
 }

lineCount:-1+count inFile
operands:parseOperand each inFile til lineCount
operator:raze parseOperator inFile[lineCount]

flipOperands:flip operands

res1:sum (+/) each flipOperands where operator="+"
res2:sum (*/) each flipOperands where operator="*"
 
res:res1+res2
