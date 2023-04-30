--determina si todos los dıgitos de un numero natural son iguales. 
-- Comparo el último digito de n con el último digito de el cociente entero entre n y 10. Luego uso el paso recursivo.
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | otherwise = (mod n 10 == mod (div n 10) 10) && (todosDigitosIguales (div n 10))
