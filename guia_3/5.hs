--5

{-
Implementar la funcion todosMenores :: (Integer, Integer, Integer) -> Bool
problema todosMenores ((n1,n2,n3) : Z×Z×Z) : Bool {
    requiere: {True}
    asegura: {(res = true) ↔((f (n1) > g(n1)) ∧(f (n2) > g(n2)) ∧(f (n3) > g(n3))))}
}
problema f (n: Z) : Z{
    requiere: {True}
    asegura: {(n ≤7 →res = n2) ∧(n > 7 →res = 2n −1)}
}
problema g (n: Z) : Z{
    requiere: {True}
    asegura: {res = if esPar(n) then n/2 else 3n + 1 fi}
}
pred esPar(n:Z){ (n mod 2) = 0 }
-}

esPar :: Integer -> Bool
esPar n | mod n 2 == 0 = True
        | otherwise = False

g :: Integer -> Integer
g n | esPar n = (div n 2)
    | otherwise = (3*n + 1)

f :: Integer -> Integer
f n | n <= 7 = 2*n
    | n > 7 = (2*n -1)

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (n1, n2, n3) | (f n1 > g n1) && (f n2 > g n2) && (f n3 > g n3) = True
                          | otherwise = False