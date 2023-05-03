--a

menorDivisor :: Integer -> Integer
menorDivisor n = buscarDivisor n 2

buscarDivisor :: Integer -> Integer -> Integer
buscarDivisor n d | d*d > n = n
                  | mod n d == 0 = d
                  | otherwise = buscarDivisor n (d+1)

--b
esPrimo :: Integer -> Bool
esPrimo n | n < 2 = False
          | not(buscarDivisor n 2 == n) = False
          | buscarDivisor n 2 == n = True
--c
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b = mcd a b == 1

mcd :: Integer -> Integer -> Integer
mcd a b | b == 0 = a
        | otherwise = mcd b (mod a b)
{-
Sobre mcd:
La función utiliza la recursión para calcular el MCD de b y el resto de la división de a entre b. El MCD de a y b es igual al MCD de b y el resto de la división de a entre b. La recursión se detiene cuando b es igual a 0, en cuyo caso el MCD es igual a a.
-}  

--d. Devuelve el n-esimo numero primo
nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 2

nEsimoPrimoAux :: Integer -> Integer -> Integer
nEsimoPrimoAux n x
    | esPrimo x && n == 1 = x
    | esPrimo x = nEsimoPrimoAux (n-1) (x+1)
    | otherwise = nEsimoPrimoAux n (x+1)

{-
Sobre nEsimoPrimoAux:
La función nEsimoPrimoAux comprueba si x es primo y, si es así, comprueba si es el enésimo número primo. Si es el enésimo número primo, lo devuelve. Si no es el enésimo número primo, llama a nEsimoPrimoAux recursivamente con n disminuido en 1 y x aumentado en 1. Si x no es primo, simplemente llama a nEsimoPrimoAux con n sin cambios y x aumentado en 1.
-}