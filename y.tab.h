/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_NUM = 258,
    T_ID = 259,
    T_VOID = 260,
    T_MAIN = 261,
    T_INT = 262,
    T_CHAR = 263,
    T_FLOAT = 264,
    T_INCLUDE = 265,
    T_RETURN = 266,
    T_WHILE = 267,
    T_U_INCR = 268,
    T_U_DECR = 269,
    T_S_PLUSEQ = 270,
    T_S_MINUSEQ = 271,
    T_S_MULTEQ = 272,
    T_S_DIVEQ = 273,
    T_TRUE = 274,
    T_FALSE = 275,
    T_S_DIV = 276,
    T_IF = 277,
    T_FOR = 278,
    T_DO = 279,
    T_S_EQ = 280,
    T_S_PLUS = 281,
    T_S_MINUS = 282,
    T_S_MULT = 283,
    T_ = 284,
    S_DIV = 285,
    T_GEQ = 286,
    T_LEQ = 287,
    T_LE = 288,
    T_GE = 289,
    T_ASSG = 290,
    T_NE = 291
  };
#endif
/* Tokens.  */
#define T_NUM 258
#define T_ID 259
#define T_VOID 260
#define T_MAIN 261
#define T_INT 262
#define T_CHAR 263
#define T_FLOAT 264
#define T_INCLUDE 265
#define T_RETURN 266
#define T_WHILE 267
#define T_U_INCR 268
#define T_U_DECR 269
#define T_S_PLUSEQ 270
#define T_S_MINUSEQ 271
#define T_S_MULTEQ 272
#define T_S_DIVEQ 273
#define T_TRUE 274
#define T_FALSE 275
#define T_S_DIV 276
#define T_IF 277
#define T_FOR 278
#define T_DO 279
#define T_S_EQ 280
#define T_S_PLUS 281
#define T_S_MINUS 282
#define T_S_MULT 283
#define T_ 284
#define S_DIV 285
#define T_GEQ 286
#define T_LEQ 287
#define T_LE 288
#define T_GE 289
#define T_ASSG 290
#define T_NE 291

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 35 "c-yacc.y" /* yacc.c:1909  */

    	int number;
    	char *string;
//    	bool *boo;   	 

#line 132 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
