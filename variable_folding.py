from collections import defaultdict


def variable_fold(quads):
    d = defaultdict(lambda:'0')
    n = len(quads)
    for i in range(n):
        if(quads[i]!=[] and type(quads[i])==list):
            if(quads[i][2] == None and quads[i][0] == '='):
                #print("hey",quads[i])
                if(d[quads[i][1]]!='0'):
                    #print("ho",quads[i],d[quads[i][2]])
                    quads[i] = d[quads[i][1]] + [quads[i][-1]]

            elif(None not in quads[i]):
                lhs = quads[i][-1]
                d[lhs] = quads[i][:-1]
                

    # for i in d:
    #     print(f"{i}----->{d[i]}")


                    
