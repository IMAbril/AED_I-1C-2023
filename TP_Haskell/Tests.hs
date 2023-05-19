module Tests where

import Test.HUnit
import Solucion

main = runTestTT tests
tests = test [testsCatedra, testSuite1, testSuite2, testSuite3, testSuite4, testSuite5, testSuite6, testSuite7, testSuite8, testSuite9, testSuite10]

testSuite1 = test [
    " no tiene usuarios" ~: (nombresDeUsuarios redC) ~?= [],
    " tiene 1 usuario" ~: (nombresDeUsuarios redA) ~?= ["Alice"],
    " tiene más de 1 usuario" ~: (nombresDeUsuarios redB) ~?= ["Alice","Patricio","Charlie", "David", "Eva"],
    " tiene muchos usuarios" ~: (nombresDeUsuarios redD) ~?= ["Alice", "Patricio", "Charlie", "David", "Frank", "Grace", "Henry", "Isabel", "Jack", "Katherine", "Liam"],
    " tiene 2 usuarios con el mismo nombre" ~: (nombresDeUsuarios redD) ~?= ["Alice", "Patricio", "Charlie", "David", "Frank", "Grace", "Henry", "Isabel", "Jack", "Katherine", "Liam"]
 ]

testSuite2 = test [
   " no tiene amigos" ~: (amigosDe redA usuario1) ~?= [],
   " tiene 1 amigo" ~: (amigosDe redD usuario10) ~?= [usuario4],
   " tiene varios amigos" ~: (amigosDe redD usuario4) ~?= [usuario1, usuario7, usuario10],
   " tiene 2 amigos con el mismo nombre" ~: (amigosDe redI usuario1) ~?= [usuario2, usuario3, usuario4, usuario5, usuario12, usuario13]
    ]

testSuite3 = test [
    " no tiene amigos" ~: (cantidadDeAmigos redA usuario1) ~?= 0,
    " tiene 1 amigo" ~: (cantidadDeAmigos redD usuario10) ~?= 1,
    " tiene 3 amigos" ~: (cantidadDeAmigos redD usuario4) ~?= 3,
    " tiene 11 amigos" ~: (cantidadDeAmigos redE usuario1) ~?= 11
 ]

testSuite4 = test [
    " red con 1 usuario" ~: (usuarioConMasAmigos redA) ~?= usuario1,
    " hay un usuarioConMasAmigos" ~: (usuarioConMasAmigos redD) ~?= usuario6,
    " hay un usuario con 1 amigo más que los demás" ~: (usuarioConMasAmigos redI) ~?= usuario1,
    " hay más de un usuario con el máximo de amigos" ~: expectAny (usuarioConMasAmigos redB) [usuario1, usuario2, usuario3, usuario4, usuario5] 
 ]

testSuite5 = test [
   " hay un usuario con más de 10 amigos" ~: (estaRobertoCarlos redE) ~?= True,
   " no hay un usuario con más de 10 amigos" ~: (estaRobertoCarlos redB) ~?= False,
   " red vacia" ~: (estaRobertoCarlos redC) ~?= False
 ]

testSuite6 = test [
   " usuario sin publicaciones" ~: (publicacionesDe redB usuario5) ~?= [],
   " usuario con 1 publicación" ~: (publicacionesDe redA usuario1) ~?= [publicacion1_1],
   " usuario con más de 1 publicacion" ~: (publicacionesDe redB usuario1) ~?= [publicacion1_1, publicacion1_2]
 ]

testSuite7 = test [
   " no le gusta ninguna publicación" ~: (publicacionesQueLeGustanA redD usuario6 ) ~?= [],
   " le gusta una publicación" ~: (publicacionesQueLeGustanA redD usuario4) ~?= [publicacion2_4],
   " le gustan varias publicaciones" ~: (publicacionesQueLeGustanA redE usuario1) ~?= [publicacion2_1, publicacion2_2, publicacion2_3, publicacion2_4, publicacion2_5],
   " le gusta su propia publicación" ~: (publicacionesQueLeGustanA redB usuario2) ~?= [publicacion2_1]
 ]

testSuite8 = test [
   " no tienen ningun like en común" ~: (lesGustanLasMismasPublicaciones redF usuario3 usuario4 ) ~?= False,
   " tienen un like en común" ~: (lesGustanLasMismasPublicaciones redF usuario4 usuario6) ~?= False,
   " les gustan las mismas publicaciones" ~: (lesGustanLasMismasPublicaciones redF usuario2 usuario5) ~?= True, 
   " a un usuario no le gusta ninguna y al otro sí" ~: (lesGustanLasMismasPublicaciones redF usuario1 usuario2) ~?= False,
   " no les gusta ninguna publicación" ~: (lesGustanLasMismasPublicaciones redF usuario1 usuario7) ~?= True
 ] 

testSuite9 = test [
   " no tienen ningún seguidor fiel" ~: (tieneUnSeguidorFiel redD usuario1) ~?= False,
   " tiene un seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario2) ~?= True,
   " tiene más de un seguidor fiel" ~: (tieneUnSeguidorFiel redF usuario3) ~?= True,
   " se dio like a si mismo" ~: (tieneUnSeguidorFiel redH usuario4) ~?= False,
   " no tiene publicaciones" ~: (tieneUnSeguidorFiel redB usuario3) ~?= False
   ]

testSuite10 = test [
   " no hay cadena de amigos" ~: (existeSecuenciaDeAmigos redG usuario5 usuario7) ~?= False,
   " amigo de amigo" ~: (existeSecuenciaDeAmigos redG usuario2 usuario4) ~?= True,
   " un usuario no tiene amigos" ~: (existeSecuenciaDeAmigos redG usuario1 usuario4) ~?= False,
   " tienen más de un amigo en común" ~: (existeSecuenciaDeAmigos redG usuario6 usuario9) ~?= True,
   " cadena de amigos extensa" ~: (existeSecuenciaDeAmigos redJ usuario1 usuario5) ~?= True,
   " esta relacionado con si mismo y tiene amigos" ~: (existeSecuenciaDeAmigos redH usuario1 usuario1) ~?= True,
   " esta relacionado con si mismo y notiene amigos" ~: (existeSecuenciaDeAmigos redA usuario1 usuario1) ~?= False
 ]

testsCatedra = test [
    " nombresDeUsuarios 1" ~: (nombresDeUsuarios redAC) ~?= ["Juan","Natalia","Pedro","Mariela"],

    " amigosDe 1" ~: (amigosDe redAC usuario1C) ~?= [usuario2C, usuario4C],

    " cantidadDeAmigos 1" ~: (cantidadDeAmigos redAC usuario1C) ~?= 2,

    " usuarioConMasAmigos 1" ~: expectAny (usuarioConMasAmigos redAC) [usuario2C, usuario4C],

    " estaRobertoCarlos 1" ~: (estaRobertoCarlos redAC) ~?= False,

    " publicacionesDe 1" ~: (publicacionesDe redAC usuario2C) ~?= [publicacion2_1C, publicacion2_2C],

    " publicacionesQueLeGustanA 1" ~: (publicacionesQueLeGustanA redAC usuario1C) ~?= [publicacion2_2C, publicacion4_1C],

    " lesGustanLasMismasPublicaciones 2" ~: (lesGustanLasMismasPublicaciones redBC usuario1C usuario3C) ~?= True,

    " tieneUnSeguidorFiel 1" ~: (tieneUnSeguidorFiel redAC usuario1C) ~?= True,

    " existeSecuenciaDeAmigos 1" ~: (existeSecuenciaDeAmigos redAC usuario1C usuario3C) ~?= True
 ]
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


redA = ([usuario1], [], [publicacion1_1])

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5]
relacionesB = [relaciones1_2, relaciones1_5, relaciones2_3, relaciones3_4, relaciones4_5]
publicacionesB = [publicacion1_1, publicacion1_2, publicacion2_1]
redB = (usuariosB, relacionesB, publicacionesB)

redC = ([],[],[])

publicacionesD = [publicacion2_4, publicacion1_1]
relacionesD = [relaciones1_3, relaciones1_4,relaciones1_6, relaciones3_6, relaciones4_7, relaciones4_10, relaciones6_7, relaciones6_8, relaciones6_9, relaciones6_11, relaciones6_12]
usuariosD = [usuario1, usuario2, usuario3, usuario4, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13]
redD = (usuariosD, relacionesD, publicacionesD)

publicacionesE = [publicacion1_1, publicacion2_1, publicacion2_2, publicacion2_3, publicacion2_4, publicacion2_5]
usuariosE = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12]
relacionesE = [relaciones1_2, relaciones1_3, relaciones1_4, relaciones1_5, relaciones1_6, relaciones1_7, relaciones1_8, relaciones1_9, relaciones1_10, relaciones1_11, relaciones1_12] 
redE = (usuariosE, relacionesE, publicacionesE) 

usuariosF = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
relacionesF = [relaciones1_2, relaciones3_4, relaciones3_6, relaciones4_5]
publicacionesF = [publicacion3_1, publicacion3_2, publicacion3_3, publicacion3_4]
redF = (usuariosF, relacionesF, publicacionesF)

usuariosG = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9]
relacionesG = [relaciones2_3, relaciones3_4, relaciones3_5, relaciones6_7, relaciones6_8, relaciones7_9, relaciones8_9]
redG = (usuariosG, relacionesG, [])

usuariosH = [usuario1, usuario2, usuario3, usuario4]
relacionesH = [relaciones1_2, relaciones1_3, relaciones1_4, relaciones2_3, relaciones2_4, relaciones3_4]
publicacionesH = [publicacion4_1, publicacion4_2, publicacion4_3]
redH = (usuariosH, relacionesH, publicacionesH)

relacionesI = [relaciones1_2, relaciones1_3, relaciones1_4, relaciones1_5, relaciones1_12, relaciones1_13, relaciones2_3, relaciones2_5, relaciones2_12, relaciones2_13, relaciones3_4, relaciones3_12, relaciones3_13, relaciones4_5, relaciones4_12, relaciones4_13, relaciones5_12, relaciones5_13]
usuariosI = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario12, usuario13]
redI = (usuariosI, relacionesI, [])

relacionesJ = [relaciones1_2, relaciones2_3, relaciones2_6, relaciones3_4, relaciones4_5]
usuariosJ = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6]
redJ = (usuariosJ, relacionesJ, [])

usuario1 = (1, "Alice")
usuario2 = (2, "Patricio")
usuario3 = (3, "Charlie")
usuario4 = (4, "David")
usuario5 = (5, "Eva")
usuario6 = (6, "Frank")
usuario7 = (7, "Grace")
usuario8 = (8, "Henry")
usuario9 = (9, "Isabel")
usuario10 = (10, "Jack")
usuario11 = (11, "Katherine")
usuario12 = (12, "Liam")
usuario13 = (13, "Liam")

relaciones1_2 = (usuario1, usuario2)
relaciones1_3 = (usuario1, usuario3)
relaciones1_4 = (usuario1, usuario4)
relaciones1_5 = (usuario1, usuario5)
relaciones1_6 = (usuario1, usuario6)
relaciones1_7 = (usuario1, usuario7)
relaciones1_8 = (usuario1, usuario8)
relaciones1_9 = (usuario1, usuario9)
relaciones1_10 = (usuario1, usuario10)
relaciones1_11 = (usuario1, usuario11)
relaciones1_12 = (usuario1, usuario12)
relaciones1_13 = (usuario1, usuario13)

relaciones2_3 = (usuario2, usuario3)
relaciones2_4 = (usuario2, usuario4)
relaciones2_5 = (usuario2, usuario5)
relaciones2_6 = (usuario2, usuario6)
relaciones2_7 = (usuario2, usuario7)
relaciones2_8 = (usuario2, usuario8)
relaciones2_9 = (usuario2, usuario9)
relaciones2_10 = (usuario2, usuario10)
relaciones2_11 = (usuario2, usuario11)
relaciones2_12 = (usuario2, usuario12)
relaciones2_13 = (usuario2, usuario13)

relaciones3_4 = (usuario3, usuario4)
relaciones3_5 = (usuario3, usuario5)
relaciones3_6 = (usuario3, usuario6)
relaciones3_7 = (usuario3, usuario7)
relaciones3_8 = (usuario3, usuario8)
relaciones3_9 = (usuario3, usuario9)
relaciones3_10 = (usuario3, usuario10)
relaciones3_11 = (usuario3, usuario11)
relaciones3_12 = (usuario3, usuario12)
relaciones3_13 = (usuario3, usuario13)

relaciones4_5 = (usuario4, usuario5)
relaciones4_6 = (usuario4, usuario6)
relaciones4_7 = (usuario4, usuario7)
relaciones4_8 = (usuario4, usuario8)
relaciones4_9 = (usuario4, usuario9)
relaciones4_10 = (usuario4, usuario10)
relaciones4_11 = (usuario4, usuario11)
relaciones4_12 = (usuario4, usuario12)
relaciones4_13 = (usuario4, usuario13)

relaciones5_6 = (usuario5, usuario6)
relaciones5_7 = (usuario5, usuario7)
relaciones5_8 = (usuario5, usuario8)
relaciones5_9 = (usuario5, usuario9)
relaciones5_10 = (usuario5, usuario10)
relaciones5_11 = (usuario5, usuario11)
relaciones5_12 = (usuario5, usuario12)
relaciones5_13 = (usuario5, usuario13)

relaciones6_7 = (usuario6, usuario7)
relaciones6_8 = (usuario6, usuario8)
relaciones6_9 = (usuario6, usuario9)
relaciones6_10 = (usuario6, usuario10)
relaciones6_11 = (usuario6, usuario11)
relaciones6_12 = (usuario6, usuario12)

relaciones7_8 = (usuario7, usuario8)
relaciones7_9 = (usuario7, usuario9)
relaciones7_10 = (usuario7, usuario10)
relaciones7_11 = (usuario7, usuario11)
relaciones7_12 = (usuario7, usuario12)

relaciones8_9 = (usuario8, usuario9)
relaciones8_10 = (usuario8, usuario10)
relaciones8_11 = (usuario8, usuario11)
relaciones8_12 = (usuario8, usuario12)

publicacion1_1 = (usuario1, "1", [])
publicacion1_2 = (usuario1, "2", [usuario1])
publicacion1_3 = (usuario1, "3", [usuario2])
publicacion1_4 = (usuario1, "4", [usuario1, usuario2])
publicacion1_5 = (usuario1, "5", [usuario2, usuario3, usuario4])

publicacion2_1 = (usuario2, "1", [usuario1, usuario2])
publicacion2_2 = (usuario2, "2", [usuario1])
publicacion2_3 = (usuario2, "3", [usuario1])
publicacion2_4 = (usuario2, "4", [usuario1, usuario4, usuario12])
publicacion2_5 = (usuario2, "5", [usuario1, usuario3, usuario4])

publicacion3_1 = (usuario3, "1", [usuario2, usuario5])
publicacion3_2 = (usuario3, "2", [usuario2, usuario5, usuario6, usuario4])
publicacion3_3 = (usuario3, "3", [usuario2, usuario5, usuario6])
publicacion3_4 = (usuario3, "4", [usuario2, usuario5, usuario3])

publicacion4_1 = (usuario4, "1", [ usuario4])
publicacion4_2 = (usuario4, "2", [usuario4])
publicacion4_3 = (usuario4, "3", [usuario4])

--Test Catedra


usuario1C = (1, "Juan")
usuario2C = (2, "Natalia")
usuario3C = (3, "Pedro")
usuario4C = (4, "Mariela")
usuario5C = (5, "Natalia")

relacion1_2C = (usuario1C, usuario2C)
relacion1_3C = (usuario1C, usuario3C)
relacion1_4C = (usuario4C, usuario1C) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3C = (usuario3C, usuario2C)
relacion2_4C = (usuario2C, usuario4C)
relacion3_4C = (usuario4C, usuario3C)

publicacion1_1C = (usuario1C, "Este es mi primer post", [usuario2C, usuario4C])
publicacion1_2C = (usuario1C, "Este es mi segundo post", [usuario4C])
publicacion1_3C = (usuario1C, "Este es mi tercer post", [usuario2C, usuario5C])
publicacion1_4C = (usuario1C, "Este es mi cuarto post", [])
publicacion1_5C = (usuario1C, "Este es como mi quinto post", [usuario5C])

publicacion2_1C = (usuario2C, "Hello World", [usuario4C])
publicacion2_2C = (usuario2C, "Good Bye World", [usuario1C, usuario4C])

publicacion3_1C = (usuario3C, "Lorem Ipsum", [])
publicacion3_2C = (usuario3C, "dolor sit amet", [usuario2C])
publicacion3_3C = (usuario3C, "consectetur adipiscing elit", [usuario2C, usuario5C])

publicacion4_1C = (usuario4C, "I am Alice. Not", [usuario1C, usuario2C])
publicacion4_2C = (usuario4C, "I am Bob", [])
publicacion4_3C = (usuario4C, "Just kidding, i am Mariela", [usuario1C, usuario3C])


usuariosAC = [usuario1C, usuario2C, usuario3C, usuario4C]
relacionesAC = [relacion1_2C, relacion1_4C, relacion2_3C, relacion2_4C, relacion3_4C]
publicacionesAC = [publicacion1_1C, publicacion1_2C, publicacion2_1C, publicacion2_2C, publicacion3_1C, publicacion3_2C, publicacion4_1C, publicacion4_2C]
redAC = (usuariosAC, relacionesAC, publicacionesAC)

usuariosBC = [usuario1C, usuario2C, usuario3C, usuario5C]
relacionesBC = [relacion1_2C, relacion2_3C]
publicacionesBC = [publicacion1_3C, publicacion1_4C, publicacion1_5C, publicacion3_1C, publicacion3_2C, publicacion3_3C]
redBC = (usuariosBC, relacionesBC, publicacionesBC)
