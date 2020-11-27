-- Es.4
--colMinMaxSup [] [] = []
--colMinMaxSup (x:xs) ((v:t:y):ys) = [(min x v), (max x t)]:(colMinMaxSup xs ys)

--colMinMax2 (x:[]) = map (\x -> [x,x]) x
--colMinMax2 (x:xs) = colMinMaxSup x (colMinMax2 xs)