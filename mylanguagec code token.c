#include<string.h>
#include<stdio.h>

void identify(char s[],int len)
{
    int flag=0;
    int i=0;
    char m1[9]="gmail.com";
	while(i<len)
    {
        flag=0;
        if(strstr(s,m1)!=NULL)
        {
            printf("emailid %c",s[i]);
            i++;
            while(((int)s[i]>=65 && (int)s[i]<=90) || ((int)s[i]>=97 && (int)s[i]<=122) || ((int)s[i]>=48 && (int)s[i]<=57))
            {
                printf("%c",s[i]);
                i++;
            }
            
             if(s[i]=='@')
            {
                printf("%c",s[i]);
                i++;
               if(strcmp(s,m1))
               {
                   
                      printf("%s",m1);
                i=len;
               }
            }
        }
       else if(((int)s[i]>=65 && (int)s[i]<=90) || ((int)s[i]>=97 && (int)s[i]<=122))
        {
            
            printf("identifier %c",s[i]);
            i++;
            while(((int)s[i]>=65 && (int)s[i]<=90) || ((int)s[i]>=97 && (int)s[i]<=122) || ((int)s[i]>=48 && (int)s[i]<=57))
            {
                printf("%c",s[i]);
                i++;
            }
            printf("\n");
        }    
            
        else if(s[i]=='+'|| s[i]=='-'|| s[i]=='%'||s[i]=='/')
        {
                printf("operator %c\n",s[i]);
				i++;
        }
        else if(s[i]=='#')
        {
            printf("operator %c\n",s[i]);
            i++;
            printf("position ");
            while((int)s[i]>=48 && (int)s[i]<=57)
            {
                printf("%d",(int)s[i]-48);
                i++;
            }
            if(s[i]=='?')
            {
                i++;
                printf("subchar %c\n",s[i]);
                i++;
            }
        }
        else if(s[i]==':')
        {
            printf("operator %c\n",s[i]);
            i++;
            printf("searchchar %c\n",s[i]);
            i++;
            
        }
       else if(s[i]=='&')
       {
           printf("operator %c\n",s[i]);
           printf("file name:");
           i++;
            while(((int)s[i]>=65 && (int)s[i]<=90) || ((int)s[i]>=97 && (int)s[i]<=122) || ((int)s[i]>=48 && (int)s[i]<=57))
            {
                printf("%c",s[i]);
                i++;
            }
       }
        else if((int)s[i]>=48 && (int)s[i]<=57)
        {
            printf("number %d",(int)s[i]-48);
            i++;
            while((int)s[i]>=48 && (int)s[i]<=57)
            {
                printf("%d",(int)s[i]-48);
            i++;
            }
            printf("\n");
        }
        else if(s[i]=='*')
        {
			i++;
			if(s[i]!='*')
			{
				printf("Operator: *\n");
			}
			else if(s[i]=='*')
			{
			    i++;
				if(s[i]=='*')
				{
					while(i<len)
					{
						i++;
					}
					printf("comment \n");
				}
			}
		}
        else
        {
            printf("error");
        }
    }
}
int main()
{
    char name[] = " " ;
    gets(name);
	identify(name,strlen(name));
	return 0;
}


