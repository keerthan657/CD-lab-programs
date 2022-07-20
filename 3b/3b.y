%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror(char *msg);
    int yylex();
    int res=0;
%}
%token FOR ID RELOP NUM
%%
S : FOR '(' arith_expr ';' bool_expr ';' arith_expr ')' '{' block '}' {res++;}
  ;
arith_expr : ID '=' NUM
           | ID '=' ID
           | ID '+' '+'
           | ID '-' '-'
           | '+' '+' ID
           | '-' '-' ID
           |
           ;
bool_expr : ID RELOP NUM
          | ID RELOP ID
          |
          ;
block : arith_expr ';'
      | S
      |
      ;
%%
void yyerror(char *msg)
{
    printf("ERROR: %s\n", msg);
    exit(0);
}
int main()
{
    printf("enter input: ");
    yyparse();
    printf("successfull, number of nesting=%d\n", res);
    return 0;
}