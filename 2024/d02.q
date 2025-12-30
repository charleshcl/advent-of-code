src:"I" $ " "vs/:read0 `:d02.txt
// part 1
deltas0:{first[x]-':x}
part1:{thedelta:deltas0 x;((all x=asc x) or (all x=desc x)) and (not any 3 < abs(thedelta)) and (not any 0=(1_thedelta))}
sum part1 each src

// part 2
// this got issue with combination
// part2:{res:part1 x;combo:x except/: x;if[0b=res;res:any 1b=(part1 each combo)];:res}
//rmAt:{[x;i] (i#x),(i+1)_ x}
rmAt:{[x;i] x _i}
combN1:{[x] (rmAt[x;]) each til count x}
part2:{res:part1 x;combo:combN1 x;if[0b=res;res:any 1b=(part1 each combo)];:res}
sum part2 each src

\\