for $nombre in doc("../Tablas en XML/hab_estrella.xml")/Habs_Estrella/Hab_Estrella
where $nombre/Coste_PM>4
return $nombre/Nombre/text()