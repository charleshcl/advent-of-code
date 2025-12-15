// https://adventofcode.com/2015/day/3

\cd /Users/charleshcl
\cd github/advent-of-code/2015

skey:read0 `:d04ex.txt
// skey:read0 `:d04.txt
skey:skey[0]

"part 1"
newKey: skey ,/: string til 300000
res:5$"" sv/: string (md5 each newKey) 
idx:res like "00000"
idx?1b

// draft
// 5$"" sv string (md5 "abcdef609043")
// md5 "this is a not so secret message"