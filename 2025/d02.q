// https://adventofcode.com/2025/day/2
src:read0 `:d02.txt // returns a list of single element as there is only 1 line
token:","vs src[0]
pair:"J"$"-" vs/: token

"part 1"
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

"part 2"
/
  generate all numbers within the range
  for each number, get the length
  from length 1 to ceiling of length % 2 ,
    check if reminder is non-zero->valid
    if reminder is zero, try repeating it and check validity
\

checkValidity2:{
  stringx:string x;
  totLen:count stringx;
  res:0;
  if[totLen>1;
    halfLen:ceiling totLen%2;
    // check only those reminder = 0
    trialPattern: (1+til halfLen) sublist\: stringx;
    reminder:totLen mod (1+til halfLen);
    mask:reminder = 0;
    seeds:trialPattern where mask;
    candidates:totLen#'seeds;
    matchRes:candidates~\:stringx;
    cond:0<sum matchRes;
    if[0<sum matchRes;res:x]
   ];
  res
 }

// checkValidity2 1010

findInvalid2:{[idRange] elem:idRange[0]+til 1+idRange[1]-idRange[0];
  res:checkValidity2 each elem;
  // res where res>0
  sum checkValidity2 each elem
 }

// findInvalid2 3         21        

// unit test
// findInvalid2 11         22        
// findInvalid2 95         115       
// findInvalid2 998        1012      
// findInvalid2 1188511880 1188511890
// findInvalid2 222220     222224    
// findInvalid2 1698522    1698528   // null handling
// findInvalid2 446443     446449    
// findInvalid2 38593856   38593862  
// findInvalid2 565653     565659    
// findInvalid2 824824821  824824827 
// findInvalid2 2121212118 2121212124

sum findInvalid2 each pair