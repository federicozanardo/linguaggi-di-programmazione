{
module Main (main) where
import ExpressionToken
}stack exec alex

%wrapper "basic"

$lecter = [I\V\X\L\C\D\M]

tokens :-

    $white+     ;
    [^$lecter]  ;
    $lecter+    {\s -> TokenVar s}

{
data Token = TokenVar String
    deriving (Eq,Show)

main = do
    s <- getContents
    print (alexScanTokens s)
}