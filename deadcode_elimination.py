def dead_eliminate(quads):
    n = len(quads)
    for i in range(n):
        if(type(quads[i])==list and quads[i][0] != 'IFFALSE' and quads[i][0] != 'goto'):
            var = quads[i][-1]
            flag = False
            for j in range(i, n):
                if(type(quads[j])==list and quads[j][1] == var or quads[j][2] == var):
                    flag = True
                    break
            if(not flag):
                # print("quads being removed ", quads[i])
                quads[i].clear()
