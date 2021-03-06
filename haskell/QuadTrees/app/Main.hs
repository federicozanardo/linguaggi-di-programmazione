module Main where

import Lib

main :: IO ()

data QT a = C a | Q (QT a) (QT a) (QT a) (QT a) deriving (Eq,Show)

quadTree1 = Q (C 2) (C 2) (C 2) (C 2)
quadTree2 = Q (C 2) (C 8) (C 6) (C 4)

quadTree3 = Q (C 2) (C 1) (C 4) (C 2)
quadTree4 = Q (C 2) (C 1) (C 4) (Q (C 2) (C 2) (C 2) (C 2))
quadTree5 = Q (C 2) (Q (C 1) (C 1) (C 1) (Q (C 1) (C 1) (C 1) (C 1))) (C 4) (C 2)
quadTree6 = Q (C 2) (C 1) (C 4) (C 2)
quadTree7 = Q quadTree3 quadTree4 quadTree5 quadTree6

-- Es.1
buildNSimplify :: Eq a => QT a -> QT a -> QT a -> QT a -> QT a
buildNSimplify q1 q2 q3 q4 =  if q1 == q2 && q1 == q3 && q1 == q4 
                              then q1 
                              else Q q1 q2 q3 q4

-- Es.2
simplify :: Eq a => QT a -> QT a 
simplify qt = case qt of
                    C _           -> qt
                    Q q1 q2 q3 q4 -> buildNSimplify (simplify q1) (simplify q2) (simplify q3) (simplify q4)

--main = print $ buildNSimplify quad1 quad1 quad1 quad1
main = print $ simplify quadTree7
