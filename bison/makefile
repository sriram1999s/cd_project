default:
	clear
	lex lexer.l
	yacc -d parser.y
	cc lex.yy.c y.tab.c -ll
clean:
	$(RM) *.o y.tab.c y.tab.h a.out
	rm lex.yy.c
