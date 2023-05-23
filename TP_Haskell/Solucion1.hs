module Solucion1 where 
-- Completar con los datos del grupo
--
-- Nombre de Grupo: Lambdadería
-- Integrante 1: Abril Magali Ibarra, abrilibarra3095@gmail.com, 945/23
-- Integrante 2: NOmbre Apellido, email, LU
-- Integrante 3: Nombre Apellido, email, LU
-- Integrante 4: Nombre Apellido, email, LU

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios

nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red | redSocialValida red = proyectarNombres (usuarios red)
                      | otherwise = []

--Funciones auxiliares para nombresDeUsuarios

proyectarNombres :: [Usuario] -> [String]
proyectarNombres (u:us) | (u:us) == [u] = (snd u : [])  
                        | sinRepetidos (u:us) = (snd u : (proyectarNombres us))
                        | otherwise = proyectarNombres (eliminarRepetidos (u:us))

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos (e:list) | sinRepetidos (e:list) = e:list
                           | pertenece e list = eliminarRepetidos list
                           | otherwise = e : (eliminarRepetidos list)
--Fin funciones auxiliares para nombresDeUSuarios

-- nombresDeUsuarios: Dada una red social valida, devuelve una lista de los nombres de los usuarios de la red.

amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe red u | usuarios red == [] = []
               | (u /= u2) && (relacionadosDirecto u u2 red ) = u2 : (amigosDe sinU2 u) 
               | otherwise = amigosDe sinU2 u
               where u2 = head (usuarios red)
                     sinU2 = (tail (usuarios red), relaciones red, publicaciones red ) 

-- describir qué hace la función: .....
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)

--Funcion auxiliar para cantidadDeAmigos
longitud :: (Eq t) => [t]->Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
--Fin funcion auxiliar para cantidadDeAmigos

-- describir qué hace la función: .....
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos red = compararAmigos red (usuarios red)
--Funcion auxiliar para usuarioConMasAmigos
compararAmigos :: RedSocial -> [Usuario] -> Usuario
compararAmigos red [] = undefined
compararAmigos red (u:us) | (u:us) == [u] = u
                          | cantidadDeAmigos red u <= cantidadDeAmigos red (head us) = compararAmigos red us
                          | otherwise = compararAmigos red (u: (tail us)) 

-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = (cantidadDeAmigos red (usuarioConMasAmigos red) > 10)
-- describir qué hace la función: .....
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red u = publicacionesDeAux (publicaciones red) u

--Auxiliar de publicacionesDe
publicacionesDeAux :: [Publicacion] -> Usuario -> [Publicacion]
publicacionesDeAux [] u = []
publicacionesDeAux (p:pubs) u | (usuarioDePublicacion p == u) = p: (publicacionesDeAux pubs u)
                  | otherwise = publicacionesDeAux pubs u
--Fin Auxiliar

-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red u = pubsQueLeGustanAAUX (publicaciones red) u

pubsQueLeGustanAAUX :: [Publicacion] -> Usuario -> [Publicacion]
pubsQueLeGustanAAUX [] u = []
pubsQueLeGustanAAUX (p:pubs) u | pertenece u (likesDePublicacion p) = p : (pubsQueLeGustanAAUX pubs u)
                               | otherwise = pubsQueLeGustanAAUX pubs u 

-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

-- describir qué hace la función: .....
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red u = existeSeguidorFiel red (usuarios red) u

existeSeguidorFiel :: RedSocial -> [Usuario] -> Usuario -> Bool
existeSeguidorFiel red us autor | us == [] = False
                                | leGustanTodasLasPublisDe (publicacionesDe red autor) (head us) = True
                                | otherwise = existeSeguidorFiel red (tail us) autor  

leGustanTodasLasPublisDe :: [Publicacion] -> Usuario -> Bool
leGustanTodasLasPublisDe pubs u | pubs == [] = True
                                | likesDePublicacion (head pubs) == [] = False
                                | pertenece u (likesDePublicacion (head pubs)) = True && (leGustanTodasLasPublisDe (tail pubs) u) 
                                | otherwise = False  

existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos = undefined

--Predicados Auxiliares
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs 

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] l2 = False
mismosElementos l1 l2 = (pertenece (head l1) l2) && (mismosElementos (tail l1) (tail l2) )

empiezaCon :: (Eq t) => t -> [t] -> Bool
empiezaCon e [] = False
empiezaCon e l = head l == e

terminaCon :: (Eq t) => t -> [t] -> Bool
terminaCon e [] = False
terminaCon e [x] = e == x
terminaCon e (x:xs) = terminaCon e xs

sinRepetidos :: (Eq t) => [t] -> Bool
sinRepetidos [] = True
sinRepetidos (x:xs) = not(pertenece x xs) && sinRepetidos xs

sonDeLaRed :: RedSocial -> [Usuario] -> Bool
sonDeLaRed red [] = True
sonDeLaRed red us = (pertenece (head us) (usuarios red) ) && sonDeLaRed red (tail us)

relacionadosDirecto :: Usuario -> Usuario -> RedSocial -> Bool
relacionadosDirecto u1 u2 red = pertenece (u1, u2) (relaciones red) || pertenece (u2, u1) (relaciones red)

cadenaDeAmigos :: [Usuario] -> RedSocial -> Bool
cadenaDeAmigos [user1,user0] red = (relacionadosDirecto user1 user0 red)
cadenaDeAmigos us red = relacionadosDirecto (head us) (head (tail us)) red && cadenaDeAmigos (tail us) red

-- REVISAR
noHayPublicacionesRepetidas :: [Publicacion] -> Bool
noHayPublicacionesRepetidas pubs = sinRepetidos pubs
{-Hay que revisar si noHayPublicacionesRepetidas realmente cumple la especificación-}

usuariosLikeValidos :: [Usuario] -> [Usuario] -> Bool
usuariosLikeValidos [] us = True
usuariosLikeValidos (user:usl) us = (pertenece user us) && (usuariosLikeValidos usl us)  

usuariosDelLikeDePublicacionSonUsuariosDeRed :: [Usuario] -> [Publicacion] -> Bool
usuariosDelLikeDePublicacionSonUsuariosDeRed us [] = True
usuariosDelLikeDePublicacionSonUsuariosDeRed us pubs = (pertenece (usuarioDePublicacion (head pubs)) us ) && (usuariosDelLikeDePublicacionSonUsuariosDeRed us (tail pubs))

publicacionesValidas :: [Usuario] -> [Publicacion] -> Bool
publicacionesValidas us pubs = (noHayPublicacionesRepetidas pubs) && (usuariosDelLikeDePublicacionSonUsuariosDeRed us pubs)

--Revisar
noHayRelacionesRepetidas :: [Relacion] -> Bool
noHayRelacionesRepetidas rels = sinRepetidos rels
{-Hay que revisar si noHayRelacionesRepetidas realmente cumple la especificación-}

relacionesAsimetricas :: [Relacion] -> Bool
relacionesAsimetricas [] = True
relacionesAsimetricas (rel:rels) =  not (pertenece (snd rel, fst rel) (rel:rels)) && relacionesAsimetricas rels   

usuariosDeRelacionValidos :: [Usuario] -> [Relacion] -> Bool
usuariosDeRelacionValidos us [] = True
usuariosDeRelacionValidos us (rel:rels) = (pertenece (fst rel) us) && (pertenece (snd rel) us) && (usuariosDeRelacionValidos us rels)

relacionesValidas :: [Usuario] -> [Relacion] -> Bool 
relacionesValidas us rels = (usuariosDeRelacionValidos us rels) && (relacionesAsimetricas rels) && (noHayRelacionesRepetidas rels)

--Revisar 
noHayIdsRepetidos :: [Usuario] -> Bool
noHayIdsRepetidos us = sinRepetidos us  
{-Revisar si noHayIdsRepetidos cumple la especificación-}

--Alternativa noHayIdsRepetidos (rebuscada pero cumple la especificación) 
a_noHayIdsRepetidos :: [Usuario] -> Bool
a_noHayIdsRepetidos [] = True
a_noHayIdsRepetidos (u:us) = not (pertenece u us) && a_noHayIdsRepetidos us
    where id = idDeUsuario u  

--Consultar si hay que tener en cuenta los nombres vacios ej "  " como longitud de longitud >0 (en caso de que no, este código cumple)
usuarioValido :: Usuario -> Bool
usuarioValido u = (idDeUsuario u > 0)&& ((nombreDeUsuario u) /= "")

usuariosValidos :: [Usuario] -> Bool
usuariosValidos [] = True
usuariosValidos (u:us) = (usuarioValido u) && (noHayIdsRepetidos (u:us)) && (usuariosValidos us)

redSocialValida :: RedSocial -> Bool
redSocialValida red = (usuariosValidos (usuarios red)) && (relacionesValidas (usuarios red) (relaciones red)) && (publicacionesValidas (usuarios red) (publicaciones red))

