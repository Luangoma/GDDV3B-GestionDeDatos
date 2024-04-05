let $procedenciasUnicas := distinct-values(doc("../Tablas en XML/personaje.xml")//Personaje/Procedencia/text())
for $procedencia in $procedenciasUnicas
order by $procedencia
return fn:concat($procedencia," ",fn:round(avg(doc("../Tablas en XML/personaje.xml")//Personaje[Procedencia = $procedencia]/PF)))