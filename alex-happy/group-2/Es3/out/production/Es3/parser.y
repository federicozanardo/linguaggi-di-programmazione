{
module Main where
import lexical
}

%name calc
%tokentype { Token }
%error { parseError }

%token
	if          { TokenIf }
    	then        { TokenThen }
    	else        { TokenElse }
    	'else if'   { TokenElseIf }
    	while       { TokenWhile }
    	'='         { TokenEq }
    	'+='        { TokenEqInc }
    	'+'         { TokenPlus }
    	'-'         { TokenMinus }
    	'*'         { TokenTimes }
    	'/'         { TokenDiv }
    	int         { TokenInt $$ }
        var         { TokenId $$ }

%left '+' '-'
%left '*' '/'
%left NEG
%%

Exp   : var '=' Exp		{ \p -> Asse (Leaf $1) ($3 p)}
	| var '+=' Exp 		{ \p -> AssInc (Leaf $1) ($3 p)}
	| Exp '+' Exp             { \p -> Sum ($1 p) ($3 p) }
      	| Exp '-' Exp             { \p -> Diff ($1 p) ($3 p) }
      	| Exp '*' Exp             { \p -> Prod ($1 p) ($3 p) }
      	| Exp '/' Exp             { \p -> Div ($1 p) ($3 p) }
      	| int                     { \p -> Leaf $1 }
      	| var                     { \p -> Leaf $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Tree a = Leaf a
		| Cond (Tree a)
		| Asse (Tree a) (Tree a)
		| AssInc (Tree a) (Tree a)
		| Sum (Tree a) (Tree a)
		| Diff (Tree a) (Tree a)
		| Prod (Tree a) (Tree a)
		| Div (Tree a) (Tree a)
	deriving (Show)

main = do s <- getContents
	  print (calc (lexer s) [])
}