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
nombresDeUsuarios (us, _, _) = proyectarNombres us 

-- describir qué hace la función: .....
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe (_, [], _) _ = []
amigosDe (us, (u1, u2):rs, ps) u
    | sonElMismoUsuario u u1 = u2 : siguienteAmigo
    | sonElMismoUsuario u u2 = u1 : siguienteAmigo
    | otherwise = siguienteAmigo
          where siguienteAmigo =   amigosDe (us, rs, ps) u   

-- describir qué hace la función: .....
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red u = longitud (amigosDe red us)

-- describir qué hace la función: .....
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos (us, rs, ps) = usuarioConMasAmigos' (tail us) (head us)
  where
    usuarioConMasAmigos' [] res = res
    usuarioConMasAmigos' (u:us) res
      | cantidadDeAmigos (us, rs, ps) u > cantidadDeAmigos (us, rs, ps) res = usuarioConMasAmigos' us u
      | otherwise = usuarioConMasAmigos' us res

-- describir qué hace la función: .....
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = (cantidadDeAmigos red (usuarioConMasAmigos red) > 10)

-- describir qué hace la función: .....
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe (_, _, []) _ = []
publicacionesDe (us, rs, p:ps) u | u == (usuarioDePublicacion p) = p : siguientesPublicaciones
                                 | otherwise = siguientesPublicaciones
                                 where siguientesPublicaciones = publicacionesDe (us, rs, ps) us

-- describir qué hace la función: .....
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA (_, _, []) _ = []
publicacionesQueLeGustanA (us, rs, (autor, texto, likes):ps) u | pertenece u likes = (autor, texto, likes) : siguientesPubs 
                                                               | otherwise = siguientesPubs
                                                               where siguientesPubs =publicacionesQueLeGustanA (us, rs, ps) u
-- describir qué hace la función: .....
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red u1 u2 = mismosElementos (publicacionesQueLeGustanA red u1) (publicacionesQueLeGustanA red u2)

-- describir qué hace la función: .....
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel ([], _, _) _ = False
tieneUnSeguidorFiel red u | contiene (publicacionesDe red u) (publicacionesQueLeGustanA red usuarioActual) = True
                          | otherwise = tieneUnSeguidorFiel siguienteRed user
                           where
                            usuarioActual = head (usuarios red)
                            siguienteRed = (tail (usuarios red), relaciones red, publicaciones red)

-- describir qué hace la función: .....
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red uInicio uObjetivo = existeSecuenciaDeAmigosAux red [uInicio] uObjetivo []

--Auxiliares

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