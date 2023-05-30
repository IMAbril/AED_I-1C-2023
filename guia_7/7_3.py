#1
def alguno_es_0(numero1:float, numero2:float) -> bool:
    return (numero1 == 0) or (numero2==0)

print(alguno_es_0(2,5))
print(alguno_es_0(0,5))
print(alguno_es_0(2,0))
print(alguno_es_0(0,0))

#2
def ambos_son_0(numero1:int, numero2:int) -> bool :
    return (numero1==0)and(numero2==0)

print(ambos_son_0(2,5))
print(ambos_son_0(0,5))
print(ambos_son_0(2,0))
print(ambos_son_0(0,0))

#3
def es_nombre_largo(nombre:str) -> bool:
    return (len(nombre) >= 3)and(len(nombre) <=8)

print(es_nombre_largo("Su"))
print(es_nombre_largo("Susano"))
print(es_nombre_largo("SusanitoVladimir"))

#4
def es_bisiesto(año:int) -> bool:
    return (año%4 == 0) and not (año%100==0)

print(es_bisiesto(200))
print(es_bisiesto(4))
print(es_bisiesto(2024))


