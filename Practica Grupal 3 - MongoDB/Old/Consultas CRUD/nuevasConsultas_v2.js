////// CONSULTAS FRECUENTES //////

// Sandro
// 1)Las descripciones de los ítems del jugador con id X (cuando se abre el inventario deben aparecer todos los ítems).
db.Jugadores.find({ "_id": 'player01' }, {Items: 1, _id: 0 }); //no estoy seguro de cómo hacerlo con un array.

// Sandro
// 2)Número de puntos corazón de cada personaje (aparecen en la UI del juego, por lo que debe accederse al dato constantemente).
db.Jugadores.find({ "_id": 'player01' }, {PC: 1, _id: 0});

// Sandro
// 3)Número de monedas del personaje (aparece en la UI).
db.Jugadores.find({ "_id": 'player01' }, {Monedas: 1, _id: 0});

// Blanca
// 4) Número de puntos estrella del jugador con id X (aparece en la barra azul de la UI).
db.Jugadores.find({"_id":"player03"}, {"_id":0, "PE": 1})

// Blanca
// 5)Índice de defensa y ataque de cada enemigo, ya que se accederá cada vez que haya una batalla.
db.Enemigos.find({}, {"_id": 0, "PuntosAtaque": 1, "PuntosDefensa": 1})

// Blanca
// 6)Salud del enemigo con nombre X (en la batalla se irá comprobando continuamente).
db.Enemigos.find({"Nombre":"Koopa Troopa"}, {"_id": 0, "PuntosCorazon": 1})

// Mario
// 7)El número de ayudantes que tiene una batalla (cada vez que haya una batalla se accederá al dato para generar los enemigos secundarios
db.Batallas.find({"_id":"battle001"},{"_id":0, "NumAyuda":1})

// Mario
// 8)Número de puntos flor de los que dispone el jugador.
db.Jugadores.find({"_id":"player01"},{_id:0,"PF":1})

// Mario
// 9)Ordenar las habilidades estrella por coste de menor a mayor.
db.Jugadores.aggregate([
  {
    $unwind: "$HabEstrella" // Descomponer en documentos individuales
  },
  {
    $project: {
      _id: 0,
      Nombre: "$HabEstrella.Nombre",
      CostePE: "$HabEstrella.CostePE",
      Descripcion: "$HabEstrella.Descripcion"
    }
  },
  {
    $sort: {
      CostePE: 1
    }
  }
])

// Luis
// 10)Comprobar si el número de puntos estrella que tiene el jugador es inferior a 8 (7 + 1 la que dan por defecto).
// (cuando llega a 8 y el jugador va a la puerta milenaria se abre)
db.Jugadores.find({PE:{$lt:7}},{_id:0,PE:1})

// Luis
// 11)Comprobar si el número de puntos nivel es 100 para subir de nivel al personaje y volver a poner los puntos nivel a 0.
db.Jugadores.find({$PuntosNivel:{$gt:100}},{_id:1})

// Luis
// 12)Las habilidades que tiene el personaje acompañante del jugador.
db.Acompañantes.find({},{_id:0,Habilidades:1})

// Luis
// 13)Saber si el enemigo es un jefe (boss) o no.
db.Enemigos.find({},{_id:0,EsBoss:1})

// Luis
// 14)Consultar el lugar de procedencia de un personaje acompañante, para saber donde se puede conseguir.
db.Acompañantes.find({},{_id:0,Procedencia:1})

// Luis
// 15)Consultar el estado del jugador.
db.Jugadores.find({},{_id:0,Estado:1})