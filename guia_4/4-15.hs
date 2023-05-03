sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 m = sumatoriaInterna 1 m
sumaRacionales n m = sumatoriaInterna n m + sumaRacionales (n-1) m

sumatoriaInterna :: Integer -> Integer -> Float
sumatoriaInterna p 1 = fromIntegral p
sumatoriaInterna p q = ((fromIntegral p)/(fromIntegral q)) + sumatoriaInterna p (q-1)