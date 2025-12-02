// https://adventofcode.com/2025/day/2
src:read0 `:d02ex.txt // returns a list of single element as there is only 1 line
token:","vs src[0]
pair:"J"$"-" vs/: token

checkValidity:{totLen:count string x;
  splitIdx:"i"$(totLen%2);
  firstPart:(-1*splitIdx) _ (string x);
  secondPart:splitIdx _ (string x);
  $[(firstPart~secondPart) and (totLen mod 2)=0;x;0]
  }

// unit test
checkValidity 1010

findInvalid:{[idRange] elem:idRange[0]+til 1+idRange[1]-idRange[0];
  sum checkValidity each elem
  }

// unit test
// findInvalid (11;22)

// sum findInvalid each pair

// part 2
f:{[l;str] l#str}
//f[7] each ("abc";"dse")
//1+til ceiling totLen%2
f2:{y sublist x}
f2[x;2]
seeds:f2[x] each 1+til ceiling totLen%2
candidates:f[totLen] each seeds

checkValidity2:{stringx:string x;
  totLen:count stringx;
  seeds:f2[stringx] each 1+til ceiling totLen%2;
  candidates:f[totLen] each seeds;
  sumup:sum candidates like stringx;
  $[((totLen mod 2)=0) and (sumup>=1);res:x;0]  // this would mistake 101 as valid
  }

checkValidity2 99

findInvalid2:{[idRange] elem:idRange[0]+til 1+idRange[1]-idRange[0];
  sum checkValidity2 each elem
  }

// unit test
findInvalid2 11         22        
findInvalid2 95         115       // 111 missing
findInvalid2 998        1012      
findInvalid2 1188511880 1188511890
findInvalid2 222220     222224    
findInvalid2 1698522    1698528   
findInvalid2 446443     446449    
findInvalid2 38593856   38593862  
findInvalid2 565653     565659    
findInvalid2 824824821  824824827 
findInvalid2 2121212118 2121212124

sum findInvalid2 each pair

// too low: 3349553331
pair
