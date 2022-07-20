%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror();

    int result=0;
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%

S : T {result = $$;}
  ;
T : T '+' T {$$ = $1 + $3;}
  | T '-' T {$$ = $1 - $3;}
  | T '*' T {$$ = $1 * $3;}
  | T '/' T {$$ = $1 / $3;}
  | '(' T ')' {$$ = $2;}
  | NUM {$$ = $1;}
  ;

%%
void yyerror()
{
    printf("ERROR\n");
    exit(0);
}
int main()
{
    printf("enter expression: ");
    yyparse();
    printf("successfull, result=%d\n", result);
    return 0;
}