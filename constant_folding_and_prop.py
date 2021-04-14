from symbol_table import *

def const_fold_prop(quads):
    operators = ['*', '/', '+', '-', '<', '<=', '>', '>=', '==', '!=']
    for quad in quads:
        for i in range(4):
                    if(type(quad) == list and type(quad[i]) == str and i!=3):
                        temp = sym_tab.get_value(quad[i])
                        if(temp):
                            quad[i] = temp
        if(quad[0] in operators and type(quad[1]) == int and type(quad[2]) == int):
            res = evaluate(quad)
            quad[0] = '='
            quad[1] = res
            quad[2] = None

        if(quad[0] == '='):
            sym_tab.update(quad[3], 'value', quad[1])

# def const_propagate(quads):
#     for quad in quads:
#         for i in range(4):
#             if(type(quad) == list and type(quad[i]) == str and i!=3):
#                 temp = sym_tab.get_value(quad[i])
#                 if(temp):
#                     quad[i] = temp

def evaluate(quad):
    x = quad[1]
    y = quad[2]
    op = quad[0]
    res = 0
    if(op == '*'):
        res = x * y
    elif(op == '/'):
        res = x // y
    elif(op == '+'):
        res = x + y
    elif(op == '-'):
        res = x - y
    elif(op == '<'):
        res = x < y
    elif(op == '<='):
        res = x <= y
    elif(op == '>'):
        res = x > y
    elif(op == '>='):
        res = x >= y
    elif(op == '=='):
        res = x == y
    elif(op == '!='):
        res = x != y

    return res
