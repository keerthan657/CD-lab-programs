%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror();
%}
%token RTYPE ID NUM OP RET
%%
S : RTYPE ' ' ID '(' ')' '{' block retbody '}'
  ;
block : ID '=' ID OP NUM ';'
      | ID '=' ID OP ID ';'
      | ID '=' ID ';'
      | ID '=' NUM ';'
      |
      ;
retbody : RET ' ' ID ';'
        | RET ' ' NUM ';'
        ;
%%
void yyerror()
{
    printf("ERROR\n");
    exit(0);
}
int main()
{
    printf("enter input: ");
    yyparse();
    printf("successfull\n");
    return 0;
}