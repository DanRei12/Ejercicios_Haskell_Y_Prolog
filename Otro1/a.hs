
precio_plato comida | (comida=="pizza") = 75
		      | (comida=="empanada") = 20
		      | (comida=="locro") = 80
		      | (comida=="tamal") = 30
		      | (comida=="flan") = 40
		      | otherwise = 0


precio_pedido [] = 0
precio_pedido (h:t) = precio_plato h + precio_pedido t


generar_lista lista p = [x | x<-lista,x>p]
