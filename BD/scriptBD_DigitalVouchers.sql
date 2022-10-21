CREATE DATABASE digitalvouchers;
USE digitalvouchers;

CREATE TABLE situacion_impositiva(
  ID_si INT NOT NULL AUTO_INCREMENT,
  Descripcion_si VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_si),
  UNIQUE INDEX ID_SI_UNIQUE (ID_si ASC) VISIBLE);

CREATE TABLE tipo_voucher(
  ID_tipo_voucher INT NOT NULL AUTO_INCREMENT,
  Tipo_voucher VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_tipo_voucher),
  UNIQUE INDEX ID_TIPO_VOUCHER_UNIQUE (ID_tipo_voucher ASC) VISIBLE);

CREATE TABLE estado_voucher(
  ID_estado_voucher INT NOT NULL AUTO_INCREMENT,
  Estado_voucher VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_estado_voucher),
  UNIQUE INDEX ID_ESTADO_VOUCHER_UNIQUE (ID_estado_voucher ASC) VISIBLE);

CREATE TABLE provincia(
  ID_provincia INT NOT NULL AUTO_INCREMENT,
  Nombre_provincia VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_provincia),
  UNIQUE INDEX ID_PROVINCIA_UNIQUE (ID_provincia ASC) VISIBLE);

CREATE TABLE localidad(
  ID_localidad INT NOT NULL AUTO_INCREMENT,
  Nombre_loc VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_localidad),
  UNIQUE INDEX ID_LOCALIDAD_UNIQUE (ID_localidad ASC) VISIBLE);

CREATE TABLE tipo_documento(
  ID_tipo_documento INT NOT NULL AUTO_INCREMENT,
  Tipo_documento VARCHAR(30) NOT NULL,
  PRIMARY KEY (ID_tipo_documento),
  UNIQUE INDEX ID_TIPO_DOCUMENTO_UNIQUE (ID_tipo_documento ASC) VISIBLE);

CREATE TABLE comercio(
  CUIT INT NOT NULL,
  Razon_Social VARCHAR(30) NOT NULL,
  ID_si INT NOT NULL,
  CONSTRAINT ID_si_FK
    FOREIGN KEY (ID_si)
    REFERENCES situacion_impositiva(ID_si),
  ID_provincia INT NOT NULL,
  CONSTRAINT ID_provincia_FK
    FOREIGN KEY (ID_provincia)
    REFERENCES provincia(ID_provincia),
  ID_localidad INT NOT NULL,
  CONSTRAINT ID_localidad_FK
    FOREIGN KEY (ID_localidad)
    REFERENCES localidad(ID_localidad),
  Email VARCHAR(30) NOT NULL,
  Telefono INT NOT NULL,
  Calle VARCHAR(30) NOT NULL,
  Nro INT NOT NULL,
  Logo VARCHAR(30) NULL,
  Fecha_Alta DATE,
  ContraseÃ±a VARCHAR(10) NOT NULL,
  PRIMARY KEY (CUIT),
  UNIQUE INDEX CUIT_UNIQUE (CUIT ASC) VISIBLE);

CREATE TABLE persona(
  DNI INT NOT NULL,
  ID_tipo_documento INT NOT NULL,
  CONSTRAINT ID_tipo_documento_FK
    FOREIGN KEY (ID_tipo_documento)
    REFERENCES tipo_documento(ID_tipo_documento),
  Nombre VARCHAR(40) NOT NULL,
  Apellido VARCHAR(15) NOT NULL,
  Fecha_Nacimiento DATE,
  Telefono INT NOT NULL,
  Email VARCHAR(30) NOT NULL,
  Sexo VARCHAR(10) NOT NULL,
  ID_provincia INT NOT NULL,
  CONSTRAINT ID_provincia_persona_FK
    FOREIGN KEY (ID_provincia)
    REFERENCES provincia(ID_provincia),
  ID_localidad INT NOT NULL,
  CONSTRAINT ID_localidad_persona_FK
    FOREIGN KEY (ID_localidad)
    REFERENCES localidad(ID_localidad),
  Calle VARCHAR(30) NOT NULL,
  Nro INT NOT NULL,
  Fecha_Alta DATE,
  ContraseÃ±a VARCHAR(10) NOT NULL,
  PRIMARY KEY (DNI),
  UNIQUE INDEX DNI_UNIQUE (DNI ASC) VISIBLE);

CREATE TABLE voucher_padre(
  ID_voucher_padre INT NOT NULL AUTO_INCREMENT,	
  CUIT INT NOT NULL,
  CONSTRAINT CUIT_FK
    FOREIGN KEY (CUIT)
    REFERENCES Comercio(CUIT),
  ID_tipo_voucher INT NOT NULL,
  CONSTRAINT ID_tipo_voucher_FK
    FOREIGN KEY (ID_tipo_voucher)
    REFERENCES tipo_voucher(ID_tipo_voucher),
  Fecha_Creacion DATE,
  Fecha_Publicacion DATE,
  Fecha_Desde_Vigencia DATE,
  Fecha_Hasta_Vigencia DATE, 
  Importe INT NULL,
  ID_rubro INT NOT NULL,
  CONSTRAINT ID_rubro_FK
    FOREIGN KEY (ID_rubro)
    REFERENCES rubro(ID_rubro),
  PRIMARY KEY (ID_voucher_padre),
  UNIQUE INDEX ID_VOUCHER_PADRE_UNIQUE (ID_voucher_padre) VISIBLE,
  ID_estado_voucher INT NOT NULL,
  CONSTRAINT ID_estado_voucher_FK
    FOREIGN KEY (ID_estado_voucher)
    REFERENCES estado_voucher(ID_estado_voucher)
);

CREATE TABLE billetera(
  ID_billetera INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID_billetera),
  UNIQUE INDEX ID_BILLETERA_UNIQUE (ID_billetera ASC) VISIBLE,
  DNI INT NOT NULL,
  CONSTRAINT DNI_FK
    FOREIGN KEY (DNI)
    REFERENCES persona(DNI));

CREATE TABLE voucher(
  ID_voucher INT NOT NULL AUTO_INCREMENT,	
  PRIMARY KEY (ID_voucher),
  UNIQUE INDEX ID_VOUCHER_UNIQUE (ID_voucher) VISIBLE,
  ID_voucher_padre INT NOT NULL,
  CONSTRAINT ID_voucher_padre_FK
    FOREIGN KEY (ID_voucher_padre)
    REFERENCES voucher_padre(ID_voucher_padre), 
  Fecha_Descarga DATE,
  ID_estado_voucher INT NOT NULL,
  CONSTRAINT ID_estado_voucher_hijo_FK
    FOREIGN KEY (ID_estado_voucher)
    REFERENCES estado_voucher(ID_estado_voucher), 
   QR VARCHAR(30) NULL
);

CREATE TABLE historial(
  ID_historial INT NOT NULL AUTO_INCREMENT,
  Fecha DATE,
  ID_estado_voucher INT NOT NULL,
  ID_voucher INT NOT NULL,
  PRIMARY KEY (ID_historial),
  UNIQUE INDEX ID_HISTORIAL_UNIQUE (ID_historial ASC) VISIBLE,
  CONSTRAINT ID_estado_voucher_historial_FK
    FOREIGN KEY (ID_estado_voucher)
    REFERENCES estado_voucher(ID_estado_voucher),
  CONSTRAINT ID_voucher_FK
    FOREIGN KEY (ID_voucher)
    REFERENCES voucher(ID_voucher)
);

CREATE TABLE rubro(
  ID_rubro INT NOT NULL AUTO_INCREMENT,
  Descripcion_rubro VARCHAR(25) NOT NULL,
  PRIMARY KEY (ID_rubro),
  UNIQUE INDEX ID_RUBRO_UNIQUE (ID_rubro ASC) VISIBLE);

CREATE TABLE interes_persona(
  ID_billetera INT NOT NULL,
  CONSTRAINT ID_billetera_FK
    FOREIGN KEY (ID_billetera)
    REFERENCES billetera(ID_billetera),
  ID_rubro INT NOT NULL,
  CONSTRAINT ID_rubro_persona_FK
    FOREIGN KEY (ID_rubro)
    REFERENCES rubro(ID_rubro),
  fecha_desde DATE,
  fecha_hasta DATE,
  PRIMARY KEY (ID_billetera, ID_rubro));

create table suscripcion(
	DNI INT NOT NULL,
	CONSTRAINT DNI_SUSC_FK
		FOREIGN KEY (DNI)
		REFERENCES persona(DNI),
	CUIT INT NOT NULL,
	CONSTRAINT CUIT_SUSC_FK
		FOREIGN KEY (CUIT)
		REFERENCES comercio(CUIT),
	fecha date,
    activo boolean
);
    








    
