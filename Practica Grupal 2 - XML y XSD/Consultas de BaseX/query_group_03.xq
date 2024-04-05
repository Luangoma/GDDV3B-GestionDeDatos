for $p in doc("../Tablas en XML/personaje.xml")//Personaje
let $h := doc("../Tablas en XML/habilidad.xml")//Habilidad[$p/Nombre = @Personaje_nom]
order by $p/Nombre
return fn:concat($p/Nombre/text()," ",$p/PF/text()," ",sum($h/Ind_atq))