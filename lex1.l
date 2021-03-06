%{
	#include <stdio.h>
	#include <stdlib.h>	
	#include "y.tab.h"
%}

digit	[0-9]
alpha	[a-zA-Z]
und	"_"



Equality [==]




%%

[\t \n]

({digit})+	{yylval.number=atoi(yytext); return T_NUM;}
"import"  {return T_IMPORT;}
"class"	{return T_CLASS;}
"public" {return T_PUBLIC;}
"static" {return T_STATIC;}
"void"	{return T_VOID;}
"main" {return T_MAIN;}
"int" {return T_INT;}
"while" {return T_WHILE;}
"for" {return T_FOR;}
"do" {return  T_DO;}



Equality {return T_S_EQ;}
"+"  {return T_S_PLUS;}
"-"   {return T_S_MINUS;}
"*"	{return T_S_MULT;}
"/"	{return T_S_DIV;}
"--" {return T_U_INCR;}
"++" {return T_U_DECR;}
"+="	{return T_S_PLUSEQ;}
"-="	{return T_S_MINUSEQ;}
"*="	{return T_S_MULTEQ;}
"/="     {return T_S_DIVEQ;}
"!="          {return T_NE;}
">="	{return T_GEQ;}
"<="	{return T_LEQ;}
">"	{return T_GE;}
"<"	{return T_LE;}
"="     {return T_ASSG;}

({alpha}|{und})({alpha}|{und}|{digit})*	{yylval.string=strdup(yytext); return T_ID ;}
.    {return yytext[0];}
%%

int yywrap()
{
	return 1;
}

