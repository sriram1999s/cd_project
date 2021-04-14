import re
import random
from symbol_table import *

label = 1
temp = [1]

def solve(i,n,l,inter_code):
    global label
    global temp
    if(i==n):
        return
    # if(type(l) == list and check_type(l) and len(l) == 3):
    #     if(l[0] == '='):
    #         quad = ['=', l[2], None, l[1]]
    #         inter_code.append(quad)

    if(type(l[i])==list and l[i][0]=='if'):
        if(len(l[i])==3):
            temp_num = 't' + str(temp[0])
            temp[0]+=1
            quad_cond = l[i][1]+[temp_num]
            inter_code.append(quad_cond)

            sym_tab.add_temp(temp_num)

            curr_label = 'L'+str(label)
            quad_if = ['IFFALSE',temp_num,None,curr_label]
            label+=1
            inter_code.append(quad_if)
            solve(0,len([l[i][2]]),[l[i][2]],inter_code)
            inter_code.append(curr_label+':')
        elif(len(l[i])==5):
            temp_num = 't' + str(temp[0])
            temp[0]+=1
            quad_cond = l[i][1]+[temp_num]
            inter_code.append(quad_cond)

            sym_tab.add_temp(temp_num)

            curr_label = 'L'+str(label)
            quad_if = ['IFFALSE',temp_num,None,curr_label]
            label+=1
            inter_code.append(quad_if)
            solve(0,len([l[i][2]]),[l[i][2]],inter_code)
            curr_label_1 = 'L'+str(label)
            label+=1
            quad_goto  = ['goto',None,None,curr_label_1]
            inter_code.append(quad_goto)
            inter_code.append(curr_label+':')
            solve(0,len([l[i][4]]),[l[i][4]],inter_code)
            inter_code.append(curr_label_1+':')


    elif(type(l[i])==list and l[i][0]=='while'):
        if(len(l[i])==3):
            temp_num = 't' + str(temp[0])
            temp[0]+=1
            curr_label = 'L'+str(label)
            label+=1
            inter_code.append(curr_label+':')
            quad_cond = l[i][1]+[temp_num]
            inter_code.append(quad_cond)

            sym_tab.add_temp(temp_num)

            curr_label_1 = 'L' + str(label)
            label+=1
            quad_if = ['IFFALSE',temp_num,None,curr_label_1]
            inter_code.append(quad_if)
            solve(0,len([l[i][2]]),[l[i][2]],inter_code)
            quad_goto = ['goto',None,None,curr_label]
            inter_code.append(quad_goto)
            inter_code.append(curr_label_1+':')


    elif(type(l[i])==list and len(l[i])==4 and check_type(l[i])):
        inter_code.append(l[i])
    elif(type(l[i])==list and len(l[i])==3 and check_type(l[i])):
        if(l[i][0] == '='):
            quad = ['=',l[i][2],None,l[i][1]]
            inter_code.append(quad)
        elif(re.search(r'[+*\-\^/|&]=',l[i][0])):
            quad = [l[i][0][0],l[i][1],l[i][2],l[i][1]]
            inter_code.append(quad)
        elif(re.search(r'[+\-*/\^&|]',l[i][0])):
            #print("hey",l[i])
            temp_num = 't' + str(temp[0])
            quad = [l[i][0],l[i][1],l[i][2],temp_num]
            temp[0]+=1
            inter_code.append(quad)

            sym_tab.add_temp(temp_num)

            l[i] = temp_num

    elif(type(l[i])==list and len(l[i])==3):
        if(type(l[i][2])==list and len(l[i][2])==3 and l[i][0] == '=' and check_type(l[i][2])):
            quad = l[i][2]+[l[i][1]]
            inter_code.append(quad)
        else:
            # print("l[i] before:",l[i])
            solve(0,len(l[i]),l[i],inter_code)
            # print("l[i] after1:",l[i])
            solve(0,len(l[i]),l[i],inter_code)
            if(type(l[i]) == list and check_type(l[i]) and len(l[i]) == 3):
                if(l[i][0] == '='):
                    quad = ['=', l[i][2], None, l[i][1]]
                    inter_code.append(quad)
            # print("l[i] after2:",l[i])
            # solve(0,len([l[i]]),[l[i]],inter_code)

    elif(type(l[i])==list):
        solve(0,len(l[i]),l[i],inter_code)
    solve(i+1,n,l,inter_code)


def check_type(l):
    for i in l:
        if(type(i)==list):
            return False
    return True


def gen(l):
    output_str = '.BEGIN\n'
    for i in l:
        if(i != []):    
            if(type(i)==str):
                output_str += i + "\n"
            else:
                #i = [str(j)+' ' for j in i]
                i = list(map(str,i))
                if(i[0]=="goto"):
                    output_str += "goto " + i[-1] + " \n"
                elif(i[0]=='='):
                    output_str += i[-1] + ' = ' + i[1] + " \n"
                elif(i[0]=='IFFALSE'):
                    output_str += i[0] + ' ' + i[1] + ' ' + i[-1] + "\n"
                else:
                    if(i[2]!='None'):
                        output_str += i[-1] + ' = ' + i[1] +' '+ i[0] + ' ' + i[2] + "\n"
                    else:
                        output_str += i[-1] + ' = ' + i[0] + ' ' + i[1] + "\n"

    output_str += '.END\n'
    return output_str
