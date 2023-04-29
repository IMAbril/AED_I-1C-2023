{-
problema estanRelacionados (a:Z, b:Z) : Bool {
    requiere: {a ̸= 0 ∧b ̸= 0}
    asegura: {(res = true) ↔(∃k : Z)((k ̸= 0) ∧(a ∗a + a ∗b ∗k = 0))}
}
-}

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b | (mod a b == 0 )= True
                      | otherwise = False

--d)sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x,y,z) = x + y + z 