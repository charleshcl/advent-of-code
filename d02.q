// https://adventofcode.com/2025/day/2
src:read0 `:d02.txt // returns a list of single element as there is only 1 line
token:","vs src[0]
pair:"J"$"-" vs/: token

checkValidity:{totLen:count string x;
  splitIdx:"i"$(totLen%2);
  firstPart:(-1*splitIdx) _ (string x);
  secondPart:splitIdx _ (string x);
  $[(firstPart~secondPart) and (totLen mod 2)=0;x;0]
  }

// unit test
// checkValidity 1010

findInvalid:{[idRange] elem:idRange[0]+til 1+idRange[1]-idRange[0];
  sum checkValidity each elem
  }

// unit test
// findInvalid (11;22)

sum findInvalid each pair

