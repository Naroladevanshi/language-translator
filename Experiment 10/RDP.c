#include<stdio.h>
#include<string.h>
#include<ctype.h>
char l;
int maxi=100;
int op=0, i=0;
char s[100]="";
int f=0;
match(char t)
{
	if(l==t)
	{
		i++;
		l=s[i];
	}
	else
	{
		f=1;
		printf("invalid");
	}
}
T()
{
	char temp=l-'0';
	if(temp==0||temp==1||temp==2||temp==3||temp==4||temp==5||temp==6||temp==7||temp==8||temp==9)
	{
		while(temp==0||temp==1||temp==2||temp==3||temp==4||temp==5||temp==6||temp==7||temp==8||temp==9)
		{	
			i++;
			l=s[i];
			temp=l-'0';
		}
		
	}
	else
	{
		f=1;
		printf("invalid digit\n");
	}
}
E1()
{
	if(l=='+')
	{
		match('+');
		T();
		E1();
	}
	else if(l=='-')
	{
		match('-');
		T();
		E1();
	}
	else if(l=='*')
	{
		match('*');
		T();
		E1();
	}
	else if(l=='/')
	{
		match('/');
		T();
		E1();
	}
	else
		return;
	
}
E()
{
	T();
	E1();
}
rdp()
{
	if(l=='$')
		return;
	E();
	if(l=='$')
		return;
}
int main()
{
	printf("Give input:");
	scanf("%s",s);
	l=s[i];
	rdp();
	if(l=='$'&&f==0)
		printf("Valid input %d",op);
	else
		printf("Invalid input");

}


