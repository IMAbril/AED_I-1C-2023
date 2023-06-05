import random
#1

def nombresDeEstudiantes()->list:
    respuesta:str = input()
    alumnos:list = []
    while respuesta != "listo":
        alumnos.append(respuesta)
        respuesta = input()
    return alumnos

#print(nombresDeEstudiantes())

#2

#Requiere que el input sea "X","C" o "D"
def historialMonedero() -> list:
    movimiento:str= input()
    historial:list=[]
    while movimiento != "X":
        print("Ingrese Monto")
        monto:str= input()
        historial.append((movimiento, monto))
        print("Ingrese operación")
        movimiento = input()
    return historial

#print(historialMonedero())

#3
def jugar7yMedio()->str:
    historial:list=[]
    puntaje:float=0
    seguirJugando:str= "Sí"
    while seguirJugando == "Sí":
        carta= random.randint(1,12)
        while carta == 8 or carta == 9:
            carta = random.randint(1,12)
        print("Tu carta es: "+ str(carta))
        if carta == 10 or carta == 11 or carta== 12:
            puntaje = puntaje + 0.5
        else:
            puntaje = puntaje + carta
        print("Tu puntaje es: "+ str(puntaje))
        historial.append(carta)
        if puntaje >= 7.5:
            if puntaje == 7.5:
                print("Ganaste! Tu historial es:")
                return historial
            else:
                print("Perdiste! Tu historial es:")
                return historial
        print("¿Quieres seguir jugando?")
        seguirJugando= input()
    print("Ok, tu historial es: ")
    return historial

print(jugar7yMedio())


