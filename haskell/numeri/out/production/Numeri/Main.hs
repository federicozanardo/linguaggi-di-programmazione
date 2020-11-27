-- Numeri

main :: IO ()

-- Es.1
--fact :: Int -> Int
fact 0 = 1
fact n =
    n * fact (n-1)

-- Es.2
--binomiale :: Int -> Int -> Int
binomiale n k =
  if k > n
    then -1
    else fact n / (fact (n - k) * fact k)

-- Es.3
--combinazioni :: Int -> [Int]
combinazioni n =
  map (\k -> binomiale n k) [0..n]

--main = print $ fact 10000
main = print $ binomiale 4 2
--main = print $ combinazioni 5