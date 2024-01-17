precio_habitacion x y | (x == 1 && y == 1) = 460
                      | (x == 1 && y == 2) = 280
                      | (x == 2 && y == 1) = 740
                      | (x == 2 && y == 2) = 490
                      | (x == 3 && y == 1) = 870
                      | (x == 3 && y == 2) = 600

importe_estadia x y z = z * (precio_habitacion x y)

cantidad_reservas [] _ = 0
cantidad_reservas (h:t) valor | h > valor = 1 + cantidad_reservas t valor 
			      | otherwise = 0 + cantidad_reservas t valor