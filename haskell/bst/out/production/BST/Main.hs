module Main where

import Lib

main :: IO ()

tree = Node {val=8, left=Node {val=2, left=Void, right=Node {val=5, left=Void, right=Void}}, right=Node {val=10, left=Void, right=Void}}

data BST a = Void | Node {val :: a, left :: BST a , right :: BST a}
  deriving (Eq, Ord, Read, Show)

-- Es.1
sumTree :: Num p => BST p -> p
sumTree Void = 0
sumTree (Node val left right) = val + sumTree left + sumTree right

-- Es.5
insertInTree :: Ord a => BST a -> a -> BST a
insertInTree Void x = Node x Void Void
insertInTree (Node val left right) x =
  if x < val
    then Node val (insertInTree left x) right
    else Node val left (insertInTree right x)

-- Es.6
bst2List Void = []
bst2List (Node val left right) = bst2List left ++ [val] ++ bst2List right

--main = print $ sumTree tree
--main = print $ bst2List tree
main = print $ insertInTree tree 6