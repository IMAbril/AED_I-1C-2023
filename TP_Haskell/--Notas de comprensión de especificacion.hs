--Notas de comprensión de especificaciones 

--Ejercicio 1--

{-
proyectarNombres toma una secuencia de usuarios (tuplas con id y nombre de usuario) sin ninguna restricción. Devuelve una lista de datos de tipo String cuyas caracteristicas son:

*No tiene elementos repetidos.

*Contiene a los nombres (coord 2 del tipo Usuario) de todos los elementos de la lista de entrada (us).

*Para todos los elementos(nombres) de la lista de salida (res) existe un elemento de la lista de entrada (us) cuya coordenada 2 (nombre) tiene el mismo valor.

En resumen, proyectarNombres devuelve la lista de las segundas coordenadas de la lista de entrada (parámetro us).

///////////////////////////////////////////////////////////////////

nombresDeUsuarios toma una red social valida y devuelve una lista de Strings cuyas características son:
*Tiene los mismos elementos que la lista devuelta por proyectarNombres cuando se le pasa la lista de usuarios de la red social valida.

En resumen, nombresDeUsuarios devuelve una lista de los nombres de los usuarios de la red social valida que toma como parámetro.

-}

--Ejercicio 2--

{-
amigosDe toma una red social valida y un usuario valido que pertenece a esa red y devuelve una lista de usuarios cuyas características son:
*Contiene a la segunda coordenada de la relacion de la red donde la primer coordenada es el usuario valido.
*Contiene a la primer coordenada de la relacion de la red donde la segunda coordenada es el usuario valido.
*Todos los elementos de la lista pertenecen a una relacion de la red y además están relacionados con el usuario valido.

En resumen, amigosDe devuelve una lista de todos los usuarios de cierta red relacionados con cierto usuario en esa red. 
-}

--Ejercicio 3--
{-
cantidadDeAmigos toma una red social valida y un usuario valido que pertenece a esa red. Devuelve la longitud de la lista amigosDe que toma de parametros a la red social dada y al usuario valido dado.
-}

--Ejercicio 4--
{-
usuarioConMasAmigos toma una red social valida cuya lista de usuarios tenga elementos y devuelve un usuario cuyas características son:
*El usuario pertenece a la lista de usuarios de la red.
*cantidadDeAmigos del usuario en la red social dada es menor o igual a la cantidadDeAmigos de los demás elementos de la lista de usuarios de la red. 
-}

--Ejercicio 5--
{-
estaRobertoCarlos toma una red social valida y devuelve true si en la lista de usuarios de la red hay un usuario tal que cantidadDeAmigos del usuario en la red sea mayor a 1 000 000 (0 10)
-}

--Ejercicio 6--
{-
publicacionesDe toma una red social valida y un usuario valido de la red. Devuelve una lista de elementos de tipo Publicacion cuyas características (De la lista) son:
*Contiene a las publicaciones de la red cuyos autor (usuarioDePublicacion) es el usuario valido.
*Todos los elementos tienen de autor al usuario valido y pertenecen a la lista de publicaciones de la red.
*No tiene elementos repetidos
-}

--Ejercicio 7--
{-
publicacionesQueLeGustanA toma una red social valida y un usuario valido de esa red. Devuelve una lista de publicaciones con las siguientes características:
* Todos sus elementos (Publicación) pertenecen a la red y tienen al usuario valido en su lista de likesDePublicacion.
* Todos sus elementos son distintos.
-}

--Ejercicio 8--
{-
lesGustanLasMismasPublicaciones toma una red social valida y 2 usuarios validos de esa red. Devuelve un valor booleano el cual es True si se cumplen las siguientes condiciones:
*publicacionesQueLeGustanA red us1 tiene los mismos elementos que publicacionesQueLeGustanA red us2
-}

--Ejercicio 9--
{-
tieneUnSeguidorFiel toma una red social valida y un usuario valido de esa red. Devuelve un booleano el cual es true si se cumplen las siguientes condiciones:
*Existe un usuario2 de la red, distinto al usuario valido pasado, que está en la lista de likesDePublicacion de todas las publicaciones en la red del usuario valido siempre que la lista de publicaciones en la red del usuario valido tenga elementos (longitud > 0) 
-}

--Ejercicio 10--
{-
existeSecuenciaDeAmigos toma una red social valida y 2 usuarios validos de la red. Devuelve un valoor booleano el cual es true si se cumplen las siguientes condiciones:
*Existe una lista de usuarios en la red, de longitud mayor a 2 donde hay CadenaDeAmigos, que empieza con el usuario valido 1 y termina con el usuario valido 2. 
-}