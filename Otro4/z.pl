reserva(1,1,7,contado(500),['custodia de valores'],300).
reserva(2,3,5,credito(6),['alquiler de bicicletas','niñera'],250).
reserva(3,2,6,contado(300),['custodia de valores','alquiler de bicicletas','guia de turismo'],350).

interes(3,10).
interes(6,15).
interes(12,25).

temporada(1,alta).
temporada(2,media).
temporada(3,baja).

regla1(Lista):-findall(CodR,
                       (reserva(CodR,CodT,_,contado(_),_,_),(CodT > 1,CodT < 4)),
                      ListAux),sort(ListAux,Lista).

regla2(CodR,Cantidad):-reserva(CodR,_,_,_,Lista,_),length(Lista,Cantidad).

