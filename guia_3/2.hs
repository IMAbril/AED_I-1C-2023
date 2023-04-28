---a) absoluto: calcula el valor absoluto de un numero entero
{- 
problema abs(a:Z):Z {
    requiere {true}
    asegura {res > 0 y res = |a|}
}
 -}

absolut :: Integer -> Integer
absolut a | a >= 0 = a
      | a < 0 = (-a)

---b) maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.
{- 
problema maxabs(a:Z,b:Z):Z{
    requiere {a/=b}
    asegura {res = if abs(a)>abs(b) then a else b fi}
}
-}
maxabs :: Integer -> Integer -> Integer
maxabs a b | (absolut a < absolut b) = absolut b 
           | otherwise = absolut a