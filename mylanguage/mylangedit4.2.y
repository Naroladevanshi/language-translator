%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern int yylex(void);    
void yyerror(char *);
char *sym[26];
FILE *fw,*fr,*ptr;
%}

%union{
	char *f;
	int v;
}

%token plus min str emailid dev per hash colon amp var nr que gt
%type <f> expr str emailid fact
%type <v> var nr
  
%left var str emailid
%left plus min dev per hash que gt colon 
%right amp
%right '='
%start program

%%

program : program statement '\n'
		|        		
	    ;

statement : expr { printf("%s\n",$<f>$); }
		  | var '=' expr {sym[$1]=$3; }
		  ;
expr : str	 {$$=$1;}
	 | var   {$$=sym[$1];}
	 | emailid {$$=$1; printf("Valid Email!\n");}
	 | expr plus expr {char *c;
	 				strcpy(c,$1);
	 				strcat(c,$3);					
				      $$=c;}
	 | expr min expr {
	 				char *c;
	 				strcpy(c,$1);
	 				strcat(c,$3);
					int i=0;
					for(i=0;i<(int)strlen(c);i++)
					{
						if(c[i]>=65 && c[i]<=90)
							c[i]=c[i]+32;
						else
							c[i]=c[i]-32;
					}					
					$$=c;
					}
	 | expr dev expr {
	 				  char *c;
	 				  
					  
						char *s=" ";
						if($3[0]>=65 && $3[0]<=90)
						{
						 strcat($1,s);
						 strcat($1,$3);
						 }
						else
							strcat($1,$3);
						
					$$=$1;
					}	
	 | expr hash nr que expr {int i=0,r=(int)strlen($1),n=(int)strlen($5),s,o,x,t=0,p;
							char b[r+1];
							p=$3;
							if(p<=r)
							{
							while(i<=r)
							{	b[i]=$1[i];
								i++;
							} b[i]='\0';
							s=n+r;
							o=p+n;
							for(i=p;i<s;i++)
							{	
								x=b[i];
								if(t<n)
								{
									$1[i]=$5[t];
									t=t+1;
								}
								$1[o]=x;
								o=o+1;
							}
							}
							printf("processed string is :");
							$$=$1;
						}
		| expr gt expr {
						char *s1;						
						char *s=".txt";
						strcat($3,s);
						char ch;
						if((ptr=fopen($3,"a"))==NULL)
						{printf("error: file not found");
						exit(1);
						}
						else{
						fputs($1,ptr);
						fclose(ptr);
						fr=fopen($3,"r");
						printf("file data is:");
						while((ch=fgetc(ptr))!=EOF)
							printf("%c",ch);
				
						printf("it is data of file :");
						fclose(ptr);
						}
						$$=$3;
						}
		
		| expr colon expr {char *p=strstr($1,$3);
							if (p)
							{
							printf("string is found and %s in %s is %s ",$3,$1,p);
					
							}
							else
								printf("string is not found");
						$$=p;
						}
		| fact
		;
fact:	expr per  { int i=0;
					for(i=0;i<(int)strlen($1);i++)
					{
						if($1[i]>=97 && $1[i]<=122)
							$1[i]=$1[i]-32;					
					}
					printf("processed string is :");
					$$=$1;
				}
		| expr amp {
				char *s1;
				char ch;
				char *s=".txt";
				strcat($1,s);
				if((ptr=fopen($1,"r"))==NULL)
	     			{printf("error: file not found");
				exit(1);
				}
				else
				{
				printf("file data is:");
				while((ch=fgetc(ptr))!=EOF)
					printf("%c",ch);
				
				printf("it is data of file :");
				fclose(ptr);				
				}
				$$=$1;
				}
		;
%%
void yyerror(char *s)
 {    
 fprintf(stderr, "%s\n", s);
 } 
int main(void) 
 {    
 yyparse();    
 return 0;
 }
			
			
