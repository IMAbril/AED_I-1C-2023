{-
Especificación:

problema tipoDeTriangulo (a,b,c:Z):seq<Char> {
    requiere { ((a+b > c) v (a+c > b) v (b+c > a)) ∧ a>0 ∧ b>0 ∧ c>0}
    asegura {(a = b ∧ a = c) -> res = "equilatero"}
    asegura {((a = b ∧ a /= c)  v (a = c∧ a/= b) v (b = c ∧ b /= a)) -> res= "isosceles"}
    asegura {(a /= b ∧ a/= c ∧ b /= c) -> res = "escaleno"}
}

1- Factores : a:Z, b:Z, c:Z
2- Sí, hay relación entre a, b y c.
3- 
    a: 
        característica: ¿Es mayor a 0?

        característica: valor

        característica: ¿Su suma con b es mayor a c?

        característica: ¿Su suma con c es mayor a b?

        característica: ¿Su valor es mayor a la suma de c con b?

    b:  
        característica: ¿Es mayor a 0?

        característica: valor

        característica: ¿Su suma con a es mayor a c?

        característica: ¿Su suma con c es mayor a a?

        característica: ¿Su valor es mayor a la suma de a con c?

    c:
        característica: ¿Es mayor a 0?

        característica: valor

        característica: ¿Su suma con b es mayor a a?

        característica: ¿Su suma con a es mayor a b?

        característica: ¿Su valor es mayor a la suma de a con b?

4-
    a: 
        característica: ¿Es mayor a 0?
            Elección: Sí
            Elección: No
        característica: valor
            a = b y a = c
            a = b y a /= c
            a = c y a /= b
            a /= c y a/= b
        característica: ¿Su suma con b es mayor a c?
            Elección: Sí
            Elección: No
        característica: ¿Su suma con c es mayor a b?
            Elección: Sí
            Elección: No
        característica: ¿Su valor es mayor a la suma de c con b?
            Elección: Sí
            Elección: No
    b:  
        característica: ¿Es mayor a 0?
            Elección: Sí
            Elección: No
        característica: valor
            b = a y b = c
            b = a y b /= c
            b = c y b /= a
            b /= c y b/= a
        característica: ¿Su suma con a es mayor a c?
            Elección: Sí
            Elección: No
        característica: ¿Su suma con c es mayor a a?
            Elección: Sí
            Elección: No
        característica: ¿Su valor es mayor a la suma de a con c?
            Elección: Sí
            Elección: No
    c:
        característica: ¿Es mayor a 0?
            Elección: Sí
            Elección: No
        característica: valor
            c = b y c = a
            c = b y c /= a
            c = a y c /= b
            c /= a y c/= b
        característica: ¿Su suma con b es mayor a a?
            Elección: Sí
            Elección: No
        característica: ¿Su suma con a es mayor a b?
            Elección: Sí
            Elección: No
        característica: ¿Su valor es mayor a la suma de a con b?
            Elección: Sí
            Elección: No
5-
    a: 
        característica: ¿Es mayor a 0?
            Elección: Sí [Restricción]
            Elección: No [ERROR]

        característica: valor
            a = b y a = c  [Único]
            a = b y a /= c [Restricción]
            a = c y a /= b [Restricción]
            a /= c y a/= b [Restricción]
        característica: ¿Su suma con b es mayor a c?
            Elección: Sí [Restricción]
            Elección: No [Restricción] 
        característica: ¿Su suma con c es mayor a b?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
        característica: ¿Su valor es mayor a la suma de c con b?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
    b:  
        característica: ¿Es mayor a 0?
            Elección: Sí [Restricción]
            Elección: No [ERROR]

        característica: valor
            b = a y b = c [Único]
            b = a y b /= c [Restricción]
            b = c y b /= a [Restricción]
            b /= c y b/= a [Restricción]
        característica: ¿Su suma con a es mayor a c?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
        característica: ¿Su suma con c es mayor a a?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
        característica: ¿Su valor es mayor a la suma de a con c?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
    c:
        característica: ¿Es mayor a 0?
            Elección: Sí [Restricción]
            Elección: No [ERROR]

        característica: valor
            c = b y c = a [Único]
            c = b y c /= a [Restricción]
            c = a y c /= b [Restricción]
            c /= a y c/= b [Restricción]
        característica: ¿Su suma con b es mayor a a?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
        característica: ¿Su suma con a es mayor a b?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
        característica: ¿Su valor es mayor a la suma de a con b?
            Elección: Sí [Restricción]
            Elección: No [Restricción]
6- Lo hago en archivo a parte (tabla6-2.6 (pagina 1 de Casos6.pdf)) 
-}