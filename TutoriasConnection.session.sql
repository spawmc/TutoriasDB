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
    numpersonalTutor INT(9) NOT NULL,
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
    numpersonalTutor INT(2),
    matriculaAlumno VARCHAR(10) NOT NULL,
    asunto VARCHAR(30),
    asistencia VARCHAR(6),
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
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 1, '2020/09/08', '2020/01/04', 190152837, 'S19012345', 'Tareas', 'Si', '15:30:00', 05, 09, 2020, 'Aula 102' );
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 2, '2020/09/08', '2020/01/04', 190152837, 'S19013687', 'Preeincripcion', 'Si', '12:30:00', 15, 11, 2020, 'Aula 502' ); 
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 3, '2020/09/08', '2020/01/04', 190159832, 'S19012394', 'Planeacion', 'Si', '09:30:00', 15, 12, 2020, 'Aula 106' ); 
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 3, '2020/09/08', '2020/01/04', 190152837, 'S19011567', 'Preeincripcion', 'Si', '12:50:00', 15, 11, 2020, 'Aula 502' );
insert into tutoria ( noTutoria, periodoInicio, periodoFinal, numpersonalTutor, matriculaAlumno, asunto, asistencia, horaTutoria, diaTutoria, mesTutoria, yearTutoria, lugarTutoria ) values ( 1, '2020/09/08', '2020/01/04', 190159832, 'S19019862', 'Tareas', 'Si', '10:30:00', 04, 09, 2020, 'Aula 102' );

/* Realizar las siguientes consultas:
o 4 consultas que involucren una sola tabla
o 4 consultas que involucren más de una tabla
o 4 consultas que incluyan una subconsulta
o 4 consultas que incluyan funciones de agregación
o 4 consultas update
o 4 consultas delete
Nota: Para cada consulta es necesario escribir: el enunciado de la consulta, la
consulta en álgebra relacional, la consulta en sql y la tabla resultado. */

/* Sola tabla */

/* Mas de una tabla */

/* Con subconsulta */

/* Que incluyan funciones de agregación */

/* update */

/* delete */

/* 2 vistas */

/* 2 cuentas de usuario con diferentes privilegios */

CREATE USER 'mantenedor'@'localhost' IDENTIFIED BY 'mantenedor123'
GRANT ALL PRIVILEGES ON Tutorias.* TO mantenedor@'localhost' WITH GRANT OPTION;

CREATE USER 'directivo'@'localhost' IDENTIFIED BY 'directivo123'
GRANT SELECT ON Tutorias.* TO 'directivo'@'localhost'

CREATE USER 'secretariaAcademica'@'localhost' IDENTIFIED BY 'secretaria123'
GRANT SELECT, UPDATE ON Tutorias.alumno TO 'secretariaAcademica'@'localhost'

/* 1 trigger */

/* Un procedimiento almacenado */