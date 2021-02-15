%{
#include<stdio.h>
#include "y.tab.h"
%}


%%
"//".* printf("COMMENT");
if {printf("if : "); ECHO; printf("    "); return IF;}
else {printf("else : "); ECHO; printf("    "); return ELSE;}
while {printf("while : "); ECHO; printf("    "); return WHILE;}

int {printf("detected keyword : "); ECHO; printf("    "); return INT_K;}
float {printf("detected keyword : "); ECHO; printf("    "); return FLOAT_K;}
char {printf("detected keyword : "); ECHO; printf("    "); return CHAR_K;}


[0-9]+\.[0-9]+([eE][0-9]+)? {printf("float : "); ECHO; printf("    "); return FLOAT_NUM;}
[0-9]+ {printf("int : "); ECHO; printf("    "); return INT_NUM;}
[A-Za-z_][A-Za-z0-9_]* {printf("id : "); ECHO; printf("    "); return ID;}

"++" {printf("detected unary : "); ECHO; printf("    "); return PLUS_PLUS;}
"--" {printf("detected unary : "); ECHO; printf("    "); return MINUS_MINUS;}



"<=" {printf("detected relop : "); ECHO; printf("    "); return LE;}
"<" {printf("detected relop : "); ECHO; printf("    "); return LT;}
">=" {printf("detected relop : "); ECHO; printf("    "); return GE;}
">" {printf("detected relop : "); ECHO; printf("    "); return GT;}
"!=" {printf("detected relop : "); ECHO; printf("    "); return NE;}
"==" {printf("detected relop : "); ECHO; printf("    "); return EQ;}

"+" {printf("detected binop : "); ECHO; printf("    "); return PLUS;}
"-" {printf("detected binop : "); ECHO; printf("    "); return MINUS;}
"*" {printf("detected binop : "); ECHO; printf("    "); return MULTIPLY;}
"/" {printf("detected binop : "); ECHO; printf("    "); return DIVIDE;}
"%" {printf("detected binop : "); ECHO; printf("    "); return MOD;}

"+=" {printf("detected assignment : "); ECHO; printf("    "); return PLUS_ASSIGN;}
"-=" {printf("detected assignment : "); ECHO; printf("    "); return MINUS_ASSIGN;}
"*=" {printf("detected assignment : "); ECHO; printf("    "); return MUL_ASSIGN;}
"/=" {printf("detected assignment : "); ECHO; printf("    "); return DIV_ASSIGN;}
"&=" {printf("detected assignment : "); ECHO; printf("    "); return AND_ASSIGN;}
"|=" {printf("detected assignment : "); ECHO; printf("    "); return OR_ASSIGN;}
"^=" {printf("detected assignment : "); ECHO; printf("    "); return XOR_ASSIGN;}
"%=" {printf("detected assignment : "); ECHO; printf("    "); return MOD_ASSIGN;}
"<<=" {printf("detected assignment : "); ECHO; printf("    "); return L_SHIFT_ASSIGN;}
">>=" {printf("detected assignment : "); ECHO; printf("    "); return R_SHIFT_ASSIGN;}
"=" {printf("detected assignment : "); ECHO; printf("    "); return ASSIGN;}


"&&" {printf("detected logop : "); ECHO; printf("    "); return AND;}
"||" {printf("detected logop : "); ECHO; printf("    "); return OR;}
"!" {printf("detected logop : "); ECHO; printf("    "); return NOT;}

"&" {printf("detected bitwiseop : "); ECHO; printf("    "); return BIT_AND;}
"|" {printf("detected bitwiseop : "); ECHO; printf("    "); return BIT_OR;}
"^" {printf("detected bitwiseop : "); ECHO; printf("    "); return BIT_XOR;}
"~" {printf("detected bitwiseop : "); ECHO; printf("    "); return BIT_COMP;}
"<<" {printf("detected bitwiseop : "); ECHO; printf("    "); return L_SHIFT;}
">>" {printf("detected bitwiseop : "); ECHO; printf("    "); return R_SHIFT;}

"(" {printf("detected bracket : "); ECHO; printf("    "); return L_PAREN;}
")" {printf("detected bracket : "); ECHO; printf("    "); return R_PAREN;}
"{" {printf("detected bracket : "); ECHO; printf("    "); return L_FLOWBRACE;}
"}" {printf("detected bracket : "); ECHO; printf("    "); return R_FLOWBRACE;}
"[" {printf("detected bracket : "); ECHO; printf("    "); return L_SQBRACE;}
"]" {printf("detected bracket : "); ECHO; printf("    "); return R_SQBRACE;}

";" {printf("detected semicolon : "); ECHO; printf("     "); return SEMICOLON;}

[\t]* printf("TAB ");

%%
