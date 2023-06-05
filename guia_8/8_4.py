import numpy as np

#1
def perteneceACadaUno(s:list, e:int)-> bool:
    listaPertenece:list= []
    for i in range(len(s)) :
        listaPertenece.append(False)
        if pertenece(s[i], e):
            listaPertenece[i]= True
    return listaPertenece

def pertenece(s:list, e:int) -> bool:
    for el in s:
        if el == e:
            return True
    return False

print(perteneceACadaUno([[1,2,3,4],[2,3,4,5],[6,4,3,6]],1))

#2
def esMatriz(s:list)->bool:
    if len(s)== 0:
        return False
    else:
        cantColumnas:int=len(s[0])
        for f in s:
            if len(f) != cantColumnas:
                return False
    return True

print(esMatriz([]))
print(esMatriz([[1],[1,2]]))
print(esMatriz([[1,2],[1]]))
print(esMatriz([[],[1]]))
print(esMatriz([[1],[]]))
print(esMatriz([[1,2],[5,7]]))

#3

def ordenados(s:list)-> bool:
    hayOrden = True
    for i in range(0, len(s)-1):
        if s[i] < s[i+1] or len(s) == 1:
            hayOrden = hayOrden and True
        else:
            return False
    return hayOrden

def filasOrdenadas(matriz:list)->list:
    listaFilaOrdenada: list = []
    for i in range(len(matriz)):
        listaFilaOrdenada.append(False)
        if ordenados(matriz[i])==True:
            listaFilaOrdenada[i]= True
    return listaFilaOrdenada
print(filasOrdenadas([[1,2,3],[5,7,8],[1,5,2]]))

#4
def elevarMatriz(d:int, p:float):
    matriz= np.random.randint(0,10,(d,d))
    print(matriz)
    matrizElevada = np.random.randint(0,1,(d,d))
    print(matrizElevada)
    for pot in range(p-1):
        for i in range(d):
            for j in range(d):
                for n in range(d):
                    print(matrizElevada[i][j])
                    print(matriz[i][n])
                    print(matriz[n][j])
                    matrizElevada[i][j] += matriz[i][n] * matriz[n][j]
    return matrizElevada

print(elevarMatriz(2,2))