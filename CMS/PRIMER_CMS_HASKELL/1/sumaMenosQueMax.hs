-- No editar esta parte
main :: IO ()
main = do
  x <- readLn
  print (sumaMenosQueMax (x :: (Int, Int, Int)))

sumaMenosQueMax :: (Int, Int, Int) -> Bool
-- Completar acá la definición de la función
sumaMenosQueMax (x,y,z) | maximo (x,y,z) > ( medio (x,y,z) + minimo (x,y,z) ) = True
                            | otherwise  = False
maximo :: (Int, Int, Int) -> Int
maximo (a,b,c) | (max a b) == (max a c) && (b/=c) = a
               | (max a b) == (max b c) = b
               | (max a c) == (max b c) = c
               | (max a b) < (max a c) = c
               | (max a b) > (max a c) = b
               | otherwise = a

minimo :: (Int, Int, Int)-> Int
minimo (a,b,c) | (min a b) == (min a c) && (b/=c)= a
               | (min a b) == (min b c) = b 
               | (min a c) == (min b c) = c
               | (min a b) < (min a c) = b 
               | (min a b) > (min a c) = c
               | otherwise = a

medio :: (Int, Int, Int) -> Int
medio (a,b,c) | (a < b) && (b < c) = b
              | (b < a) && (a < c) = a
              | (a < c) && (c < b) = c
              | (c < b) && (b < a) = b
              | (b < c) && (c < a) = c
              | a == b = a
              | a == c = a
              | b == c = b

-- Pueden agregan las funciones que consideren necesarias