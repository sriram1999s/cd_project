/* A Bison parser, made by GNU Bison 3.7.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IF = 258,                      /* IF  */
    ELSE = 259,                    /* ELSE  */
    WHILE = 260,                   /* WHILE  */
    INT_K = 261,                   /* INT_K  */
    FLOAT_K = 262,                 /* FLOAT_K  */
    CHAR_K = 263,                  /* CHAR_K  */
    INT_NUM = 264,                 /* INT_NUM  */
    FLOAT_NUM = 265,               /* FLOAT_NUM  */
    ID = 266,                      /* ID  */
    PLUS_PLUS = 267,               /* PLUS_PLUS  */
    MINUS_MINUS = 268,             /* MINUS_MINUS  */
    PLUS = 269,                    /* PLUS  */
    MINUS = 270,                   /* MINUS  */
    MULTIPLY = 271,                /* MULTIPLY  */
    DIVIDE = 272,                  /* DIVIDE  */
    L_SHIFT = 273,                 /* L_SHIFT  */
    R_SHIFT = 274,                 /* R_SHIFT  */
    MOD = 275,                     /* MOD  */
    LE = 276,                      /* LE  */
    LT = 277,                      /* LT  */
    GE = 278,                      /* GE  */
    GT = 279,                      /* GT  */
    NE = 280,                      /* NE  */
    EQ = 281,                      /* EQ  */
    PLUS_ASSIGN = 282,             /* PLUS_ASSIGN  */
    MINUS_ASSIGN = 283,            /* MINUS_ASSIGN  */
    MUL_ASSIGN = 284,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 285,              /* DIV_ASSIGN  */
    AND_ASSIGN = 286,              /* AND_ASSIGN  */
    OR_ASSIGN = 287,               /* OR_ASSIGN  */
    XOR_ASSIGN = 288,              /* XOR_ASSIGN  */
    MOD_ASSIGN = 289,              /* MOD_ASSIGN  */
    L_SHIFT_ASSIGN = 290,          /* L_SHIFT_ASSIGN  */
    R_SHIFT_ASSIGN = 291,          /* R_SHIFT_ASSIGN  */
    AND = 292,                     /* AND  */
    OR = 293,                      /* OR  */
    NOT = 294,                     /* NOT  */
    BIT_AND = 295,                 /* BIT_AND  */
    BIT_OR = 296,                  /* BIT_OR  */
    BIT_XOR = 297,                 /* BIT_XOR  */
    BIT_COMP = 298,                /* BIT_COMP  */
    L_PAREN = 299,                 /* L_PAREN  */
    R_PAREN = 300,                 /* R_PAREN  */
    L_FLOWBRACE = 301,             /* L_FLOWBRACE  */
    R_FLOWBRACE = 302,             /* R_FLOWBRACE  */
    L_SQBRACE = 303,               /* L_SQBRACE  */
    R_SQBRACE = 304,               /* R_SQBRACE  */
    SEMICOLON = 305                /* SEMICOLON  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IF 258
#define ELSE 259
#define WHILE 260
#define INT_K 261
#define FLOAT_K 262
#define CHAR_K 263
#define INT_NUM 264
#define FLOAT_NUM 265
#define ID 266
#define PLUS_PLUS 267
#define MINUS_MINUS 268
#define PLUS 269
#define MINUS 270
#define MULTIPLY 271
#define DIVIDE 272
#define L_SHIFT 273
#define R_SHIFT 274
#define MOD 275
#define LE 276
#define LT 277
#define GE 278
#define GT 279
#define NE 280
#define EQ 281
#define PLUS_ASSIGN 282
#define MINUS_ASSIGN 283
#define MUL_ASSIGN 284
#define DIV_ASSIGN 285
#define AND_ASSIGN 286
#define OR_ASSIGN 287
#define XOR_ASSIGN 288
#define MOD_ASSIGN 289
#define L_SHIFT_ASSIGN 290
#define R_SHIFT_ASSIGN 291
#define AND 292
#define OR 293
#define NOT 294
#define BIT_AND 295
#define BIT_OR 296
#define BIT_XOR 297
#define BIT_COMP 298
#define L_PAREN 299
#define R_PAREN 300
#define L_FLOWBRACE 301
#define R_FLOWBRACE 302
#define L_SQBRACE 303
#define R_SQBRACE 304
#define SEMICOLON 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
