{
module Main where
import Lexical
}

%name calc
%tokentype { Token }
%error { parseError }

%token
	if          	{ TokenIf }
    	then        	{ TokenThen }
    	else        	{ TokenElse }
    	while       	{ TokenWhile }
    	'='         	{ TokenAssign }
    	'+='        	{ TokenAssignInc }
    	'+'         	{ TokenPlus }
    	'-'         	{ TokenMinus }
    	'*'         	{ TokenTimes }
    	'/'         	{ TokenDiv }
    	'('         	{ TokenOpenBracket }
        ')'         	{ TokenCloseBracket }
        '{'         	{ TokenOpenBrace }
        '}'         	{ TokenCloseBrace }
        ';'		{ TokenConcat }
       	conds 		{ TokenConds $$ }
    	int         	{ TokenInt $$ }
        var         	{ TokenId $$ }

%left '+' '-'
%left '*' '/'
%left NEG
%%

Exp   	: var '=' Exp							{ \p -> Assign (Leaf $1) ($3 p)}
	| var '+=' Exp							{ \p -> AssignInc (Leaf $1) ($3 p)}
	| Exp '+' Exp           					{ \p -> Sum ($1 p) ($3 p) }
      	| Exp '-' Exp          						{ \p -> Sub ($1 p) ($3 p) }
      	| Exp '*' Exp           					{ \p -> Prod ($1 p) ($3 p) }
      	| Exp '/' Exp        						{ \p -> Div ($1 p) ($3 p) }
      	| if '(' var ')' '{' Exp '}'					{ \p -> If (Leaf $3) ($6 p) }
      	| if '(' var conds var ')' '{' Exp '}'				{ \p -> Cond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| if '(' var conds int ')' '{' Exp '}'				{ \p -> Cond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| if '(' int conds var ')' '{' Exp '}'				{ \p -> Cond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| if '(' int conds int ')' '{' Exp '}'				{ \p -> Cond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| if '(' var ')' '{' Exp '}' else '{' Exp '}' 			{ \p -> IfElse (Leaf $3) ($6 p) ($10 p) }
      	| if '(' var conds var ')' '{' Exp '}' else '{' Exp '}' 	{ \p -> CondElse (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) ($12 p) }
      	| if '(' var conds int ')' '{' Exp '}' else '{' Exp '}' 	{ \p -> CondElse (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) ($12 p) }
      	| if '(' int conds var ')' '{' Exp '}' else '{' Exp '}' 	{ \p -> CondElse (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) ($12 p) }
      	| if '(' int conds int ')' '{' Exp '}' else '{' Exp '}' 	{ \p -> CondElse (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) ($12 p) }
      	| while '(' var ')' '{' Exp '}'					{ \p -> While (Leaf $3) ($6 p) }
      	| while '(' var conds var ')' '{' Exp '}'			{ \p -> WhileCond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| while '(' var conds int ')' '{' Exp '}'			{ \p -> WhileCond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| while '(' int conds var ')' '{' Exp '}'			{ \p -> WhileCond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| while '(' int conds int ')' '{' Exp '}'			{ \p -> WhileCond (Leaf $3) (Leaf $4) (Leaf $5) ($8 p) }
      	| '(' Exp ')'							{ $2 }
      	| '{' Exp '}'							{ $2 }
      	| Exp ';'							{ $1 }
      	| Exp ';' Exp							{ \p -> Concat ($1 p) ($3 p) }
      	| conds								{ \p -> Leaf $1 }
      	| int                   					{ \p -> Leaf $1 }
      	| var                   					{ \p -> Leaf $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Tree a = Leaf a
		| Cond (Tree a) (Tree a) (Tree a) (Tree a)
		| CondElse (Tree a) (Tree a) (Tree a) (Tree a) (Tree a)
		| Concat (Tree a) (Tree a)
		| If (Tree a) (Tree a)
		| IfElse (Tree a) (Tree a) (Tree a)
		| While (Tree a) (Tree a)
		| WhileCond (Tree a) (Tree a) (Tree a) (Tree a)
		| Assign (Tree a) (Tree a)
		| AssignInc (Tree a) (Tree a)
		| Sum (Tree a) (Tree a)
		| Sub (Tree a) (Tree a)
		| Prod (Tree a) (Tree a)
		| Div (Tree a) (Tree a)
	deriving (Show)

main = do s <- getContents
	  print (calc (lexer s) [])
}