for $Lugar in doc("../Tablas en XML/lugar.xml")//Lugar
where $Lugar/number(Enemigos) > 10 and $Lugar/number(Npc) > 5
return $Lugar/Nombre/text()