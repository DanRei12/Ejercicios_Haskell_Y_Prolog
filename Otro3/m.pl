venta(1,perezNoelia,fecha(02,04,2014),1,210,libro(programacion,prenticeHall)).
venta(2,martiManuel,fecha(10,05,2014),2,110,revista(2012,3)).
venta(3,lunaRebeca,fecha(11,05,2014),1,200,libro(programacion,editPlanet)).
venta(4,luqueClaudio,fecha(11,05,2014),1,85,revista(2013,1)).
venta(5,martinezTomas,fecha(03,06,2014),4,190,libro(estadistica,trillas)).

especialidad(1,sistemas).
especialidad(2,quimica).
especialidad(3,industrial).
especialidad(4,mecanica).

regla1(Especialidad,Cantidad):-findall(Cod,
                              (especialidad(CodP,Especialidad),venta(Cod,_,_,CodP,_,_)),
                              Lista),length(Lista,Cantidad).

regla2(Importe):-venta(_,_,_,_,Precio,_),Precio > Importe,!.

regla3(CodV,Descr):-((venta(CodV,_,_,CodEs,_,revista(2012,_)),especialidad(CodEs,Descr));(venta(CodV,_,_,CodE,_,libro(programacion,_)),especialidad(CodE,Descr))).

