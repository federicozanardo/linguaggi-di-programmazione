%{
#include <stdio.h>
#include "file.tab.h"
%}
%%
[ \t] ;
[0-9]+ {yylval = atoi(yytext); return NUM;}
\n {return *yytext;}
"+" {return *yytext;}
[\-\*\/\(\)] {return *yytext;}
%%
