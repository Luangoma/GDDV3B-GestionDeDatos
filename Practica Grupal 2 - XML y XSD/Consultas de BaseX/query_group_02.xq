for $jugi in doc("..//Tablas en XML/jugador_items.xml")//Jugador_Items
order by xs:integer($jugi/@Jugador_ID)
return fn:concat($jugi/@Jugador_ID," ",$jugi/num_Items)