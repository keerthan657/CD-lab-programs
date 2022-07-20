%{
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<ctype.h>
void yyerror(char *s);
int yylex();
char AddToTable(char,char,char);
char table[100][4]; int currIndex=0;
char temp = 'A';
int seen[128];
%}

%token NUMBER LETTER
%left '+' '-'
%left '*' '/'

%%
statement: LETTER '=' expr {AddToTable((char)$1,(char)$3,'=');}
         | expr
         ;
expr: expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
		| expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
		| expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
		| expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
		| '(' expr ')' {$$ = (char)$2;}
		| NUMBER {$$ = $1;}
		| LETTER {$$ = (char)$1;}
		;
%%

void yyerror(char *s)
{
    printf("ERROR: %s",s);
    exit(0);
}

char AddToTable(char od1, char od2, char op)
{
	temp++;

	table[currIndex][0] = od1;
	table[currIndex][1] = od2;
	table[currIndex][2] = op;
	table[currIndex][3] = temp;

	currIndex++;
	return temp;
}

void convert()
{
	for(int i=0; i<currIndex; i++)
	{
		if(table[i][2]=='+')
		{
			printf("\nADD Reg%c Reg%c Reg%c", table[i][0], table[i][1], table[i][3]);
		}
		else if(table[i][2]=='-')
		{
			printf("\nSUB Reg%c Reg%c Reg%c", table[i][0], table[i][1], table[i][3]);
		}
		else if(table[i][2]=='*')
		{
			printf("\nMUL Reg%c Reg%c Reg%c", table[i][0], table[i][1], table[i][3]);
		}
		else if(table[i][2]=='/')
		{
			printf("\nDIV Reg%c Reg%c Reg%c", table[i][0], table[i][1], table[i][3]);
		}
		else if(table[i][2]=='=')
		{
			printf("\nASSIGN Reg%c %c", table[i][1], table[i][0]);
		}
	}
	printf("\n");
}

void printAssembly()
{
	printf("\nTAC:\n");
	for(int i=0; i<currIndex; i++)
	{
		printf("%c : =  %c \t %c \t %c\n", table[i][3], table[i][0], table[i][1], table[i][2]);
	}
	printf("#####\n");

	printf("\nASSEMBLY CODE:\n");
	convert();
}

void main()
{
	printf("\nEnter expression: ");
	yyparse();
	printf("\nVALID\n");
	printAssembly();
}
