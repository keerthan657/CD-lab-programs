%{
#include"y.tab.h"
extern char yyval; // some LEX versions might not work with "extern char", use "extern int" instead then (no other changes required)
%}
%%
[0-9]+    {yylval=(char)yytext[0]; return NUMBER;}
[a-zA-Z]+ {yylval=(char)yytext[0]; return LETTER;}
\n {return 0;}
. {return yytext[0];}
%%
