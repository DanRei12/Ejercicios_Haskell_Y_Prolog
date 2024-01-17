vuelo('LN 481','Santiago de Chile', '11:20', '11:30', 'Aterrizado', 1).
vuelo('AU 2358','Salta', '13:00', '13:05', 'Aterrizado', 2).
vuelo('CM 101','Panama', '15:00', '', 'Demorado', 3).
vuelo('G3 7364','Río de Janeiro', '15:40', '16:00', 'Aterrizado',4).
vuelo('LN 2423','Aeroparque', '16:00', '', 'Cancelado', 2).
vuelo('LN 1502','Mendoza', '17:00', '17:10', 'Aterrizado', 2).
vuelo('AU 1502','Aeroparque', '18:00', '18:20', 'Aterrizado', 2).
vuelo('AU 2818','Aeroparque', '16:00', '', 'Aterrizado', 2).
vuelo('AU 2590','Aeroparque', '20:00', '20:10', 'Aterrizado', 2).

linea(1, 'Lan Chile').
linea(2, 'Austral').
linea(3, 'Copa Airlines').
linea(4, 'Gol').

punto1(NV, E) :-  vuelo(NV,'Aeroparque', _, _, E, _).
punto2(NV, P, L) :- vuelo(NV,P,_,_, 'Cancelado',NL) , linea(NL, L).
punto3(NV, P, H, L) :- vuelo(NV, P, _, H, _, NL),  linea(NL,L).
punto4(P, H) :- vuelo(_, P, _, H, 'Aterrizado', _).










