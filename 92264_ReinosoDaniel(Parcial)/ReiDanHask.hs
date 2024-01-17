funcion1 cod monto   | cod == 1 = monto *(1-3/100)
		     | cod == 2 = monto *(1-5/100)
		     | cod == 3 = monto *(1-7/100)
		     | otherwise = 0

funcion2 lista desde hasta = [x|x<-lista, x>=desde && x<=hasta]

contar::[Integer]->Float
contar[] = 0.0
contar (_:xs) = 1.0 + contar(xs)


funcion3 lista p = ((cantidadCumplen lista p)/(contar lista))*100 

cantidadCumplen [] p = 0.0
cantidadCumplen (h:t) p | h>p && mod h 2 == 0 = 1.0 + cantidadCumplen t p
			| otherwise = cantidadCumplen t p