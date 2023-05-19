module Solucion where

-- Completar con los datos del grupo

-- Nombre de Grupo: Lambdadería
-- Integrante 1: Tomás Canosa Moreno, tomimoreno03@gmail.com, 310/22
-- Integrante 2: Maira Daniela Godoy, godoymaira0@gmail.com, 256/23
-- Integrante 3: Abril Milagros Palacín, abrilmpalacin@gmail.com, 905/19
-- Integrante 4: Abril Magali Ibarra, abrilibarra3095@gmail.com, 945/23

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])

-- FUNCIONES BÁSICAS --

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

-- EJERCICIOS --

--toma la lista de usuarios de la red social y la pasa como argumento a la función proyectarNombres para obtener la lista de nombres de usuarios. 
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios (us, _, _) = proyectarNombres us 


--busca recursivamente las relaciones de la red social 
--y agrega a la lista de amigos aquellos usuarios que estén relacionados directamente con el usuario dado
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (_, [], _) _ = []
amigosDe (us, (u1, u2):rs, ps) u
    | sonElMismoUsuario u u1 = u2 : siguienteAmigo
    | sonElMismoUsuario u u2 = u1 : siguienteAmigo
    | otherwise = siguienteAmigo
          where siguienteAmigo =   amigosDe (us, rs, ps) u   


--utiliza la función 'amigosDe' para obtener la lista de amigos del usuario en la red social 
--luego utiliza la función 'longitud' para contar la cantidad de elementos en esa lista, que representa la cantidad de amigos del usuario en la red social.
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red u)


--Hace recursión sobre la lista de usuarios, comparando la cantidad de amigos de cada usuario con la cantidad de amigos del usuario acumulado hasta el momento
--Finaliza una vez que  resultado acumulado sea el usuario con mayor cantidad de amigos 
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos (us, rs, ps) = usuarioConMasAmigos' (tail us) (head us)
  where
    usuarioConMasAmigos' [] res = res
    usuarioConMasAmigos' (u:us) res
      | cantidadDeAmigos (us, rs, ps) u > cantidadDeAmigos (us, rs, ps) res = usuarioConMasAmigos' us u
      | otherwise = usuarioConMasAmigos' us res


--determina si el usuario con más amigos en la red social tiene más de 10 amigos, devolviendo True de ser el caso, caso contrario,False
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = (cantidadDeAmigos red (usuarioConMasAmigos red) > 10)


--filtra las publicaciones de una red social y devuelve únicamente aquellas publicaciones que fueron realizadas por un usuario específico
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (_, _, []) _ = []
publicacionesDe (us, rs, p:ps) u | u == (usuarioDePublicacion p) = p : siguientesPublicaciones
                                 | otherwise = siguientesPublicaciones
                                 where siguientesPublicaciones = publicacionesDe (us, rs, ps) u


--filtra las publicaciones de una red social y devuelve únicamente aquellas publicaciones en las que el usuario especificado se encuentra en la lista de likes(publicaciones que le gustan)
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (_, _, []) _ = []
publicacionesQueLeGustanA (us, rs, (autor, texto, likes):ps) u | pertenece u likes = (autor, texto, likes) : siguientesPubs 
                                                               | otherwise = siguientesPubs
                                                               where siguientesPubs =publicacionesQueLeGustanA (us, rs, ps) u


--Compara las listas de publicaciones que le gustan a dos usuarios en una red social y determina si son exactamente iguales
--lo que implica que a ambos usuarios les gustan las mismas publicaciones.
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)


-- verifica si un usuario tiene al menos un seguidor fiel comparando las publicaciones del usuario con las publicaciones que le gustan al primer usuario en la red social
-- Si no se encuentra un seguidor fiel en esa comparación, se realiza la misma verificación en la siguiente red social, eliminando al primer usuario. Esto hasta encontrarlo o finalice la lista
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel ([], _, _) _ = False
tieneUnSeguidorFiel red u | contiene (publicacionesDe red u) (publicacionesQueLeGustanA red usuarioActual) = True
                          | otherwise = tieneUnSeguidorFiel siguienteRed u
                           where
                            usuarioActual = head (usuarios red)
                            siguienteRed = (tail (usuarios red), relaciones red, publicaciones red)

--verifica si existe una secuencia de amigos que conecta al usuario de inicio con el usuario objetivo en una red social dada
--la Aux realiza una búsqueda recursiva de la secuencia de amigos, comprobando si el usuario objetivo pertenece a los amigos actuales
--Si no se encuentra una secuencia válida, se continúa la búsqueda con los siguientes amigos.
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red uInicio uObjetivo = existeSecuenciaDeAmigosAux red [uInicio] uObjetivo []

-- AUXILIARES --

--1
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres ((_, nombre):us) = sacarRepetidos(nombre : proyectarNombres us)

sacarRepetidos :: Eq a => [a] -> [a]
sacarRepetidos [] = []
sacarRepetidos (x:xs)
    | pertenece x xs = sacarRepetidos xs
    | otherwise = x : sacarRepetidos xs

--2
sonElMismoUsuario :: Usuario -> Usuario -> Bool
sonElMismoUsuario user1 user2 = idDeUsuario user1 == idDeUsuario user2

--3
longitud :: [t] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs 

--7
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) = e == x || pertenece e xs

--8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] l2 = False
mismosElementos l1 [] = False
mismosElementos (x:xs) l2 = pertenece x l2 && mismosElementos xs (sacarUnaVez x l2)

sacarUnaVez :: (Eq t) => t -> [t] -> [t]
sacarUnaVez e [] = []
sacarUnaVez e (x:xs) | e == x = xs
                     | otherwise = x : sacarUnaVez e xs

--9
contiene :: (Eq t) => [t] -> [t] -> Bool
contiene [] [] = True
contiene [] l2 = True
contiene l1 [] = False
contiene (x:xs) l2 = pertenece x l2 && contiene xs l2

--10
existeSecuenciaDeAmigosAux :: RedSocial -> [Usuario] -> Usuario -> [Usuario] -> Bool
existeSecuenciaDeAmigosAux _ [] _ _ = False
existeSecuenciaDeAmigosAux red (u:us) uObjetivo usVisitados | pertenece uObjetivo amigosActuales = True
                                                            | otherwise = existeSecuenciaDeAmigosAux red siguientesAmigos uObjetivo (u:usVisitados)
                                                             where
                                                             amigosActuales = u : amigosDe red u
                                                             siguientesAmigos = sacarTodos (us ++ amigosActuales) usVisitados
sacarTodos :: (Eq t) => [t] -> [t] -> [t]
sacarTodos [] l2 = []
sacarTodos l1 [] = l1
sacarTodos (x:xs) l2 | pertenece x l2 = sacarTodos xs l2
                     | otherwise = x : sacarTodos xs l2
