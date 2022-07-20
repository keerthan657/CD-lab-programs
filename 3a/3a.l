%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
%}
%%

"//"[ a-zA-Z0-9]* {printf("single-line comment found\n");}
"/*"([ a-zA-Z0-9]|\n)*"*/" {printf("multi-line comment found\n");}  // fix this plz
. {fprintf(yyout, "%s", yytext);}

%%
int main()
{
    char inputFile[100];
    printf("enter C code file name: ");
    scanf("%s", inputFile);
    yyin = fopen(inputFile, "r+");
    yyout = fopen("output.c", "r+");

    yylex();
    printf("successfull\n");
    return 0;
}