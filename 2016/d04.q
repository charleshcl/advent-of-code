// https://adventofcode.com/2016/day/4

// \cd /Users/charleshcl
// \cd github/advent-of-code/2016
\cd C:\Users\charl\SynologyDrive\Documents\advent-of-code\advent-of-code\2016

line:read0 `:d04.txt

"part 1"
rm:{ssr[x;y;""]}
rm[rm[rm["aaaaa-bbb-z-y-x-123[abxyz]";"-"];"0"];"1"];

// 3 ways to keep alpha only
// s:"aaaaa-bbb-z-y-x-123[abxyz]" 
// s except "0123456789-"
// s inter .Q.a,"[]"
// {ssr[x;y;""]} over ("aaaaa-bbb-z-y-x-123[abxyz]";"-";"0";"1";"2";"3";"4";"5";"6";"7";"8";"9")

preprocess:{t:-1_x;
  u:"[" vs t;
  encryptedName:u[0] inter .Q.a,"[]";
  sensorId:u[0] inter .Q.n,"[]";
  res:`encryptedName`sensorId`checksum!(encryptedName;"J"$sensorId;u[1]);
  res
 }

// unit test
// preprocess "aaaaa-bbb-z-y-x-123[abxyz]" 

x:"aaaaa-bbb-z-y-x-123[abxyz]"
x:"a-b-c-d-e-f-g-h-987[abcde]"

g:{
  r1:preprocess x;
  stat:count each group r1[`encryptedName];
  tab:flip `k`v!(key stat;value stat);
  r5:`v xdesc `k xasc tab;
  len:count r1[`checksum];
  r2:select k from tab where i<len;
  r3:flip r5;
  r4:r3[`k];
  r5:len sublist r4;
  $[r5~r1[`checksum];r1[`sensorId];0]
 }

sum g each line