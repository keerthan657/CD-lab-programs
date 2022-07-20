%option noyywrap
%{
#include<stdio.h>
int nWords=0, nLines=0, nChars=0, nSpaces=0;
%}
%%

[a-zA-Z]+ {nWords++; nChars+=yyleng;}
[ ] {nSpaces++;}
[\n] {nLines++;}
[!] {return 0;}

%%
int main()
{
    printf("enter string: ");
    yylex();
    printf("number of words: %d\n", nWords);
    printf("number of lines: %d\n", nLines);
    printf("number of characters: %d\n", nChars);
    printf("number of spaces: %d\n", nSpaces);
    return 0;
}