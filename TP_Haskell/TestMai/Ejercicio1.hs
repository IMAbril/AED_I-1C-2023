module Test22 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

    "Caso de prueba 1" ~: nombresDeUsuarios redA ~?= ["Melina", "Ignacio", "Ian", "Iara","Antonio","Malvina","Luisa","Daniel","Luis"]

  , "Caso de prueba 1" ~: nombresDeUsuarios redB ~?= ["Melina", "Ignacio", "Ian", "Iara","Antonio","Malvina","Luisa","Daniel","Luis","Patricia"]

  , "Caso de prueba 2" ~: nombresDeUsuarios ([], [], []) ~?= []

  , "Caso de prueba 3" ~: nombresDeUsuarios ([usuario1], [], []) ~?= ["Melina"]

  , "Caso de prueba 4" ~: nombresDeUsuarios ([usuario1, usuario1], [], []) ~?= ["Melina"]

  , "Caso de prueba 5" ~: nombresDeUsuarios ([usuario1, usuario2, usuario1], [], []) ~?= ["Ignacio", "Melina"] 
  
  , "Caso de prueba 6" ~: nombresDeUsuarios ([usuario2, usuario1, usuario2], [], []) ~?= ["Melina", "Ignacio"] 
  ,
  ]

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



usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9]
redA = (usuariosA, [], [])

usuariosB = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7, usuario8, usuario9,usuario10]
redB = (usuariosB, [], [])

