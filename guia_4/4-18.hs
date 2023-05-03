mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n | ultimo == resto && not (esPar n) = (-1)
                 | ultimo == resto && (esPar n) = ultimo
                 | esPar ultimo = elMayor ultimo (mayorDigitoPar resto)
                 | otherwise = mayorDigitoPar resto
    where 
        ultimo = mod n 10
        resto = div n 10

esPar :: Integer -> Bool
esPar x = mod x 2 == 0

elMayor :: Integer -> Integer -> Integer
elMayor a b | a > b = a
            | otherwise = b