--6

{-
Programar una funcion bisiesto :: Integer -> Bool
pred EsMultiplo(x : Z, y : Z){x mod y = 0}
problema bisiesto (año: Z) : Bool {
requiere: {True}
asegura: {res = false ↔(¬EsMultiplo(año, 4) ∨ ( EsMultiplo(año, 100) ∧ ¬EsMultiplo(año, 400)) )}
}
-}

esMultiplo :: Integer -> Integer -> Bool 
esMultiplo x y | mod x y == 0 = True
               | otherwise = False

bisiesto :: Integer -> Bool
bisiesto a | (not (esMultiplo a 4)) || ( (esMultiplo a 100) && (not (esMultiplo a 400)) ) = False
           | otherwise = True