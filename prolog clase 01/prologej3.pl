area(1,'Gerencia').
area(2,'Marketing').
area(3,'Limpieza').

localidad(1,'Córdoba').
localidad(2,'Capilla del Monte').
localidad(3,'Calamuchita').
localidad(4,'Laborde').

trabajador(111,'María','Richardi',domicilio('Jujuy',142,1),3,contrato(24,25.5,5)).
trabajador(222,'Diana','Bambini',domicilio('Calle 1',339,3),3,contrato(20,25.5,7)).
trabajador(333,'Lara','Pointer',domicilio('Perú',721,3),2,efectivo(2200,1,2)).
trabajador(444,'Victoria','Dove',domicilio('Jujuy',344,4),2,efectivo(2000,12,1.5)).
trabajador(555,'Ximena','Coraggio',domicilio('Salta',545,1),3,contrato(24,25.5,8)).
trabajador(666,'Gaspar','Gioia',domicilio('Chile',123,2),3,contrato(20,25.5,7)).
trabajador(777,'Vera','Petro',domicilio('Salta',888,2),1,efectivo(2500,8,2.5)).
trabajador(888,'Gastón','Bravi',domicilio('Luján',104,1),2,efectivo(1800,9,2)).

punto_1(Leg,CantHs,NomArea):- trabajador(Leg,_,_,_,IDAREA,contrato(X,_,Y)),area(IDAREA,NomArea),CantHs is X*Y.

punto_2(Leg,Nom,Ap,NomLoc,NomArea,CantHs):-trabajador(Leg,Nom,Ap,domicilio(_,_,IDLOC),IDAREA,contrato(X,_,Y)),localidad(IDLOC,NomLoc),area(IDAREA,NomArea),CantHs is X*Y,CantHs>125.

punto_3(Leg,Nom,Ap,NomLoc,NomArea,Ant):- trabajador(Leg,Nom,Ap,domicilio(_,_,IDLOC),IDAREA,efectivo(_,Ant,_)),localidad(IDLOC,NomLoc),area(IDAREA,NomArea),Ant>10.

punto_4(Leg,Sal):-(trabajador(Leg,_,_,_,_,contrato(X,Y,Z)), Sal is X*Y*Z); trabajador(Leg,_,_,_,_,efectivo(X,Y,Z)), Sal is X+(X*Y*Z)/100.

punto_5(Leg,Nomb,Ap,Area,Loc):-trabajador(Leg,Nomb,Ap,domicilio(_,_,IDLOC),IDAREA,contrato(_,_,_)), area(IDAREA,Area),localidad(IDLOC,Loc),IDLOC =\=1.

punto_6(Leg,Sal):-(trabajador(Leg,_,_,domicilio(_,_,IDLOC),_,contrato(X,Y,Z)),IDLOC=:=1,Sal is X*Y*Z);

(trabajador(Leg,_,_,domicilio(_,_,IDLOC),_,contrato(X,Y,Z)),IDLOC=\=1,Sal is X*Y*Z+250);

(trabajador(Leg,_,_,_,_,efectivo(X,Y,Z)), Sal is X+(X*Y*Z)/100).






