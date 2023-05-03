sumatoriaInterna :: Integer -> Integer -> Integer
sumatoriaInterna n 1 = n
sumatoriaInterna n j = (n^j) + sumatoriaInterna n (j-1)

sumatoriaDoble :: Integer -> Integer -> Integer 
sumatoriaDoble 1 m = sumatoriaInterna 1 m
sumatoriaDoble n m = sumatoriaInterna n m + sumatoriaDoble (n-1) m