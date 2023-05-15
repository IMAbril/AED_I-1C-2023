--toma la lista de usuarios de la red social y la pasa como argumento a la función proyectarNombres para obtener la lista de nombres de usuarios. 
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (us, _, _) = proyectarNombres us 

--se encarga de filtrar los usuarios inválidos y de eliminar duplicados
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres ((_, nombre):us) = sinRepetidos(nombre : proyectarNombres us)
------------------------------------------------------------------------------------
--EJ2

amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (_, [], _) _ = []
amigosDe (usuarios, (u1, u2):relaciones, publicaciones) user
    | sonElMismoUsuario user u1 = u2 : siguienteAmigo
    | sonElMismoUsuario user u2 = u1 : siguienteAmigo
    | otherwise = siguienteAmigo
          where siguienteAmigo =   amigosDe (usuarios, relaciones, publicaciones) user   

--EJ3
cantidadDeAmigos :: RedSocial -> Usuario -> Integer
cantidadDeAmigos redSocial usuario = longitud (amigosDe redSocial usuario)

longitud :: [a] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs 

--EJ4

usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos (us, rs, ps) = usuarioConMasAmigos' (tail us) (head us)
  where
    usuarioConMasAmigos' [] res = res
    usuarioConMasAmigos' (u:us) res
      | cantidadDeAmigos (us, rs, ps) u > cantidadDeAmigos (us, rs, ps) res = usuarioConMasAmigos' us u
      | otherwise = usuarioConMasAmigos' us res

--EJ5
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = (cantidadDeAmigos red (usuarioConMasAmigos red) > 10)

--EJ6
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (_, _, []) _ = []
publicacionesDe (us, rels, pub:pubs) user | user == (usuarioDePublicacion pub) = pub : siguientesPublicaciones
                                          | otherwise = siguientesPublicaciones
                                         where siguientesPublicaciones = publicacionesDe (us, rels, pubs) user

--EJ7
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (_, _, []) _ = []
publicacionesQueLeGustanA (us, rels, (author, texto, likes):pubs) user | pertenece user likes = (author, texto, likes) : siguientesPubs 
                                                                       | otherwise = siguientesPubs
                                                                      where siguientesPubs =publicacionesQueLeGustanA (us, rels, pubs) user

--EJ8
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

--EJ9


