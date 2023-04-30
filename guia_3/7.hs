--7 

{-
Implementar una funcion:

distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float

problema distanciaManhattan (p : R×R×R, q : R×R×R) : R{
    requiere: {T rue}
    asegura: {res = (i=0 hasta 2)∑|pi −qi|}
}
-}

distanciaManhattan :: (Float, Float, Float)-> (Float, Float, Float) -> Float
distanciaManhattan (p0, p1, p2) (q0, q1, q2) = (abs(p0-q0) + abs(p1-q1) + abs(p2-q2))