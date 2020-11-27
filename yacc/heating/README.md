# YACC-riscaldamento
## Example of YACC and (F)LEX program - Programming Languages course (UniUD)

### Description
This is just an easy example of a YACC program. It permits to manage a (very simple) heating system.

### Compile
1. Add to the prologue of the ```lex``` file (```file.l```): ```#include "file.tab.h"```
2. Compile ```lex``` file (in this case I used ```flex```): ```flex file.l```
3. Compile ```yacc``` file (in this case I use ```bison```): ```bison -d file.y```
4. Compile and generate the execute: ```gcc lex.yy.c file.tab.c -o file```
5. Run with ```./file```
