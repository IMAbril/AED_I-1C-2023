--a
f1 :: Integer -> Integer 
f1 n | n == 0 = 1
     | otherwise = (2^n) + f1 (n-1)

--b
f2 :: Integer -> Float -> Float
f2 n q | q == 0 = 0
       | q == 1 = fromInteger n
       | otherwise = ((q^(n+1)-1)/(q-1))-1
--c
f3 :: Integer -> Float -> Float
f3 n q = f2 (2*n) q

--d
f4 :: Integer -> Float -> Float
f4 n q = (f3 n q)-(f2 n q)
