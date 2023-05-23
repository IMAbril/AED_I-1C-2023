--1
nat2bin :: Integer -> [Integer]
nat2bin 0 = [0]
nat2bin 1 = [1]
nat2bin x = nat2bin (div x 2) ++ (mod x 2)   

--2
bin2nat :: [Integer] -> Integer
bin2nat [] = 0
bin2nat (x:xs) = x * 2^(length xs) + bin2nat xs

--3
nat2hex :: Integer -> [Char]
nat2hex n = invertirLista (nat2hexAux n)
   where 
    nat2hexAux 0 = []
    nat2hexAux n 
       | mod n 16 < 10 = toEnum (fromIntegral (mod n 16) + 48) : nat2hex (div n 16)
       | mod n 16 == 10 = 'A' : nat2hex (div n 16)
       | mod n 16 == 11 = 'B' : nat2hex (div n 16)
       | mod n 16 == 12 = 'C' : nat2hex (div n 16)
       | mod n 16 == 13 = 'D' : nat2hex (div n 16)
       | mod n 16 == 14 = 'E' : nat2hex (div n 16)
       | mod n 16 == 15 = 'F' : nat2hex (div n 16)

invertirLista :: (Eq t) => [t] -> [t]
invertirLista [] = []
invertirLista (x:xs) = invertirLista xs ++ [x]

--4
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x] 
sumaAcumulada (x:y:s) = x : sumaAcumulada ((x+y):s) 

--5
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (n:ns) = (descomponerNumero n) : descomponerEnPrimos ns 

descomponerNumero :: Integer -> [Integer]
descomponerNumero n = descomponer n 2
    where 
        descomponer 1 _ = []
        descomponer n divisor 
            | mod n divisor == 0 = divisor : descomponer (div n divisor) divisor
            | otherwise = descomponer n (divisor + 1)