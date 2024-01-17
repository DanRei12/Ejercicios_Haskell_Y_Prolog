proyecto('xxx001',fecha(29,7,2019),1,14,200).
proyecto('xxx002',fecha(29,7,2019),2,12,180).
proyecto('xxx003',fecha(3,8,2019),1,8,150).
proyecto('xxx004',fecha(6,8,2019),1,16,220).
proyecto('xxx005',fecha(6,8,2019),2,10,140).

tipoProyecto(1,'Desarrollo de Software').
tipoProyecto(2,'Infraestructura').

%REGLAS
%regla1/2
regla1(CodProy,Descrip):-(
			   (proyecto(CodProy,fecha(_,7,2019),CodTipo,CantP,_),CodTipo=:=1,CantP=<12);
			   (proyecto(CodProy,_,CodTipo,_,Dur),CodTipo=:=2,Dur=<200)
			 ),tipoProyecto(CodTipo,Descrip).
%regla2/1
regla2(DurX):-proyecto(_,fecha(_,M,2019),2,_,Duracion),M>=8,M=<12,Duracion>=DurX,!.

%regla3/2
regla3(CantTipo,Tipo):-findall(Dur,proyecto(_,_,Tipo,_,Dur),Lista),length(Lista,CantTipo).














