-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(sumaPrimerosNImpares(x ::(Integer)))
  }

sumaPrimerosNImpares :: Integer -> Integer
-- Completar la definición de la función
sumaPrimerosNImpares n | n == 1 = (2*n+2)
                       | otherwise = esImpar((2*n)-1)
esImpar n | n < 1 = 0
          | mod n 2 == 0 = esImpar (n-1)
          | otherwise = (2*n+2) + esImpar (n-1)

-- Pueden agregan las funciones que consideren necesarias


