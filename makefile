default:
	clear
	lex lexer.l
	yacc -d parser.y
	cc lex.yy.c y.tab.c -ll
clean:
	$(RM) *.o lex.yy.cc y.tab.c y.tab.h
