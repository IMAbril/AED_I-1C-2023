from math import *

#1
def imprimir_saludo(nombre:str) -> str:
    print("Hola " + nombre)

imprimir_saludo("Abril")

#2
def raiz_cuadrada_de(numero:float) -> float:
    return sqrt(numero)

print(raiz_cuadrada_de(2))

#3
def imprimir_dos_veces(estribillo:str) -> str:
    print(estribillo*2)

imprimir_dos_veces("I see a little silhouetto of a man,\n Scaramouch, Scaramouch, will you do the Fandango!\n")

#4
def es_multiplo_de(n:int, m:int) -> bool :
    if (n % m == 0):
        return True
    else:
        return False

print(es_multiplo_de(25,5))
print(es_multiplo_de(24,5))

#5
def es_par(numero:int) -> bool:
    if (es_multiplo_de(numero, 2)):
        return True
    else:
        return False
    
print(es_par(22))
print(es_par(23))

#6
def cantidad_de_pizzas (comensales:int, min_cant_de_porciones:int) -> int:
    porciones:int = comensales * min_cant_de_porciones
    pizzas:int = ceil(porciones/8) 
    return pizzas

print(cantidad_de_pizzas(4,2))
print(cantidad_de_pizzas(3,2))
print(cantidad_de_pizzas(5,2))
