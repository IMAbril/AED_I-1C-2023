--9 A partir de las siguientes implementaciones en Haskell, describir en lenguaje natural qu ́e hacen y especificarlas semiformalmente

--a. Dado un real, si es igual a 0 devuelve 1 sino devuelve 0.

f1 :: Float -> Float
f1 n | n == 0 = 1
     | otherwise = 0

{-
problema f1(n:R):R {
    requiere {}
    asegura {res = 1 si y solo si n = 0}
    asegura {res = 0 si y solo si n/= 0}
}
-}

--b. Dado un numero real n, si n= 1 entonces devuelve 15. Si n= -1 entonces devuelve -15.
f2 :: Float-> Float
f2 n | n == 1 = 15
     | n == (-1) = (-15)

{-
problema f2(n:R):R{
    requiere {n es igual a 1 o n es igual a -1}
    asegura {si n= 1 entonces res=15}
    asegura {si n=-1 entonces res=-15}
}
-}

--c. Dado un real n, si es menor o igual a 9 devuelve 7. Si n es mayor a 9 devuelve 5 (por el orden de los guardas).
f3 :: Float -> Float
f3 n | n <= 9 = 7
     | n >= 3 = 5

{-
problema f3(n:R):R {
    requiere {}
    asegura {si n es mayor a 9, res= 5}
    asegura {si n es menor o igual a 9, res=7}
}
-}

--d. Dados dos reales x y, devuelve el cociente de su suma y 2.
f4 :: Float -> Float -> Float
f4 x y = (x+y) / 2

{-
problema f4(x:R,y:R):R {
    requiere {}
    asegura {res es la mitad de la suma entre x e y}
}
-}

--e. Dada una dupla de 2 numeros reales, devuelve la mitad de la suma de sus coordenadas
f5 :: (Float, Float) -> Float
f5 (x, y) = (x+y) / 2
{-
problema f5(a:RxR):R {
    requiere {}
    asegura {res es la mitad de la suma de las coordenadas de a}
}
-}

--f. Dados un real a y un entero b, devuelve True si la parte entera de a es igual a b y false si no.
f6 :: Float -> Int -> Bool
f6 a b = (truncate a == b)
{-
problema f6(a:R,b:Z):Bool {
    requiere {}
    asegura {res es True si y solo si la parte entera de a es igual a b}
    asegura {res es False si y solo si la parte entera de a es distinta de b}
}
-}