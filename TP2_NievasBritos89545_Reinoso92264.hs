-- TP 2 PPR 2K05

-- Consigna 1, devolver bool para saber si un numero es divisible por otro.
esDivisible :: Integer -> Integer -> Bool
esDivisible nro exp = if exp == 0 then False else mod nro exp == 0


-- Consigna 2, devolver todos los numeros que dividen al ingresado por parametro.
listaFactoresDivisiblesDe2 :: Integer -> [Integer]
listaFactoresDivisiblesDe2 0 = []
listaFactoresDivisiblesDe2 1 = [1]
listaFactoresDivisiblesDe2 nro = if nro < 0 then [] else auxiliarListaFactoresDivisiblesDe nro 1

-- Auxiliar de Punto 2 
auxiliarListaFactoresDivisiblesDe :: Integer -> Integer -> [Integer]
auxiliarListaFactoresDivisiblesDe nro exp | nro == exp = [nro]
		         				 | esDivisible nro exp = exp: lista
		      				 |otherwise = lista
		         			 	 where lista = auxiliarListaFactoresDivisiblesDe nro (exp+1)


-- Consigna 3, devolver true si es primo.
esPrimo2 :: Integer -> Bool
esPrimo2 1 = False
esPrimo2 2 = True
esPrimo2 nro = if nro < 1  then False else auxiliarEsPrimo nro 3

-- Auxiliar del punto 3
auxiliarEsPrimo  ::  Integer -> Integer -> Bool
auxiliarEsPrimo nro divisor | divisor >= nro = True    
				| esDivisible nro 2 = False
				| esDivisible nro divisor  = False
				| otherwise = auxiliarEsPrimo nro (divisor+2)


-- Consigna 4, generar lista de primos o iguales que numero ingresado.
listadoPrimosMenoresOIgualesQue ::Integer -> [Integer]
listadoPrimosMenoresOIgualesQue nro = [x | x <- [1..nro], esPrimo2 x]


-- Consigna 5, generar lista de factores primos que su producto sea igual al numero ingresado.
factorizacion :: Integer -> [Integer]
factorizacion 1 = []
factorizacion nro | nro < 1 = [] 
                  | otherwise = auxFactorizacion nro listado
                     where listado = listadoPrimosMenoresOIgualesQue nro

-- Auxiliar del punto 5
auxFactorizacion :: Integer -> [Integer] -> [Integer]
auxFactorizacion 1 y = []
auxFactorizacion nro (primerPrimo:otrosPrimos) |esDivisible nro primerPrimo = primerPrimo: (auxFactorizacion newNro (primerPrimo:otrosPrimos))
				               |otherwise = auxFactorizacion nro otrosPrimos
	 			                 where newNro = div nro primerPrimo


-- Consigna 6, generar la expansión de la factorización de los elementos de las listas ingresadas.
expansion :: [(Integer,Integer)] -> Integer
expansion [] = 1
expansion ((x,y):xs) = x^y * expansion xs