%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    void yyerror();

    int res=0;
%}
%token IF RELOP ID NUM
%%
S : IF '(' bool_expr ')' '{' block '}' {res++;}
  ;
bool_expr : ID RELOP NUM
          | ID RELOP ID
          ;
block : ID '=' NUM ';'
      | ID '=' ID ';'
      | S
      |
      ;
%%
void yyerror()
{
    printf("ERROR/n");
    exit(0);
}
int main()
{
    printf("enter input: ");
    yyparse();
    printf("successfull, number of nestings=%d\n", res);
    return 0;
}