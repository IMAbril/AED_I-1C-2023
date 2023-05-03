esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | otherwise = if (div n pot == mod n 10) then esCapicua (eliminarExtremos n) else False
            where pot = 10^(cantDigitos n - 1)

eliminarExtremos :: Integer -> Integer
eliminarExtremos n | n < 10 = 0
                   | otherwise = div (n - (mod n 10) - (div n pot)*pot) 10
                    where pot = 10^(cantDigitos n - 1)

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos (div n 10)

