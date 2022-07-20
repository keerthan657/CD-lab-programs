%option noyywrap
%{
%}
%%

[abc] return yytext[0];
[\n.] return 0;

%%
