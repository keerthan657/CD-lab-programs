%{
#include "y.tab.h"
%}
%%
int|float|char|double {return RTYPE;}
return {return RET;}
[a-zA-Z]+ {return ID;}
[0-9]+ {return NUM;}
[-+/*%] {return OP;}
. {return yytext[0];}
\n {return 0;}
%%
