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
state:(`hitCount`rays)!(0;ssr[diagram[0];"S";"|"]);

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
  // :res:cnt+sum hits;
  state[`hitCount]:cnt + sum hits;
  state[`rays]:ray updateRays/ idx;
  state
 }

// state:(`hitCount`rays)!(0;ssr[diagram[0];"S";"|"]);
// checkSplitters[state] ".......^......."

state checkSplitters/ diagram[til lineSize];

// working area
/
ray: "....|......|..|"
aft: "....|.....|.||."
r: "....|......|..|"="|"
s: "..^........^..^"="^" 
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

ray updateRays/ idx
\