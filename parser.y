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
%token ASSIGN PLUS_ASSIGN MINUS_ASSIGN MUL_ASSIGN DIV_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN MOD_ASSIGN L_SHIFT_ASSIGN R_SHIFT_ASSIGN
%token AND OR NOT
%token BIT_AND BIT_OR BIT_XOR BIT_COMP
%token L_PAREN R_PAREN L_FLOWBRACE R_FLOWBRACE L_SQBRACE R_SQBRACE
%token SEMICOLON

%start S

%%
S : multiple_statements
  | block

block : L_FLOWBRACE multiple_statements R_FLOWBRACE

multiple_statements : multiple_statements statement
                   | statement

statement : expr SEMICOLON
          | SEMICOLON

expr : expr assignment exprOR
     | exprOR

assignment : ASSIGN
           | PLUS_ASSIGN
           | MINUS_ASSIGN
           | MUL_ASSIGN
           | DIV_ASSIGN
           | AND_ASSIGN
           | OR_ASSIGN
           | XOR_ASSIGN
           | MOD_ASSIGN
           | L_SHIFT_ASSIGN
           | R_SHIFT_ASSIGN

exprOR : exprOR OR exprAND
       | exprAND

exprAND : exprAND AND exprBITOR
        | exprBITOR

exprBITOR : exprBITOR BIT_OR exprBITXOR
          | exprBITXOR

exprBITXOR : exprBITXOR BIT_XOR exprBITAND
           | exprBITAND

exprBITAND : exprBITAND BIT_AND exprEQ
           | exprEQ

exprEQ : exprEQ EQ exprRELOP
       | exprEQ NE exprRELOP
       | exprRELOP

exprRELOP : exprRELOP relop exprSHIFT
          | exprSHIFT

relop : LE
      | LT
      | GE
      | GT

exprSHIFT : exprSHIFT L_SHIFT exprOP
          | exprSHIFT R_SHIFT exprOP
          | exprOP

exprOP : exprOP PLUS term
     | exprOP MINUS term
     | term

term : term MULTIPLY factor
     | term DIVIDE factor
     | term MOD factor
     | factor

factor : NOT factor
       | PLUS factor
       | MINUS factor
       | PLUS_PLUS factor
       | MINUS_MINUS factor
       | brace

brace  :  L_PAREN expr R_PAREN
       | brace PLUS_PLUS
       | brace MINUS_MINUS
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
