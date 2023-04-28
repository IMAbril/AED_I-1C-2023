-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(prod(x ::(Integer)))
  }

prod :: Integer -> Integer
-- Completar la definición de la función
prod b | b == 1 = 24
       | otherwise = prodHasta (2*b)
       
prodHasta :: Integer -> Integer
prodHasta b |b == 1 = 3 
            |otherwise = (b^2 + 2*b)* (prodHasta (b-1))
-- Pueden agregan las funciones que consideren necesarias