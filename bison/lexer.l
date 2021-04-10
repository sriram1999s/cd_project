%{
  #include<stdio.h>
  #include<string.h>
  #include "y.tab.h"
  #include "symbol_table.h"
  extern int tokval;
  extern int lineno;
%}



%%
"//".* printf("COMMENT");
if { return IF;}
else { return ELSE;}
while { return WHILE;}

int { return INT_K;}
float { return FLOAT_K;}
char { return CHAR_K;}
void { return VOID_K;}
include {return INCLUDE;}

[A-Za-z0-9]+\.[h] {return HEADER;}

[0-9]+\.[0-9]+([eE][0-9]+)? { return FLOAT_NUM;}
[0-9]+ { return INT_NUM;}
[A-Za-z_][A-Za-z0-9_]* {  tokval = add_to_tab(yytext, lineno);return ID;}

"++" { return PLUS_PLUS;}
"--" { return MINUS_MINUS;}



"<=" { return LE;}
"<" { return LT;}
">=" { return GE;}
">" { return GT;}
"!=" { return NE;}
"==" { return EQ;}

"+" { return PLUS;}
"-" { return MINUS;}
"*" { return MULTIPLY;}
"/" { return DIVIDE;}
"%" { return MOD;}

"+=" { return PLUS_ASSIGN;}
"-=" { return MINUS_ASSIGN;}
"*=" { return MUL_ASSIGN;}
"/=" { return DIV_ASSIGN;}
"&=" { return AND_ASSIGN;}
"|=" { return OR_ASSIGN;}
"^=" { return XOR_ASSIGN;}
"%=" { return MOD_ASSIGN;}
"<<=" { return L_SHIFT_ASSIGN;}
">>=" { return R_SHIFT_ASSIGN;}
"=" { return ASSIGN;}


"&&" { return AND;}
"||" { return OR;}
"!" { return NOT;}

"&" { return BIT_AND;}
"|" { return BIT_OR;}
"^" { return BIT_XOR;}
"~" { return BIT_COMP;}
"<<" { return L_SHIFT;}
">>" { return R_SHIFT;}

"(" { return L_PAREN;}
")" { return R_PAREN;}
"{" { return L_FLOWBRACE;}
"}" { return R_FLOWBRACE;}
"[" { return L_SQBRACE;}
"]" { return R_SQBRACE;}

";" { return SEMICOLON;}

"#" {return HASH;}
"\"" {return DOUBLE_QUOTES;}

[\t]* printf("TAB ");
[\n] {++lineno;}
%%
