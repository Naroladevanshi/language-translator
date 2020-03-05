#include <stdio.h>
#include<string.h>
#include<stdlib.h>
#define s 10
int main(void) {
    char nt;
    char b,a;
    int n,i;
    char p[10][s];
    int in=3;
    printf("enter the no of productions:");
    scanf("%d",&n);
    n=4;
    printf("enter the grammer as E->E-A :\n");
    for(i=0;i<n;i++)
    {
        scanf("%s",p[i]);
    }
    for(i=0;i>n;i++)
    {
        printf("\nGRAMMER: %s",p[i]);
        nt=p[i][0];
        if(nt==p[i][in])
        {
            a=p[i][in+1];
            printf("is left recursive. \n");
            while(p[i][in]!=0 && p[i][in]!='|')
                in++;
            if(p[i][in]!=0)
            {
                b=p[i][in+1];
                printf("grammer without left recursion:\n");
                printf("%c->%c%c\'",nt,b,nt);
                printf("\n%c\'->%c%c\'|E\n",nt,a,nt);
            }
            else
            {
                printf(" can't be reduced\n");
            }
        }
        else
            printf(" is not left recursive\n");
            in=3;
    }
	return 0;
}

