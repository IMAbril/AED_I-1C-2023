#1
"""
El resultado de evaluar tres veces seguidas ro(1) es:
    Primera llamada a ro(1): El valor de retorno es 2.
    Segunda llamada a ro(1): El valor de retorno es 3.
    Tercera llamada a ro(1): El valor de retorno es 4.

"""
#2
"""
El resultado de evaluar tres veces seguidas rt(1, 0) es:
    Primera llamada a rt(1, 0): El valor de retorno es 2.
    Segunda llamada a rt(1, 0): El valor de retorno es 3.
    Tercera llamada a rt(1, 0): El valor de retorno es 4.

"""

#3
"""
Ejecución simbólica de rt:
//EstadoInicial: {}
//Asignación_x: x@{x:int}
//Asignación_g: g@{g:int, x}
//Reasignación_g: g@{g=g@Asignación_g +1}
//retorno: x+g

Ejecución simbólica de ro:
//EstadoInicial: {}
//Asignación_x: x@{x:int}
//Asignacion_g: g@{x=x@Asignacion_x, g=global g}
//Reasignacion_g: g@{x=x@Asignacion_g, g=g@Asignacion_g + 1}
//retorno: x+g

"""

#4
"""
problema rt(in x:Z, inoutg:Z):Z{
    requiere {}
    asegura {g -> g = g@pre + 1}
    asegura {res= x+g@pre+1}
}

problema ro(in x:z):z{
    requiere {}
    asegura {g -> g = g@pre + 1}
    asegura {res= x+g@pre + 1}
}
"""