import sys
from parser import *
from intermediate_codegen import *
from preprocessing import *
from constant_folding_and_prop import *
from deadcode_elimination import *
from common_subexpression_elimination import *
from variable_folding import *

lexer = lex()
parser = yacc()

try:
    file = sys.argv[1]
except :
    print('No arguments')

lines = ""
with open(file) as f:
    for line in f:
        lines += line

lines = preprocess(lines)

print(lines)

parse_tree = parser.parse(lines)
inter_code = []
solve(0,len(parse_tree),parse_tree,inter_code)
print("\n\nquads\n\n")
for i in inter_code:
    print(i)


''' optimizations '''



const_fold_prop(inter_code)
print("\n\nICG AFTER CONSTANT FOLDING AND PROPAGATION:\n")
print(gen(inter_code))

variable_fold(inter_code)
print("\n\nICG AFTER VARIABLE FOLDING:\n")
print(gen(inter_code))

common_subexpression_eliminate(inter_code)
print("\n\nICG AFTER COMMON SUBEXPRESSION ELIMINATION:\n")
print(gen(inter_code))

# sym_tab.disp()
dead_eliminate(inter_code)
print("\n\nICG AFTER DEAD CODE ELIMINATION:\n")
print(gen(inter_code))



# const_propagate(inter_code)
''' optimizations end '''


# intermediate_code = gen(inter_code)
# print("\n\nICG FINAL:\n")
# print(intermediate_code)
