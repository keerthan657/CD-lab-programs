%option noyywrap
%{
#include "y.tab.h"
%}
%%

[0-9]+ {return NUM;}
"for" {return FOR;}
[a-zA-Z]+ {return ID;}
[<>]=?|"=="|"!=" {return RELOP;}
. {return yytext[0];}
\n {return 0;}

%%