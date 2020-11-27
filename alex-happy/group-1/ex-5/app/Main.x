{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9
$octalDigits = 0-7
$alpha = [a-fA-F]
@hex = 0x($digit*$alpha*)* | ($digit*$alpha*)*H
@octal = 0o($octalDigits)* | ($octalDigits)*O

tokens :-
    $white+     ;
    "--".*      ;
    $digit+     { \s -> TokenInt s (length s)}
    @hex        { \s -> TokenHex s (length s)}
    @octal      { \s -> TokenOctal s (length s)}

{
data Token
        = TokenInt String Int
        | TokenHex String Int
        | TokenOctal String Int
        deriving (Eq,Show)

main =  do
       s <- getContents
       print (alexScanTokens s)
}