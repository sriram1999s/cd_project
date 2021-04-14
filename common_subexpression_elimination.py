from collections import defaultdict

def check_collision(start,end,quads):
    arg1 = quads[start][1]
    arg2 = quads[start][2]
    #print(quads[start],quads[end],arg1,arg2)
    for i in range(start+1,end):
        if(quads[i]!= []  and type(quads[i])==list):
            if(quads[i][-1] == arg1 or quads[i][-1] == arg2):
                return 0
    return 1
    


def common_subexpression_eliminate(quads):
    n = len(quads)
    d = defaultdict(lambda:'0') 
    for i in range(n):
        if(type(quads[i])==list and quads[i]!=[]):
            for j in range(i+1,n):
                if(type(quads[j])==list and quads[j]!=[]):
                    if(quads[i][-1]!=quads[j][-1] and quads[i][:-1] == quads[j][:-1] and check_collision(i,j,quads)):
                        d[quads[j][-1]] = quads[i][-1]
                        quads[j].clear()


    #substi the CSE from dictionary                    
    for i in range(n):
        if(type(quads[i])==list and quads[i]!=[]):
           # print("quads[i]: ",quads[i]) 
            for j in range(4):
                if(d[quads[i][j]]!='0'):
                    quads[i][j] = d[quads[i][j]]

    


                    
