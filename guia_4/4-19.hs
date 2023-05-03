esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos s = esSumaDeMPrimos (fromIntegral s) 1
--s es igual a la suma de los m primeros numeros primos, para algun m
esSumaDeMPrimos :: Integer -> Integer -> Bool
esSumaDeMPrimos s m | s == sumaPrimerosPrimos m = True
                    | s < sumaPrimerosPrimos m = False
                    | otherwise = esSumaDeMPrimos s (m+1)

sumaPrimerosPrimos :: Integer -> Integer
sumaPrimerosPrimos n | n == 1 = 2
                     | otherwise = nEsimoPrimo n + sumaPrimerosPrimos (n-1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2

nEsimoPrimoAux :: Integer -> Integer -> Integer
nEsimoPrimoAux n x
    | esPrimo x && n == 1 = x
    | esPrimo x = nEsimoPrimoAux (n-1) (x+1)
    | otherwise = nEsimoPrimoAux n (x+1)

esPrimo :: Integer -> Bool
esPrimo n | n < 2 = False
          | not(buscarDivisor n 2 == n) = False
          | buscarDivisor n 2 == n = True

buscarDivisor :: Integer -> Integer -> Integer
buscarDivisor n d | d*d > n = n
                  | mod n d == 0 = d
                  | otherwise = buscarDivisor n (d+1)