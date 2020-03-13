%{
	int l = 0;
%}

%%
.*\n	{fprintf(yyout,"%d %s", l++, yytext);}
%%

int main()
{
	yyin=fopen("input.c","r");
	yyout=fopen("output.c","w");
	yylex();
	fclose(yyout);
	return 0;
}
