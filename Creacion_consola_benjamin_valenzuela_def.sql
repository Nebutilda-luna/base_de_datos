DROP TABLE ACCESORIO_PRUEBA CASCADE CONSTRAINT;

CREATE TABLE CONSOLA (
  id_consola            NUMBER(4) PRIMARY KEY,
  nombre_consola        VARCHAR2(60) not NULL UNIQUE,
  tipo_consola          VARCHAR2(20) not NULL check(tipo_consola in( 'SOBREMESA', 'PORTATIL', 'HIBRIDA')),
  anio_lanzamiento      NUMBER(4) not NULL check(anio_lanzamiento BETWEEN 1983 and 2030),
  precio_referencia_usd NUMBER(6,2) not NULL check(precio_referencia_usd > 0),
  estado_fabricacion    VARCHAR2(15) default 'ACTIVA' not NULL check(estado_fabricacion IN ('ACTIVA', 'DESCONTINUADA'))
);


CREATE TABLE FRANQUICIA (
    id_franquicia     NUMBER(4) PRIMARY KEY,
    nombre_franquicia VARCHAR2(60) not NULL UNIQUE,
    creador_principal VARCHAR2(80) not NULL,
    anio_debut        NUMBER(4) NOT NULL check(anio_debut >= 1980),
    estudio_principal VARCHAR2(60) default 'NINTENDO EPD' NOT NULL
);


CREATE TABLE VIDEOJUEGO (
    id_juego            number(6) PRIMARY KEY,
    codigo_catalogo     VARCHAR2(10) not NULL UNIQUE,
    titulo              VARCHAR2(100) not NULL,
    id_franquicia       NUMBER(4) not NULL REFERENCES FRANQUICIA(id_franquicia),
    id_consola          NUMBER(4) not NULL REFERENCES CONSOLA(id_consola),
    clasificacion_esrb  VARCHAR2(5) not NULL check(clasificacion_esrb in('E', 'E10+', 'T', 'M')),
    precio_clp          NUMBER(8) not NULL check(precio_clp >= 0),
    puntaje_metacritic  NUMBER(3) check(puntaje_metacritic BETWEEN 0 and 100),
    stock_fisico        NUMBER(5) default 0 not NULL check(stock_fisico >= 0),
    fecha_lanzamiento   DATE not NULL
);


CREATE TABLE JUGADOR (
    id_jugador          NUMBER(6) PRIMARY KEY,
    nickname            VARCHAR2(30) not NULL UNIQUE,
    email               VARCHAR2(100) not NULL UNIQUE,
    pais                VARCHAR2(40) default 'CHILE' NOT NULL,
    monedas_oro         NUMBER(6) default 0 NOT NULL check(monedas_oro > = 0),
    suscripcion_online  VARCHAR2(15) default 'GRATUITA' not NULL check(suscripcion_online in('GRATUITA', 'INDIVIDUAL', 'FAMILIAR', 'EXPANSION')),
    id_juego_favorita   NUMBER(6) REFERENCES VIDEOJUEGO(id_juego)
);


CREATE TABLE ACCESORIO_PRUEBA (
    id_accesorio        number(4) PRIMARY KEY,
    nombre_accesorio    VARCHAR2(40) not NULL,
    precio_usd          number(5,2) not NULL check(precio_usd > 0),
    id_consola          NUMBER(4) not NULL REFERENCES CONSOLA(id_consola)
);


ALTER TABLE JUGADOR add fecha_registro DATE DEFAULT SYSDATE NOT NULL;
ALTER TABLE JUGADOR ADD nivel_cuenta number(3) default 1 not NULL CHECK(nivel_cuenta BETWEEN 1 and 99);
ALTER TABLE ACCESORIO_PRUEBA MODIFY nombre_accesorio VARCHAR2(100);
ALTER TABLE ACCESORIO_PRUEBA ADD color_edicion VARCHAR2(25);
ALTER TABLE ACCESORIO_PRUEBA DROP COLUMN color_edicion;
ALTER TABLE VIDEOJUEGO ADD descuento_porcentaje NUMBER(3) default 0 not NULL check(descuento_porcentaje BETWEEN 0 and 80);



SELECT * FROM CONSOLA;
SELECT * from ACCESORIO_PRUEBA;

