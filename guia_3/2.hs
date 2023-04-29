---a) absoluto: calcula el valor absoluto de un numero entero
{- 
problema abs(a:Z):Z {
    requiere {true}
    asegura {res > 0 y res = |a|}
}
 -}

absolut :: Integer -> Integer
absolut a | a >= 0 = a
          | a < 0 = (-a)

---b) maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.
{- 
problema maxabs(a:Z,b:Z):Z{
    requiere {a/=b}
    asegura {res = if abs(a)>abs(b) then a else b fi}
}
-}
maxabs :: Integer -> Integer -> Integer
maxabs a b | (absolut a < absolut b) = absolut b 
           | otherwise = absolut a

---c) maximo3: devuelve el maximo entre tres numeros enteros
{-
problema maximo3(a,b,c: ℤ): ℤ {
    requiere {true}
    asegura { (∀x: {a,b,c}) (res >= x) } 
}
-}
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 a b c | (a <= b) && (b <= c) = c
              | (b <= a) && (a <= c) = c
              | (c <= a) && (a <= b) = b 
              | (a <= c) && (c <= b) = b
              | (c <= b) && (b <= a) = a
              | (b <= c) && (c <= a) = a

--d) algunoEs0: dados dos numeros racionales, decide si alguno de los dos es igual a 0(hacerlo dos veces, una usando pattern matching y otra no).
{-
problema algunoEs0(a,b:ℝ):Bool {
    requiere {a y b se pueden escribir como cociente de enteros}
    asegura {res = True si a = 0 y/o b=0}
}
-}

--Pattern Matching--
{--
algunoEs0 :: Float -> Float -> Bool
algunoEs0 _ 0 = True
algunoEs0 0 _ = True
algunoEs0 a b  = False
--}

--Guardas--
algunoEs0 :: Float -> Float -> Bool
algunoEs0 a b | (a==0) || (b ==0) = True
              | otherwise = False 

--e) ambosSon0: dados dos numeros racionales, decide si ambos son iguales a 0 (hacerlo dos veces, una usando pattern matching y otra no).
{-
problema ambosSon0(a,b:ℝ): Bool {
    requiere {a y b se pueden escribir como cociente de enteros}
    asegura {res = true ↔ a=0 y b=0}
} 
-}

--Pattern matching
ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True 
ambosSon0 _ _ = False

--Guardas
{-
ambosSon0 :: Float -> Float -> Bool 
ambosSon0 a b | (a==0) && (b==0) = True
              | otherwise = False
-}

--f) mismoIntervalo: dados dos numeros reales, indica si estan relacionados considerando la relacion de equivalencia en ℝ cuyas clases de equivalencia son: (−∞, 3], (3, 7] y (7, ∞), o dicho de otra forma, si pertenecen al mismo intervalo.

{-
problema mismoIntervalo(a,b:ℝ):Bool {
    requiere {true}
    asegura {res = true ↔ (a ∈ (−∞, 3] y b ∈ (−∞, 3]) v (a ∈ (3, 7] y b ∈ (3, 7]) v (a ∈ (7, ∞)y b ∈ (7, ∞))}
}
-}

mismoIntervalo :: Float -> Float -> Bool 
mismoIntervalo a b | (a<=3) && (b<=3) = True 
                   | ((3<a) && (a<=7)) && ((3<b) && (b<=7)) = True
                   | (a>7) && (b>7) = True
                   | otherwise = False

--g) sumaDistintos: que dados tres numeros enteros calcule la suma sin sumar repetidos (si los hubiera) 

--Este problema tiene varias interpretaciones dado que no se especifica si se suma uno de los repetidos o no se suma nada si es que hay repeticiones.

{-
problema sumaDistintos(a,b,c: ℤ): ℤ{
    requiere {true}
    asegura {si los 3 parametros son distintos -> res = a + b + c}
    asegura {si los 3 parametros son iguales -> res = 0}
    asegura {si se repiten 2 parametros, res es igual al no repetido}
}
-}
sumaDistintos :: Integer -> Integer -> Integer -> Integer 
sumaDistintos a b c | (a==b) && (b==c) = 0
                    | a==b = c
                    | b==c = a
                    | a==c = b 
                    | otherwise = a+b+c

--h) esMultiploDe: dados dos numeros naturales, decidir si el primero es multiplo del segundo.
{-
problema esMultiploDe(a,b:ℤ): Bool {
    requiere {a>0 y b>0}
    asegura {res=True ↔ (∃k:ℤ)(a=kb)}
    asegura {mod a b = 0}
}
-}
esMultiploDe :: Integer -> Integer -> Bool 
esMultiploDe a b | mod a b == 0 = True
                 | otherwise = False

--i) digitoUnidades: dado un numero natural, extrae su digito de las unidades.
{-
problema digitoUnidades(a:ℤ):ℤ{
    requiere {a>0}
    asegura {res = mod a 10}
    asegura {mod (a-res) 10 = 0 }
}
-}

digitoUnidades :: Integer -> Integer 
digitoUnidades a = mod a 10

--j) digitoDecenas: dado un numero natural, extrae su digito de las decenas.
{-
problema digitoDecenas(a:ℤ):ℤ{
    requiere {a>0}
    asegura {res = div (mod a 100) 10}
    asegura {mod (a-res) 100 = 0 }
}
-}
digitoDecenas :: Integer -> Integer
digitoDecenas a = div (mod a 100) 10 