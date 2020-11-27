module Main where

import Lib

main :: IO ()

data QT a = C a | Q (QT a) (QT a) (QT a) (QT a) deriving (Eq,Show)

quadTree = Q (C 2) (C 2) (C 2) (C 2)

data Mat a = Mat {
  nexp :: Int,
  mat :: QT a
} deriving (Eq,Show)

mat1 = Q (Q (C 1 ) (C 1) (C 2) (C 3)) (Q (C 1) (C 2) (C 1) (C 1)) (Q (C 4) (C 5) (C 7) (C 8)) (Q (C 6) (C 1) (C 2) (C 3))
mat2 = Q (C 1) (C 1) (C 2) (C 3)
mat3 = Q (Q (C 1) (C 2) (C 2) (C 4)) (Q (C 1) (C 4) (C 5) (C 6)) (Q (C 7) (C 8) (C 9) (C 10)) (Q (C 20) (C 21) (C 22) (C 23))
mat4 = Q (Q (C 1) (C 0) (C 0) (C 3)) (Q (C 0) (C 0) (C 0) (C 0)) (Q (C 0) (C 0) (C 0) (C 0)) (Q (C 6) (C 0) (C 0) (C 0))
mat5 = Q (Q (C 1) (C 0) (C 0) (C 3)) (C 0) (C 0) (Q (C 6) (C 0) (C 0) (C 10))

-- Es.3
diagMat (C a) = (C 0)
diagMat (Q s t u v) = (Q (diagMat s) t u (diagMat v))

sumMat (C x) = x
sumMat (Q s t u v) = (sumMat s) + (sumMat t) + (sumMat u) + (sumMat v)

diagonal xs = (sumMat (diagMat xs)) == 0

-- Es.4
matSum (C s) (C t) = (C (s + t))
matSum (C a) (Q b c d e) = (Q (matSum (C a) b) (matSum (C a) c) (matSum (C a) d) (matSum (C a) d))
matSum (Q a b c d) (C e) = (Q (matSum a (C e)) (matSum b (C e)) (matSum c (C e)) (matSum d (C e)))
matSum (Q a b c d) (Q s t u v) = (Q (matSum a s) (matSum b t) (matSum c u) (matSum d v))

--main = print $ diagonal fourth
main = print $ matSum mat4 mat5
