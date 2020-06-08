%{
	#include<stdio.h>
	#include<string.h>
	#include "y.tab.h"
	void yyerror(char *);	
	
%}

%%

$[a-z]																{yylval.v=yytext[1]-'a';return var;}
[a-zA-Z][a-zA-Z0-9]*"@"[a-z]"mail.com"							    {yylval.f=strdup(yytext);return emailid;}
[a-zA-Z]([a-zA-Z0-9]|\b)*											{yylval.f=strdup(yytext);return str;}
[0-9]+([a-zA-Z]|\b)+												{yylval.f=strdup(yytext);return str;}
[0-9]+                                                              {yylval.v=atoi(yytext);return nr;}
"+"																	{return plus;}
"-"																	{return min;}
"/"																	{return dev;}
"%"																	{return per;}
"#"																	{return hash;}
"?"																	{return que;}
">"																	{return gt;}
"&"																	{return amp;}
":"																	{return colon;}
[=\n]																{return *yytext;}
.																	yyerror("invalid character");
%%


int yywrap(){
	return -1;
}