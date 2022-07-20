%option noyywrap
%{
#include<stdio.h>
%}
%%

[-][0-9]+\/[+]?[0-9]+ {printf("negative|positive fraction\n");}
[+]?[0-9]+\/[-][0-9]+ {printf("positive|negative fraction\n");}
[-][0-9]+\/[-][0-9]+ {printf("negative|negative fraction\n");}
[+]?[0-9]+\/[+]?[0-9]+ {printf("positive|positive fraction\n");}
[-][0-9]+\.[0-9]+ {printf("negative decimal\n");}
[+]?[0-9]+\.[0-9]+ {printf("positive decimal\n");}
[-][0-9]+ {printf("negative integer\n");}
[+]?[0-9]+ {printf("positive integer\n");}
[.]+ {printf("invalid input\n");}
\n\n {return 0;}

%%
int main()
{
    printf("enter number: ");
    yylex();
}