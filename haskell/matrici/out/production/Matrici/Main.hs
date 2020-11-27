module Main where

import Lib

type Matrice a = [[a]]

main :: IO ()

-- Es.1
checkRows :: (Eq a, Num a) => Matrice a -> a -> a
checkRows [] r = r
checkRows (x:xs) r = checkRows xs (r+1)

countCols :: (Eq a, Num a) => [a] -> a
countCols [] = 0
countCols (x:xs) = 1 + countCols xs

matrixSupp :: (Eq a, Num a) => Matrice a -> a -> a -> (a, a)
matrixSupp [] r c = (r, c)
matrixSupp (x:xs) r c = if c == (-1)
                        then
                          matrixSupp xs r (countCols x)
                        else
                          if (countCols x) == c
                          then
                            matrixSupp xs r c
                          else
                            ((-1), (-1))

matrixDim :: (Eq a, Num a) => Matrice a -> (a, a)
matrixDim xs = matrixSupp xs (checkRows xs 0) (-1)

-- Es.2
sumCols :: Num a => [a] -> [a] -> [a]
sumCols xs [] = xs
sumCols [] ys = ys
sumCols (x:xs) (y:ys) = (x+y) : sumCols xs ys

colsums :: Num a => Matrice a -> [a]
colsums (x:xs) = foldl sumCols x xs

-- Es.3

sums [] _ _ = []
sums _ [] _ = []
sums (x:xs) (y:ys) neg =
  if neg
    then (x + (y * (-1))) : sums xs ys neg
    else (x + y) : sums xs ys neg    

--colaltsums :: Num a => Matrice a 
colaltsums [] = []
colaltsums (x:xs) = colaltsumsSupp xs x True where
                      colaltsumsSupp [] y _ = y
                      colaltsumsSupp (x:xs) y True  = colaltsumsSupp xs (sums y x True) False
                      colaltsumsSupp (x:xs) y False = colaltsumsSupp xs (sums y x False) True

-- Es.4
findMin :: (Num a, Ord a) => [a] -> a
findMin (x:[]) = x
findMin (x:xs) = min x (findMin xs)

findMax :: (Num a, Ord a) => [a] -> a
findMax (x:[]) = x
findMax (x:xs) = max x (findMax xs)

colMinMaxSupp :: (Num a, Ord a) => Matrice a -> [(a,a)]
colMinMaxSupp ([x]) = [(findMin x, findMax x)]
colMinMaxSupp (x:xs) = (findMin x, findMax x) : colMinMaxSupp xs
   
colMinMax :: (Num a, Ord a) => Matrice a -> [(a,a)]
colMinMax [] = []               
colMinMax xs = colMinMaxSupp (trasposta xs) 
    
--colMinMaxSup [] [] = []
--colMinMaxSup (x:xs) ((v:t:y):ys) = [(min x v), (max x t)]:(colMinMaxSup xs ys)

--colMinMax2 (x:[]) = map (\x -> [x,x]) x
--colMinMax2 (x:xs) = colMinMaxSup x (colMinMax2 xs)

-- Es.5
checkRowZero :: (Num a, Ord a) => [a] -> a -> a -> a -> Bool
checkRowZero [] k i n = True
checkRowZero (x:xs) k col n =
                            if k < col
                            then
                              checkRowZero xs (k+1) col n
                            else
                              if x == 0
                              then
                                checkRowZero xs (k+1) col n
                              else
                                False

lowertriangularSupp :: (Num a, Ord a) => Matrice a -> a -> a -> a -> Bool
lowertriangularSupp (x:xs) n row col = if row < (n-1)
                                       then
                                          if checkRowZero x 0 col n
                                          then
                                            lowertriangularSupp xs n (row+1) (col+1)
                                          else
                                            False
                                       else
                                          True

getMatrixDim :: Num a => Matrice a -> a -> a
getMatrixDim [] i = i
getMatrixDim (x:xs) i = getMatrixDim xs (i+1)

lowertriangular :: (Num a, Ord a) => Matrice a -> Bool
lowertriangular a = lowertriangularSupp a (getMatrixDim a 0) 0 1

-- Es.9
trasposta :: (Eq a, Num a) => Matrice a -> Matrice a
trasposta = foldr traspose []

traspose :: (Eq a, Num a) => [a] -> Matrice a -> Matrice a
traspose []     mxs      = mxs                                 
traspose xs     []       = map (:[]) xs
traspose (x:xs) (mx:mxs) = (x:mx) : (traspose xs mxs)

-- Es.10
isSymmetric :: (Eq a, Num a) => Matrice a -> Bool
isSymmetric xs = xs == (traspose [] xs)

--main = print $ matrixDim [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ colsums [[1,2,3], [4,5,6], [7,8,9]]
main = print $ colaltsums [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ colMinMax [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ trasposta [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ isSymmetric [[1,2,3], [4,5,6], [7,8,9]]
--main = print $ colMinMax [[1,2,3], [0,5,6], [7,20,9]]
--main = print $ lowertriangular [[1,0,0,0,0],[1,2,0,0,0],[1,2,3,0,0],[1,2,3,4,0],[1,2,3,4,5]]
