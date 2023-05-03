raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = sucesion 1 - 1
raizDe2Aprox n = sucesion n - 1
sucesion :: Integer -> Float
sucesion 1 = 2
sucesion n = 2 + 1/(sucesion (n-1))