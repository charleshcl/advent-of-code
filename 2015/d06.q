// https://adventofcode.com/2015/day/6

\cd /Users/charleshcl
\cd github/advent-of-code/2015

m0:(1000 1000)#100?1

instr:read0 `:d06ex.txt

"part 1"
process:{[m;i]
  if[i like "toggle *";
    corner:"J"$"," vs/: " through " vs ssr[i;"toggle ";""];
    ((s_x;s_y);(e_x;e_y)):corner;
    idx_x:s_x + til (1+e_x-s_x);
    idx_y:s_y + til (1+e_y-s_y);
    m[idx_x;idx_y]: {1-x} m[idx_x;idx_y]
  ];
  if[i like "turn on *";
    corner:"J"$"," vs/: " through " vs ssr[i;"turn on ";""];
    ((s_x;s_y);(e_x;e_y)):corner;
    idx_x:s_x + til (1+e_x-s_x);
    idx_y:s_y + til (1+e_y-s_y);
    m[idx_x;idx_y]:1
  ];
  if[i like "turn off *";
    corner:"J"$"," vs/: " through " vs ssr[i;"turn off ";""];
    ((s_x;s_y);(e_x;e_y)):corner;
    idx_x:s_x + til (1+e_x-s_x);
    idx_y:s_y + til (1+e_y-s_y);
    m[idx_x;idx_y]:0
  ];
  m
 }
// res: process[m0] "toggle 2,4 through 5,8"

// process[process[m0] "toggle 2,4 through 5,8";"turn on 7,2 through 8,8"]

// m1:process[m0;"toggle 2,4 through 5,8"]
// m2:process[m1;"turn on 7,2 through 8,8"]

// instr0:("toggle 2,4 through 5,8";"turn on 7,2 through 8,8")

// count instr0
// count instr
// instr[0]
// instr0[0]
// instr0[1]
// type instr0[0]
// type instr[0]

res_m:m0 process/ instr
// res_m:m0 process/ instr0

sum sum each res_m
