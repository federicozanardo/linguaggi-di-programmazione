module Main where

import Lib

main :: IO ()

data Tree a = Void | Node a [Tree a] deriving (Eq,Show)

tree = Node 2 [(Node 4 [(Node 1 [Void]), (Node 2 [Void]), (Node 3 [Void])]), (Node 5 [Void])]

-- Es.7
countSons Void = 0
countSons (Node a []) = 0
countSons (Node a (x:xs)) = 1 + countSons (Node a xs)

degree (Node a xs) = degreeSupp (Node a xs) where 
                degreeSupp Void = 0
                degreeSupp (Node a []) = 0 
                degreeSupp (Node a (x:xs)) = max (max (countSons x) (degreeSupp x)) (countSons (Node a xs))

-- Es.15

preorder2 [] = []
preorder2 (x:xs) = preorder x

preorder Void = []
preorder (Node a []) = []
preorder (Node a xs) = a : preorder2 xs

--main = print $ degree tree
main = print $ preorder tree
