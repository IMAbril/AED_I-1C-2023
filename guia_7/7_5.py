""" 
1-
    problema devolver_el_doble_si_es_par(in un_numero: Z):Z{
        requiere {true}
        asegura {un_numero es par -> res= 2*un_numero}
        asehura {un_numero es impar -> res= un_numero}
    }

"""
def devolver_el_doble_si_es_par(un_numero: int) -> int :
    if un_numero % 2 == 0:
        return 2*un_numero
    else:
        return un_numero

"""
2-
    problema devolver_valor_si_es_par_sino_el_que_sigue(in un_numero:Z):Z{
        requiere {true}
        asegura {valor es par -> res= valor}
        asegura {valor es impar -> res = valor+1}
    }

"""
def devolver_valor_si_es_par_sino_el_que_sigue(un_numero: int) -> int:
    if un_numero % 2 == 0:
        return un_numero
    else:
        return un_numero+1

"""
3-
    problema devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(in un_numero):Z{
        requiere {true}
        asegura {un_numero es multiplo de 3 pero no de 9 -> res= 2* un_numero}
        asegura {un_numero es multiplo de 9 -> res = 3*un_numero}
    }
"""
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(un_numero: int)-> int :
    if (un_numero % 3 == 0) and (un_numero % 9 != 0):
        return 2*un_numero
    if un_numero % 9 == 0:
        return 3*un_numero

"""
4-
    problema masDe5Caracteres (in nombre: seq<Char>):seq<Char> {
        requiere {nombre no tiene espacios}
        asegura {if |nombre|<5 then res = "Tu nombre tiene menos de 5 caracteres" else res="Tu nombre tiene muchas letras!" fi}
    }
"""
def masDe5Caracteres(nombre:str) -> str:
    if len(nombre) < 5:
        return "Tu nombre tiene menos de 5 caracteres"
    else:
        return "Tu nombre tiene muchas letras!"
    
"""
5-
    problema tieneVacaciones(in sexo: Char, in edad:Z): seq<Char>{
        requiere {}
        asegura {edad < 18 -> res= "Andá de vacaciones"}
        asegura {(edad >59 y sexo = F) v (edad>64 y sexo=M) -> res= "Andá de vacaciones"}
        asegura {(edad<59 y sexo = F) v (edad<64 y sexo=M) -> res = "Te toca trabajar"}
    }
    
"""

def tieneVacaciones(sexo: str, edad: int) -> str :
    if edad < 18:
        return "Andá de vacaciones"
    else:
        if (edad > 59 and sexo =="F") or (edad >64 and sexo == "M"):
            return "Andá de vacaciones"
        else:
            return "Te toca trabajar"

