%option noyywrap
%{
#include<stdio.h>
int nId=0, nOp=0, nKe=0;
%}
%%
(int|float|double|char|long|short|for|while|if|printf|scanf|return) {nKe++;}
[_a-zA-Z][a-zA-Z0-9]*[(][)] ;   // exclude function names
[_a-zA-Z][a-zA-Z0-9]* {nId++;}
"#include".* ;
["].*["] ;  // exclude string values
[; ,] ;
[-+*%/] {nOp++;}
. ;
\n ;
%%
int main()
{
    char inputFile[100];
    printf("enter input C file name: ");
    scanf("%s", inputFile);
    yyin = fopen(inputFile, "r+");

    yylex();
    printf("successfull\n");
    printf("number of identifiers: %d\n", nId);
    printf("number of operators: %d\n", nOp);
    printf("number of keywords: %d\n", nKe);
    return 0;
}