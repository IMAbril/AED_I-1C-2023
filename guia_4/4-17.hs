esFibonacci :: Integer -> Bool
esFibonacci n = fibonacci 0 1 n

fibonacci :: Integer -> Integer -> Integer -> Bool
fibonacci a b c | a == c = True
                | a > c = False
                | otherwise = fibonacci b (a+b) c
