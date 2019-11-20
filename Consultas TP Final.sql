-- Consultas de TP Final 2018

-- 1)Emitir listados de clientes, con su correspondiente abono si lo tiene

select 
	p.dni as DNI,
    p.apellido as Apellido,
    p.nombre as Nombre,
    a.tipo as 'Tipo de abono',
    a.recorrido_idRecorrido as Recorrido
    
    from pasajero p
	left outer join pasajero_has_abono pha on pha.pasajero_dni = p.dni
    left outer join abono_mensual a on pha.abono_idAbono = a.idAbono_mensual
    
    order by p.dni, a.recorrido_idRecorrido;


-- 2)  Emitir listados de recorridos, con sus paradas.

SELECT 
    r.idRecorrido AS Recorrido,
    r.nombre AS Nombre_Recorrido,
    p.nombre AS Nombre_Parada
FROM
    recorrido r
        INNER JOIN
    recorrido_has_parada rxp ON r.idRecorrido = rxp.recorrido_idRecorrido
        RIGHT JOIN
    parada p ON rxp.parada_calle_idCalle = p.calle_idCalle AND rxp.parada_calle_idCalle1 = p.calle_idCalle1
ORDER BY rxp.recorrido_idRecorrido, rxp.num_orden ASC;


-- 3)  Emitir listados de historial de mantenimiento entre fechas, por móvil o taller.

select 
	m.fechaHora as 'Fecha/Hora',
	mini.dominio as Dominio,
    t.razonSocial as Taller,
    m.kilometros as Km    
        
    
    from mantenimiento m
	inner join minibus mini on m.minibus_dominio = mini.dominio
    inner join taller t on t.cuit = m.taller_cuit
    
    where 
    m.fechaHora >= str_to_date("2018,07,01","%Y,%m,%d")
    and
    m.fechaHora <= str_to_date("2018,09,30","%Y,%m,%d")
    
    order by m.fechaHora, mini.dominio;


-- 4)  Confeccionar las planillas de salida, con las paradas en las que deba detenerse el
-- 	   móvil, y los pasajeros a recoger en cada una de ellas.

select 
	r.nombre as Recorrido,
    par.nombre as Parada,
    p.apellido as Apellido,
    p.nombre as Nombre
        -- inner join recorrido r on s.recorrido_idRecorrido = r.idRecorrido
    from recorrido r
    inner join recorrido_has_parada rhp on r.idRecorrido = rhp.recorrido_idRecorrido
    inner join parada par on rhp.parada_calle_idCalle = par.calle_idCalle and rhp.parada_calle_idCalle1 = par.calle_idCalle1
    left outer join parada_favorita pf on par.calle_idCalle = pf.parada_calle_idcalle and par.calle_idCalle1 = pf.parada_calle_idcalle1
    left outer join pasajero p on pf.pasajero_dni = p.dni
        
    where 
        (pf.recorrido_idRecorrido = r.idRecorrido or pf.recorrido_idRecorrido is null)
        
	group by par.calle_idCalle, par.calle_idCalle1, p.dni
    
    order by r.idRecorrido, rhp.num_orden, par.calle_idCalle, par.calle_idCalle1

    ;
    


-- 5) Consultar la recaudación bruta ya sea por recorrido o por destino (provincia de
--    Buenos Aires o CABA)

select
    r.nombre as Recorrido,
	(select sum(c.cajaFinal+c.gastoEspecial) from salida s
    inner join caja c on s.caja_idCaja = c.idCaja
    where s.recorrido_idRecorrido = r.idRecorrido) as 'Ganancia Bruta'
    
    from recorrido r    
    group by r.idRecorrido
    ;
        

-- 6) Consultar los gastos por recorrido, por chofer o por chofer y entre fechas

select
	ch.apellido as Apellido,
    ch.nombre as Nombre,
    ch.licencia as Licencia,
    sum(c.gastoEspecial) as Gastos
    
    from chofer ch
    inner join salida s on s.chofer_cuil = ch.cuil
    inner join caja c on s.caja_idCaja = c.idCaja
    
    where 
    s.fechaHora >= str_to_date("2018,07,01","%Y,%m,%d")
    and
    s.fechaHora <= str_to_date("2018,09,30","%Y,%m,%d")
    
    group by ch.licencia
    ;


-- 7) Emitir un listado mensual de los gastos realizados por todos los choferes.

select
	ch.apellido as Apellido,
    ch.nombre as Nombre,
    ch.licencia as Licencia,
    month(s.fechaHora) as Mes,
    sum(c.gastoEspecial) as gastos    
        
    from chofer ch
    left outer join salida s on ch.cuil = s.chofer_cuil
    inner join caja c on s.caja_idCaja = c.idCaja
    
    group by Mes, ch.licencia
    order by ch.licencia, Mes   
    ;


-- 8) Emitir listados de consumo medio de combustible por km entre fechas (por recorrido,
--    por móvil o por chofer), ordenado de mayor a menor.

select
	mini.dominio,
    
    (select sum(rec.litros) from recarga rec
    where rec.minibus_dominio = mini.dominio and
		rec.fechaHora between str_to_date("2018,07,01","%Y,%m,%d") and str_to_date("2018,09,30","%Y,%m,%d")) as 'Litros',
    
	(select sum(s.km_odometro_fin - s.km_odometro_inicio) from salida s 
		where s.minibus_dominio = mini.dominio and
			s.fechaHora between str_to_date("2018,07,01","%Y,%m,%d") and str_to_date("2018,09,30","%Y,%m,%d")) as 'Kms recorridos',
        
	(select sum(rec.litros) from recarga rec
    where rec.minibus_dominio = mini.dominio and
			rec.fechaHora between str_to_date("2018,07,01","%Y,%m,%d") and str_to_date("2018,09,30","%Y,%m,%d"))/
	(select sum(s.km_odometro_fin - s.km_odometro_inicio) from salida s 
		where s.minibus_dominio = mini.dominio and
			s.fechaHora between str_to_date("2018,07,01","%Y,%m,%d") and str_to_date("2018,09,30","%Y,%m,%d")) as 'Relacion'
       
    from minibus mini        
    
    group by mini.dominio
    
    order by Relacion desc
    ;
    
    
-- 9) Emitir listados de ganancia bruta por km, por recorrido
	
select
	r.idRecorrido,
    r.nombre,
	(select sum(s.km_odometro_fin - s.km_odometro_inicio) from salida s where s.recorrido_idRecorrido = r.idRecorrido) as 'Kms recorridos',
    (select sum(c.cajaFinal+c.gastoEspecial) from salida s
    inner join caja c on s.caja_idCaja = c.idCaja
    where s.recorrido_idRecorrido = r.idRecorrido) as Ganacia,
    
    ((select sum(c.cajaFinal+c.gastoEspecial) from salida s
    inner join caja c on s.caja_idCaja = c.idCaja
    where s.recorrido_idRecorrido = r.idRecorrido)/
    (select sum(s.km_odometro_fin - s.km_odometro_inicio) from salida s where s.recorrido_idRecorrido = r.idRecorrido)
    )as 'Ganancia/km'
    
    from recorrido r    
    group by r.idRecorrido
    ;


-- 10) Emitir listado de cantidad de pasajeros transportados entre fechas por recorrido.

SELECT 
    r.nombre as Recorrido,
    
    (SELECT 
            SUM(s.cant_pasajes)
        FROM
            salida s
        WHERE
            s.recorrido_idRecorrido = r.idRecorrido
                AND s.fechaHora BETWEEN STR_TO_DATE('2018,09,01', '%Y,%m,%d') AND STR_TO_DATE('2018,09,30', '%Y,%m,%d')) AS 'Cantidad sin abono',
    (SELECT 
            COUNT(*)
        FROM
            abono_mensual am
			INNER JOIN
            pasajero_has_abono pha ON am.idAbono_mensual = pha.abono_idAbono
        WHERE
            am.recorrido_idRecorrido = r.idRecorrido) AS 'Cantidad de abonados',
            
	(SELECT SUM(s.cant_pasajes) FROM salida s
        WHERE s.recorrido_idRecorrido = r.idRecorrido AND s.fechaHora BETWEEN STR_TO_DATE('2018,09,01', '%Y,%m,%d') 
        AND STR_TO_DATE('2018,09,30', '%Y,%m,%d'))
				+
    (SELECT COUNT(*) FROM abono_mensual am INNER JOIN pasajero_has_abono pha ON am.idAbono_mensual = pha.abono_idAbono
        WHERE am.recorrido_idRecorrido = r.idRecorrido) AS 'Cantidad total'
            
FROM
    recorrido r
;


-- 11) Emitir listado mensual de recaudación por recorrido o parada final.

select
    r.nombre as Recorrido,
    month(s.fechaHora) as Mes,
    sum(c.cajaFinal+c.gastoEspecial) as Ganacia
    
    from recorrido r
    inner join salida s on s.recorrido_idRecorrido = r.idRecorrido
    inner join caja c on s.caja_idCaja = c.idCaja
    
    group by r.idRecorrido, month(s.fechaHora)
    ;


-- 12) Emitir listado de km recorridos entre fecha, para móvil o chofer.

select
	mini.dominio as Dominio,
    sum(s.km_odometro_fin-s.km_odometro_inicio) as 'Total recorrido'
    
    
    from salida s
    left outer join minibus mini on s.minibus_dominio = mini.dominio
    
    where 
    s.fechaHora >= str_to_date("2018,07,01","%Y,%m,%d")
    and
    s.fechaHora <= str_to_date("2018,09,30","%Y,%m,%d")
    
    group by mini.dominio
    ;
    

-- 13) Emitir listado de gastos de mantenimiento, por móvil

select 
	mini.dominio as Dominio,
    sum(m.monto) as 'Gasto total'
    
    from mantenimiento m
	inner join minibus mini on m.minibus_dominio = mini.dominio    
    
    group by dominio;
    

-- 14) Emitir listado de ganancia bruta por recorrido, calculada como el total de pasajes
--     vendidos menos los gastos entre fechas.

SELECT 
    r.nombre as 'Recorrido',
    
    sum(s.cant_pasajes) as 'Cantidad vendida',
    
    (s.cant_pasajes*s.boleto_unico) - c.gastoEspecial as 'Calculo total'               
            
            
FROM
    recorrido r
	INNER JOIN
    salida s ON r.idRecorrido = s.recorrido_idRecorrido    
	INNER JOIN
	caja c ON c.idCaja = s.caja_idCaja
    
WHERE
	s.fechaHora BETWEEN STR_TO_DATE('2018,07,01', '%Y,%m,%d') AND STR_TO_DATE('2018,09,30', '%Y,%m,%d')

    
GROUP BY r.nombre
;


-- 15) Consultar la ganancia bruta de la empresa, calculada como el total de pasajes
-- vendidos, más los abonos, menos el combustible y menos los gastos de
-- mantenimiento.


SELECT 
    sum(s.cant_pasajes*s.boleto_unico) as 'Recaudacion Boletos vendidos',
    
    (select sum(pha.precio) from pasajero_has_abono pha) as 'Recaudacion de abonos',
    
    (select sum(r.monto) from recarga r) as 'Gasto en combustible',
    
    (select sum(m.monto) from mantenimiento m) as 'Gasto en mantenimiento',
    
    
    sum(s.cant_pasajes*s.boleto_unico)
			+
	(select sum(pha.precio) from pasajero_has_abono pha)
			-
    (select sum(r.monto) from recarga r)
			-
    (select sum(m.monto) from mantenimiento m) as 'Balance total'
    
    
    from salida s    
    
    
;