--1

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (el:s) | e == el = True
                   | otherwise = pertenece e s  

--2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [e] = True
todosIguales (e:l) | e == (head l) = True && todosIguales l
                   | otherwise = False

--3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (e:s) | pertenece e s = False
                     | otherwise = todosDistintos s

--4 (misma especificacion que el 3)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos s = todosDistintos s

--5
quitar :: (Eq t) => t -> [t] -> [t]
quitar x [] = []
quitar x (e:xs) | x == e = xs
                | otherwise = e : quitar x xs   

--6
quitarTodos ::(Eq t) => t -> [t] -> [t]
quitarTodos x [] = []
quitarTodos x xs | pertenece x xs = quitarTodos x (quitar x xs)
                 | otherwise = xs 

--7
eliminarRepetidos :: (Eq t) => [t] -> [t] 
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = eliminarRepetidos xs
                         | otherwise = x:eliminarRepetidos xs

--8 
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos l [] = False
mismosElementos [] l = False
mismosElementos (x:xs) l | pertenece x l = True && mismosElementos (quitarTodos x xs) (quitarTodos x l)
                         | otherwise = False

--9 
capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == listaInvertida xs []
 where 
    listaInvertida [] invertida = invertida  --Invertida es [] en un inicio. Caso base.
    listaInvertida (y:ys) invertida = listaInvertida ys (y:invertida) -- crea una lista invertida de xs. Usa recursión.

