%option noyywrap
%{
#include "y.tab.h"
%}
%%
"if" {return IF;}
[0-9]+ {return NUM;}
[a-zA-Z_]+ {return ID;}
[<>]=?|==|!= {return RELOP;}
. {return yytext[0];}
\n {return 0;}
%%
