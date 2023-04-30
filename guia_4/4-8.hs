iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | cantDigitos n == i = (mod n 10)
                 | otherwise = iesimoDigito (sacarUltimo n) i
                 where sacarUltimo n = div n 10

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos (div n 10)
