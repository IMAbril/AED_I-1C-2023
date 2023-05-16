module Test22 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

    " prueba 1"     ~: usuarioConMasAmigos redA ~?= usuario5

  , " prueba 2"     ~: usuarioConMasAmigos redB ~?= usuario2

  , "unico usuario" ~: usuarioConMasAmigos redC ~?= usuario1

  , "dos usuarios"  ~: usuarioConMasAmigos redD  ~?= [[usuario1,usuario2]] -- como la funcion devuelve un Usuario, no una lista, esto no compila
  ]                                                                       -- Arreglar y preguntar

-- Ejemplo de datos de prueba
usuario1  = (1, "Melina")
usuario2  = (2, "Ignacio")
usuario3  = (3, "Ian")
usuario4  = (4, "Iara")
usuario5  = (5, "Antonio")
usuario6  = (6, "Malvina")
usuario7  = (7, "Luisa")
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
relacion3_2 = (usuario3, usuario2)
relacion2_6 = (usuario2, usuario6)
relacion5_8 = (usuario5, usuario8)
relacion5_9 = (usuario5, usuario9)
relacion5_7 = (usuario5, usuario7)
relacion2_5 = (usuario2, usuario5)

usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9]
relacionesA = [relacion1_2, relacion5_9, relacion5_7, relacion5_6]
redA = (usuariosA, relacionesA, [])

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9]
relacionesB = [relacion1_2, relacion2_3, relacion3_4, relacion6_7, relacion7_8, relacion8_9, relacion2_6, relacion5_8]
redB = (usuariosB, relacionesB, [])

usuariosC =[usuario1]
relacionesC =[]
redC =(usuariosC,relacionesC,[])

usuariosD =[usuario1,usuario2]
relacionesD =[relacion1_2]
redD =(usuariosD,relacionesD,[])
