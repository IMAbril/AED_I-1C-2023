--1
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (z:zs) = z + sumatoria zs 

--2
productoria :: [Integer] -> Integer
productoria [n] = n
productoria (z:zs) = z * productoria zs

--3
maximo :: [Integer]-> Integer
maximo [z] = z 
maximo (z:zs) | z >= head zs = maximo (z: tail zs) 
              | otherwise = maximo zs

--4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = []
sumarN n (z:zs) = (z+n) : (sumarN n zs)

--5 
sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero (x:s) = (x+x):(sumarN x s)

--6 
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo s = sumarN (ultimo s) s 
 where 
    ultimo [e] = e
    ultimo (e:es) = ultimo es  

--7 
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

--8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x: multiplosDeN n xs
                      | otherwise = multiplosDeN n xs 

--9
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar l = minimo l : ordenar (quitar (minimo l) l)
 where 
    minimo [n] = n
    minimo (x:xs) | x <= head xs = minimo (x:tail xs) 
                  | otherwise = minimo xs

--Funcion auxiliar del ejercicio 2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (e:xs) | x == e = xs
                | otherwise = e : quitar x xs   


