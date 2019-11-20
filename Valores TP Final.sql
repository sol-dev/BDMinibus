-- Valores a cargar del TP Final 2018

use minibus;


insert into provincia (nombre) values
	 ("Buenos Aires");
     

insert into localidad (nombre, provincia_idProvincia) values
	 ("Lanus", 1),
     ("Avellaneda", 1),
     ("Barracas", 1),
     ("Monserrat", 1),
     ("Puerto Madero", 1),
     ("Nueva Pompeya", 1),
     ("Flores", 1),
     ("Floresta", 1),
     ("Villa del Parque", 1),
     ("Villa Devoto", 1);
     
     
insert into calle  values (1, "Hipolito Yrigoyen", 1);
	
insert into calle (nombre, localidad_idLocalidad) values
	
-- Recorrido 1: Constitucion
 
		("25 de Mayo", 1),    
		("Quito", 1),    
		("Bustamante", 1),    
    ("Hipolito Yrigoyen", 2),
		("Avenida Galicia", 2),
		("Rivadavia", 2),
		("Constitucion", 2),        
	("Rio Cuarto", 3),
		("Vieytes", 3),        
	("Brandsen", 3),
		("Dr. Ramon Carrillo", 3),        
    ("Avenida Brasil", 3),
		("Avenida Entre Rios", 3),
		("Lima", 3),
		
-- Recorrido 2: Correo Central
	("Sarmiento", 1),
		("Ayacucho", 1),
		("Helguera", 2),
    ("Av. Larralde", 2),
		("Lacarra", 2),
    ("Guemes", 2),
		("San Martin", 2),
    ("Av Mitre", 2),
		("Mariano Acosta", 2),
    ("Av. San Juan", 4),
		("Tacuari", 4),
	("Av. Paseo Colon", 5),
		("Av. Independencia", 5),
		("Moreno", 5),
	("Av. Leandro N. Alem",5 ),
		("Av. Corrientes", 5),

-- Recorrido 3: Agronomia
	-- parada compartida Yrigoyen Quito
    ("Remedios de Escalada de San Martin", 1),
		("Rivadavia", 1),
		("Coronel Luna", 1),
	("Av. Perito Moreno", 6),
		("Corrales", 6),
		("Pergamino", 6),
	("Av. Nazca", 7),
		("Yerbal", 7),
	("Av. Nazca", 8),
		("Tres Arroyos", 8),
     ("Terrada", 9),   
		("Marcos Sastre", 9),
	("Terrada", 10),
		("Gutembreg", 10);        
        
        
        
insert into parada values
    
    (1,2,"Hipolito Yrigoyen-25 de Mayo"),
    (1,3,"Hipolito Yrigoyen-Quito"),
	(1,4,"Hipolito Yrigoyen-Bustamante"),		   
    (5,6,"Hipolito Yrigoyen-Avenida Galicia"),
	(5,7,"Hipolito Yrigoyen-Rivadavia"),
	(5,8,"Hipolito Yrigoyen-Constitucion"),
	(9,10,"Rio Cuarto-Vieytes"),
	(11,12,"Brandsen-Dr. Ramon Carrillo"),       
	(13,14,"Avenida Brasil-Avenida Entre Rios"),
    (13,15,"Avenida Brasil-Lima"),

-- Recorrido 2: Correo Central
	(16,17,"Sarmiento-Ayacucho"),
	(16,18,"Sarmiento-Helguera"),	
    (19,20,"Av. Larralde-Lacarra"),
	(21,22,"Av. Guemes-San Martin"),	
    (23,24,"Av Mitre-Mariano Acosta"),		
    (25,26,"Av. San Juan-Tacuari"),
	(27,28,"Av. Paseo Colon-Av. Independencia"),
    (27,29,"Av. Paseo Colon-Moreno"),	
	(30,31,"Av. Leandro N. Alem-Av. Corrientes"),

-- Recorrido 3: Agronomia
	-- parada compartida Yrigoyen Quito
    (32,33,"Remedios de Escalada de San Martin-Rivadavia"),
	(32,34,"Remedios de Escalada de San Martin-Coronel Luna"),
	(35,36,"Av. Perito Moreno-Corrales"),
	(35,37,"Av. Perito Moreno-Pergamino"),
	(38,39,"Av. Nazca-Yerbal"),
	(40,41,"Av. Nazca-Tres Arroyos"),
	(42,43,"Terrada-Marcos Sastre"),
	(44,45,"Terrada-Gutembreg");
    
    

insert into recorrido values
	(1, 10, "Lanus-Constitucion"),
    (2, 13, "Lanus-Correo Central"),
    (3, 18, "Lanus-Agronomia");
    
    
    
 insert into recorrido_has_parada values   	
    (1,1,2,1),
    (1,1,3,2),
	(1,1,4,3),		   
    (1,5,6,4),
	(1,5,7,5),
	(1,5,8,6),
	(1,9,10,7),
	(1,11,12,8),       
	(1,13,14,9),
    (1,13,15,10),
		
-- Recorrido 2: Correo Central
	(2,1,2,1),
	(2,16,17,2),
	(2,16,18,3),		
    (2,19,20,4),
	(2,21,22,5),	
    (2,23,24,6),		
    (2,25,26,7),
	(2,27,28,8),
    (2,27,29,9),	
	(2,30,31,10),

-- Recorrido 3: Agronomia
	-- parada compartida Yrigoyen Quito
    (3,1,2,1),
    (3,1,3,2),
    (3,32,33,3),
	(3,32,34,4),
	(3,35,36,5),
	(3,35,37,6),
	(3,38,39,7),
	(3,40,41,8),
	(3,42,43,9),
	(3,44,45,10);
    
    
    
 insert into pasajero values   
	(00000000, "Carlos", "Perez", 2, 500),
    (11111111, "Laura", "Gomez", 2, 1000),
    (22222222, "Juan", "Gonzalez", 4, 1500),
    (33333333, "Alejandro", "Sielecki", 4, 3000),
    (44444444, "Romina", "Ramirez", 7, 50),
    (55555555, "Federico", "Guzman", 11, 500),
    (66666666, "Pedro", "Pedroski", 12, 1350),
    (77777777, "Camila", "Lorenzo", 16, 700),
    (88888888, "Jesica", "Amirevole", 25, 10),
    (99999999, "Barbara", "Gimenez", 38, 16200),
    
-- Sin abonos
    (91234567, "Jose", "Gimenez", 38, 16200),
    (92345678, "Anabela", "Rigantti", 28, 1620),
    (93456789, "Roberto", "Gutierrez", 31, 620),
    (01234567, "Julian", "Rojas", 10, 555),
    (02345678, "Ana", "Razzi", 15, 444),
    (03456789, "Gino", "Fernandez", 32, 333);



 insert into abono_mensual(tipo, precio_lista, recorrido_idRecorrido) values 
    ("Tarifa Plana", 2000, null),
    -- tiene todos los recorridos
    ("Restringido(Lanus-Constitucion)", 1500, 1),
    ("Restringido(Lanus-Correo Central)", 1500, 2),
    ("Restringido(Lanus-Agronomia)", 1500, 3);
    
    
    
insert into pasajero_has_abono values
    (00000000, 1, 8, 2018,2000),
    (11111111, 2, 9, 2018,1500),
    (22222222, 3, 8, 2018,1500),
    (33333333, 4, 9, 2018,1500),
    (44444444, 1, 8, 2018,2000),
    (55555555, 2, 9, 2018,1500),
    (66666666, 3, 8, 2018,1500),
    (77777777, 4, 9, 2018,1500),
    (88888888, 2, 8, 2018,1500),
    (99999999, 2, 9, 2018,1500),
    (99999999, 3, 8, 2018,1500),
    (99999999, 4, 9, 2018,1500);
    
    
    
insert into parada_favorita values
-- dni	recorrido que abonaron,
				  -- parada del recorrido	
	(00000000, 1, 	1,2, 	"2018/08/05",'23:59:59'),
    (11111111, 1,	9,10,	"2018/08/05",'13:46:00'),
    (22222222, 2,	1,2,	"2018/08/05",'07:30:46'),
    (33333333, 3,	32,33,	"2018/08/05",'23:59:59'),
    (44444444, 3,	1,2,	"2018/08/05",'23:59:59'),
    (55555555, 1,	11,12,	"2018/08/05",'07:30:46'),
    (66666666, 2,	25,26,	"2018/08/05",'13:46:00'),
    (77777777, 3,	35,37,	"2018/08/05",'23:59:59'),
    (88888888, 1,	13,15,	"2018/08/05",'07:30:46'),
    (99999999, 1,	5,8,	"2018/08/05",'23:59:59'),
    (99999999, 2,	27,29,	"2018/08/05",'13:46:00'),
    (99999999, 3,	1,3,	"2018/08/05",'07:30:46'),
    
-- Sin abono, pago por viaje
    (91234567, 1,	5,7,	"2018/08/10",'13:46:00'),
        
    (92345678, 2,	23,24,	"2018/08/10",'13:46:00'),
    (93456789, 2,	16,18,	"2018/08/10",'13:46:00'),
    (01234567, 2,	27,29,	"2018/08/10",'13:46:00'),
        
    (02345678, 3,	32,33,	"2018/08/10",'23:59:59'),
    (03456789, 3,	40,41,	"2018/08/10",'07:30:46'),
        
    
    (91234567, 1,	5,7,	"2018/08/20",'13:46:00'),
    (92345678, 1,	9,10,	"2018/08/20",'13:46:00'),    
    
    (93456789, 2,	16,18,	"2018/08/20",'13:46:00'),
    
    (01234567, 3,	35,37,	"2018/08/20",'13:46:00'),    
    (02345678, 3,	32,33,	"2018/08/20",'23:59:59'),
    (03456789, 3,	40,41,	"2018/08/20",'07:30:46'),
    
    
    (91234567, 1,	5,7,	"2018/09/06",'13:46:00'),
    (92345678, 1,	9,10,	"2018/09/06",'13:46:00'),
    (93456789, 1,	11,12,	"2018/09/06",'13:46:00'),    
    
    (01234567, 2,	27,29,	"2018/09/06",'13:46:00'),
	(02345678, 2,	16,18,	"2018/09/06",'23:59:59'),   
    
    (03456789, 3,	40,41,	"2018/09/06",'07:30:46'),
    
    
    (91234567, 2,	16,18,	"2018/09/28",'13:46:00'),
    (92345678, 2,	27,29,	"2018/09/28",'13:46:00')
    ;
    
    
    -- select am.idAbono_mensual,am.tipo,am.recorrido_idRecorrido , pxa.pasajero_dni from abono_mensual am
	-- inner join pasajero_has_abono pxa
	-- on am.idAbono_mensual=pxa.abono_idAbono;
    
insert into marca values
		(1,"Volkswagen"),
        (2, "Volvo");
        
insert into modelo values
		(1,"Tanker",1),
        (2,"Amphibious",1),
        (3,"Mases",2),
        (4,"Fun House",2);
    
insert into minibus values
    ("AA-123-AA", 1, 3500),
    ("AA-345-AB", 2, 5000),
    ("AB-789-AA", 3, 7000),
    ("AA-159-BA", 4, 9500);
    
    
    
insert into chofer values
    (11000000001, "Sergio", "Alvarez", 6, 3214,  "14725836",str_to_date("2017, 05, 22", "%Y, %m, %d")),
    (12852741946, "Graciela", "Godoy", 34, 842,  "95175352",str_to_date("2016, 11, 03", "%Y, %m, %d")),
    (13758421425, "Horacio", "Prieto", 17, 356,  "94316785",str_to_date("2012, 02, 16", "%Y, %m, %d"));
    


insert into caja(cajaInicial, gastoEspecial) values
	(500, 15),
    (500, 20),
    (500, 40),
    (500, 30),
    (500, 15),	-- La caja final se tiene que calcular en base a la
    (500, 20), -- cantidad de pasajes vendidos y el precio del boleto.
    (500, 40),
    (500, 30),
    (500, 15),
    (500, 20);  
    
    
    
insert into salida values
    ("AA-123-AA", 1, str_to_date("2018, 08, 10, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 72000, 11000000001,
		str_to_date("11,0,0", "%H, %i, %s"), 1, 72020, null, 100, 1),
    ("AA-345-AB", 2, str_to_date("2018, 08, 10, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 93000, 12852741946,
		str_to_date("12,0,0", "%H, %i, %s"), 3, 93030, null, 105, 2),
    ("AB-789-AA", 3, str_to_date("2018, 08, 10, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 64000, 13758421425,
		str_to_date("13,0,0", "%H, %i, %s"), 2, 64040, null, 125, 3),
    
    ("AA-159-BA", 1, str_to_date("2018, 08, 20, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 81000, 13758421425,
		str_to_date("11,0,0", "%H, %i, %s"), 2, 81020, null, 100, 4),    
    ("AA-123-AA", 3, str_to_date("2018, 08, 20, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 72020, 12852741946,
		str_to_date("13,0,0", "%H, %i, %s"), 3, 72060, null, 145, 5),
    ("AA-345-AB", 2, str_to_date("2018, 08, 20, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 93030, 11000000001,
		str_to_date("12,0,0", "%H, %i, %s"), 1, 93060, null, 105, 6),
   
	("AB-789-AA", 3, str_to_date("2018, 09, 06, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 64040, 11000000001,
		str_to_date("13,0,0", "%H, %i, %s"), 1, 64080, null, 135, 7),
    ("AA-159-BA", 2, str_to_date("2018, 09, 06, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 81020, 13758421425,
		str_to_date("12,0,0", "%H, %i, %s"), 2, 81050, null, 145, 8),        
	("AA-123-AA", 1, str_to_date("2018, 09, 06, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 72080, 12852741946,
		str_to_date("11,0,0", "%H, %i, %s"), 3, 72100, null, 100, 9),
   
	("AA-345-AB", 2, str_to_date("2018, 09, 28, 8,0,0", "%Y, %m, %d, %H, %i, %s"), 93060, 13758421425,
		str_to_date("12,0,0", "%H, %i, %s"), 2, 93090, null, 125, 10);
    
    

    
insert into estacionServicio values
	(12345678912,"PETROGUAZZ SA",25,123),
    (12345678987,"HERNANDO HERMANOS SA",1,147),
    (12345678901,"CABARO SRL",4,5556);
    

 
    
  insert into recarga values
	("AA-123-AA",11000000001,	"2018-08-20 14:10:00",12345678912,380,950),
    ("AA-345-AB",12852741946,	"2018-09-28 15:10:00",12345678987,300,750),
    ("AB-789-AA",13758421425,	"2018-08-10 14:10:00",12345678912,420,1050),
    ("AA-159-BA",12852741946,	"2018-08-20 15:10:00",12345678901,190,750),
    ("AA-123-AA",11000000001,	"2018-09-06 15:10:00",12345678912,200,1000),
    ("AA-345-AB",13758421425, 	"2018-08-10 14:10:00",12345678987,315,875),
    ("AB-789-AA",11000000001,	"2018-09-06 14:10:00",12345678901,380,950),
    ("AA-159-BA",11000000001,	"2018-09-06 15:10:00",12345678912,300,750),
	("AA-123-AA",12852741946,	"2018-08-10 14:10:00",12345678987,190,550),
    ("AA-345-AB",11000000001,	"2018-08-20 15:10:00",12345678912,315,715);   
    
insert into taller values
    (45612378987,"ROZA HNOS SA",2,125),
	(45612378921,"CASA ELICEIRY SA",6,897);
    

-- select * from salida;

insert into mantenimiento values
	("AA-123-AA","2018-09-28 12:10:00",null,72080.00,200,45612378987),
    ("AB-789-AA","2018-09-06 12:10:00",null,64040.00,459,45612378921),
	("AA-159-BA","2018-09-06 11:10:00",null,81050.00,562,45612378921),
    ("AA-123-AA","2018-09-06 13:10:00",null,72020.00,198,45612378987),
    ("AA-345-AB","2018-08-20 11:10:00",null,93060.00,151,45612378921);
    
    
    
update caja c inner join salida s on s.caja_idCaja = c.idCaja 
	set cajaFinal = (s.cant_pasajes * s.boleto_unico) + c.cajaInicial - c.gastoEspecial;