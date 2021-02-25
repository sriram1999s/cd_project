%{
  #include<stdio.h>
  #include<ctype.h>
  #include<string.h>
  #define YYSTYPE double
  #include "symbol_table.h"
  #include<assert.h>

  int yylex();
  void yyerror(const char *s);
  int tokval;
  int lineno =1;
  SYMTAB sym_tab[SYMTABSIZE];
  int curr_ptr = 0;

  typedef struct treenode
  {
    /*
    union
    {
      int i;
      float f;
      char* c;
      char* s;
    }val;*/

    char *s;
    struct treenode *left;
    struct treenode *right;

  } Tnode_t;

  typedef struct syntaxtree
  {
    Tnode_t *head;
  }Tree_t;

  Tree_t tree;

  void  add_to_tree();
  Tnode_t * node(char *, Tnode_t *, Tnode_t *);
%}

%token IF ELSE WHILE
%token INT_K FLOAT_K CHAR_K VOID_K
%token INT_NUM FLOAT_NUM ID
%token PLUS_PLUS MINUS_MINUS
%token PLUS MINUS MULTIPLY DIVIDE L_SHIFT R_SHIFT MOD
%token LE LT GE GT NE EQ
%token ASSIGN PLUS_ASSIGN MINUS_ASSIGN MUL_ASSIGN DIV_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN MOD_ASSIGN L_SHIFT_ASSIGN R_SHIFT_ASSIGN
%token AND OR NOT
%token BIT_AND BIT_OR BIT_XOR BIT_COMP
%token L_PAREN R_PAREN L_FLOWBRACE R_FLOWBRACE L_SQBRACE R_SQBRACE
%token SEMICOLON
%token HASH INCLUDE DOUBLE_QUOTES HEADER


%right ASSIGN PLUS_ASSIGN MINUS_ASSIGN MUL_ASSIGN DIV_ASSIGN AND_ASSIGN OR_ASSIGN XOR_ASSIGN MOD_ASSIGN L_SHIFT_ASSIGN R_SHIFT_ASSIGN
%left PLUS MINUS MULTIPLY DIVIDE L_SHIFT R_SHIFT MOD LE LT GE GT NE EQ


%start program

%%
program : multiple_statements {display_tab(); delete_tab();}


multiple_statements : multiple_statements statement
                    | statement

statement : open
          | closed

open : IF condition statement
     | IF condition closed ELSE open
     | WHILE condition open

closed : simple
       | block
       | IF condition closed ELSE closed
       | WHILE condition closed


block : L_FLOWBRACE multiple_statements R_FLOWBRACE


simple : expr SEMICOLON
       | HASH INCLUDE header
       | declaration
       | ID L_PAREN R_PAREN SEMICOLON
       | SEMICOLON

declaration : type ID SEMICOLON
            | type ID ASSIGN expr SEMICOLON
            | type ID L_PAREN R_PAREN SEMICOLON
            | type ID L_PAREN R_PAREN block

type : INT_K
     | FLOAT_K
     | CHAR_K
     | VOID_K
header : LT HEADER GT
       | DOUBLE_QUOTES HEADER DOUBLE_QUOTES

condition : L_PAREN expr R_PAREN

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

brace  : L_PAREN expr R_PAREN
       | brace PLUS_PLUS
       | brace MINUS_MINUS
       | INT_NUM
       | FLOAT_NUM
       | ID {assert(sym_tab[tokval].ix == tokval); printf("ID : %s : %d",sym_tab[tokval].name , sym_tab[tokval].ix);}
%%

// syntax tree functions begin

Tnode_t * node(char *s, Tnode_t *left, Tnode_t *right)
{
  Tnode_t *temp = (Tnode_t*)malloc(sizeof(Tnode_t));
  temp->s = strdup(s);
  temp->left = left;
  temp->right = right;
  return temp;
}
// syntax tree functions end


// symbol table functions begin
int add_to_tab(char *name, int line_no)
{
  if(curr_ptr < SYMTABSIZE)
  {
    for(int i = 0; i < curr_ptr; ++i)
    {
      if(!strcmp(name,sym_tab[i].name))
      {
        printf("Symbol already present\n");
        return i;
      }
    }
    printf("Adding to table ...ID : %s\n", name);
    sym_tab[curr_ptr].name = malloc(strlen(name) + 1);
    strcpy(sym_tab[curr_ptr].name, name);
    sym_tab[curr_ptr].ix = curr_ptr;
    sym_tab[curr_ptr].line_no = line_no;
    sym_tab[curr_ptr].type = NULL;
    sym_tab[curr_ptr].width = 0;
    ++curr_ptr;

    return sym_tab[curr_ptr-1].ix;
  }
  return -1;
}

void display_tab()
{
  printf("\nDisplaying table ...\n");
  for(int i = 0; i < SYMTABSIZE; ++i)
  {
    printf("\tname : %s , index : %d , type : %s , width : %d , first found at line : %d\n", sym_tab[i].name, sym_tab[i].ix, sym_tab[i].type, sym_tab[curr_ptr].width, sym_tab[curr_ptr].line_no);
  }
}
void delete_tab()
{
  printf("\nDeleting table ...\n");
  for(int i = 0; i < SYMTABSIZE; ++i)
  {
    free(sym_tab[i].name);
  }
}
// symbol table functions end


void yyerror(s)
const char *s;
{
  fprintf(stderr, "%s in line %d\n",s , lineno);
}

int yywrap()
{
  return(1);
}

int main()
{
  return yyparse();
}

// | error { yyerrok; yyclearin;}
