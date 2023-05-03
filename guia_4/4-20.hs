sumaDivisores :: Int -> Int -> Int
sumaDivisores n i | i == 1 = 1
                  | mod n i == 0 = i + sumaDivisores n (i-1)
                  | otherwise = sumaDivisores n (i-1)

tomaSumaMax :: Int -> Int -> Int
tomaSumaMax a b | a == b = max (sumaDivisores a a) (sumaDivisores b b)
                | b > a = max (max (sumaDivisores a a) (sumaDivisores b b)) (tomaSumaMax a (b-1) )

tomaValorMax :: Int -> Int -> Int
tomaValorMax a b | a == b = a
                 | tomaSumaMax a b == sumaDivisores b b = b
                 | tomaSumaMax a b == sumaDivisores a a = a
                 | otherwise = tomaValorMax a (b-1)