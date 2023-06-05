#1
def posicionParCeroInOut(lista:list)-> list:
    for i in range(2, len(lista),2):
        lista[i]= 0
    return lista

print(posicionParCeroInOut([0,1,2,3,4,5,6,7,8]))

#2
def posicionParCeroIn(lista:list)-> list:
    copiaLista: list =  list(lista)
    for i in range(2, len(lista),2):
        copiaLista[i]= 0
    return copiaLista

lista:list = [0,1,2,3,4,5,6,7,8,9]
print(posicionParCeroIn(lista))
print(lista)

#3
def borrarVocales(texto:str)-> str:
    vocales: list = ["A","E","I","O","U","a","e","i","o","u"]
    textoSinVocales: list = list(texto)
    textoNuevo:str=""
    for i in range(len(texto)):
        for v in vocales:
            if textoSinVocales[i] == v:
                textoSinVocales[i] = ""
    for l in textoSinVocales:
        textoNuevo = textoNuevo + l

    return textoNuevo

texto1:str = "Dinosaurio y murcielago"
print(borrarVocales(texto1))
print(texto1)

#4
def reemplazaVocales(s:list)->list:
    resultadoLista: list = list(s)
    vocales:list=["A","E","I","O","U","a","e","i","o","u"]
    resultado:str=""
    for i in range(len(resultadoLista)):
        for v in vocales:
            if resultadoLista[i]==v:
                resultadoLista[i]="_"
    for l in resultadoLista:
        resultado = resultado + l

    return resultado

texto2:str="Esta es una cadena con vocales"
print(reemplazaVocales(texto2))
print(texto2)        

#5
def daVueltaStr(s:str)-> str:
    cadenaInvertida:str=""
    for i in range(len(s)-1,-1,-1):
        cadenaInvertida= cadenaInvertida + s[i]
    return cadenaInvertida

texto3 = "Esta es una cadena no invertida"
print(daVueltaStr(texto3))
print(texto3)

