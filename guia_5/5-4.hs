--1
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos "" = ""
sacarBlancosRepetidos tx | (tx == "  ") || (tx == " ") = ""
                         | (head tx == ' ') && (head (tail tx) == ' ') = sacarBlancosRepetidos (tail tx) 
                         | otherwise = head tx : sacarBlancosRepetidos (tail tx)

--2
contarPalabras :: [Char] -> Integer
contarPalabras [a] = 1
contarPalabras tx | (head txCorregido /= ' ')  && (head (tail txCorregido) == ' ') = 1 + contarPalabras (tail txCorregido)
                  | otherwise = 0 + contarPalabras (tail txCorregido)
                where txCorregido = sacarBlancosRepetidos tx

--3
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga texto = buscarPalabraMasLarga (palabras texto) ""

buscarPalabraMasLarga :: [[Char]] -> [Char] -> [Char]
buscarPalabraMasLarga [] palabraMasLarga = palabraMasLarga
buscarPalabraMasLarga (palabra:palabrasRestantes) palabraMasLarga
  | longitud palabra > longitud palabraMasLarga = buscarPalabraMasLarga palabrasRestantes palabra
  | otherwise = buscarPalabraMasLarga palabrasRestantes palabraMasLarga

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--4
palabras :: [Char]-> [[Char]]
palabras [] = []
palabras texto
   | (head tx) == ' ' = formarPalabra (tail tx) : palabras txSinPalabra
   | otherwise = formarPalabra tx : palabras txSinPalabra         
   where 
     txSinPalabra = quitarPalabra (formarPalabra tx) tx
     tx = sacarBlancosRepetidos (corregir texto)
     corregir (t:text) | t == ' ' = text
                       | otherwise = t:text

formarPalabra :: [Char] -> [Char]
formarPalabra [] = []
formarPalabra (letra:texto) 
    | letra /= ' ' = letra : formarPalabra texto
    | otherwise = []

quitarPalabra :: [Char] -> [Char] -> [Char]
quitarPalabra palabra [] = []
quitarPalabra [] texto =  (tail texto)
quitarPalabra (pl:palabra) (tl:texto)
    | pl == tl = quitarPalabra palabra texto
    | otherwise = tl:texto 
 
--5
aplanar :: [[Char]] -> [Char]
aplanar []= []
aplanar (p:ps) = p ++ aplanar ps

--6 
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [p]= p
aplanarConBlancos (p:ps) = p ++ " " ++ aplanarConBlancos ps

--7
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [p] n = p
aplanarConNBlancos (p:ps) n = p ++ blancos n ++ aplanarConNBlancos ps n
 where 
    blancos 1 = " "
    blancos n = " " ++ blancos (n-1)