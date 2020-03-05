%{
	int id=0;
	int kw=0;
	int pun=0;
	int intn=0;
	int floatn=0;
	int ws=0;
	int opr=0;
	int com=0;
	int other=0;
%}
DIGIT    [1-9][0-9]+
ID       [a-z][a-z0-9]*
%%
"'"[^.]*"'"							{printf("%s is a string const\n",yytext);}
if|for|while|do|else|case|switch|until|exit		{printf("%s is a keyword\n",yytext);kw++;}
{ID}   							{printf("%s is an identifier\n",yytext);id++;}
{DIGIT}+"."{DIGIT}*	 				{printf("%s is a float\n",yytext);floatn++;}
{DIGIT}+						{printf("%d is an integer\n",atoi(yytext));intn++;}
"***"							{printf("%s is a comment\n",yytext);com++;}	
[ \t]+							{printf("%s is a white space char\n",yytext);ws++;}
"["|"]"|"{"|"}""("|")"|","				{printf("%s is a punctuation\n",yytext);pun++;}
":="|"<>"|"= ="|"!=" |"<="|"<="|"+"|"-"|"*"|"%"		{printf("%s is an operator\n",yytext);opr++;}
.							{printf("%s is Other\n",yytext);other++;}
\n      {return 0;}
%%

int yywrap(){}
int main()
{
	yylex();
	printf("Number of ID in a given I/P: %d\n",id);
	printf("Number of Keywords in a given I/P: %d\n",kw);
	printf("Number of Punctuations in a given I/P: %d\n",pun);
	printf("Number of Integers in a given I/P: %d\n",intn);
	printf("Number of Floats in a given I/P: %d\n",floatn);
	printf("Number of Whitespaces in a given I/P: %d\n",ws);
	printf("Number of Operators in a given I/P: %d\n",opr);
	return 0;
}
