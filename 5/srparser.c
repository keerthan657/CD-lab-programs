#include<stdio.h>
#include<string.h>

int i=0,j=0,z=0,len=0;
char stk[20], input[20];

void check()
{
    int c=len;
    for(z=0; z<c; z++)
    {
        if(stk[z]=='c')
        {
            printf("reduced by S->c");
            stk[z] = 'S';
            stk[z+1] = '\0';
            printf("\n$%s\t\t%s$\t\t", stk, input);
        }
    }
    for(z=0; z<c-2; z++)
    {
        if(stk[z]=='a' && stk[z+1]=='S' && stk[z+2]=='a')
        {
            printf("reduced by S->aSa");
            stk[z] = 'S';
            stk[z+1] = '\0';
            stk[z+2] = '\0';
            printf("\n$%s\t\t%s$\t\t", stk, input);
            i=i-2;
        }
    }
    for(z=0; z<c-2; z++)
    {
        if(stk[z]=='b' && stk[z+1]=='S' && stk[z+2]=='b')
        {
            printf("reduced by S->bSb");
            stk[z] = 'S';
            stk[z+1] = '\0';
            stk[z+2] = '\0';
            printf("\n$%s\t\t%s$\t\t", stk, input);
            i=i-2;
        }
    }
}

int main()
{
    printf("grammar is S->aSa|bSb|c\n");
    printf("enter input: ");
    scanf("%s", input);

    len = strlen(input);
    char action[20] = "Shift";

    printf("STACK\t\tINPUT\t\tACTION");
    printf("\n$\t\t%s$\t\t", input);

    for(i=0; j<len; i++,j++)
    {
        printf("%s", action);
        stk[i] = input[j];
        stk[i+1] = '\0';
        input[j] = ' ';
        printf("\n$%s\t\t%s$\t\t", stk, input);
        check();
    }
    check();
    
    if(stk[0]=='S' && stk[1]=='\0')
        printf("ACCEPT\n");
    else
        printf("REJECT\n");
    return 0;
}
