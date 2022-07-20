#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int z = 0, i = 0, j = 0, c = 0;
char a[16], ac[20], stk[15], act[10];

void check()
{
	// Copying string to be printed as action
    strcpy(ac,"REDUCE TO E -> "); 
     
    // c=length of input string
    for(z = 0; z < c; z++)
    {
        //checking for producing rule E->4
        if(stk[z] == 'c')
        {
            printf("%sc", ac);
            stk[z] = 'S';
            stk[z + 1] = '\0';
             
            //printing action
            printf("\n$%s\t\t%s$\t", stk, a);
        }
    }
         
    for(z = 0; z < c - 2; z++)
    {
        //checking for another production
        if(stk[z] == 'a' && stk[z + 1] == 'S' &&
                                stk[z + 2] == 'a')
        {
            printf("%saSa", ac);
            stk[z] = 'S';
            stk[z + 1] = '\0';
            stk[z + 2] = '\0';
            printf("\n$%s\t\t%s$\t", stk, a);
            i = i - 2;
        }
         
    }
         
    for(z=0; z<c-2; z++)
    {
        //checking for E->3E3
        if(stk[z] == 'b' && stk[z + 1] == 'S' &&
                                stk[z + 2] == 'b')
        {
            printf("%sbSb", ac);
            stk[z]='S';
            stk[z + 1]='\0';
            stk[z + 1]='\0';
            printf("\n$%s\t\t%s$\t", stk, a);
            i = i - 2;
        }
    }
    return ; //return to main
}

int main()
{
	printf("GRAMMAR is -\nS->aSa \nS->bSb \nS->c\n");
    
    printf("enter input: ");
	scanf("%s", a);

    // strlen(a) will return the length of a to c
    c=strlen(a);
     
    strcpy(act,"SHIFT");
     
    printf("\nstack \t\t input \t\t action");
     
    printf("\n$\t\t%s$\t", a);
     
    for(i = 0; j < c; i++, j++)
    {
        printf("%s", act);
         
        // Pushing into stack
        stk[i] = a[j];    
        stk[i + 1] = '\0';
         
        a[j]=' ';
         
        // Printing action
        printf("\n$%s\t\t%s$\t", stk, a);
         
        check();
    }
     
    check();
     
    // if top of the stack is E(starting symbol)
    // then it will accept the input
    if(stk[0] == 'S' && stk[1] == '\0')
        printf("Accept\n");
    else //else reject
        printf("Reject\n");
}