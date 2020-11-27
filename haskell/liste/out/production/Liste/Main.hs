module Main where

import Lib

main :: IO ()

-- Liste

-- Es.1
removePairsSupp [] k = []
removePairsSupp (x:xs) k =
                    if k `mod` 2 == 0
                    then
                      removePairsSupp xs (k+1)
                    else
                      [x] ++ removePairsSupp xs (k+1)

removePairs xs = removePairsSupp xs 1

-- Es.2
sumOddsSupp [] k = 0
sumOddsSupp (x:xs) k =
                  if k `mod` 2 == 0
                  then
                    sumOddsSupp xs (k+1)
                  else
                    x + sumOddsSupp xs (k+1)
sumOdds xs = sumOddsSupp xs 1

-- Es.3
quickSort [] = []
quickSort (x:xs) = quickSort[ y | y <- xs, y < x] ++ (x : quickSort[ y | y <- xs, x <= y])

-- Es.4
--minOddsSupp [] min1 min2 = [min1, min2]
--minOddsSupp (x:xs) min1 min2 =
--                            if x `mod` 2 /= 0
--                            then
--                              if min1 == 0
--                              then
--                                minOddsSupp xs x min2
--                              else
--                                if min2 == 0
--                                then
--                                  minOddsSupp xs min1 x
--                                else
--                                  if x < min1
--                                  then
--                                    minOddsSupp xs x min2
--                                  else
--                                    if x < min2
--                                    then
--                                      minOddsSupp xs min1 x
--                                    else
--                                      minOddsSupp xs min1 min2
--                            else
--                              minOddsSupp xs min1 min2

--minOdd xs = minOddsSupp xs 0 0

minOdd xs = take 2 (quickSort (filter (\a -> (mod a 2) /= 0) xs))

-- Es.5
fun5Supp [] n = []
fun5Supp xs n = [[n, sum xs]] ++ fun5Supp (tail xs) (n+1)
fun5 xs = fun5Supp xs 0

-- Es.6
mySum (y:ys) n i = if i < n then y + mySum ys n (i+1) else y

fun6Supp [] _ n = []
fun6Supp xs ys n = [[n, mySum ys n 1]] ++ fun6Supp (tail xs) ys (n+1)
fun6 xs = fun6Supp xs xs 1

--main = print $ removePairs [0..5]
--main = print $ sumOdds [0..5]
--main = print $ quickSort [2,3,4,6,8,7,5]
main = print $ minOdd [2,3,4,6,8,7,5]
--main = print $ fun5 [2,3,4,6,8,7,5]
--main = print $ fun6 [2,3,4,6,8,7,5]