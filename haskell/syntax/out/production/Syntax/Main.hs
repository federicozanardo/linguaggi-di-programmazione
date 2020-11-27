module Main where

import Lib

main :: IO ()

checkP :: [Int] -> [Int] -> Bool
checkP [] [] = True
checkP xs [] = False
checkP [] ys = False
checkP (x:xs) ys = if (myCompare x ys) == True
                   then checkP xs (removeFromList x ys)
                   else False

myCompare :: Int -> [Int] -> Bool
myCompare _ [] = False
myCompare x (y:ys) = if x == y then True else myCompare x ys

removeFromList :: Int -> [Int] -> [Int]
removeFromList _ [] = []
removeFromList x (y:ys) = if x == y
                          then removeFromList x ys
                          else y:(removeFromList x ys)
                      
data Tree a = Leaf a | Branch (Tree a) (Tree a)
  deriving(Eq, Ord, Show)
--tree = Branch (Leaf 1) (Branch (Leaf 2) (Leaf 3)) :: Tree Integer
tree = Branch (Branch (Leaf 4) (Branch (Leaf 5) (Leaf 7))) (Branch (Leaf 2) (Leaf 3)) :: Tree Integer

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

quickSort [] = []
quickSort (x:xs) = quickSort[ y | y <- xs, y < x] ++ (x : quickSort[ y | y <- xs, x <= y])

mergeList xs ys = quickSort (xs++ys)

--listFromMatrix :: [[Int]] -> [Int]
listFromMatrixSupp [] = []
listFromMatrixSupp (x:xs) = x : listFromMatrixSupp xs
listFromMatrix xs = listFromMatrixSupp xs

--main = print $ checkP [] [1,2,3,4]
--main = print $ countInTree tree
--main = print $ removeRowColumn [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ chessboard 5
--main = print $ mergeList [1,2] [2,3,4]
main = print $ listFromMatrix [[1,2,3], [4,5,6], [7,8,9]]