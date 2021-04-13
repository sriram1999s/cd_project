import sys
from parser import *
from intermediate_codegen import *

lexer = lex()
parser = yacc()

try:
    file = sys.argv[1]
except :
    print('No arguments')

lines = ""
with open(file) as f:
    for line in f:
        lines += line.strip('\n')
    lines.strip('\n')

parse_tree = parser.parse(lines)
inter_code = []
solve(0,len(parse_tree),parse_tree,inter_code)
#solve(0,len(parse_tree),parse_tree,inter_code)
print("\n\nquads\n\n")
for i in inter_code:
    print(i)

intermediate_code = gen(inter_code)
print("\n\nICG\n\n")
print(intermediate_code)
