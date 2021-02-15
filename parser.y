%{
  #include<stdio.h>
  #include<ctype.h>
  #define YYSTYPE double
  int yylex();
  void yyerror(const char *s);
%}

%token IF ELSE WHILE
%token INT_K FLOAT_K CHAR_K
%token INT_NUM FLOAT_NUM ID
%token PLUS_PLUS MINUS_MINUS
%token PLUS MINUS MULTIPLY DIVIDE L_SHIFT R_SHIFT MOD
%token LE LT GE GT NE EQ
%token PLUS_ASSIGN MINUS_ASSIGN MUL_ASSIGN DIV_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN MOD_ASSIGN L_SHIFT_ASSIGN R_SHIFT_ASSIGN
%token AND OR NOT
%token BIT_AND BIT_OR BIT_XOR BIT_COMP
%token L_PAREN R_PAREN L_FLOWBRACE R_FLOWBRACE L_SQBRACE R_SQBRACE
%token SEMICOLON

%start S

%%
S : multiple_statements

multiple_statements : multiple_statements statement
                   | statement

statement : expr SEMICOLON

expr : expr PLUS term
     | expr MINUS term
     | term

term : term MULTIPLY factor
     | term DIVIDE factor
     | factor
factor : L_PAREN expr R_PAREN
       | MINUS factor
       | INT_NUM
       | FLOAT_NUM
       | ID
%%

void yyerror(s)
const char *s;
{
  fprintf(stderr, "%s\n",s);
}

int yywrap()
{
  return(1);
}

int main()
{
  return yyparse();
}

