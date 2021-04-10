from collections import defaultdict
class SymbolTable:
    def __init__(self):
        self.symbol_table = defaultdict(lambda : defaultdict(lambda : []))

    def add(self, tok):
        # print("adding to symbol table...")
        # print(dir(tok))
        self.symbol_table[tok.value]['pos'].append(tok.lexpos)

    def update(self, id, key, value):
        print("here", id, key , value)
        self.symbol_table[id][key] = value

    def disp(self):
        print("Printing symbol table....")
        for id in self.symbol_table:
            print(f"{id} --> ", end = '')
            for attr in self.symbol_table[id]:
                print(f"{attr} : ", self.symbol_table[id][attr], end = ', ')
            print()
