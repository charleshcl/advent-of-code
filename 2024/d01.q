src:`s1`s2!"II" $ flip "   "vs/:read0 `:d01.txt
// part 1
s1:asc src.s1
s2:asc src.s2
res:abs s1-s2
0 +/ res

// one-liner
// 0 +/ abs ((asc src[`s1]) - (asc src[`s2]))

// part 2
res:src.s1 =\: src.s2
cnt:sum each res
sum src.s1 * cnt
// one-liner
// sum src.s1 * sum each src.s1 =\: src.s2

\\