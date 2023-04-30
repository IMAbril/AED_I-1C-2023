--calcula la suma de digitos de un numero natural
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos 1 = 1
sumaDigitos n = (mod n 10)+ sumaDigitos(div n 10)