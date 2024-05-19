//// Sandro
// Simple 1
// Todos los jugadores con más de 50 monedas y 20 puntos flor.
db.Jugadores.find({Monedas:{$gt:50}, PF:{$gt:30}})

// Compuesta 1
// El nombre de los enemigos que vuelan que vivan en X región.
db.Enemigos.aggregate([
{
$lookup: {
from: "Lugares",
localField: "Region.$id",
foreignField: "_id",
as: "Enemigos_Lugares"
}},
{$unwind:"$Enemigos_Lugares"},
{
$match: { "Enemigos_Lugares.Nombre": "Llanura Estelar"
}},
{
$match: { "Vuela": true
}},
{$project:{_id:0,Nombre:1}}])

//// Mario
// Simple 2
//Todas las habilidades estrella que consuman mas de 4 puntos estrella
db.Jugadores.aggregate([
  {
    $unwind: "$HabEstrella" // Descomponer el array "HabEstrella" en documentos individuales
  },
  {
    $match: {
      "HabEstrella.CostePE": { $gt: 4 } // Filtrar habilidades estrella con un coste mayor a 1
    }
  },
  {
    $project: {
      _id: 0,
      Nombre: "$HabEstrella.Nombre",
      CostePE: "$HabEstrella.CostePE",
      Descripcion: "$HabEstrella.Descripcion"
    }
  }
])

// Compuesta 2
// La descripcion de un item cuyo nombre sea x del jugador con id x
db.Jugadores.aggregate([
  {
    $match: { "_id": "player01" } // Seleccionar id jugador
  },
  {
    $unwind: "$Items" // Descomponer array
  },
  {
    $match: { "Items.Nombre": "Seta" } // Filtrar por nombre
  },
  {
    $project: {
      _id: 0,
      Descripcion: "$Items.Descripcion"
    }
  }
])


//// Blanca
// Simple 3
db.Lugares.find({$and: [{"Enemigos":{$gt:10}}, {"NPCs":{$gt:5}}]}, {"_id": 0, "Nombre": 1})

// Agrupada 1
//Agrupar las habilidades estrella según su coste y mostrar cuantas habilidades hay de cada coste
db.Jugadores.aggregate([
    { $unwind: "$HabEstrella" },
    {
        $group: {
            _id: "$HabEstrella.CostePE",
            count: { $sum: 1 }
        }
    }
])


//// Luis
// Compuesta 3
// Mostrar el nombre de los enemigos que se han enfrentado a1 jugador con id X
//-SELECT e.Nombre FROM Enemigo e JOIN Batalla b ON e.Enemigo_ID = b.Enenigo_ID WHERE b.Jugador_1D = 1;
db.Batallas.aggregate({$match:{"Jugador.$id":'player02'}},
{$lookup:{from:'Enemigos',localField:'Enemigo.$id',foreignField:'_id',as:'enemigo_info'}},{$unwind:'$enemigo_info'},
{$project:{_id:0,Nombre:'$enemigo_info.Nombre'}});

// Agrupada 2
// Ca1cu1ar la media de PF de los personajes segun su procedencia
//-SELECT Procedencia, round(avg(PC),2) FROM Personaje GROUP BY Procedencia;
db.Acompañantes.aggregate([{$group:{_id:'$Procedencia',avgPC:{$avg:'$PC'}}},{$project:{Procedencia:'$_id',avgPC:{$round:['$avgPC',2]}}}]);