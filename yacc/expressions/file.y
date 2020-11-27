%{
#include <stdio.h>
/*#include "lex.yy.c"*/
void yyerror(const char *str){
    fprintf(stderr,"errore: %s\n",str);
}
int yywrap() {return 1;}
int main() {yyparse();}
%}

%token NUM

%left '-' '+'
%left '*' '/'
%left NEG
%%

input:
	| input line
;

line: '\n'
	|exp '\n' { printf("The value is %d \n", $1); }
;

exp: NUM {$$=$1;}
	| exp '+' exp {$$=$1+$3;}
	| exp '-' exp {$$=$1-$3;}
	| exp '*' exp {$$=$1*$3;}
	| exp '/' exp {$$=$1/$3;}
	| '-' exp %prec NEG {$$=-$2;}
	| '(' exp ')' {$$=$2;}
;
