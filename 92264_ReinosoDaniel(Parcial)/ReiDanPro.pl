pedido(1,111,30000000,domicilio(salta,250,1),['television por cable','wi fi']).
pedido(2,111,20000000,domicilio(avColon,101,2),['wi fi']).
pedido(3,222,15000000,domicilio(sanMartin,1321,1),['internet por cable']).
pedido(4,333,12000000,domicilio(avellaneda,3213,2),['internet por cable','wi fi']).
pedido(5,333,25000000,domicilio(nueveDeJulio,2123,1),['television por cable']).
pedido(6,111,20000000,domicilio(urquiza,1203,3),['television satelital']).

tecnico(111,olazabal,juliana).
tecnico(222,luchetti,gertrudis).
tecnico(333,manfredi,luiggi).

descuento(1,centro,10).
descuento(2,alberdi,20).
descuento(3,cofico,15).
descuento(4,maipu,20).

regla1(Lista):-findall(Barrio,
                       (descuento(Cod,Barrio,_),pedido(_,_,_,domicilio(_,_,Cod),_)),
                       ListAux),sort(ListAux,Lista).

regla2(Dni):-pedido(_,_,Dni,_,_),!.

regla3(Cod,Nombre,Apellido,Monto):-pedido(Cod,CodT,_,domicilio(_,_,CodB),Servicios),
    tecnico(CodT,Nombre,Apellido),
    descuento(CodB,_,Porc),
    length(Servicios,Cantidad),
    Monto is (Cantidad*500)*(1-Porc/100),!.
