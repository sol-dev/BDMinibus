-- Creación de tablas de TP de Intro a BD
-- 		Sistema de transportes

drop schema if exists minibus;
create schema minibus;

use minibus;

-- Tablas

 drop table if exists marca;
 create table marca(
 	idMarca int not null auto_increment,
     nombre varchar(45) not null,
     
     primary key(idMarca)
 );
 
 
 drop table if exists modelo;
 create table modelo(
 	idModelo int not null auto_increment,
    nombre varchar(45) not null,
    marca_idMarca int not null,
     
     primary key(idModelo),
     foreign key(marca_idMarca) references marca(idMarca)
 		on delete no action
         on update no action
);


drop table if exists minibus;
create table minibus(
	dominio varchar(10) not null,
    modelo_idmodelo int not null,
    km_service decimal(10,2) not null,    
    
    primary key(dominio),
--         
	foreign key(modelo_idModelo) references modelo(idModelo)
-- 		on delete no action
--         on update no action
);


drop table if exists provincia;
create table provincia(
	idProvincia int not null auto_increment,
    nombre varchar(45) not null,
    
    primary key(idProvincia)
);


drop table if exists localidad;
create table localidad(
	idLocalidad int not null auto_increment,
    nombre varchar(45) not null,
    provincia_idProvincia int not null,
    
    primary key(idLocalidad),
    foreign key(provincia_idProvincia) references provincia(idProvincia)
		on delete no action
        on update no action
);


drop table if exists calle;
create table calle(
	idCalle int not null auto_increment,
    nombre varchar(45) not null,
    localidad_idLocalidad int not null,
    
    primary key(idCalle),
    foreign key(localidad_idLocalidad) references localidad(idLocalidad)
		on delete no action
        on update no action
);


drop table if exists taller;
create table taller(
	cuit bigint not null,
    razonSocial varchar(45) not null,
    calle_idCalle int not null,
    numeroCalle int default null,

    
    primary key(cuit),
    foreign key(calle_idCalle) references calle(idCalle)
		on delete no action
        on update no action
);


drop table if exists mantenimiento;
create table mantenimiento(
	minibus_dominio varchar(10) not null,
    fechaHora datetime not null,
    descripcion varchar(100) ,
    kilometros decimal(15,2) not null,
    monto decimal(10,2) not null,
    taller_cuit bigint not null,
    
    primary key(minibus_dominio, fechaHora),
    
    foreign key(minibus_dominio) references minibus(dominio)
		on delete no action
        on update no action,
        
	foreign key(taller_cuit) references taller(cuit)
		on delete no action
        on update no action
);


drop table if exists parada;
create table parada(
	calle_idCalle int not null,
    calle_idCalle1 int not null,
    nombre varchar(100) not null,    
    
    primary key(calle_idCalle, calle_idCalle1),
    foreign key(calle_idCalle) references calle(idCalle)
		on delete no action
        on update no action,
        
	foreign key(calle_idCalle1) references calle(idCalle)
		on delete no action
        on update no action
);


drop table if exists recorrido;
create table recorrido(
	idRecorrido int not null auto_increment,
    distancia_km decimal(10,2) not null,
    nombre varchar(100) not null,
    
    primary key(idRecorrido)
);


drop table if exists recorrido_has_parada;
create table recorrido_has_parada(
	recorrido_idRecorrido int not null,
    parada_calle_idCalle int not null,
    parada_calle_idCalle1 int not null,
    num_orden int not null,
    
    primary key(recorrido_idRecorrido, parada_calle_idCalle, parada_calle_idCalle1),
    
    foreign key(recorrido_idRecorrido) references recorrido(idRecorrido)
		on delete no action
        on update no action,
        
	foreign key(parada_calle_idCalle) references parada(calle_idCalle)
		on delete no action
        on update no action,
        
	foreign key(parada_calle_idCalle1) references parada(calle_idCalle1)
		on delete no action
        on update no action
);


drop table if exists pasajero;
create table pasajero(
	dni bigint not null,
    nombre varchar(45) not null,
    apellido varchar(45) not null,
    calle_idCalle int not null,
    numero_calle int,
    
    primary key(dni),
    
    foreign key(calle_idCalle) references calle(idCalle)
		on delete no action
        on update no action
);


drop table if exists abono_mensual;
create table abono_mensual(
	idAbono_mensual int not null auto_increment,
    tipo varchar(45) not null,
    precio_lista decimal(10,2) not null,
    recorrido_idRecorrido int,
    
    primary key(idAbono_mensual),
    
    foreign key(recorrido_idRecorrido) references recorrido(idRecorrido)
		on delete no action
        on update no action
);


drop table if exists parada_favorita;
create table parada_favorita(
	pasajero_dni bigint not null,
    recorrido_idRecorrido int not null,    
	parada_calle_idcalle int not null,
    parada_calle_idcalle1 int not null,
    fecha date not null,
    hora time not null,
    
    primary key(recorrido_idRecorrido, pasajero_dni, fecha),
    
    foreign key(recorrido_idRecorrido) references recorrido(idRecorrido)
		on delete no action
        on update no action,
        
	foreign key(pasajero_dni) references pasajero(dni)
		on delete no action
        on update no action,
        
	foreign key(parada_calle_idcalle) references parada(calle_idCalle),
    foreign key(parada_calle_idcalle1)references parada(calle_idCalle1)
);


drop table if exists pasajero_has_abono;
create table pasajero_has_abono(
	pasajero_dni bigint not null,
    abono_idAbono int not null,
    mes int not null,
    año int not null,
    precio decimal (10,2)not null,
    
    primary key(pasajero_dni, abono_idAbono),
    
    foreign key(pasajero_dni) references pasajero(dni)
		on delete no action
        on update no action,
        
    foreign key(abono_idAbono) references abono_mensual(idAbono_mensual)
		on delete no action
        on update no action	
);


drop table if exists chofer;
create table chofer(
	cuil bigint not null,
    nombre varchar(45) not null,
    apellido varchar(45) not null,
    calle_idCalle int not null,
    numero_calle int default null,
    licencia varchar(45) not null,
    fecha_ingreso date not null,    
    
    primary key(cuil),
    
    foreign key(calle_idCalle) references calle(idCalle)
		on delete no action
        on update no action
);


drop table if exists estacionServicio;
create table estacionServicio(
	cuit bigint not null,
    razonSocial varchar(45) not null,
	calle_idCalle int not null,
    numeroCalle int ,   
    
    primary key(cuit),
    
    foreign key(calle_idCalle) references calle(idCalle)
	ON UPDATE CASCADE 

);


drop table if exists recarga;
create table recarga(
	minibus_dominio varchar(10) not null,
    chofer_cuil bigint not null,
	fechaHora datetime not null,
    estacionServicio_cuit bigint not null,   
    litros decimal(7,2),
    monto decimal(7,2),
    
    primary key(minibus_dominio, chofer_cuil, fechaHora),
    
    foreign key(minibus_dominio) references minibus(dominio)
		on delete no action
        on update no action,
        
	foreign key(chofer_cuil) references chofer(cuil)
		on delete no action
        on update no action,
        
	foreign key(estacionServicio_cuit) references estacionServicio(cuit)
		on delete no action
        on update no action
);


drop table if exists caja;
create table caja(
	idCaja int not null auto_increment,
    cajaInicial decimal(7,2) not null,
	cajaFinal decimal(7,2) ,
    gastoEspecial decimal(7,2),
    
    primary key(idCaja)
);



drop table if exists salida;
create table salida(
	minibus_dominio varchar(10) not null,
    recorrido_idRecorrido int not null,
	fechaHora datetime not null,
    km_odometro_inicio decimal(10,2) not null,
    chofer_cuil bigint not null,
    hora_llegada time ,
    cant_pasajes int ,
    km_odometro_fin decimal(10,2),
    novedades varchar(100) ,
    boleto_unico decimal(10,2) not null,
    caja_idCaja int not null,
    
    primary key(minibus_dominio, recorrido_idrecorrido, fechaHora),
    
    foreign key(minibus_dominio) references minibus(dominio)
		on delete no action
        on update no action,
        
	foreign key(recorrido_idRecorrido) references recorrido(idRecorrido)
		on delete no action
        on update no action,
        
	foreign key(chofer_cuil) references chofer(cuil)
		on delete no action
        on update no action,
        
	foreign key(caja_idCaja) references caja(idCaja)
		on delete no action
        on update no action 
);



