// https://adventofcode.com/2025/day/4

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code

diagram:read0 `:./d07ex.txt //data type of string
lineCount:count diagram
lineSize:count diagram[0]

"part 1"

/
  # example
  init state:
    hitCount: n
    rays:     "....|......|..."
  input: 
    splitters:"..^........^..."
                 ^not hit ^hit
  next state:
    rays:     "....|.....|.|.."
                         ^ ^ splitted rays
    hitCount: n+1
\

diagram
state:(`hitCount`rays`countList)!(0;ssr[diagram[0];"S";"|"];lineSize # 0);

updateRays:{[ray;idx]
  ray[idx]:".";
  ray[idx+1]:ray[idx-1]:"|";
  ray  
 }

checkSplitters:{[state;splitters]
  ray:state[`rays];
  r:state[`rays]="|";
  cnt:state[`hitCount];
  s:splitters="^";
  hits:r and s;
  idx:where hits=1b;
  state[`hitCount]:cnt + sum hits;
  state[`rays]:ray updateRays/ idx;
  state
 }

// state:(`hitCount`rays)!(0;ssr[diagram[0];"S";"|"]);
// checkSplitters[state] ".......^......."

part1Res:state checkSplitters\ diagram[til lineSize];

// part 2

/
  # example
  init state:
    hitCount: n
    rays:     "....|......|..."
    countList:"000000000030000"
  input: 
    splitters:"..^........^..."
                 ^not hit ^hit
  next state:
    hitCount: n+1
    rays:     "....|.....|.|.."
                         ^ ^ splitted rays
    countList:"000000000040100"
\

updateRaysContext:{[rayContext;idx]
  countList:rayContext[`countList];
  ray:rayContext[`ray];
  ray[idx]:".";
  ray[idx+1]:"|";
  countList[idx+1]:countList[idx]+countList[idx+1];
  ray[idx-1]:"|";
  countList[idx-1]:countList[idx]+countList[idx-1];
  countList[idx]:0;
  rayContext[`ray]:ray;
  rayContext[`countList]:countList;
  rayContext
 }

checkSplitters:{[state;splitters]
  cnt:state[`hitCount];
  ray:state[`rays];
  countList:state[`countList];
  r:state[`rays]="|";
  s:splitters="^";
  hits:r and s;
  idx:where hits=1b;
  state[`hitCount]:cnt + sum hits;
  state[`rays]:ray updateRays/ idx;
  rayContext:(`ray`countList)!(ray;countList);
  rayContext:rayContext updateRaysContext/ idx;
  state[`countList]:rayContext[`countList];
  state
 }

initCount:lineSize # 0
startIdx:diagram[0] ss "S"
initCount[startIdx]:1

state:(`hitCount`rays`countList)!(0;ssr[diagram[0];"S";"|"];initCount);

// state:(`hitCount`rays`countList)!(0;ssr[diagram[0];"S";"|"];(0 0 0 0 0 0 3 5 1 0 0 0 0 0 0));
// checkSplitters[state] ".......^......." 

part2Res:state checkSplitters/ diagram[til lineSize];
sum part2Res[`countList]


// 3104: too low
// working area
/
ray: "....|......|..|"
aft: "....|.....|.||."
r:   "....|......|..|"="|"
s:   "..^........^..^"="^" 
hitCount:sum r and s
hits:r and s
idx:where hits=1b
updateRays:{[ray;idx]
  ray[idx]:".";
  if[idx<lineSize-1;ray[idx+1]:"|"];
  if[idx>=1;ray[idx-1]:"|"];
  ray  
 }
updateRays[ray] 11
updateRays[ray] 14

ray:".....|.|.|....."
rayContext:(`ray`countList)!(ray;0 0 0 0 0 1 0 2 0 1 0 0 0 0 0)
s:  ".....^.^.^....."="^"
updateRaysContext:{[rayContext;idx]
  countList:rayContext[`countList];
  ray:rayContext[`ray];
  ray[idx]:".";
  ray[idx+1]:"|";
  countList[idx+1]:countList[idx]+countList[idx+1];
  ray[idx-1]:"|";
  countList[idx-1]:countList[idx]+countList[idx-1];
  countList[idx]:0;
  rayContext[`ray]:ray;
  rayContext[`countList]:countList;
  rayContext
 }

rayContext:updateRaysContext[rayContext] 5
rayContext:updateRaysContext[rayContext] 7
rayContext:updateRaysContext[rayContext] 9

ray updateRays/ idx
\
