DROP DATABASE IF EXISTS Tutorias;
/* SHOW DATABASES; */
CREATE DATABASE Tutorias;
use Tutorias;
/* |                                | */
/* |            Tablas              | */
/* |                                | */
CREATE table alumno (
    matricula VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    semestre INT(2) NOT NULL,
    diaIngreso INT(2) NOT NULL,
    mesIngreso INT(2) NOT NULL,
    yearIngreso INT(4) NOT NULL
);
CREATE table tutor (
    numpersonal INT(9) PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL
);
CREATE table alumno_tutor (
    matricula VARCHAR(10) NOT NULL,
    numpersonalTutor INT(9),
    PRIMARY KEY(
        matricula,
        numpersonalTutor
    ),
    FOREIGN KEY (matricula) REFERENCES alumno(matricula),
    FOREIGN KEY (numpersonalTutor) REFERENCES tutor(numpersonal)
);
CREATE table tutoria (
    noTutoria INT(20) NOT NULL,
    periodoInicio DATE NOT NULL,
    periodoFinal DATE NOT NULL,
    numpersonalTutor INT(2) NOT NULL,
    matriculaAlumno VARCHAR(10) NOT NULL,
    asunto VARCHAR(30),
    asistencia VARCHAR(2),
    horaTutoria time,
    diaTutoria INT(2),
    mesTutoria INT(2),
    yearTutoria INT(4),
    lugarTutoria varchar(30),
    PRIMARY KEY(
        noTutoria,
        periodoInicio,
        periodoFinal,
        numpersonalTutor,
        matriculaAlumno
    ),
    FOREIGN KEY (numpersonalTutor) REFERENCES tutor(numpersonal),
    FOREIGN KEY (matriculaAlumno) REFERENCES alumno(matricula)
);
/* |                                | */
/* |            Inserts             | */
/* |                                | */
/* Alumno */
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19012345', 'Alberto', 'Perez', 'Galvan', 'S19012345@estudiantes.uv.mx', 3, 06, 07, 2019 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19013687', 'Miguel', 'Guzman', 'Quiroz', 'S19013687@estudiantes.uv.mx', 3, 10, 12, 2019 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19012394', 'Carlos', 'Hernandez', 'Gutierrez', 'S19012394@estudiantes.uv.mx', 3, 06, 07, 2019 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19011567', 'Jose', 'de Jesus', 'Hernandez', 'S19011567@estudiantes.uv.mx', 3, 10, 12, 2019 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19019862', 'Melissa', 'Acuña', 'Galvan', 'S19019862@estudiantes.uv.mx', 5, 06, 07, 2018 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19013489', 'Alexia', 'Carrasco', 'Mendez', 'S19013489@estudiantes.uv.mx', 5, 10, 12, 2018 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19015920', 'Sofia', 'Lopez', 'Gonzalez', 'S19015920@estudiantes.uv.mx', 7, 06, 07, 2017 );
insert into alumno ( matricula, nombre, apellidoP, apellidoM, email, semestre, diaIngreso, mesIngreso, yearIngreso ) values ( 'S19014781', 'Karla', 'Landa', 'Ruiz', 'S19014781@estudiantes.uv.mx', 7, 10, 12, 2017 );
    /* Tutor */
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152837, 'Alizia', 'Lozano', 'Marques', '190152837@tutores.uv.mx' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152983, 'Nestor', 'Pujol', 'Beltran', '190152983@tutores.uv.mx' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190159832, 'Enric', 'Jover', 'Infante', '190159832@tutores.uv.mx' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152782, 'Irene', 'Canales', 'Pulido', '190152782@tutores.uv.mx' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152394, 'Virgilio', 'Lema', 'Mendez', '190152394@tutores.uv.mx' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190153981, 'Graciela', 'Aguado', 'Hernandez', '190153981@tutores.uv.mx' );
    
/* alumno_turo */ 
insert into alumno_tutor (matricula, numpersonalTutor) values('S19012345', 190152837);
insert into alumno_tutor (matricula, numpersonalTutor) values('S19013687', 190152837);
insert into alumno_tutor (matricula, numpersonalTutor) values('S19012394', 190159832);
insert into alumno_tutor (matricula, numpersonalTutor) values('S19011567', 190152837);
insert into alumno_tutor (matricula, numpersonalTutor) values('S19019862', 190159832);
insert into alumno_tutor (matricula, numpersonalTutor) values('S19013489', 190159832);

 /* tutoria */
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 1, '2020/09/08', '2020/01/04', 190152837, 'S19012345', 'Tareas', '', '15:30:00', 05, 09, 2020, 'Aula 102' );
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 2, '2020/09/08', '2020/01/04', 190152837, 'S19013687', 'Preeincripcion', '', '12:30:00', 15, 11, 2020, 'Aula 502' ); 
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 3, '2020/09/08', '2020/01/04', 190159832, 'S19012394', 'Planeacion', '', '09:30:00', 15, 12, 2020, 'Aula 106' ); 
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 3, '2020/09/08', '2020/01/04', 190152837, 'S19011567', 'Preeincripcion', '', '12:50:00', 15, 11, 2020, 'Aula 502' );
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 1, '2020/09/08', '2020/01/04', 190159832, 'S19019862', 'Tareas', '', '10:30:00', 04, 09, 2020, 'Aula 102' );

/* Sola tabla */
select matricula,
    nombre
from alumno;

select *
from tutor
where nombre = 'Nestor';

select numpersonal,
    nombre,
    email
from tutor
where apellidoM = 'Pulido';

select *
from tutoria
where numpersonalTutor = 190159832
    and matriculaAlumno = 'S19012394';

/* Mas de una tabla */

select nombre,
    asunto
from tutor,
    tutoria
where tutor.numpersonal = tutoria.numpersonalTutor
    and matriculaAlumno = 'S19013687';

select nombre,
    horaTutoria,
    lugarTutoria
from alumno,
    tutoria
where alumno.matricula = tutoria.matriculaAlumno;

select alumno.nombre,
    alumno.apellidoP,
    tutor.nombre,
    tutor.apellidoP
from alumno,
    tutoria,
    tutor
where alumno.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = tutor.numpersonal;

select alumno.nombre,
    alumno.apellidoP,
    alumno.apellidoM
from alumno,
    tutoria,
    tutor
where alumno.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = tutor.numpersonal
    and tutor.nombre = 'Enric';

/* Con subconsulta */

select nombre,
    asunto
from tutor,
(
        select *
        from tutoria
        where matriculaAlumno = 'S19013687'
    ) t
where tutor.numpersonal = t.numpersonalTutor;

select alumno.nombre,
    alumno.apellidoP,
    alumno.apellidoM
from alumno,
    tutoria,
(
        select *
        from tutor
        where nombre = 'Enric'
    ) t
where alumno.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = t.numpersonal;

select tutor.nombre,
    tutor.email,
    tutoria.horaTutoria,
    tutoria.lugartutoria
from tutor,
    tutoria,
(
        select *
        from alumno
        where email = 'S19012394@estudiantes.uv.mx'
    ) a
where a.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = tutor.numpersonal;

select tutor.numpersonal,
    tutor.nombre,
    tutoria.horaTutoria,
    tutoria.lugarTutoria
from tutor,
    tutoria,
(
        select *
        from alumno
        where yearIngreso = 2019
    ) a
where a.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = tutor.numpersonal;

/* Que incluyan funciones de agregación */

select count(nombre)
from alumno;

select max(horaTutoria)
from tutoria;

select min(matricula)
from alumno;

select count(alumno.nombre),
    min(alumno.matricula),
    max(tutor.numpersonal)
from alumno,
    tutor,
    tutoria
where alumno.matricula = tutoria.matriculaAlumno
    and tutoria.numpersonalTutor = tutor.numpersonal;

/* update */

-- Actualizar la asistencia del alumno Jose de Jesus Hernandez --
UPDATE tutoria
SET asistencia = 'Si'
WHERE matriculaAlumno = (
        SELECT matricula
        from alumno
        WHERE nombre = 'Jose'
            AND apellidoP = 'de Jesus'
            AND apellidoM = 'Hernandez'
    );

-- Actualizar la asistencia del alumno S19012345 --
UPDATE tutoria
SET asistencia = 'No'
WHERE matriculaAlumno = 'S19013687';

-- Actualizar lugar de tutoria --
UPDATE tutoria
SET lugarTutoria = 'Aula 106'
WHERE numpersonalTutor = 190152837 AND matriculaAlumno = 'S19013687'

-- Cambiar tutor del alumno Jose de Jesus Hernandez --
UPDATE alumno_tutor
SET numpersonalTutor = (
        SELECT numpersonal
        FROM tutor
        WHERE nombre = 'Nestor'
            AND apellidoP = 'Pujol'
            AND apellidoM = 'Beltran'
    )
WHERE numpersonalTutor = (
        SELECT numpersonal
        FROM tutor
        WHERE nombre = 'Alizia'
            AND apellidoP = 'Lozano'
            AND apellidoM = 'Marques'
    )
    AND matricula = (
        SELECT matricula
        from alumno
        WHERE nombre = 'Jose'
            AND apellidoP = 'de Jesus'
            AND apellidoM = 'Hernandez'
    )

/* delete */

-- Eliminar informacion de la primera tutoria del alumno Alberto Perez Galvan --

DELETE FROM tutoria
WHERE matriculaAlumno = (
        SELECT matricula
        from alumno
        WHERE nombre = 'Alberto'
            AND apellidoP = 'Perez'
            AND apellidoM = 'Galvan'
    )
    AND noTutoria = 1;

-- Eliminar alumnos que superaron los 10 semestres --
DELETE FROM alumno
WHERE semestre >= 10;


/* 2 vistas */

-- nombre completo de los alumnos --
CREATE VIEW nombreCompletoAlumno AS
SELECT nombre,
    apellidoP,
    apellidoM
FROM alumno;

-- DROP VIEW nombreCompletoAlumno;

SELECT * FROM nombreCompletoAlumno;

-- nombre y matricula de los alumnos que asistieron a la tutoria -- 

CREATE VIEW nombreAlumnosAsistentes AS
SELECT matricula,
    nombre,
    apellidoP,
    apellidoM
FROM alumno
    INNER JOIN tutoria ON alumno.matricula = tutoria.matriculaAlumno
WHERE tutoria.asistencia = 'Si'
    OR 'si';

-- DROP VIEW nombreAlumnosAsistentes;

SELECT * FROM nombreAlumnosAsistentes;

/* cuentas de usuario con diferentes privilegios */
 -- Cuenta de usurio para darle mantenimiento a la base de datos Tutoria --
CREATE USER 'mantenedor'@'localhost' IDENTIFIED BY 'mantenedor123'
GRANT ALL PRIVILEGES ON Tutorias.* TO mantenedor@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'mantenedor'@'localhost';

-- Cuenta de usuario para acceder a todos los datos de todos los alumnos --
CREATE USER 'directivo'@'localhost' IDENTIFIED BY 'directivo123'
GRANT SELECT ON Tutorias.* TO 'directivo'@'localhost'
SHOW GRANTS FOR 'directivo' @'localhost';

-- Cuenta de usuario para el acceso unico a los datos de los alumnos --
CREATE USER 'secretariaAcademica'@'localhost' IDENTIFIED BY 'secretaria123'
GRANT SELECT, UPDATE ON Tutorias.alumno TO 'secretariaAcademica'@'localhost'
SHOW GRANTS FOR 'secretariaAcademica' @'localhost';

/* 1 trigger */
DELIMITER / / CREATE TRIGGER tutorado
AFTER
INSERT ON alumno FOR EACH ROW BEGIN
INSERT INTO alumno_tutor
values (
        (
            SELECT *
            FROM tutoria
            LIMIT 1;
), NULL
);
END;
/ / DELIMITER;

/* Procedimiento almacenado */

-- Actualizar semestre --
DELIMITER //
CREATE PROCEDURE aumentarSemestre() BEGIN
UPDATE alumno
SET semestre = (semestre + 1);
END;
//
DELIMITER ;


/* |                                | */
/* |            JAVA                | */
/* |                                | */

CREATE USER 'javaConnection'@'localhost' IDENTIFIED BY 'javaConnection';
GRANT ALL PRIVILEGES ON Tutorias.* TO 'javaConnection'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'javaConnection' @'localhost';

/* Para poder trabajar con la tabla que se muestra en java es necesario tener la vista nombreCompletoAlumno */

CREATE VIEW nombreCompletoAlumno AS
SELECT nombre,
    apellidoP,
    apellidoM
FROM alumno;