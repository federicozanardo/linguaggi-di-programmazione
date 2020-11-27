{
module Lexical (Token(..), lexer) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$lowercaseAlpha = [a-z]
$condS = [\<\>]

@identifier = ($lowercaseAlpha)($alpha*$digit*)*

tokens :-
    $white+         ;
    "--".*          ;
    if              { \s -> TokenIf }
    then            { \s -> TokenThen }
    else            { \s -> TokenElse }
    while           { \s -> TokenWhile }
    \=              { \s -> TokenAssign }
    \+\=            { \s -> TokenAssignInc }
    \+              { \s -> TokenPlus }
    \-              { \s -> TokenMinus }
    \*              { \s -> TokenTimes }
    \/              { \s -> TokenDiv }
    \(              { \s -> TokenOpenBracket }
    \)              { \s -> TokenCloseBracket }
    \{              { \s -> TokenOpenBrace }
    \}              { \s -> TokenCloseBrace }
    \;              { \s -> TokenConcat }
    $condS          { \s -> TokenConds s }
    \<\=            { \s -> TokenConds s }
    \>\=            { \s -> TokenConds s }
    \=\=            { \s -> TokenConds s }
    \!\=            { \s -> TokenConds s }
    $digit+         { \s -> TokenInt s }
    @identifier     { \s -> TokenId s }

{
data Token
        = TokenIf
        | TokenThen
        | TokenElse
        | TokenWhile
        | TokenAssign
        | TokenAssignInc
        | TokenPlus
        | TokenMinus
        | TokenTimes
        | TokenDiv
        | TokenOpenBracket
        | TokenCloseBracket
        | TokenOpenBrace
        | TokenCloseBrace
        | TokenConcat
        | TokenConds String
        | TokenInt String
        | TokenId String
        deriving (Eq,Show)

lexer = alexScanTokens
}