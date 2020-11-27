%{
#include <stdio.h> 
#include "file.tab.h"
%}
%%
[0-9]+ { yylval=atoi(yytext); return NUMERO; }
riscaldamento return TOKRISCALDAMENTO;
acceso|spento { yylval=strcmp(yytext,"spento");
		return STATO;}
obiettivo return TOKOBIETTIVO;
temperatura return TOKTEMP;
[ \t\n]+ ;
%%

