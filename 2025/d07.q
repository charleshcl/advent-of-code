// https://adventofcode.com/2025/day/7

// macOS specific line
\cd /Users/charleshcl
\cd github/advent-of-code/2025

diagram:read0 `:./d07ex.txt //data type of string
lineCount:count diagram
lineSize:count diagram[0]

/
  # example
  init state:
    hitCount: n
    beams:     "....|......|..."
    countList:"000000000030000"
  input: 
    splitters:"..^........^..."
                 ^not hit ^hit
  next state:
    hitCount: n+1
    beams:     "....|.....|.|.."
                         ^ ^ splitted beams
    countList:"000000000040100"
\

updateRays:{[beam;idx]
  beam[idx]:".";
  if[idx<lineSize-1;beam[idx+1]:"|"];
  if[idx>=1;beam[idx-1]:"|"];
  beam  
 }

updateRaysContext:{[beamCtx;idx]
  countList:beamCtx[`countList];
  beam:beamCtx[`beam];
  beam[idx]:".";
  beam[idx+1]:"|";
  countList[idx+1]:countList[idx]+countList[idx+1];
  beam[idx-1]:"|";
  countList[idx-1]:countList[idx]+countList[idx-1];
  countList[idx]:0;
  beamCtx[`beam]:beam;
  beamCtx[`countList]:countList;
  beamCtx
 }

checkSplitters:{[state;splitters]
  cnt:state[`hitCount];
  beam:state[`beams];
  countList:state[`countList];
  r:state[`beams]="|";
  s:splitters="^";
  hits:r and s;
  idx:where hits=1b;
  state[`hitCount]:cnt + sum hits;
  state[`beams]:beam updateRays/ idx;
  beamCtx:(`beam`countList)!(beam;countList);
  beamCtx:beamCtx updateRaysContext/ idx;
  state[`countList]:beamCtx[`countList];
  state
 }

initCount:lineSize # 0
startIdx:diagram[0] ss "S"
initCount[startIdx]:1
state:(`hitCount`beams`countList)!(0;ssr[diagram[0];"S";"|"];initCount);

// state:(`hitCount`beams`countList)!(0;ssr[diagram[0];"S";"|"];(0 0 0 0 0 0 3 5 1 0 0 0 0 0 0));
// checkSplitters[state] ".......^......." 

res:state checkSplitters/ diagram[til lineSize];

"part 1"
part1Ans:res[`hitCount]
part1Ans

"part2"
part2Answer:sum res[`countList]
part2Answer

// working area
/
beam: "....|......|..|"
aft: "....|.....|.||."
r:   "....|......|..|"="|"
s:   "..^........^..^"="^" 
hitCount:sum r and s
hits:r and s
idx:where hits=1b
updateRays:{[beam;idx]
  beam[idx]:".";
  if[idx<lineSize-1;beam[idx+1]:"|"];
  if[idx>=1;beam[idx-1]:"|"];
  beam  
 }
updateRays[beam] 11
updateRays[beam] 14

beam:".....|.|.|....."
beamCtx:(`beam`countList)!(beam;0 0 0 0 0 1 0 2 0 1 0 0 0 0 0)
s:  ".....^.^.^....."="^"

beamCtx:updateRaysContext[beamCtx] 5
beamCtx:updateRaysContext[beamCtx] 7
beamCtx:updateRaysContext[beamCtx] 9

beam updateRays/ idx
\
