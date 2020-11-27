{
module Lexical (Token(..), lexer) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$lowercaseAlpha = [a-z]

@const = $digit+
@identifier = ($lowercaseAlpha)($alpha*$digit*)*

tokens :-
    $white+     ;
    "--".*      ;
    \+          { \s -> TokenPlus }
    \-          { \s -> TokenMinus }
    \*          { \s -> TokenTimes }
    \/          { \s -> TokenDiv }
    \*\*        { \s -> TokenExpo }
    sin         { \s -> TokenSin }
    cos         { \s -> TokenCos }
    tan         { \s -> TokenTan }
    \(          { \s -> TokenOpenBracket }
    \)          { \s -> TokenCloseBracket }
    @const      { \s -> TokenConst s }
    @identifier { \s -> TokenId s }

{
data Token
        = TokenConst String
        | TokenId String
        | TokenPlus
        | TokenMinus
        | TokenTimes
        | TokenDiv
        | TokenExpo
        | TokenSin
        | TokenCos
        | TokenTan
        | TokenOpenBracket
        | TokenCloseBracket
        deriving (Eq,Show)

lexer = alexScanTokens
}