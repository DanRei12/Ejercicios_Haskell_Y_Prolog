precio_venta monto base = monto + base

precio_venta_final cod monto base = if ((monto + base) < 200) then precio_venta monto base
                                  else if cod == 1 then (precio_venta monto base) * 0.9
                                              else if cod == 2 then (precio_venta monto base) * 0.92
					      else precio_venta monto base

precio_total [] = 0
precio_total (h:t) =  h + precio_total t

contar [] = 0
contar (h:t) = 1 + contar t

promedio lista = (precio_total lista) / (contar lista)