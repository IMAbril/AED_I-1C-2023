--5

{-
Implementar la funcion todosMenores :: (Integer, Integer, Integer) -> Bool
problema todosMenores ((n1,n2,n3) : Z×Z×Z) : Bool {
    requiere: {T rue}
    asegura: {(res = true) ↔((f (n1) > g(n1)) ∧(f (n2) > g(n2)) ∧(f (n3) > g(n3))))}
}
problema f (n: Z) : Z{
    requiere: {T rue}
    asegura: {(n ≤7 →res = n2) ∧(n > 7 →res = 2n −1)}
}
problema g (n: Z) : Z{
    requiere: {T rue}
    asegura: {res = if esP ar(n) then n/2 else 3n + 1 fi}
}
pred esP ar(n : Z){ (n mod 2) = 0 }

-}

