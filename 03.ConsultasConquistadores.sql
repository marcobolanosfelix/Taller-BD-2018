USE Conquistadores
GO

--1. Mostrar el nombre completo de los niños que se invistiron en el año 2018:
SELECT apellido, nombre FROM Niño N 
	INNER JOIN Investidura_Niño I ON I.niño_id = N.id 
		WHERE (fecha >= '2018-01-01')

--2. Mostrar el nombre completo y telefono de lo padres que tienen a hijos con alguna enfermedad o alergia:
SELECT P.apellido, P.nombre, P.telefono FROM Padre P 
	INNER JOIN Niño N ON N.padre_id = P.id 
		WHERE (alergias<>'ninguna' OR enfermedades<>'ninguna')

--3. Mostrar el nombre de los clubes que pertenecen a Medellin:
SELECT CL.nombre FROM Club CL 
	INNER JOIN Ciudad CD ON CD.id = CL.ciudad_id
	INNER JOIN Estado E ON E.id = CD.estado_id
		WHERE (E.nombre = 'Medellin')

--4. Mostrar la cantidad de asistencias que tuvo cada niño en las reuniones:
SELECT niño_id, COUNT(asistencia) AS Cantidad 
	FROM Reunion_Niño RN 
		WHERE asistencia = 1 GROUP BY RN.niño_id
		
--5. Mostrar la cantidad de inasistencias que tuvo cada niño en las reuniones:
SELECT niño_id, COUNT(asistencia) AS Cantidad 
	FROM Reunion_Niño RN 
		WHERE asistencia = 0 GROUP BY RN.niño_id

--6. Mostrar el nombre completo de los instructores que han impartido clases en el club "Los Antorcha":
SELECT I.apellido, I.nombre FROM Instructor I
	INNER JOIN Clase C ON C.instructor_id = I.id
	INNER JOIN Club CL ON CL.id = C.club_id	
		WHERE CL.nombre = 'Los Antorcha'

--7. Mostrar el club que tienen niños con más enfermedades:
(SELECT DISTINCT CL.nombre FROM Club CL 
	INNER JOIN Clase C ON C.club_id = CL.id 
		INNER JOIN Niño N ON N.clase_id = CL.id) 
			SELECT COUNT(enfermedades) AS Cantidad 
				FROM Niño N
					WHERE N.enfermedades<>'ninguna'

--8. Mostrar la cantidad de clubes por ciudad:
SELECT C.id, COUNT(CL.id) AS Cantidad_clubes 
	FROM Ciudad C INNER JOIN Club CL ON CL.ciudad_id = C.id 
		GROUP BY C.id 

--9. Mostrar el nombre de los instructores con niños sin alergias:
SELECT DISTINCT I.apellido, I.nombre FROM Instructor I 
	INNER JOIN Investidura_Niño NI ON NI.instructor_id = I.id
	INNER JOIN Niño N ON N.id = NI.niño_id
		WHERE N.alergias = 'Ninguna'

--10. Mostrar el nombre de los niños que se invistieron el 2017 y el nombre de la clase y su color al que pertenecian:
SELECT DISTINCT N.apellido, N.nombre, C.nombre, C.color FROM Clase C 
	INNER JOIN Niño N ON N.clase_id = C.id
	INNER JOIN Investidura_Niño NI ON NI.niño_id = N.id
		WHERE ((NI.fecha >= '2017-01-01') AND (NI.fecha < '2018-01-01'))

--11. Mostrar el nombre del niño que más cumplió con todos los requisitos en una reunión:
SELECT N.apellido, N.nombre FROM Niño N 
	INNER JOIN Reunion_Niño RN ON RN.niño_id = N.id
		WHERE RN.asistencia=1 AND RN.cuota=1 AND RN.pulcritud=1 AND RN.puntualidad=1 AND RN.tarea=1 AND RN.uniforme=1

--12. Mostrar el nombre del niño que cumplió con ningún requisito en una reunión:
SELECT N.apellido, N.nombre FROM Niño N 
	INNER JOIN Reunion_Niño RN ON RN.niño_id = N.id
		WHERE RN.asistencia=0 AND RN.cuota=0 AND RN.pulcritud=0 AND RN.puntualidad=0 AND RN.tarea=0 AND RN.uniforme=0

--13. ¿Cuántos pagos de las cuotas se obtuvieron en total en el 2018? :
SELECT COUNT(RN.cuota) AS Total_Cuotas FROM Reunion_Niño RN 
	WHERE ((RN.fecha >= '2018-01-01') AND (RN.fecha < '2019-01-01') AND RN.cuota = 1)
	
--14. ¿Cuántos pagos de las cuotas no se obtuvieron en el 2018? :
SELECT COUNT(RN.cuota) AS Cantidad_faltantes FROM Reunion_Niño RN 
			WHERE ((RN.fecha >= '2018-01-01') AND (RN.fecha < '2019-01-01') AND RN.cuota = 0)

--15. Nombre de las unidades y fecha de investimiento deonde hubo niños menores de 8 años:
SELECT DISTINCT U.nombre, NI.fecha FROM Unidad U 
	INNER JOIN Niño N ON N.unidad_id = U.id
	INNER JOIN Investidura_Niño NI ON NI.niño_id = N.id
		WHERE N.edad <= 8
	
--16. Nombre del niño con estatura arriba de 1.75 que realizaron la actividad de "Escalado":
SELECT N.apellido, N.nombre FROM Niño N
	INNER JOIN Actividad_Niño AN ON AN.niño_id = N.id
	INNER JOIN Actividad A ON A.id = AN.actividad_id
		WHERE A.nombre = 'Escalado' AND N.estatura >= 1.75

--17. Nombre de los consejeros e instructores con especilaidad en "Multilenguaje":
SELECT DISTINCT C.apellido, C.nombre, I.apellido, I.nombre FROM Instructor I
	INNER JOIN Especialidad_Instructor EI ON EI.instructor_id = I.id
	INNER JOIN Especialidad E ON E.id = EI.especialidad_id
	INNER JOIN Consejero_Especialidad CE ON CE.especialidad_id = E.id
	INNER JOIN Consejero C ON C.id = CE.consejero_id
		WHERE E.nombre = 'Multilenguaje'

--18. Mostrar el nombre del consejero con especialidad en "Experto en excursiones" y que tiene niños menores de 10 años:
SELECT C.apellido, C.nombre FROM Niño N
	INNER JOIN Unidad U ON U.id = N.unidad_id
	INNER JOIN Consejero C ON C.id = U.consejero_id
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id
		WHERE E.nombre = 'Experto en excursiones' AND N.edad = 10

--19. Mostrar los nombres de los directores que presidieron las investiduras:
SELECT DISTINCT D.apellido, D.nombre FROM Director D
	INNER JOIN Club C ON C.director_id = D.id
	INNER JOIN Clase CL ON CL.club_id = C.id
	INNER JOIN Niño N ON N.clase_id = CL.id
	INNER JOIN Investidura_Niño NI ON NI.niño_id = N.id 

--20. Nombre de los niños que pesan más de 75kg y son menores de 10 años:
SELECT * FROM Niño N
	WHERE N.peso>75 AND N.edad<10

--21. Mostrar las actividades que realizaron los niños con enfermedades:
SELECT A.nombre FROM Actividad A 
	INNER JOIN Actividad_Niño AN ON AN.niño_id = A.id
	INNER JOIN Niño N ON N.id = AN.actividad_id
		WHERE N.enfermedades<>'Ninguna'

--22. Mostrar los nombres del director y el subdirector del club llamado "Los Ceibas":
SELECT D.apellido, D.nombre, S.apellido, S.nombre FROM Director D 
	INNER JOIN Club C ON C.director_id = D.id
	INNER JOIN Subdirector S ON S.id = C.subdirector_id
		WHERE C.nombre = 'Los Ceibas'

--23. Mostrar la dirección del club con los directores con la especialidad de "Tirador Profesional":
SELECT C.calle, C.colonia FROM Club C 
	INNER JOIN Director D ON D.id = C.director_id
	INNER JOIN Especialidad E ON E.id = D.especialidad_id
		WHERE E.nombre = 'Tirador Profesional'

--24. Mostrar el nombre de los clubes con directores que tengan la especialidad de "Experto en tirolina":
SELECT * FROM Club C 
	INNER JOIN Director D ON D.id = C.director_id
	INNER JOIN Especialidad E ON E.id = D.especialidad_id
		WHERE E.nombre = 'Experto en tirolina'
		
--25. Mostrar el nombre completo y la dirección donde trabajnn todos los tesoreros:
SELECT T.apellido, T.nombre, C.calle, C.colonia FROM Tesorero T 
	INNER JOIN Club C ON C.tesorero_id = T.id

--26. Mostrar en qué fecha se invistieron los niños de la Unidad "Fox":
SELECT NI.fecha FROM Investidura_Niño NI 
	INNER JOIN Niño N ON N.id = NI.niño_id
	INNER JOIN Unidad U ON U.id = N.unidad_id
		WHERE U.nombre = 'Fox'

--27. Mostrar el nombre de los niños que pertenecen al club de "Los Corre Caminos":
SELECT N.apellido, N.nombre FROM Club C 
	INNER JOIN Clase CS ON CS.club_id = C.id
	INNER JOIN Niño N ON N.clase_id = CS.id
		WHERE C.nombre = 'Los Corre Caminos'

--28. Mostrar el nombre del instructor que imparte la clase 3A:
SELECT I.apellido, I.nombre FROM Instructor I 
	INNER JOIN Clase C ON C.instructor_id = I.id
		WHERE C.nombre = '3A'

--29. Mostrar el nombre de los consejeros de la unidad "Agua" y "Tierra":
SELECT C.apellido, C.nombre FROM Consejero C 
	INNER JOIN Unidad U ON U.consejero_id = C.id
		WHERE U.nombre = 'Agua' OR U.nombre = 'Tierra'

--30. Mostrar el nombre del consejero con la especialidad en "Especial" que tiene la unidad "Fuego":
SELECT DISTINCT C.apellido, C.nombre FROM Unidad U 
	INNER JOIN Consejero C ON C.id = U.consejero_id
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id
		WHERE U.nombre = 'Fuego'

--31. ¿Cuántos niños dieron la cuota en el mes de Septiembre? :
SELECT  COUNT(RN.cuota) FROM Reunion_Niño RN WHERE (RN.cuota = 1 AND (RN.fecha >= '2018-09-01' AND RN.fecha < '2018-10-01'))

--32. ¿Cuántos niños dieron la cuota en el mes de Octubre? :
SELECT * FROM Reunion_Niño RN WHERE (RN.cuota = 1 AND (RN.fecha >= '2018-10-01' AND RN.fecha < '2018-11-01'))

--33. Mostrar todo el registro de los padres cuyos hijos no han cumplido con la cuota:
SELECT P.* FROM Padre P 
	INNER JOIN Niño N ON P.id = N.padre_id
	INNER JOIN Reunion_Niño RN ON RN.niño_id = N.id
		WHERE RN.cuota = 0

--34. Mostrar el nombre del capitan de la unidad "Vibora":
SELECT C.apellido, C.nombre FROM Capitan C 
	INNER JOIN Niño N ON N.capitan_id = C.id
	INNER JOIN Unidad U ON U.id = N.unidad_id	
		WHERE U.nombre = 'Vibora'
	
--35. Mostrar el nombre de los consejeros con niños que tienen un peso de 80kg :
SELECT C.apellido, C.nombre FROM Consejero C 
	INNER JOIN Unidad U ON U.consejero_id = C.id
	INNER JOIN Niño N ON N.unidad_id = U.id
		WHERE N.peso > 80
		
--36. Mostrar nombre de las clases donde se encuentran niños mayores de 14 años:
SELECT C.nombre FROM Clase C 
	INNER JOIN Niño N ON N.clase_id = C.id
		WHERE N.edad>14			
		
--37. Mostrar la ocupación que tiene el padre Carlos Aguilar de los niños:
SELECT P.ocupacion FROM Padre P 
	INNER JOIN Niño N ON N.padre_id = P.id
	INNER JOIN Capitan C ON C.id = N.capitan_id
		WHERE C.apellido = 'Aguilar' AND C.nombre = 'Carlos'
		
--38. Nombre de la unidad que tiene un consejero con especialidad en "Experto en musica":
SELECT U.nombre FROM Unidad U 
	INNER JOIN Consejero C ON C.id = U.consejero_id
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id				
		 WHERE E.nombre = 'Experto en musica'

--39. Mostrar el nombre del estado donde se encuentra la unidad "Aguila":
SELECT DISTINCT E.nombre FROM Estado E
	INNER JOIN Ciudad C ON C.estado_id = E.id
	INNER JOIN Club CB ON CB.ciudad_id = C.id
	INNER JOIN Clase CS ON CS.club_id = CB.id
	INNER JOIN Niño N ON N.clase_id = CS.id
	INNER JOIN Unidad U ON U.id = N.unidad_id
		WHERE U.nombre = 'Aguila'

--40. Cantidad de niños sanos que realizaron la actividad de "Buseo":
SELECT COUNT(*) AS Cantidad_Niños_Sanos_Buseo FROM Niño N
	INNER JOIN Actividad_Niño AN ON AN.niño_id = N.id
	INNER JOIN Actividad A ON A.id = AN.actividad_id
		WHERE A.nombre = 'Buseo' AND N.alergias='Ninguna' AND N.enfermedades='Ninguna'

--41. Mostrar el pais donde se encuentra la clase "4A":
SELECT P.nombre FROM Pais P
	INNER JOIN Estado E ON E.pais_id = P.id
	INNER JOIN Ciudad C ON C.estado_id = E.id
	INNER JOIN Club CB ON CB.ciudad_id = C.id
	INNER JOIN Clase CS ON CS.club_id = CB.id
		WHERE CS.nombre = '4A'

--42. Cantidad de consejeros que hicieron su especialidad en 2014:
SELECT COUNT(*) AS "Cantidad de consejeros especializados en 2014" FROM Consejero C 
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id
		WHERE ((CE.fecha >= '2014-01-01') AND (CE.fecha < '2015-01-01')) 

--43. Mostrar el nombre de los consejeros que hicieron su especializacion hace menos de 3 años:
SELECT DISTINCT C.apellido, C.nombre FROM Consejero C 
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id
		WHERE CE.fecha > '2015-10-23'

--44. Nombre de los instructores con más de 5 años de experiencia en la especialidad de "Cocinero profesional":
SELECT I.apellido, I.nombre FROM Instructor I
	INNER JOIN Especialidad_Instructor EI ON EI.instructor_id = I.id
	INNER JOIN Especialidad E ON E.id = EI.especialidad_id
		WHERE E.nombre = 'Cocinero profesional'

--45. Mostrar el nombre y numero de emergencia de los niños que están en una clase color azul y tiene alguna alergia o enfermedad:
SELECT N.apellido, N.nombre, N.numero_emergencia FROM Niño N
	INNER JOIN Clase CS ON CS.id = N.clase_id
		WHERE N.alergias='Ninguna' AND N.enfermedades='Ninguna' AND CS.color='Azul'

--46. Cantidad de instructores que se especializaron entre el 2016 y el 2014:
SELECT COUNT(*) AS "Cantidad de especializados entre 2014 y 2016" FROM Instructor I
	INNER JOIN Especialidad_Instructor EI ON EI.instructor_id = I.id
	INNER JOIN Especialidad E ON E.id = EI.especialidad_id
		WHERE EI.fecha >= '2014-01-01' AND EI.fecha < '2017-01-01' 

--47. Fecha en el que los consejeros René Ontiveros y Valentin Rendon se especializaron como "Experto en montar caballo":
SELECT COUNT(*) FROM Consejero C 
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
	INNER JOIN Especialidad E ON E.id = CE.especialidad_id
		WHERE E.nombre = 'Experto en montar caballo' AND C.apellido='Ontiveros' AND C.apellido='Rendón'

--48. Nombre de la unidad en el que tiene consejeros especializados desde hace solo un año:
SELECT DISTINCT U.nombre FROM Unidad U 
	INNER JOIN Consejero C ON C.id = U.consejero_id
	INNER JOIN Consejero_Especialidad CE ON CE.consejero_id = C.id
		WHERE CE.fecha > '2017-10-23'

--49. Mostrar el nombre de los niños y fecha en que se realizó la actividad de "Tirolina":
SELECT N.apellido, N.nombre FROM Niño N 
	INNER JOIN Actividad_Niño AN ON AN.niño_id = N.id
	INNER JOIN Actividad A ON A.id = AN.actividad_id
		WHERE A.nombre = 'Tirolina'

--50. Cantidad de actividades realizadas entre abril y junio del 2018:
SELECT COUNT(*) AS "Cantidad de actividades realizadas entre abril y junio del 2018" FROM Actividad_Niño AN
	WHERE AN.fecha >= '2018-04-01' AND AN.fecha < '2018-07-01'

