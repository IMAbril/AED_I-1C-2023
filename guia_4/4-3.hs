--Dados dos numeros naturales determinar si el primero es divisible por el segundo--

--Si n1 es divisible por n2, entonces puede escribirse como una suma reiterada de n2. Ej 8 = 2+2+2+2 
esDivisible :: Integer -> Integer -> Bool
esDivisible n1 n2 | n1 == n2 = True
                  | n2 == 1 = True
                  | n1 < n2 = False
                  | (n1 > n2) = esDivisible (n1-n2) n2
