module TestAbrilI where

import Test.HUnit
import Solucion

run = runTestTT testSuite10

testSuite1 = test [
    " no tiene usuarios" ~: (nombresDeUsuarios redC) ~?= [],
    " tiene 1 usuario" ~: (nombresDeUsuarios redA) ~?= ["Alice"],
    " tiene más de 1 usuario" ~: (nombresDeUsuarios redB) ~?= ["Alice","Patricio","Charlie", "David", "Eva"],
    " tiene muchos usuarios" ~: (nombresDeUsuarios redD) ~?= ["Alice", "Charlie", "Eva", "Grace", "Isabel", "Katherine", "Mia", "Olivia", "Quinn", "Samuel"]
 ]

testSuite2 = test [
   " no tiene amigos" ~: (amigosDe redA usuario1) ~?= [],
   " tiene 1 amigo" ~: (amigosDe redD usuario15) ~?= [usuario5],
   " tiene varios amigos" ~: (amigosDe redD usuario5) ~?= [usuario1, usuario9, usuario15]
   
 ]

testSuite3 = test [
    " no tiene amigos cantidad" ~: (cantidadDeAmigos redA usuario1) ~?= 0,
    " tiene 1 amigo cantidad" ~: (cantidadDeAmigos redD usuario15) ~?= 1,
    " tiene 3 amigos" ~: (cantidadDeAmigos redD usuario5) ~?= 3,
    " tiene 7 amigos" ~: (cantidadDeAmigos redD usuario7) ~?= 7,
    " tiene 11 amigos" ~: (cantidadDeAmigos redE usuario1) ~?= 11
    
 ]

testSuite4 = test [
    " red con 1 usuario" ~: (usuarioConMasAmigos redA) ~?= usuario1,
    " usuarios con misma cantidadDeAmigos, devuelve el ultimo" ~: (usuarioConMasAmigos redB) ~?= usuario5,
    " hay un usuarioConMasAmigos" ~: (usuarioConMasAmigos redD) ~?= usuario7
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
   " no le gusta ninguna publicación" ~: (publicacionesQueLeGustanA redD usuario7 ) ~?= [],
   " le gusta una publicación" ~: (publicacionesQueLeGustanA redD usuario5) ~?= [publicacion2_1],
   " le gustan varias publicaciones" ~: (publicacionesQueLeGustanA redE usuario1) ~?= [publicacion2_1, publicacion2_2, publicacion2_3, publicacion2_4, publicacion2_5],
   " autolike" ~: (publicacionesQueLeGustanA redB usuario2) ~?= [publicacion2_1]
 ]

testSuite8 = test [
   " no tienen ningun like en común" ~: (lesGustanLasMismasPublicaciones redF usuario3 usuario4 ) ~?= False,
   " tienen un like en común" ~: (lesGustanLasMismasPublicaciones redF usuario4 usuario6) ~?= False,
   " les gustan las mismas publicaciones" ~: (lesGustanLasMismasPublicaciones redF usuario2 usuario5) ~?= True, 
   " a un usuario no le gusta ninguna y al otro sí" ~: (lesGustanLasMismasPublicaciones redF usuario1 usuario2) ~?= False
 ] 

testSuite9 = test [
   " no tienen ningún seguidor fiel" ~: (tieneUnSeguidorFiel redD usuario1) ~?= False,
   " tiene un seguidor fiel" ~: (tieneUnSeguidorFiel redB usuario2) ~?= True,
   " tiene más de un seguidor fiel" ~: (tieneUnSeguidorFiel redF usuario3) ~?= True,
   " el usuario no tiene ninguna publicacion" ~: (tieneUnSeguidorFiel redF usuario1) ~?= False
 ]

testSuite10 = test [
   " no hay cadena de amigos" ~: (existeSecuenciaDeAmigos redG usuario5 usuario7) ~?= False,
   " amigos de amigo" ~: (existeSecuenciaDeAmigos redG usuario2 usuario4) ~?= True,
   " un usuario no tiene amigos" ~: (existeSecuenciaDeAmigos redG usuario1 usuario4) ~?= False,
   " tienen más de un amigo en común" ~: (existeSecuenciaDeAmigos redG usuario6 usuario9) ~?= True,
   " cadena de amigos extensa" ~: (existeSecuenciaDeAmigos redB usuario1 usuario5) ~?= True

 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


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
usuario13 = (13, "Mia")
usuario14 = (14, "Nathan")
usuario15 = (15, "Olivia")
usuario16 = (16, "Patrick")
usuario17 = (17, "Quinn")
usuario18 = (18, "Rachel")
usuario19 = (19, "Samuel")
usuario20 = (20, "Taylor")
  
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
relaciones1_14 = (usuario1, usuario14)
relaciones1_15 = (usuario1, usuario15)
relaciones1_16 = (usuario1, usuario16)
relaciones1_17 = (usuario1, usuario17)
relaciones1_18 = (usuario1, usuario18)
relaciones1_19 = (usuario1, usuario19)
relaciones1_20 = (usuario1, usuario20)

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
relaciones2_14 = (usuario2, usuario14)
relaciones2_15 = (usuario2, usuario15)
relaciones2_16 = (usuario2, usuario16)
relaciones2_17 = (usuario2, usuario17)
relaciones2_18 = (usuario2, usuario18)
relaciones2_19 = (usuario2, usuario19)
relaciones2_20 = (usuario2, usuario20)

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
relaciones3_14 = (usuario3, usuario14)
relaciones3_15 = (usuario3, usuario15)
relaciones3_16 = (usuario3, usuario16)
relaciones3_17 = (usuario3, usuario17)
relaciones3_18 = (usuario3, usuario18)
relaciones3_19 = (usuario3, usuario19)
relaciones3_20 = (usuario3, usuario20)

relaciones4_5 = (usuario4, usuario5)
relaciones4_6 = (usuario4, usuario6)
relaciones4_7 = (usuario4, usuario7)
relaciones4_8 = (usuario4, usuario8)
relaciones4_9 = (usuario4, usuario9)
relaciones4_10 = (usuario4, usuario10)
relaciones4_11 = (usuario4, usuario11)
relaciones4_12 = (usuario4, usuario12)
relaciones4_13 = (usuario4, usuario13)
relaciones4_14 = (usuario4, usuario14)
relaciones4_15 = (usuario4, usuario15)
relaciones4_16 = (usuario4, usuario16)
relaciones4_17 = (usuario4, usuario17)
relaciones4_18 = (usuario4, usuario18)
relaciones4_19 = (usuario4, usuario19)
relaciones4_20 = (usuario4, usuario20)

relaciones5_6 = (usuario5, usuario6)
relaciones5_7 = (usuario5, usuario7)
relaciones5_8 = (usuario5, usuario8)
relaciones5_9 = (usuario5, usuario9)
relaciones5_10 = (usuario5, usuario10)
relaciones5_11 = (usuario5, usuario11)
relaciones5_12 = (usuario5, usuario12)
relaciones5_13 = (usuario5, usuario13)
relaciones5_14 = (usuario5, usuario14)
relaciones5_15 = (usuario5, usuario15)
relaciones5_16 = (usuario5, usuario16)
relaciones5_17 = (usuario5, usuario17)
relaciones5_18 = (usuario5, usuario18)
relaciones5_19 = (usuario5, usuario19)
relaciones5_20 = (usuario5, usuario20)

relaciones6_7 = (usuario5, usuario7)
relaciones6_8 = (usuario5, usuario8)
relaciones6_9 = (usuario5, usuario9)
relaciones6_10 = (usuario6, usuario10)
relaciones6_11 = (usuario6, usuario11)
relaciones6_12 = (usuario6, usuario12)
relaciones6_13 = (usuario6, usuario13)
relaciones6_14 = (usuario6, usuario14)
relaciones6_15 = (usuario6, usuario15)
relaciones6_16 = (usuario6, usuario16)
relaciones6_17 = (usuario6, usuario17)
relaciones6_18 = (usuario6, usuario18)
relaciones6_19 = (usuario6, usuario19)
relaciones6_20 = (usuario6, usuario20)

relaciones7_8 = (usuario7, usuario8)
relaciones7_9 = (usuario7, usuario9)
relaciones7_10 = (usuario7, usuario10)
relaciones7_11 = (usuario7, usuario11)
relaciones7_12 = (usuario7, usuario12)
relaciones7_13 = (usuario7, usuario13)
relaciones7_14 = (usuario7, usuario14)
relaciones7_15 = (usuario7, usuario15)
relaciones7_16 = (usuario7, usuario16)
relaciones7_17 = (usuario7, usuario17)
relaciones7_18 = (usuario7, usuario18)
relaciones7_19 = (usuario7, usuario19)
relaciones7_20 = (usuario7, usuario20)

relaciones8_9 = (usuario8, usuario9)
relaciones8_10 = (usuario8, usuario10)
relaciones8_11 = (usuario8, usuario11)
relaciones8_12 = (usuario8, usuario12)
relaciones8_13 = (usuario8, usuario13)
relaciones8_14 = (usuario8, usuario14)
relaciones8_15 = (usuario8, usuario15)
relaciones8_16 = (usuario8, usuario16)
relaciones8_17 = (usuario8, usuario17)
relaciones8_18 = (usuario8, usuario18)
relaciones8_19 = (usuario8, usuario19)
relaciones8_20 = (usuario8, usuario20)

publicacion1_1 = (usuario1, "1", [])
publicacion1_2 = (usuario1, "2", [usuario1])
publicacion1_3 = (usuario1, "3", [usuario2])
publicacion1_4 = (usuario1, "4", [usuario1, usuario2])
publicacion1_5 = (usuario1, "5", [usuario2, usuario3, usuario4])

publicacion2_1 = (usuario2, "1", [usuario1, usuario2])
publicacion2_2 = (usuario2, "2", [usuario1])
publicacion2_3 = (usuario2, "3", [usuario1])
publicacion2_4 = (usuario2, "4", [usuario1, usuario5, usuario19])
publicacion2_5 = (usuario2, "5", [usuario1, usuario3, usuario4])

publicacion3_1 = (usuario3, "1", [usuario2, usuario5])
publicacion3_2 = (usuario3, "2", [usuario2, usuario5, usuario6, usuario4])
publicacion3_3 = (usuario3, "3", [usuario2, usuario5, usuario6])
publicacion3_4 = (usuario3, "4", [usuario2, usuario5, usuario3])

redA = ([usuario1], [], [publicacion1_1])

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5]
relacionesB = [relaciones1_2, relaciones1_5, relaciones2_3, relaciones3_4, relaciones4_5]
publicacionesB = [publicacion1_1, publicacion1_2, publicacion2_1]
redB = (usuariosB, relacionesB, publicacionesB)

redC = ([],[],[])

publicacionesD = [publicacion2_4, publicacion1_1]
relacionesD = [relaciones1_3, relaciones1_5, relaciones5_9, relaciones7_11, relaciones5_15, relaciones1_7, relaciones3_7, relaciones7_9, relaciones7_13, relaciones7_19, relaciones7_17]
usuariosD = [usuario1, usuario3, usuario5, usuario7, usuario9, usuario11, usuario13, usuario15, usuario17, usuario19]
redD = (usuariosD, relacionesD, publicacionesD)

publicacionesE = [publicacion1_1, publicacion2_1, publicacion2_2, publicacion2_3, publicacion2_4, publicacion2_5]
usuariosE = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12]
relacionesE = [relaciones1_2, relaciones1_3, relaciones1_4, relaciones1_5, relaciones1_6, relaciones1_7, relaciones1_8, relaciones1_9, relaciones1_10, relaciones1_11, relaciones1_12] 
redE = (usuariosE, relacionesE, publicacionesE) 

usuariosF = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6]
relacionesF = [relaciones1_2, relaciones3_4, relaciones3_6, relaciones4_5]
publicacionesF = [publicacion3_1, publicacion3_2, publicacion3_3, publicacion3_4]
redF = (usuariosF, relacionesF, publicacionesF)

usuariosG = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9]
relacionesG = [relaciones2_3, relaciones3_4, relaciones3_5, relaciones6_7, relaciones6_8, relaciones7_9, relaciones8_9]
redG = (usuariosG, relacionesG, [])