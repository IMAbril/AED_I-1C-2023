module Test22 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

   "le gusta una cosa"        ~: publicacionesQueLeGustanA redA usuario1 ~?= [publicacion2_1]

  , "le gusta tres cosas"     ~: publicacionesQueLeGustanA redA usuario2 ~?= [publicacion1_1, publicacion1_3,publicacion2_2]

  , "le gusta dos cosas"      ~: publicacionesQueLeGustanA redA usuario3 ~?= [publicacion1_3,publicacion2_2]

  , "no le gusta nada"        ~: publicacionesQueLeGustanA redA usuario7 ~?= []

  , "red vacia"               ~: publicacionesQueLeGustanA ([], [], []) usuario1 ~?= []

  , "caso le gusta casi todo" ~: publicacionesQueLeGustanA redA usuario5 ~?= [publicacion1_1, publicacion1_2,publicacion1_3,publicacion1_5,publicacion2_1,publicacion2_2]
  ]


-- Ejemplo de datos de prueba
usuario1  = (1, "Melina")
usuario2  = (2, "Ignacio")
usuario3  = (3, "Ian")
usuario4  = (4, "Iara")
usuario5  = (5, "Antonio")
usuario6  = (6, "Malvina")
usuario7  = (7, "Luisa")

publicacion1_1 = (usuario1, "publi1", [usuario2, usuario4, usuario5])
publicacion1_2 = (usuario1, "publi2", [usuario4,usuario5])
publicacion1_3 = (usuario1, "publi3", [usuario2, usuario3,usuario5])
publicacion1_4 = (usuario1, "publi4", [])
publicacion1_5 = (usuario1, "publi5", [usuario5, usuario6])
publicacion2_1 = (usuario2, "publi6", [usuario1, usuario4, usuario5])
publicacion2_2 = (usuario2, "publi7", [usuario2, usuario3,usuario5])



usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
publicacionesA = [publicacion1_1,publicacion1_2,publicacion1_3,publicacion1_4,publicacion1_5,publicacion2_1,publicacion2_2]
redA = (usuariosA, [], publicacionesA)



