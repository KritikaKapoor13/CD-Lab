%{
	#include <stdio.h>
	#include <stdlib.h>	
	#include "y.tab.h"

int scope=0;
	
%}
%option yylineno

digit	[0-9]
alpha	[a-zA-Z]
und	"_"



Equality [==]




%%

[\t \n]  
\/[\/]+.*[\n\t]*	
"/*"([^*]|\*+[^*/])*\*+"/"[\n\t]*

"{" {scope++;}
"}" {scope--;}
	

({digit})+	{yylval.number=atoi(yytext); return T_NUM;}
"#include"[ ]*<.+\.h> {return T_INCLUDE;}
"return" {return T_RETURN;}
"void"	{return T_VOID;}
"main" {return T_MAIN;}
"int" {return T_INT;}
"char" {return T_CHAR;}
"float" {return T_FLOAT;}
"while" {return T_WHILE;}
"for" {return T_FOR;}
"if"  {return T_IF;}
"true"	{return T_TRUE;}
"false"	{return T_FALSE;}
"do"	{return T_DO;}


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

