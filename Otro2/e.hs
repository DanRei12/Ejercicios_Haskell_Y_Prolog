precio_articulo nombre | nombre == "pinza" = 75
		       | nombre == "tenaza" = 20
		       | nombre == "brocha" = 80
		       | nombre == "martillo" = 30
		       | nombre == "yunque" = 40
		       | otherwise = 0

precio_pedido [] = 0
precio_pedido (h:t) = precio_articulo h + precio_pedido t

generar_lista [] _ = []
generar_lista (h:t) p | h > p = h: generar_lista t p
		      | otherwise = generar_lista t p   