% primer ejemplo prolog
%
% Hechos

padre(pedro,nico).
padre(pedro,vera).
padre(pedro,viviana).
padre(juan,luciana).
padre(juan,luisa).
padre(roberto,pedro).

% Reglas
hermano(A,B) :- padre(P,A), padre(P,B), A \==B.
nieto(A,B) :- padre(P,A), padre(B,P).




