{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    $white+     ;
    "--".*      ;
    if          { \s -> TokenIf}
    then        { \s -> TokenThen}
    else        { \s -> TokenElse}
    'else if'   { \s -> TokenElseIf}
    while       { \s -> TokenWhile}
    \=          { \s -> TokenEq}
    \+\=        { \s -> TokenEqInc}
    \+          { \s -> TokenPlus}
    \-          { \s -> TokenMinus}
    \*          { \s -> TokenTimes}
    \/          { \s -> TokenDiv}
    $digit+     { \s -> TokenInt (read s)}
    $alpha+     { \s -> TokenId s}

{
data Token
        = TokenIf
        | TokenThen
        | TokenElse
        | TokenElseIf
        | TokenWhile
        | TokenEq
        | TokenEqInc
        | TokenPlus
        | TokenMinus
        | TokenTimes
        | TokenDiv
        | TokenInt Int
        | TokenId String
        deriving (Eq,Show)


main =  do
       s <- getContents
       print (alexScanTokens s)
}