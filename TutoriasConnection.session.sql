DROP DATABASE IF EXISTS tutorias;
CREATE DATABASE tutorias;
/* SHOW DATABASES; */
/* drop DATABASE coordinaciontutoria; */
CREATE DATABASE coordinaciontutoria;
use coordinaciontutoria;
/* |                                | */
/* |            Tablas              | */
/* |                                | */
CREATE table alumno (
    matricula VARCHAR(10) PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    semestre INT(2) NOT NULL,
    diaIngreso INT(2) NOT NULL,
    mesIngreso INT(2) NOT NULL,
    yearIngreso INT(4) NOT NULL
);
CREATE table alumno_tutor (
    matricula VARCHAR(10) NOT NULL,
    numpersonalTutor INT(2) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES alumno(matricula)
);
CREATE table tutor (
    numpersonal INT(9) PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);
CREATE table tutoria (
    noTutoria INT(2) NOT NULL,
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
        numpersonalTutor
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
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152837, 'Alizia', 'Lozano', 'Marques', 'ecovi91@outlook.com' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152983, 'Nestor', 'Pujol', 'Beltran', 'ecovi91@outlook.com' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190159832, 'Enric', 'Jover', 'Infante', 'ecovi91@outlook.com' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152782, 'Irene', 'Canales', 'Pulido', 'ecovi91@outlook.com' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190152394, 'Virgilio', 'Lema', 'Mendez', 'ecovi91@outlook.com' );
insert into tutor (numpersonal, nombre, apellidoP, apellidoM, email) values ( 190153981, 'Graciela', 'Aguado', 'Hernandez', 'ecovi91@outlook.com' );
    /*alumno_turo TODO: AGREGAR MAS REGISTROS PARA ALUMNO_TUTOR*/ 
insert into alumno_tutor (matricula, numpersonal) values('S19012345', )
insert into tutoria (
        NoTutoria,
        PeriodoInicial,
        PeriodoFinal,
        numpersonalTutor,
        matriculaAlumno,
        asunto,
        asistencia,
        horaTutoria,
        diaTutoria,
        mesTutoria,
        yearTutoria,
        lugarTutoria
    )
values (
        1,
        '2020/09/08',
        '2020/01/04',
        22,
        'S19012345',
        'Tareas',
        'Si',
        '09:30:00',
        15,
        10,
        2020,
        'Aula 102'
    );