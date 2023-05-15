module TestDeSolucion where

import Test.HUnit
import Solucion3

run = runTestTT tests

tests = test [
    " autolike" ~: (publicacionesQueLeGustanA redA usuario1) ~?= [publicacion1_1, publicacion2_2, publicacion4_1],
    " noLeGustaNada"~: (publicacionesQueLeGustanA redA usuario2) ~?= [],
    " leGustanTodasLasPublicaciones" ~: (publicacionesQueLeGustanA redA usuario3) ~?= [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1,publicacion3_2,publicacion4_1,publicacion4_2],
    " leGustanAlgunas" ~: (publicacionesQueLeGustanA redA usuario4) ~?= [publicacion1_1, publicacion2_2],
    " tieneUnUsuario" ~: (usuarioConMasAmigos redC) ~?= usuario1,

 ]
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

{-

 leGustanTodasLasPublicaciones ~: (nombresDeUsuarios redA) ~?= ["Juan","Natalia","Pedro","Mariela"]


-}

usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

publicacion1_1 = (usuario1, "Este es mi primer post", [usuario4, usuario1, usuario3])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario3])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario3])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4, usuario3])

publicacion3_1 = (usuario3, "Lorem Ipsum", [usuario3])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario3])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario3])
publicacion4_2 = (usuario4, "I am Bob", [usuario3])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])

redC = ([usuario1], [], [])

usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]
redA = (usuariosA, relacionesA, publicacionesA)

usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]
redB = (usuariosB, relacionesB, publicacionesB)


{--tests = test [
" noLesGustanLasMismasPublicaciones" ~: (nombresDeUsuarios redA) ~?= ["Juan","Natalia","Pedro","Mariela"]
" lesGustanLasMismasPublicaciones" ~: (nombresDeUsuarios redA) ~?= ["Juan","Natalia","Pedro","Mariela"]
" lesGustabAlgunasPublicaciones"
" lesGustaPublicacionesQueNoSo"
]
--}