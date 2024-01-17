pedido(c1,4,fecha(30,10,2016),pedro,['pizza','empanada','empanada']).
pedido(c2,3,fecha(30,10,2016),laura,['locro','locro','empanada']).
pedido(c3,4,fecha(30,10,2016),lisa,['tamal','empanada']).
pedido(c4,2,fecha(2,11,2016),lisa,['flan','tamal','tamal']).
pedido(c5,3,fecha(2,11,2016),fiamma,['locro','locro','tamal','empanada','flan']).
pedido(c6,1,fecha(2,11,2016),fiamma,['empanada','empanada','empanada','empenada','flan']).

plato(1,pizza,75).
plato(2,empanada,20).
plato(3,locro,80).
plato(4,tamal,30).
plato(5,flan,40).

regla1(Lista):-findall(Nombre,
                      pedido(_,_,fecha(_,11,2016),Nombre,_),
                      ListAux),sort(ListAux,Lista).

regla2(Mesero,Mesas):-findall(Mesa,
                              pedido(_,Mesa,_,Mesero,_),
                             ListAux),length(ListAux,Mesas).

regla3(CodP,Lista):-findall((Codp,Precio),
                           (pedido(Codp,_,_,_,Comidas),
                            plato(CodP,Plato,Precio),member(Plato,Comidas)),
                            ListAux),sort(ListAux,Lista).
