import re

def preprocess(source):
    pat1 = r'//.*?\n'
    pat2 = r'/\*.*?\*/'
    source = re.sub(pat1,"",source,flags = re.S)
    source = re.sub(pat2,"",source,flags = re.S)
    source = re.sub('\n',"",source,flags = re.S)
    return source
