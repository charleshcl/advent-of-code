// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

inFile:read0 `:./d06.txt //data type of string
lineCount:-1+count inFile

"part 1"
parseOperand:{
  elem:"J"$" " vs x;
  elem where not null elem
 }

parseOperator:{
  elem:" " vs x;
  elem where count each elem > 0
 }

operands:parseOperand each inFile til lineCount
operator:raze parseOperator inFile[lineCount]

flipOperands:flip operands

res1:sum (+/) each flipOperands where operator="+"
res2:sum (*/) each flipOperands where operator="*"
 
res:res1+res2

"part 2"
rawOperator:inFile[lineCount]
operatorIdx:rawOperator ss "[+*]"
operatorCount:count operatorIdx
lineSize:max count each inFile
patchedOperatorIdx:operatorIdx,lineSize+1

mathGroup:{(x;x+1)} each til operatorCount
subMatrixIntervals:patchedOperatorIdx each mathGroup

getSubMatrixIdx:{x[0]+(til x[1]-x[0]+1)}
// unit test
// getSubMatrixIdx[4 8]

submatrixIntervals:getSubMatrixIdx each subMatrixIntervals

getOperands:{"J"$(flip inFile[til lineCount;x])}

cephalopodOperands:getOperands each submatrixIntervals

// inFile[til lineCount;4 5 6]
// inFile[til lineCount;8 9 10]
// inFile[til lineCount;12 13 14]

res1:sum (+/) each cephalopodOperands where operator="+"
res2:sum (*/) each cephalopodOperands where operator="*"
 
res:res1+res2
