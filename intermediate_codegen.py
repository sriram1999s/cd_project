import re
def solve(i,n,l,inter_code):
    if(i==n):
        return
    if(type(l[i])==list and len(l[i])==4 and check_type(l[i])):
        inter_code.append(l[i])
    if(type(l[i])==list and len(l[i])==3 and check_type(l[i])):
        if(l[i][0] == '='):
            quad = [None,l[i][2],None,l[i][1]]
            inter_code.append(quad)
        elif(re.search(r'[+*\-\^/|&]=',l[i][0])):
            quad = [l[i][0][0],l[i][1],l[i][2],l[i][1]]
            inter_code.append(quad)
        elif(re.search(r'[+\-*/\^&|]',l[i][0])):
            #print("hey",l[i])
            quad = [l[i][0],l[i][1],l[i][2],'temp']
            inter_code.append(quad)
            l[i] = 'temp'

    elif(type(l[i])==list and len(l[i])==3):
        if(type(l[i][2])==list and len(l[i][2])==3 and l[i][0] == '=' and check_type(l[i][2])):
            quad = l[i][2]+[l[i][1]]
            inter_code.append(quad)
        else:
            #print("l[i] before:",l[i])
            solve(0,len(l[i]),l[i],inter_code)
           # print("l[i] after:",l[i])
            solve(0,len(l[i]),l[i],inter_code)
    elif(type(l[i])==list):
        solve(0,len(l[i]),l[i],inter_code)
    solve(i+1,n,l,inter_code)


def check_type(l):
    for i in l:
        if(type(i)==list):
            return False
    return True
            
