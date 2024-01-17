pedido(c1,4,fecha(30,10,2016),pedro,['pinza','tenaza']).
pedido(c2,3,fecha(30,10,2016),laura,['brocha','martillo']).
pedido(c3,4,fecha(30,10,2016),lisa,['yunque']).
pedido(c4,2,fecha(2,11,2016),lisa,['brocha','tenaza']).
pedido(c5,3,fecha(2,11,2016),fiamma,['martillo','pinza']).
pedido(c6,1,fecha(2,11,2016),fiamma,['brocha']).

articulo(1,pinza,75).
articulo(2,tenaza,20).
articulo(3,brocha,80).
articulo(4,martillo,30).
articulo(5,yunque,40).

regla1(Lista):-findall(Vendedor,pedido(_,_,fecha(_,11,2016),Vendedor,_),ListAux),sort(ListAux,Lista).

regla2(Vendedor,Cantidad):-findall(Cod,
                                   pedido(Cod,_,_,Vendedor,_),
                                   Lista),
    length(Lista,Cantidad).

regla3(CodA,Lista):-findall((CodP,Precio),
                            (pedido(CodP,_,_,_,Articulos),articulo(CodA,Articulo,Precio),not(member(Articulo,Articulos))),
                           ListAux),sort(ListAux,Lista).



