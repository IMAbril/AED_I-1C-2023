#1

#1.1
def pertenece(s:list, e:int) -> bool:
    for el in s:
        if el == e:
            return True
    return False

print(pertenece([1,2,3,4,5],3))
print(pertenece([1,2,3,4],5))

#1.2
def pertenece2(s:list, e:int) -> bool:
    i:int=0
    while i < len(s):
        if s[i]==e:
            return True
        i = i+1
    return False
print(pertenece2([1,2,3,4,5],3))
print(pertenece2([1,2,3,4],5))

#1.3
def pertenece3(s:list, e:int) -> bool:
    for i in range(0,len(s)):
        if s[i]==e:
            return True
    return False

print(pertenece3([1,2,3,4,5],3))
print(pertenece3([1,2,3,4],5))

#2

def divideATodos(s:list, e:int)-> bool :
    divide:int = True  
    for el in s:
        if el % e == 0:
            divide = divide and True
        else:
            divide = divide and False
    return divide  

print(divideATodos([2,4,6,8],2))
print(divideATodos([2,5,6,8],2))

#3

def sumaTotal(s:list)->int:
    suma = 0
    for e in s:
        suma = suma + e
    return suma
print(sumaTotal([1,2,3,4,5]))

#4

def ordenados(s:list)-> bool:
    hayOrden = True
    for i in range(0, len(s)-1):
        if s[i] < s[i+1] or len(s) == 1:
            hayOrden = hayOrden and True
        else:
            return False
    return hayOrden
print(ordenados([1,2,3,4])) 
print(ordenados([1,2,4,3,5]))
print(ordenados([]))
print(ordenados([1]))

#5
def tienePalabraCon7Letras(s:list)-> bool:
    for p in s:
        if len(p) > 7:
            return True
    return False
print(tienePalabraCon7Letras(["Dinosaurio","Susano","Messi"]))
print(tienePalabraCon7Letras(["Lino","Oliver"]))

#6
def esPalindroma(texto:str) -> bool:
    palindroma: bool = True
    for i in range(0, int(len(texto)/2)):
        if texto[i] == texto[-(i+1)]:
            palindroma = palindroma and True
        else:
            return False
    return palindroma

print(esPalindroma("A"))
print(esPalindroma(""))
print(esPalindroma("aba"))
print(esPalindroma("aa"))
print(esPalindroma("susanoonasus"))

#7
#requiere: password no tiene caracteres especiales
def passCategory(password:str)-> str:
    if len(password) >= 5:
        if len(password)>8 and strongPass(password):
            return "VERDE"
        else:
            return "AMARILLA"
    else:
        return "ROJA"

#requiere: password no tiene caracteres especiales. asegura: strongPass devuelve true si password tiene al menos 1 minuscula, 1 mayuscula y 1 digito numerico.
def strongPass(password: str) -> bool:
    upperCase: bool = False
    lowerCase: bool = False
    number: bool = False
    numbers: list =["0","1","2","3","4","5","6","7","8","9"]
    for l in password:
        if (pertenece(numbers,l)):
            number = True
        else:
            if ("a" <= l <= "z") or l=="ñ":
                lowerCase = True
            else:
                upperCase = True
    return upperCase and lowerCase and number


print("verde " + passCategory("EstaEsUnaContraseÑaFuerte1"))
print("amarillo " + passCategory("contraseña"))
print("rojo " + passCategory("1coT"))



#8
#requiere: movimientos es una lista de tuplas (tipo, dinero), donde tipo es "I" o "R"
def saldo(movimientos: list):
    saldoActual: float = 0
    for mov in movimientos:
        if mov[0] == "I":
            saldoActual = saldoActual + mov[1]
        else:
            saldoActual = saldoActual - mov[1]
    return saldoActual

print(saldo([("I",2000),("R",20), ("R", 1000), ("I",300)]))

#9
#sin recorrer la palabra
def tiene3VocalesDistintas(palabra:str)-> bool:
    vocalesMayus:list =["A","E","I","O","U"]
    vocalesMinus: list =["a","e","i","o","u"]
    vocalesDistintas: list = []
    for i in range(0,5):
        aparicionesMayus: int = palabra.count(vocalesMayus[i])
        aparicionesMinus: int = palabra.count(vocalesMinus[i])
        if (aparicionesMayus == 0 and aparicionesMinus== 1):
            vocalesDistintas.append(vocalesMinus[i])
        if (aparicionesMayus==1 and aparicionesMinus==0):
            vocalesDistintas.append(vocalesMayus[i])
    if len(vocalesDistintas)>=3:
        return True
    else:
        return False
#recorriendo la palabra (como lo pide la consigna)
def tiene3VocalesDistintas2(palabra:str)-> bool:
    vocalesMayus:list =["A","E","I","O","U"]
    vocalesMinus: list =["a","e","i","o","u"]
    vocalesMayusEncontradas: list = []
    vocalesMinusEncontradas: list = []
    vocalesDistintas: list = []
    for l in palabra:
        for i in range(0,5):
            if l == vocalesMayus[i]:
                vocalesMayusEncontradas.append(vocalesMayus[i])
            if l == vocalesMinus[i]:
                vocalesMinusEncontradas.append(vocalesMinus[i])

    for i in range(0,5):
        if vocalesMayusEncontradas.count(vocalesMayus[i])==1 and vocalesMinusEncontradas.count(vocalesMinus[i])== 0:
            vocalesDistintas.append(vocalesMayus[i])
        if vocalesMayusEncontradas.count(vocalesMayus[i])==0 and vocalesMinusEncontradas.count(vocalesMinus[i])== 1:
            vocalesDistintas.append(vocalesMinus[i])
    if len(vocalesDistintas)>=3:
        return True
    else:
        return False

print(tiene3VocalesDistintas2("Susano"))
print(tiene3VocalesDistintas2("dinosaurio"))




