{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
@integer = [\+\-]?$digit+
@frac = [\+\-]?$digit+\.$digit* | [\+\-]?$digit*\.$digit+

tokens :-
    $white+                                                 ;
    "--".*                                                  ;
    @integer                                                { \s -> TokenInt s (length s)}
    @frac                                                   { \s -> TokenFrac s (length s)}
    [\+\-]?@integer[eE]@integer | [\+\-]?@frac[eE]@integer  { \s -> TokenFloat s (length s)}

{
data Token
        = TokenInt String Int
        | TokenFrac String Int
        | TokenFloat String Int
        deriving (Eq,Show)

main =  do
       s <- getContents
       print (alexScanTokens s)
}