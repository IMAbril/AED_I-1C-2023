satisfacePitagoras :: Integer -> Integer -> Integer -> Bool
satisfacePitagoras r m n = ((m^2 + n^2) <= r^2)

cuantosParesN :: Integer -> Integer -> Integer -> Integer 
cuantosParesN r m n | (n == 0) && (satisfacePitagoras r m 0) = 1
                    | (n == 0) && not (satisfacePitagoras r m 0) = 0
                    | (satisfacePitagoras r m n) = 1 + cuantosParesN r m (n-1)
                    | otherwise = cuantosParesN r m (n-1) 

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r | m == 0 = cuantosParesN r 0 n
                | otherwise = cuantosParesN r m n + pitagoras (m-1) n r