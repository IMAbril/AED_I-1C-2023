module Test88 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

    "tiene seguidor fiel" ~: tieneUnSeguidorFiel redA usuario1 ~?= True

  , "tiene un like unicamente" ~: tieneUnSeguidorFiel redA usuario2 ~?= False

  , "no tiene likes" ~: tieneUnSeguidorFiel redA usuario3 ~?= False

  , "no tienelikes2" ~: tieneUnSeguidorFiel redA usuario4 ~?= False

  , "tiene en almenos 2 pero no todas" ~: tieneUnSeguidorFiel redA usuario5 ~?= False
  ]


-- Ejemplo de datos de prueba
usuario1  = (1, "Melina")
usuario2  = (2, "Ignacio")
usuario3  = (3, "Ian")
usuario4  = (4, "Iara")
usuario5  = (5, "Antonio")
usuario6  = (6, "Malvina")
usuario7  = (7, "Luisa")

publicacion1_1 = (usuario1, "publi1", [usuario2])
publicacion1_2 = (usuario1, "publi2", [usuario2])
publicacion1_3 = (usuario1, "publi2.1",[usuario2])
publicacion2_1 = (usuario2, "publi3", [usuario1])
publicacion2_2 = (usuario2, "publi4", [])
publicacion3_1 = (usuario3, "publi5", [])
publicacion4_1 = (usuario4, "publi6", [])
publicacion5_1 = (usuario5, "publi7", [usuario7])
publicacion5_2 = (usuario5, "publi8", [usuario7])
publicacion5_3 = (usuario5, "publi9", [])

usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
publicacionesA = [publicacion1_1,publicacion1_2,publicacion1_3,publicacion2_1,publicacion2_2,publicacion3_1,publicacion4_1,publicacion5_1,publicacion5_2,publicacion5_3]
redA = (usuariosA, [], publicacionesA)

