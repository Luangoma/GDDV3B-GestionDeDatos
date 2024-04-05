for $coste in doc("../Tablas en XML/hab_estrella.xml")//Hab_Estrella
group by $c:= $coste/Coste_PM
let $appareances := count($coste/Coste_PM)
return element Hab_Estrella{$appareances, distinct-values($coste/Coste_PM)}/text()