-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(combinacionesMenoresOiguales(x ::(Integer)))
  }

combinacionesMenoresOiguales :: Integer -> Integer
-- Completar la definición de la función
combinacionesMenoresOiguales n = sumaExterna n n

sumaInterna :: Integer -> Integer -> Integer -> Integer
sumaInterna n i 1 = 1
sumaInterna n i j = (if j*i <=n then 1 else 0) + sumaInterna n i (j-1)

sumaExterna :: Integer -> Integer -> Integer
sumaExterna n 0 = 0
sumaExterna n i = sumaInterna n i n + sumaExterna n (i-1)

-- Pueden agregan las funciones que consideren necesarias


