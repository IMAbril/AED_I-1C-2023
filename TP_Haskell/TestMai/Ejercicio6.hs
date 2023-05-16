module Test22 where
import Test.HUnit
import Unificado

run = runTestTT tests

tests = test [

    "tiene tres publis"         ~: publicacionesDe redA usuario1 ~?= [publicacion1_1, publicacion1_2, publicacion1_3]

  , "tiene dos publis"          ~: publicacionesDe redA usuario2 ~?= [publicacion2_1,publicacion2_2]
  
  , "tiene una publi"           ~: publicacionesDe redA usuario3 ~?= [publicacion3_1]
 
  , "usuario sin publicaciones" ~: publicacionesDe redA usuario6 ~?= []

  ]

-- Ejemplo de datos de prueba
usuario1  = (1, "Melina")
usuario2  = (2, "Ignacio")
usuario3  = (3, "Ian")
usuario4  = (4, "Iara")
usuario5  = (5, "Antonio")
usuario6  = (6, "Malvina")
usuario7  = (7, "Luisa")

publicacion1_1 = (usuario1, "publi1", [])
publicacion1_2 = (usuario1, "publi2", [])
publicacion1_3 = (usuario1, "publi2.1",[])
publicacion2_1 = (usuario2, "publi3", [])
publicacion2_2 = (usuario2, "publi4", [])
publicacion3_1 = (usuario3, "publi5", [])
publicacion4_1 = (usuario4, "publi6", [])
publicacion5_1 = (usuario5, "publi7", [])



usuariosA = [usuario1, usuario2, usuario3, usuario4, usuario5, usuario6, usuario7]
publicacionesA = [publicacion1_1,publicacion1_2,publicacion1_3,publicacion2_1,publicacion2_2,publicacion3_1,publicacion4_1,publicacion5_1]
redA = (usuariosA,[], publicacionesA)
