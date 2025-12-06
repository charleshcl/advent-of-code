// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

inFile:read0 `:./d06ex.txt //data type of string

"part 1"
parseOperand:{
  elem:"J"$" " vs x;
  elem where not null elem
 }

parseOperator:{
  elem:" " vs x;
  elem where count each elem > 0
 }

operand1:parseOperand inFile[0]
operand2:parseOperand inFile[1]
operand3:parseOperand inFile[2]
operator:raze parseOperator inFile[3]

worksheet:`operand1`operand2`operand3`operator!(operand1;operand2;operand3;operator)

worksheet

worksheet:flip worksheet

update res:operand1+operand2+operand3 from `worksheet where operator="+"
update res:operand1*operand2*operand3 from `worksheet where operator="*"

sum worksheet[`res]
