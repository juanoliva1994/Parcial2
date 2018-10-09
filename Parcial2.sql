create tablespace MID_TERM  datafile
    'ParcialDTF' size 50M;

	CREATE user user1 
    IDENTIFIED by user123 
        default tablespace MID_TERM
            quota 20M on MID_TERM;
            
GRANT DBA TO user1;
GRANT CONNECT TO user1;


create sequence COMUNAS_SEQ 
    start with 50
    increment by 3
    nocycle;   
	
create sequence COLEGIOS_SEQ  
    start with 100
    increment by 1
    nocycle;  

CREATE TABLE COMUNAS (
	ID INTEGER PRIMARY KEY,
	NOMBRE VARCHAR2(255)
);

INSERT INTO COMUNAS VALUES (1,	'POPULAR');
INSERT INTO COMUNAS VALUES (10,	'LA CANDELARIA');
INSERT INTO COMUNAS VALUES (11,	'LAURELES ESTADIO');
INSERT INTO COMUNAS VALUES (12,	'LA AMERICA');
INSERT INTO COMUNAS VALUES (13,	'SAN JAVIER');
INSERT INTO COMUNAS VALUES (14,	'POBLADO');
INSERT INTO COMUNAS VALUES (15,	'GUAYABAL');
INSERT INTO COMUNAS VALUES (16,	'BELÉN');
INSERT INTO COMUNAS VALUES (2,	'SANTA CRUZ');
INSERT INTO COMUNAS VALUES (3,	'MANRIQUE');
INSERT INTO COMUNAS VALUES (4,	'ARANJUEZ');
INSERT INTO COMUNAS VALUES (5,	'CASTILLA');
INSERT INTO COMUNAS VALUES (50,	'PALMITAS');
INSERT INTO COMUNAS VALUES (6,	'DOCE DE OCTUBRE');
INSERT INTO COMUNAS VALUES (60,	'SAN CRISTOBAL');
INSERT INTO COMUNAS VALUES (7,	'ROBLEDO');
INSERT INTO COMUNAS VALUES (70,	'ALTAVISTA');
INSERT INTO COMUNAS VALUES (8,	'VILLA HERMOSA');
INSERT INTO COMUNAS VALUES (80,	'SAN ANTONIO DE PRADO');
INSERT INTO COMUNAS VALUES (9,	'BUENOS AIRES');
INSERT INTO COMUNAS VALUES (90,	'SANTA ELENA');

SELECT * FROM COMUNAS;

create table colegios (
	ID INTEGER PRIMARY KEY,
	consecutivo_dane VARCHAR2(255),
	nombre_sede VARCHAR2(255),
	tipo_sede VARCHAR2(255),
	comuna_id INTEGER,
	prestacion_servicio VARCHAR2(255),
	zona VARCHAR2(255),
	barrio VARCHAR2(255),
	sector VARCHAR2(255),
	direccion_sede VARCHAR2(255),
	telefono_sede VARCHAR2(255),
	rector VARCHAR2(255),
	contador_prejardin_jardin INTEGER,
	contador_transicion INTEGER,
	contador_primaria INTEGER,
	contador_secundaria INTEGER,
	contador_media INTEGER,
	contador_adultos INTEGER,
	jornada_completa VARCHAR(8),
	jornada_manana VARCHAR(8),
	jornada_tarde VARCHAR(8),
	jornada_nocturna VARCHAR(8),
	jornada_fin_de_semana VARCHAR(8),
	jornada_unica VARCHAR(8),
	clasificacion_icfes VARCHAR(8),
	CONSTRAINT COMUNA_FK FOREIGN KEY (comuna_id)
    REFERENCES COMUNAS(ID)
);

SELECT * FROM COLEGIOS;

SELECT barrio,count(*) over (PARTITION BY barrio) as numero_colegios
    from COLEGIOS
    where comuna_id = 9
    group by barrio;
     
select ID, NOMBRE_SEDE, COMUNA_ID, NOMBRE_COMUNA, TOTAL_GENERAL, TOTAL_POR COMUNA
from colegios inner join COMUNAS ON ID = comuna_id;