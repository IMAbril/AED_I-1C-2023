sumatoriaInterna :: Integer -> Integer -> Integer -> Integer 
sumatoriaInterna _ _ 0 = 0
sumatoriaInterna n j k = n^(j+k) + sumatoriaInterna n j (k-1)

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias _ 0 _ = 0 
sumaPotencias q n m = sumatoriaInterna q n m + sumaPotencias q (n-1) m