module Main where

import Lib

main :: IO ()

myCompare :: Eq a => [a] -> [a] -> Bool
myCompare _ [] = False
myCompare x (y:ys) = if x == y then True else myCompare x ys

removeFromList :: Eq a => [a] -> [a] -> [Int]
removeFromList _ [] = []
removeFromList x (y:ys) = if x == y
                          then removeFromList x ys
                          else y:(removeFromList x ys)

checkP :: Eq a => [a] -> [a] -> Bool
checkP [] [] = True
checkP xs [] = False
checkP [] ys = False
checkP (x:xs) ys = if (myCompare x ys) == True
                   then checkP xs (removeFromList x ys)
                   else False

-- Versione del prof
-- checkP :: Eq (t) => [t] -> [t] -> Bool
--checkP (x:xs) ys =  case (remove x ys) of
                    --Nothing -> False
                    --Just yss -> checkP xs yss

-- remove :: Eq (t) => t -> [t] -> Maybe [t]
--remove x [] = Nothing
--remove x (y:ys) | x == y = Just ys
--                | True = concMaybe y (remove x ys)

-- concMaybe :: t -> Maybe [t] -> Maybe [t]
--concMaybe y Nothing = Nothing
--concMaybe y Just ys = Just (y:ys)
                      
data Tree a = Leaf a | Branch (Tree a) (Tree a)
  deriving(Eq, Ord, Show)
--tree = Branch (Leaf 1) (Branch (Leaf 2) (Leaf 3)) :: Tree Integer
tree = Branch (Branch (Leaf 4) (Branch (Leaf 5) (Leaf 7))) (Branch (Leaf 2) (Leaf 3)) :: Tree Integer

-- Versione del prof

data BTree a = Null | BTBranch a (BTree a) (BTree a)

occorrenze x Null = 0
occorrenze x (BTBranch y bt1 bt2) = (if x == y then 1 else 0) + occorrenze x bt1 + occorrenze x bt2

countInTree :: Tree t -> Int
countInTree (Leaf a) = 1
countInTree (Branch left right) = (countInTree left) + (countInTree right)

removeRow :: [[Int]] -> [[Int]]
removeRow (x:xs) = xs

removeCol :: [Int] -> [Int]
removeCol (x:xs) = xs

removeColumn :: [[Int]] -> [[Int]]
removeColumn [] = []
removeColumn (x:xs) = removeCol x:removeColumn xs
removeRowColumn xs = removeColumn (removeRow xs)

-- 1 2 3
-- 4 5 6
-- 7 8 9

printChess :: Int -> Bool -> [Int]
printChess 0 _ = []
printChess n isPair =
  if isPair
    then 0 : printChess (n - 1) False
    else 1 : printChess (n - 1) True

chessboardSupp :: Int -> Int -> Bool -> [[Int]]
chessboardSupp _ 0 _ = []
chessboardSupp n j isPair = if isPair
                          then
                            printChess n isPair : chessboardSupp n (j - 1) False
                          else
                            printChess n isPair : chessboardSupp n (j - 1) True
                            
chessboard :: Int -> [[Int]]
chessboard n = chessboardSupp n n True

-- Versione del prof

scacchiera n = [[(x + y) mod 2 | y <- [1..n]] | x <- [1..n]]

quickSort [] = []
quickSort (x:xs) = quickSort[ y | y <- xs, y < x] ++ (x : quickSort[ y | y <- xs, x <= y])

mergeList xs ys = quickSort (xs++ys)

--listFromMatrix :: [[Int]] -> [Int]
concatInt x xs = x:xs
listFromMatrixSupp [] _ = []
listFromMatrixSupp (x:xs) list = listFromMatrixSupp xs (concatInt )
listFromMatrix xs = listFromMatrixSupp xs

-- Grafo

-- Versione del prof

appList :: Eq (t) => [(a,b)] -> a -> Maybe b
appList [] x = Nothing
appList ((v,r):fl) x  | v == x = Just r
                      | True = appList fl x

mapListAux fl l = map (appList fl) l

--filter [] = []
--filter (Nothing:xs) = filter xs
--filter (Just x:xs) = x:filter xs

mapList fl xs = filter . (mapListAux fl xs)

-- Versione del prof

controllo [] = True
controllo ((v,r):xs) = if presente v xs then False else controllo xs

presente v [] = False
presente v ((v1,r1):xs) | v == v1 = True
                        | True = presente v xs

-- Versione del prof
tavolaPitagorica :: Num t => t -> [[t]]
tavolaPitagorica n = [[x * y | y <- [1..n]] | x <- [1..n]]

tavolaPitagoricaGeneralizzata :: Num t => t -> [[t]]
tavolaPitagoricaGeneralizzata f l = [[f x y | y <- l] | x <- l]
-- tavolaPitagoricaGeneralizzata (+) [1..3]

-- Alternativa
tavolaM  :: Num t => t -> [[t]]
tavolaM n = map (\x -> map (x*) [1..n]) [1..n]

tavolaMGeneralizzata :: Num t => t -> [[t]]
tavolaMGeneralizzata f l = map (\x -> map f x) l

-- Versione del prof

buildList i 0 = []
buildList i n = buildList i (n-1) ++ [i * n]

buildMatrix 0 n = []
buildMatrix m n = buildMatrix (m-1) n ++ [buildList m n]

-- Versione del prof
mergeList2 :: Ord (t) => [t] -> [t] -> [t]
mergeList2 [] ys = ys
mergeList2 xs [] = xs
mergeList2 (x:xs) (y:ys)  | x < y = x:mergeList2 xs (y:ys)
                          | True = y:mergeList2 (x:xs) ys

merge3List :: Ord (t) => [t] -> [t] -> [t] -> [t]                          
merge3List xs ys zs = mergeList2 xs (mergeList2 ys zs)

--main = print $ checkP [] [1,2,3,4]
--main = print $ countInTree tree
--main = print $ removeRowColumn [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ chessboard 5
--main = print $ mergeList [1,2] [2,3,4]
main = print $ listFromMatrix [[1,2,3], [4,5,6], [7,8,9]]