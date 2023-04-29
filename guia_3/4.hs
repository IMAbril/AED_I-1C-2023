--a)prodInt: calcula el producto interno entre dos tuplas R×R.
{-
problema prodInt(a,s: RxR ):R {
    requiere {}
    asegura {res= (a0*s0 + a1*s1) }
}
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float 
prodInt a s = (fst a)*(fst s) + (snd a)*(snd s)

--b)todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.
{-
problema todoMenor(a,s : RxR):Bool {
    requiere {}
    asegura {res= true si y solo si a0 < s0 y a1 < s1}
}
-}
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor a s = if ((fst a < fst s) && (snd a < snd s)) then True else False 

--c)distanciaPuntos: calcula la distancia entre dos puntos de RxR.
{-
problema distanciaPuntos(a,s : RXR):R {
    requiere {}
    asegura {res = |a-s|}
}
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos a s = sqrt ((fst s - fst a)**2 + (snd s - snd a)**2)

--d)sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
{-
problema sumaTerna(a: ZxZxZ):Z {
    requiere {}
    asegura {res = a0 + a1 +a2}
}
-}
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x,y,z) = x + y + z 

--e) sumarSoloMultiplos: dada una terna de numeros enteros y un natural, calcula la suma de los elementos de la terna que son multiplos del numero natural.
{-
problema sumarSoloMultiplos(n:Z, v:ZxZxZ){
    requiere { n>0}
    asegura {si v0, v1 y v2 son multiplos de n res= v0+v1+v2}
    asegura {si v0 y v1 son multiplos de n res= v0+v1}
    asegura {si v0 y v2 son multiplos de n res= v0+v2}
    asegura {si v1 y v2 son multiplos de n res= v1+v2}
    asegura {si v1 y v2 no son multiplos de n y v0 es multiplo de n res= v0}
    asegura {si v0 y v2 no son multiplos de n y v1 es multiplo de n res= v1}
    asegura {si v0 y v1 no son multilos de n y v2 es multiplo de n res= v2}
    asegura {si v0, v1 y v2 no son multiplos de n res= 0}
}
-}

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (v0, v1, v2) n | (mod v0 n == 0) && (mod v1 n == 0) && (mod v2 n == 0) = (v0+v1+v2)
                                  | (mod v0 n == 0) && (mod v1 n == 0) = (v0+v1)
                                  | (mod v0 n == 0) && (mod v2 n == 0) = (v0+v2)
                                  | (mod v2 n == 0) && (mod v1 n == 0) = (v1+v2)
                                  | mod v0 n == 0 = v0
                                  | mod v1 n == 0 = v1
                                  | mod v2 n == 0 = v2
                                  | otherwise = 0
 
--f) posPrimerPar: dada una terna de enteros, devuelve la posicion del primer numero par si es que hay alguno, y devuelve 4 si son todos impares.

{-
problema posPrimerPar(s:ZxZxZ):Z{
    requiere {}
    asegura {si s0 es par res= 0}
    asegura {si s0 es impar y s1 es par res= 1}
    asegura {si s0 y son impar y s2 es par res=2}
    asegura {si s0, s1 y s2 son impares, res= 4}
}
-}

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (s0,s1,s2) | mod s0 2 == 0 = 0
                        | mod s1 2 == 0 = 1
                        | mod s2 2 == 0 = 2
                        | otherwise = 4

--g) crearPar :: a ->b ->(a, b): crea un par a partir de sus dos componentes dadas por separado (debe funcionar para elementos de cualquier tipo).
{-
problema crearPar(a:T1, b:T2):T1xT2{
    requiere {}
    asegura{ res= (a,b)}
}
-}

crearPar :: t1 -> t2 -> (t1, t2)
crearPar a b = (a,b)

--h) invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como par ́ametro (debe funcionar para elementos de cualquier tipo).
{-
problema invertir(a:T1, b:T2):T2xT1 {
    requiere {}
    asegura {res= (b,a)}
}
-}
invertir :: (t1, t2) -> (t2, t1)
invertir (a, b) = (b, a)