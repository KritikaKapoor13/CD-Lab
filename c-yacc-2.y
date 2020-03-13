%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>


struct double_list
{
	struct double_list * next;
  	char name[30];
  	int type;
  	
	union Value 
	{
    	int val;
    	char vale[20];
    	float valu;
  	}value;
};

typedef struct double_list d_list;
d_list* head=NULL;
int yylex(void);
void yyerror(char *);

int fill(char*name,int value,int type);
int lookupsymb(char *id);
void display();
int update(char* id,int value);
%}

%union
{
    	int number;
    	char *string;
//    	bool *boo;   	 
}

%token <number> T_NUM  
%token <string> T_ID
%type<number> T_Const
%type<number> T_expr
%token T_VOID
%token  T_MAIN
%token T_INT T_CHAR T_FLOAT T_INCLUDE T_RETURN T_WHILE
%token T_U_INCR T_U_DECR
%token	T_S_PLUSEQ T_S_MINUSEQ T_S_MULTEQ T_S_DIVEQ T_TRUE T_FALSE T_S_DIV T_IF T_FOR T_DO
%nonassoc  T_S_EQ
%left T_S_PLUS T_S_MINUS T_S_MULT T_ S_DIV
%right T_GEQ T_LEQ T_LE T_GE T_ASSG T_NE


%%
/*start_aug:
import_stmt class_def {exit(0);}
| class_def  {exit(0);}
;
import_stmt:
 T_IMPORT T_ID
;*/
include_stmt:
	| T_INCLUDE Class_head
;
Class_head:
	main_def '{' stmts T_RETURN T_NUM ';' '}'  {display();}
;

main_def:
T_INT T_MAIN
;

stmts:
 stmts stmt
 | stmt
 
 ;
 
stmt:
  T_ID T_ASSG T_expr ';' {update($1,$3,yylineno);}  
  | var_decl
  | T_DO '{' stmts '}' T_WHILE'(' cond ')' ';'
	| T_FOR '(' init ';' cond ';' updating ')' '{' stmts '}'
	| T_IF '(' cond ')' '{' stmts '}'
	| single_IF_stmt
  //| T_FOR '('
;

init:
	T_INT T_ID T_ASSG T_expr {fill($2,$4,0,yylineno);}
	|T_ID T_ASSG T_expr {update($1,$3,yylineno);} 
	|" "
	;

updating:
	T_ID T_ASSG T_expr {update($1,$3,yylineno);} 
	|" "
	;

single_IF_stmt:
	T_IF '(' cond ')' stmt 

//for_dec:
   
T_expr:
   T_Const T_S_PLUS T_Const {$$=$1+$3;}
   | T_Const T_S_MINUS T_Const {$$=$1-$3;}
   | T_Const T_S_MULT T_Const  {$$=$1*$3;}
   | T_Const T_S_DIV T_Const  {$$=$1/$3;}
   | T_Const {$$=$1;}

;
T_Const:
	T_ID {$$=lookupsymb($1);}
	| T_NUM { $$=$1;}
	;

cond:
	|T_TRUE 
	|T_FALSE
	|T_expr T_GEQ T_expr 
	|T_expr T_LEQ T_expr
	|T_expr T_GE T_expr
	|T_expr T_LE T_expr
	|T_expr T_S_EQ T_expr 
	;

 
var_decl:
	T_INT T_ID ';' { fill($2,0,0,yylineno);}
	|T_INT T_ID T_ASSG T_expr ';' {fill($2,$4,0,yylineno);}
	|T_FLOAT T_ID ';' { fill($2,0,1,yylineno);}
	|T_FLOAT T_ID T_ASSG T_expr ';' {fill($2,$4,1,yylineno);}
	|T_CHAR T_ID ';' { fill($2,0,2,yylineno);}
	|T_CHAR T_ID T_ASSG T_expr ';' {fill($2,$4,2,yylineno);}
       //| T_Const T_S_DIV T_Const  {$$=$1/$3;}
       ;

type:
T_INT;
%%
int update(char*name,int value){
  d_list*node=head;
  while(node->next!=NULL){
    if(strcmp(name,node->name)==0){
      node->value.val=value;
      printf("%s %d",node->name,node->value.val);
    
      return 1;
      
    }
    node=node->next;

  }
   
  return 0;
  exit(1);

}

int  fill(char* name,int value,int type){
  d_list*node=head;
  while(node!=NULL){
    if(strcmp(name,node->name)==0){
      yyerror("variable already declared");
      exit(1);
      return  -1;
    }
    node=node->next;
  }
  node=head;
  d_list* newnode=(d_list*) malloc(sizeof(d_list));
  strcpy(newnode->name,name);
  newnode->type=type;
  newnode->value.val=value;
  newnode->next=head;
  head=newnode;
  
  
}
void display(){
  d_list* node;
  node=head;
  while(node!=NULL){
  
    printf("var-name\t%s\tvalue\t%d\n",node->name,node->value.val);
    node=node->next;
  }
  
}
int lookupsymb(char *id){
  d_list* node;
  node=head;
  if(head==NULL){
    yyerror("Variable Not declared");
    return -1;
    exit(1);

  }
  while(node!=NULL){
    if(strcmp(id,node->name)==0){
      return node->value.val;

    }
    node=node->next;
  }
  if(node==NULL){
    yyerror("Variable Not declared");
    return -1;
    exit(1);
  }
  
}

void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main()
{
yyparse();

return 0;
}



