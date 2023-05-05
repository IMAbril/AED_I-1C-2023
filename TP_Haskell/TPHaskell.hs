--TP_haskell




--Predicados Auxiliares
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs 

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] l2 = False
mismosElementos l1 l2 = (pertenece (head l1) l2) && (mismosElementos (tail l1) (tail l2) )

empiezaCon :: (Eq t) => t -> [t] -> Bool
empiezaCon e [] = False
empiezaCon e l = head l == e

terminaCon :: (Eq t) => t -> [t] -> Bool
terminaCon e [] = False
terminaCon e [x] = e == x
terminaCon e (x:xs) = terminaCon e xs

sinRepetidos :: (Eq t) => [t] -> Bool
sinRepetidos [] = True
sinRepetidos (x:xs) = not(pertenece x xs) && sinRepetidos xs
