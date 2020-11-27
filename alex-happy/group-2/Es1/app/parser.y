{
module Main where
import Lexical
}

%name calc
%tokentype { Token }
%error { parseError }

%token
       	'+'         	{ TokenPlus }
    	'-'         	{ TokenMinus }
    	'*'         	{ TokenTimes }
    	'/'         	{ TokenDiv }
    	'**'        	{ TokenExpo }
    	'('		{ TokenOpenBracket }
    	')'		{ TokenCloseBracket }
    	'sin'		{ TokenSin }
    	'cos'		{ TokenCos }
    	'tan'		{ TokenTan }
    	const         	{ TokenConst $$ }
        var         	{ TokenId $$ }

%left '('
%right ')'
%left '+' '-'
%left '*' '/'
%left 'sin' 'cos' 'tan'
%right '**'
%left NEG
%%

Exp   	: Exp '+' Exp           { \p -> Plus ($1 p) ($3 p) }
      	| Exp '-' Exp           { \p -> Minus ($1 p) ($3 p) }
      	| Exp '*' Exp           { \p -> Times ($1 p) ($3 p) }
      	| Exp '/' Exp           { \p -> Div ($1 p) ($3 p) }
      	| Exp '**' Exp		{ \p -> Expo ($1 p) ($3 p) }
      	| 'sin' Exp		{ \p -> Sin ($2 p) }
      	| 'cos' Exp		{ \p -> Cos ($2 p) }
      	| 'tan' Exp		{ \p -> Tan ($2 p) }
      	| '(' Exp ')'		{ $2 }
      	| '-' Exp %prec NEG	{ \p -> Neg($2 p) }
      	| const              	{ \p -> Leaf $1 }
      	| var		        { \p -> Leaf $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Tree a = Leaf a
		| Plus (Tree a) (Tree a)
		| Minus (Tree a) (Tree a)
		| Times (Tree a) (Tree a)
		| Div (Tree a) (Tree a)
		| Expo (Tree a) (Tree a)
		| Neg (Tree a)
		| Sin (Tree a)
		| Cos (Tree a)
		| Tan (Tree a)
	deriving (Show)

main = do s <- getContents
	  print (calc (lexer s) [])
}