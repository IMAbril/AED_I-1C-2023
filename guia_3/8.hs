--8 
{-
Implementar una funcion comparar :: Integer ->Integer ->Integer
problema comparar (a:Z, b:Z) : Z{
requiere: {True}
asegura: {(res = 1 ↔sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
asegura: {(res = −1 ↔sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
asegura: {(res = 0 ↔sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b)))}
}
problema sumaUltimosDosDigitos (x: Z) : Z{
requiere: {True}
asegura: {res = (x mod 10) + (⌊(x/10)⌋ mod 10)}
}
-}

sumaUltimosDosDigitos :: Integer -> Integer 
sumaUltimosDosDigitos x = ((mod x 10 )+ (mod (div x 10) 10))

comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
             | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0