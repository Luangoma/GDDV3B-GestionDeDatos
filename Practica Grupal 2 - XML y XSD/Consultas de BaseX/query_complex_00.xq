for $enemigo in doc("../Tablas en XML/enemigos.xml")//Enemigo
let $lugarEnemigo := doc("../Tablas en XML/lugar_enemigo.xml")//Lugar_Enemigo[@Enemigo_ID = $enemigo/@Enemigo_ID]
where $enemigo/@Vuela = "1"
and $lugarEnemigo/@Nombre_Lugar = "Llanura Estelar"
return $enemigo/Nombre/text()