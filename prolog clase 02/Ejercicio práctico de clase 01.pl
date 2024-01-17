localidad(1,'Córdoba').
localidad(2,'Carlos Paz').
localidad(3,'Mar Chiquita').

inmueble(111,domicilio('Paraná',100,1),20,departamento(0,200)).
inmueble(222,domicilio('Maipú',200,1),30,casa(30)).
inmueble(333,domicilio('Salta',200,2),30,departamento(2,150)).
inmueble(444,domicilio('Paraná',100,1),25,departamento(1,250)).
inmueble(555,domicilio('Perú',200,2),35,casa(25)).
inmueble(666,domicilio('Perú',200,2),35,casa(30)).

listaAlquilados([111,222,444]).


%Punto1)
regla1(Cod,Alq):-(inmueble(Cod,_,SupCub,departamento(_,Exp)),Alq is SupCub*20.0+Exp);(inmueble(Cod,_,SupCub,casa(SupDescub)),Alq is SupCub*20.0+SupDescub*10.0).

%Punto2)
regla2(Cod,Alq):-inmueble(Cod,domicilio(_,_,CodLoc),_,_),regla1(Cod,AlqAux),
	((CodLoc=:=1,Alq is AlqAux-AlqAux*0.1);(CodLoc=\=1,Alq is AlqAux +AlqAux*0.20)).

%Punto3)
regla3(Ref):-inmueble(CodInm,_,SupCub,casa(_)),listaAlquilados(L1),not(member(CodInm,L1)),SupCub=<Ref,!.

%Punto4)
regla4(ListaOrd):-findall(Alq,(inmueble(CodInm,_,_,_),listaAlquilados(L1),member(CodInm,L1),regla2(CodInm,Alq)),L2),sort(L2,L3),
	reverse(L3, ListaOrd).


inmuebleLoc(Cod, Loc) :- inmueble(Cod, domicilio(_,_,CodLoc),_,_), localidad(CodLoc,Loc). 











