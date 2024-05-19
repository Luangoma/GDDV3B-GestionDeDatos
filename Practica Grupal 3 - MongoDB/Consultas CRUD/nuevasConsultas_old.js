CONSULTAS FRECUENTES
//SANDRO
1)Las descripciones de los ítems del jugador con id X (cuando se abre el inventario deben aparecer todos los ítems).                        -S
db.collection('Jugadores').find({ "@id": '1' }, {Items: 1, _id: 0 }); //no estoy seguro de cómo hacerlo con un array.

//SANDRO
2)Número de puntos corazón de cada personaje (aparecen en la UI del juego, por lo que debe accederse al dato constantemente).               -S
db.jugador.find({ "@id": '1' }, {PC: 1, _id: 0});

//SANDRO
3)Número de monedas del personaje (aparece en la UI).                                                                                       -S
db.jugador.find({ "@id": '1' }, {Monedas: 1, _id: 0});   


//BLANCA
4)Número de puntos estrella del jugador con id X (aparece en la barra azul de la UI).                                                       -B
db.jugador.find({"@id":"4"}, {"_id":0, "PE": 1})

//BLANCA
5)Índice de defensa y ataque de cada enemigo, ya que se accederá cada vez que haya una batalla.                                             -B
db.enemigos.find({}, {"_id": 0, "Puntos_ataque": 1, "Puntos_defensa": 1})

//BLANCA
6)Salud del enemigo con id X (en la batalla se irá comprobando continuamente).                                                              -B
db.enemigos.find({}, {"_id": 0, "Puntos_corazon": 1})'¡


// Mario
7)El número de ayudantes que tiene una batalla (cada vez que haya una batalla se accederá al dato para generar los enemigos secundarios).   -M
db.batalla.find({"@Jugador_ID":"1"},{_id:0,"num_Ayudantes":1})

// Mario
8)Número de puntos flor de los que dispone el jugador.                                                                                      -M
db.jugador.find({"@id":"1"},{_id:0,"PE":1})

// Mario
9)Ordenar las habilidades estrella por coste de menor a mayor.                                                                              -M
db.hab_estrella.find({}, { Coste_PM: 1, _id: 0 }).sort({ Coste_PM: 1 })

// Luis
10)Comprobar si el número de puntos estrella que tiene el jugador es inferior a 8 (7 + la que dan por defecto).                             -L
(cuando llega a 8 y el jugador va a la puerta milenaria se abre)
db.jugador.find({},{"_id":0,PE:1})
db.jugador.find({PE:{$lt:7}},{"_id":0,PE:1})

// Luis
11)Comprobar si el número de puntos nivel es 100 para subir de nivel al personaje y volver a poner los puntos nivel a 0.                    -L
db.jugador.find({PuntosNivel:{$gt:100}},{true})
Revisar si devuelve el dato correcto

// Luis
12)Las habilidades que tiene el personaje acompañante del jugador.                                                                          -L
//In progress
//Reanudar cuando esten los datos insertados

// Luis
13)Saber si el enemigo es un jefe (boss) o no.                                                                                              -L
db.enemigos.find({},{_id:0,"@Es_Boss":1})

// Luis
14)Consultar el lugar de procedencia de un personaje acompañante, para saber donde se puede conseguir.                                      -L
db.acompañante.find({},{_id:0,Procedencia:1})

// Luis
15)Consultar el estado del jugador.                                                                                                         -L
db.jugador.find({},{_id:0,Estado:1})
