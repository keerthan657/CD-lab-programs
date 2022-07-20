%{
    #include<stdio.h>
    #include<stdlib.h>
    void yyerror();
    char yylex();
%}
%%

S : X Y
  ;
X : 'a' X 'b'
  |;
Y : 'b' Y 'c'
  |;

%%
void yyerror()
{
    printf("ERROR\n");
    exit(0);
}
int main() {
    printf("enter string: ");
    yyparse();
    printf("successfully parsed\n");
    return 0;
}