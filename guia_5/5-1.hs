--1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--2
ultimo :: [t] -> t
ultimo l | longitud l == 1 = head l
         | otherwise = ultimo (tail l)  

--3
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

--4
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]
