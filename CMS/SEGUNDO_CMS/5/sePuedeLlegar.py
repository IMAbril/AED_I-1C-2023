from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  ruta:List[Tuple[str,str]] = buscarRuta(vuelos, [], origen, destino)
  if len(ruta) == 0:
     return -1
  else:
     return len(ruta)
  
def buscarVuelo(vuelos:List[Tuple[str,str]], origen: str):
  vueloEncontrado : Tuple[str,str] = []
  for vuelo in vuelos:
    if vuelo[0] == origen:
      vueloEncontrado = vuelo
  return vueloEncontrado

def buscarRuta(vuelos:List[Tuple[str,str]], vuelosRecorridos:List[Tuple[str,str]], origen: str, destino:str):
  vueloAnterior: Tuple[str,str] = buscarVuelo(vuelos,origen)
  if (vueloAnterior != []) and(vueloAnterior[1] == destino):
    vuelosRecorridos.append(vueloAnterior)
    return vuelosRecorridos 
  if (vuelos == []) or (vueloAnterior == []):
    return []
  else:
    vuelosRecorridos.append(vueloAnterior)
    remover_elementos(vuelos, vuelosRecorridos)
    origen = vueloAnterior[1]
    return buscarRuta(vuelos, vuelosRecorridos, origen, destino)

    
def remover_elementos(lista_original: List[Tuple[str,str]], elementos_a_eliminar: List[Tuple[str,str]]):
    for elemento in elementos_a_eliminar:
        if elemento in lista_original:
            lista_original.remove(elemento)


if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))