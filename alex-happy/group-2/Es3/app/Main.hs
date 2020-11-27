module Main where

import Lib

main :: IO ()

generaCoppia nEsercizi matricola = (primo, secondo) where 
  primo = matricola `mod` nEsercizi + 1
  secondo = (matricola `mod` (nEsercizi - 1) + primo) `mod`  nEsercizi + 1

main = print $ generaCoppia 4 138634
