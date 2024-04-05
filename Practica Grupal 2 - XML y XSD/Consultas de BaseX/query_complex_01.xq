for $items in doc("../Tablas en XML/items.xml")//item
for $jugador_items in doc("../Tablas en XML/jugador_items.xml")//Jugador_Items[items_Nombre = $items/nombre]
where $items/nombre = "Concha Protectora"
and $jugador_items/@Jugador_ID = "4"
return $items/descripcion/text()