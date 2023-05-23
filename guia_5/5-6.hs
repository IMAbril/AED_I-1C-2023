--Considero una abstracción del tipo [[Int]] al redefinirlo como conjunto
--1

type Set a = [a]

agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer) 
agregarATodos n [c] = [n:c]
agregarATodos n (c:cls) = (n:c) : agregarATodos n cls 

--2
partes :: Integer -> Set (Set Integer)
partes 0 = [[]]
partes x = agregarATodos x partesMasChico ++ partesMasChico
    where 
        partesMasChico = partes (x-1)

--3
productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano [] cto2 = []
productoCartesiano (e:cto1) cto2 = paresOrdenados e cto2 ++ productoCartesiano cto1 cto2

paresOrdenados :: Integer -> Set Integer -> [(Integer,Integer)]
paresOrdenados z [] = []
paresOrdenados z (e:cto) = (z,e) : paresOrdenados z cto 