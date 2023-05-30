from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  if (len (l) == 0) :
    return 0
  else:
    lenMesetaActual : int = 0
    lenMesetaMasLarga : int = 1
    anterior : int = l[0]
    for elem in l:
      if elem == anterior:
        lenMesetaActual = lenMesetaActual + 1
      else:
        lenMesetaActual = 1
      if lenMesetaActual > lenMesetaMasLarga:
        lenMesetaMasLarga = lenMesetaActual
      anterior = elem
  return lenMesetaMasLarga

if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))