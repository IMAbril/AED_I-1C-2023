#1
""" 
def nums_1to10():
    i:int = 0
    while i < 10:
        print(i+1)
        i += 1
"""
def nums_1to10():
    for i in range(0,10,1):
        print(i+1)

#2
""" 
def nums_pares_10to40():
    i:int= 10
    while i <= 40:
        print(i)
        i = i+2
"""
def nums_pares_10to40():
    for i in range(10,41,2):
        print(i)

#3
""" 
def eco_10():
    i:int= 0
    while i<10:
        print("eco")
        i += 1
"""
def eco_10():
    for i in range(0,10,1):
        print("eco")

#4
""" 
def cuenta_regresiva(numero:int) -> str :
    i:int= numero
    while i > 0:
        print(i)
        i -= 1
    print("Despegue")
"""
def cuenta_regresiva(numero:int) -> str:
    for i in range(numero,0,-1):
        print(i)
    print("Despegue")

#5
""" 
def viajeEnElTiempo(añoPartida:int, añoLlegada:int) -> str:
    i:int= 1
    while añoLlegada<añoPartida:
        print("Viajó un año al pasado, estamos en el año: "+ str(añoPartida-i))
        añoLlegada += 1
        i += 1
"""
def viajeEnElTiempo(añoPartida:int, añoLlegada:int) -> str:
    for i in range(añoPartida-1, añoLlegada-1,-1):
        print("Viajó un año al pasado, estamos en el año: "+ str(i))


#6
""" 
def viajeEnElTiempoAristoteles(añoPartida:int) -> str:
    while -364<añoPartida:
        añoPartida -= 20
        print("Viajó al pasado, estamos en el año: "+ str(añoPartida))
"""
def viajeEnElTiempoAristoteles(añoPartida:int) -> str:
    for i in range(añoPartida-20, -384,-20):
        print("Viajó al pasado, estamos en el año: "+ str(i))

viajeEnElTiempoAristoteles(100)