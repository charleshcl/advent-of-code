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

sum isNice each s

// "part 2"
chk:{x[y]=x[y+2]};
isNice2:{
  pair:reverse each (,':) x;
  occ:count each ss[x] each pair;
  cond1:1<sum occ>1;
  idx:til -2+count x;
  cond2:0<sum chk[x] each idx;
  cond1 & cond2
 }

sum isNice2 each s