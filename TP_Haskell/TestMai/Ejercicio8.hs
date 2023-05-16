module Test66 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

    "Caso de prueba 1" ~: lesGustanLasMismasPublicaciones redA usuario3 usuario4 ~?= False

  , "Caso de prueba 2" ~: lesGustanLasMismasPublicaciones redA usuario2 usuario3 ~?= False

  , "Caso de prueba 3" ~: lesGustanLasMismasPublicaciones redA usuario2 usuario4  ~?= True

  , "Caso de prueba 4" ~: lesGustanLasMismasPublicaciones redA usuario5 usuario2 ~?= True

  , "Caso de prueba 5" ~: lesGustanLasMismasPublicaciones redA usuario6 usuario7 ~?= False
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
publicacion1_2 = (usuario1, "publi2", [usuario2,usuario5,usuario4])
publicacion1_3 = (usuario1, "publi3", [usuario2, usuario3,usuario5,usuario4])
publicacion1_4 = (usuario1, "publi4", [])
publicacion1_5 = (usuario1, "publi5", [usuario5, usuario6,usuario2,usuario4])
publicacion2_1 = (usuario2, "publi6", [usuario2, usuario4, usuario5])
publicacion2_2 = (usuario2, "publi7", [usuario2, usuario3,usuario5,usuario4])



usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
publicacionesA = [publicacion1_1,publicacion1_2,publicacion1_3,publicacion1_4,publicacion1_5,publicacion2_1,publicacion2_2]
redA = (usuariosA, [], publicacionesA)

