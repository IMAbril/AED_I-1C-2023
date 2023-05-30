import sys

def quienGana(j1: str, j2: str) -> str : 
    #Implementar esta funcion
    tijera : str = "Tijera"
    papel : str = "Papel"
    piedra : str = "Piedra"
    if (j1 == j2):
       return "Empate"
    if (j1 == tijera):
       if (j2 == papel):
          return "Jugador1"
       else:
          return "Jugador2"
    if (j1 == papel):
       if (j2 == tijera):
          return "Jugador2"
       else:
          return "Jugador1"
    if (j1 == piedra):
       if (j2 == papel):
          return "Jugador2"
       else:
          return "Jugador1"

if __name__ == '__main__':
  x = input()
  jug = str.split(x)
  print(quienGana(jug[0], jug[1]))