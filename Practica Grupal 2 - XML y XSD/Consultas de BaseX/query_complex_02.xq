for $enemigo in doc("../Tablas en XML/enemigos.xml")//Enemigo
let $batalla := doc("../Tablas en XML/batallas.xml")//Batalla[$enemigo/@Enemigo_ID=@Enemigo_ID]
where $batalla and $batalla/@Jugador_ID="1"
return $enemigo/Nombre/text()