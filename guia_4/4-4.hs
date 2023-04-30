--Dado n ∈ N suma los primeros n numeros impares.
{-
Caso base, n=1 . p(1)=1
Veo el patrón que se repite entre los primero 4 impares.
1 = 1
3 = 2*2-1 
5 = 3*2-1
7 = 4*2-1
-}
sumaImpares :: Integer -> Integer
sumaImpares n | n == 1 = 1
              | otherwise = (2*n-1) + sumaImpares(n-1)

