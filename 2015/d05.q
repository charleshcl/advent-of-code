// https://adventofcode.com/2015/day/5

\cd /Users/charleshcl
\cd github/advent-of-code/2015

s:read0 `:d05ex.txt

"part 1"
isNice:{
  cond1:2<sum count each x ss/: "aeiou";
  cond2:0<sum (=':) x;
  cond3:0 >= count raze x ss/: ("ab";"cd";"pq";"xy");
  cond1 & cond2 & cond3  
 }

// x:"ugknbfddgicrmopn"
// x:"aaa"
// x:"jchzalrnumimnmhp"
// x:"haegwjzuvuyypxyu"
// x:"dvszwmarrgswjxmb"
// isNice x

sum isNice each s

// "part 2"
