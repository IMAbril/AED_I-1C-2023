module TestBase where
import Test.HUnit
import Funcionestp

run = runTestTT tests

tests = test [

   " Amigos directos" ~: (existeSecuenciaDeAmigos redA usuario1 usuario2) ~?= True,

   " Amigos a través de un amigo" ~: (existeSecuenciaDeAmigos redA usuario1 usuario4) ~?= True,

   " Misma persona" ~: (existeSecuenciaDeAmigos redA usuario1 usuario1) ~?= True,

   " No estan relacionados " ~: (existeSecuenciaDeAmigos redA usuario1 usuario5) ~?= False,

   " No estan relacionados2" ~: (existeSecuenciaDeAmigos redA usuario1 usuario9) ~?= False,

   "Secuencia extensa de amigos" ~: (existeSecuenciaDeAmigos redB usuario1 usuario9) ~?= True

 
  ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

-- Ejemplos

usuario1  = (1, "Melina")
usuario2  = (2, "Ignacio")
usuario3  = (3, "Ian")
usuario4  = (4, "Iara")
usuario5  = (5, "Antonio")
usuario6  = (6, "Malvina")
usuario7  = (7, "luisa")
usuario8  = (8, "Daniel")
usuario9  = (9, "Luis")
usuario10 = (10, "Patricia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion2_4 = (usuario2, usuario4)
relacion2_3 = (usuario2, usuario3)
relacion3_4 = (usuario3, usuario4)
relacion4_5 = (usuario4, usuario5)
relacion5_6 = (usuario5, usuario6)
relacion6_7 = (usuario6, usuario7)
relacion7_8 = (usuario7, usuario8)
relacion8_9 = (usuario8, usuario9)

usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6,usuario7, usuario8,usuario9]
relacionesA = [relacion1_2, relacion1_3, relacion3_4, relacion5_6]
redA = (usuariosA, relacionesA,[])

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7,usuario8,usuario9]
relacionesB = [relacion1_2, relacion2_3,relacion3_4,relacion4_5,relacion5_6,relacion6_7,relacion7_8, relacion8_9]
redB = (usuariosB, relacionesB,[])
