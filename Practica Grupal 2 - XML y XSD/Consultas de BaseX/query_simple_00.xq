for $Jugador in doc("../Tablas en XML/jugador.xml")//Jugador
where $Jugador/number(Monedas) > 50 and $Jugador/number(PF) > 20
return $Jugador