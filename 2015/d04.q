// https://adventofcode.com/2015/day/4

\cd /Users/charleshcl
\cd github/advent-of-code/2015

skey:read0 `:d04ex.txt
skey:skey[0]

"part 1"
newKey: skey ,/: string til 399999
res:5$"" sv/: string (md5 each newKey) 
idx:res like 5#"0"
idx?1b

"part 2"
newKey: skey ,/: string til 9999999
res:6$"" sv/: string (md5 each newKey) 
idx:res like 6#"0"
idx?1b

// draft
// 5$"" sv string (md5 "abcdef609043")
// md5 "this is a not so secret message"