%{
	#include <stdio.h>
	#include <stdlib.h>	
	#include "y.tab.h"

struct double_list
{
	struct double_list * next;
  	char name[30];
  	int type;
    	int line;
	int scope;
  	
	union Value 
	{
    	int val;
    	char vale[20];
    	float valu;
  	}value;
};

int type=0;
int scope=0;

typedef struct double_list d_list;
d_list* head=NULL;


void  fill(char* name,int type,int line,int scope){
  d_list*node=head;
  while(node!=NULL){
    if(strcmp(name,node->name)==0){
      node->line=line;
	node->scope=scope;
      return;
    }
    node=node->next;
  }
  node=head;
  d_list* newnode=(d_list*) malloc(sizeof(d_list));
  strcpy(newnode->name,name);
  newnode->type=type;
  newnode->line=line;
  newnode->next=head;
  newnode->scope=scope;
  head=newnode;
 
  
}

void display(){
  d_list* node;
  node=head;
  while(node!=NULL){
    if(node->type==0)
    	printf("Type\tInt\tvar-name\t%s\tline\t%d\tScope\t%d\n",node->name,node->line,node->scope);
    else if(node->type==1)
    	printf("Type\tFloat\tvar-name\t%s\tline\t%d\tScope\t%d\n",node->name,node->line,node->scope);
	else if(node->type==2)
    	printf("Type\tChar\tvar-name\t%s\tline\t%d\tScope\t%d\n",node->name,node->line,node->scope);
    node=node->next;
  }
  
}
	
%}

%option yylineno

digit	[0-9]
alpha	[a-zA-Z]
und	"_"



Equality [==]




%%

[\t \n]  {printf("\n");fprintf(yyout,yytext);}
\/[\/]+.*[\n\t]*	{fprintf(yyout,"");}
"/*"([^*]|\*+[^*/])*\*+"/"[\n\t]*	{printf(yyout,"");}
"{" {scope++;fprintf(yyout,yytext);}
"}" {scope--;fprintf(yyout,yytext);}

({digit})+	{printf("T_NUM");fprintf(yyout,yytext);}
"#include"[ ]*<.+\.h> {printf("T_INCLUDE");fprintf(yyout,yytext);}
"printf" {printf("T_printf");fprintf(yyout,yytext);}
"void"	{printf("T_VOID");fprintf(yyout,yytext);}
"main" {printf("T_MAIN");fprintf(yyout,yytext);}
"int" {type=0;fprintf(yyout,yytext);}
"char" {type=2;fprintf(yyout,yytext);}
"float" {type=1;fprintf(yyout,yytext);}
"while" {printf("T_WHILE");fprintf(yyout,yytext);}
"for" {printf("T_FOR");fprintf(yyout,yytext);}
"if"  {printf("T_IF");fprintf(yyout,yytext);}
"true"	{printf("T_TRUE");fprintf(yyout,yytext);}
"false"	{printf("T_FALSE");fprintf(yyout,yytext);}
"do"	{printf("T_DO");fprintf(yyout,yytext);}
"return"	{printf("T_RETURN");fprintf(yyout,yytext);}

Equality {printf("T_S_EQ");fprintf(yyout,yytext);}
"+"  {printf("T_S_PLUS");fprintf(yyout,yytext);}
"-"   {printf("T_S_MINUS");fprintf(yyout,yytext);}
"*"	{printf("T_S_MULT");fprintf(yyout,yytext);}
"/"	{printf("T_S_DIV");fprintf(yyout,yytext);}
"--" {printf("T_U_INCR");fprintf(yyout,yytext);}
"++" {printf("T_U_DECR");fprintf(yyout,yytext);}
"+="	{printf("T_S_PLUSEQ");fprintf(yyout,yytext);}
"-="	{printf("T_S_MINUSEQ");fprintf(yyout,yytext);}
"*="	{printf("T_S_MULTEQ");fprintf(yyout,yytext);}
"/="     {printf("T_S_DIVEQ");fprintf(yyout,yytext);}
"!="          {printf("T_NE");fprintf(yyout,yytext);}
">="	{printf("T_GEQ");fprintf(yyout,yytext);}
"<="	{printf("T_LEQ");fprintf(yyout,yytext);}
">"	{printf("T_GE");fprintf(yyout,yytext);}
"<"	{printf("T_LE");fprintf(yyout,yytext);}
"="     {printf("T_ASSG");fprintf(yyout,yytext);}

({alpha}|{und})({alpha}|{und}|{digit})*	{printf("Identifier");fill(yytext,type,yylineno,scope);fprintf(yyout,yytext);}

%%

int main(){
	yyin=fopen("ex.c","r");
	yyout=fopen("ex1.c","w");
	yylex();
	printf("\n\n\n");
	display();
	return 0;
}

int yywrap()
{
	return -1;
}
