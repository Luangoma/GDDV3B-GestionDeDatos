// Sandro
// Jugadores que pueden subir de nivel
db.Jugadores.createIndex({"PuntosNivel":1}, {name:"SubirNivel", partialFilterExpresion:{PuntosNivel:{$gt:100}}});
// Reduce el campo de busqueda a los jugadores que  
db.Jugadores.createIndex({"PE":1}, {name:"AbrirPuertaMilenaria", partialFilterExpresion:{PE:{$lt:8}}});
// Jugadores que tienen un estado concreto
db.Jugadores.createIndex({"_id":1, "Estado":1});
// Jugadores que tienen un gran numero de puntos flor y de monedas
db.Jugadores.createIndex({"Monedas": 1, "PF": 1},{name:"ConsultaSimple1", partialFilterExpresion:{Monedas:{$gt:50}, PF:{$gt:30}}});
// Jugadores que tienen de habilidad estralla 1
db.Jugadores.createIndex({"HabEstrella.CostePE":1});

// Blanca
// Reduce la busqueda a los enemigos que son debiles
db.Enemigos.createIndex({"PuntosAtaque":1, "PuntosDefensa":1})
// Reduce la busqueda a los enemigos que son boss
db.Enemigos.createIndex({"Nombre": 1},{name:"EsBoss", partialFilterExpression:{EsBoss:true}})
// Evita nombres duplicados
db.Enemigos.createIndex({"Nombre":1}, {"unique":true})

// Mario
// Mejorar eficiencia de las busquedaas por procedencia
db.Acompañantes.createIndex({ "Procedencia": 1 });

// Luis
// Duelos de gran duracion:
db.Batallas.createIndex({NumTurnos:1,NumAyuda:1},{name:"Duelo_LargaDuracion",partialFilterExpression:{NumTurnos:{$gt:5},NumAyuda:0}});
// Grandes enfrentamientos de duracion minima:
db.Batallas.createIndex({NumTurnos:1,NumAyuda:1},{name:"GranBatalla",partialFilterExpression:{NumTurnos:{$gt:4},NumAyuda:{$gt:4}}})

// COLECCION LUGAR PENDIENTE