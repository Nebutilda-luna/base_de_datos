SELECT * FROM jugadores;


SELECT nickname, SUELDO_MENSUAL, SUELDO_MENSUAL * 12 AS SUELDO_ANUAL FROM JUGADORES;

SELECT upper(nickname) FROM JUGADORES WHERE LOWER(NICKNAME) LIKE '%z%';

SELECT jugador_id, MAX(puntaje_combate)  as puntaje, j.NOMBRE_REAL FROM PARTICIPACIONES p join jugadores j on p.id = j.id
GROUP BY JUGADOR_ID, j.NOMBRE_REAL ORDER BY puntaje DESC;


SELECT NOMBRE, SUELDO_MENSUAL, SUELDO_MENSUAL * 12 AS presupuesto_anual FROM REGIONES, JUGADORES;

--SELECT

--1
SELECT * FROM REGIONES;
--2
SELECT nombre, rol, origen_lore from AGENTES;
--3
SELECT nickname as jugador, nombre_real as nombre_completo, sueldo_mensual as sueldo_usd from JUGADORES;
--4
SELECT nickname, sueldo_mensual, sueldo_mensual * 12 as presupuesto_anual from JUGADORES;
--5
SELECT nombre, TAG, presupuesto_anual / 1000000 as presupuesto_millones from EQUIPOS;
--6 
SELECT id,kills assists, deaths, kills + assists as participacion_ofensiva from PARTICIPACIONES;

--WHERE

--7
SELECT nickname, pais_natal, sueldo_mensual FROM JUGADORES where pais_natal = 'Chile';
--8
SELECT nickname, edad, sueldo_mensual from JUGADORES where SUELDO_MENSUAL > 25000;
--9
SELECT nombre, ambientacion from MAPAS WHERE sitios_bomba = 3;
--10
SELECT nickname,edad, sueldo_mensual from JUGADORES where edad BETWEEN 19 and 22;
