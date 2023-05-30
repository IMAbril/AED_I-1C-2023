from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def filasParecidas(matriz: List[List[int]]) -> bool :
  parecida : bool = True
  columnaFilaAnterior= matriz[0][0]
  if len (matriz) == 1:
    return True
  else:
    desplazamiento = matriz[1][0] - matriz[0][0]
    for numFila in range(1, len(matriz)):
      for numColumna in range(0,len(matriz[numFila])):
        columnaFilaAnterior = matriz[numFila-1][numColumna]
        if matriz[numFila][numColumna] == (columnaFilaAnterior + desplazamiento):
          parecida = True
        else:
          return False
  return parecida


if __name__ == '__main__':
  filas = int(input())
  columnas = int(input())
 
  matriz = []
 
  for i in range(filas):         
    fila = input()
    if len(fila.split()) != columnas:
      print("Fila " + str(i) + " no contiene la cantidad adecuada de columnas")
    matriz.append([int(j) for j in fila.split()])
  
  print(filasParecidas(matriz))