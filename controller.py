from parser import *
import sys

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

parser.parse(lines)
