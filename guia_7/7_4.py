#1
def peso_pino(metros:float) -> float:
    altura: float = metros * 100
    peso: float = altura * 3
    if altura > 300:
        altura2: float = altura - 300
        peso = 300*3 + altura2*2
    return peso

#2
def es_peso_util(peso:float) -> bool:
    return (peso>=400)and(peso<=1000)

#3 y 4
def sirve_pino(altura:float) -> bool:
    return es_peso_util(peso_pino(altura))

