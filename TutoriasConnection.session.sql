DROP DATABASE tutorias;
CREATE DATABASE tutorias;
SHOW DATABASES;
drop database coordinaciontutoria;
create database coordinaciontutoria;
use coordinaciontutoria;
create table alumno(
    matricula varchar(10) primary key not null,
    nombre varchar(20) not null,
    apellidoP varchar(20) not null,
    apellidoM varchar(20) not null,
    email varchar(20) not null,
    semestre int(2) not null,
    diaIngreso int(2) not null,
    mesIngreso int(2) not null,
    yearIngreso int(4) not null
);
create table alumno_tutor(
    matricula varchar(10) not null,
    numpersonalTutor int(2) not null,
    FOREIGN KEY (matricula) REFERENCES alumno(matricula)
);
create table tutor(
    numpersonal int(2) primary key not null,
    nombre varchar(20) not null,
    apellidoP varchar(20) not null,
    apellidoM varchar(20) not null,
    email varchar(20) not null
);
create table tutoria(
    NoTutoria int(2) not null,
    PeriodoInicio date not null,
    PeriodoFinal date not null,
    numpersonalTutor int(2),
    matriculaAlumno varchar(10) not null,
    asunto varchar(30),
    asistencia varchar(6),
    horaTutoria time,
    diaTutoria int(2),
    mesTutoria int(2),
    yearTutoria int(4),
    primary key(
        NoTutoria,
        PeriodoInicio,
        PeriodoFinal,
        numpersonalTutor
    ),
    FOREIGN KEY (numpersonalTutor) REFERENCES tutor(numpersonal),
    FOREIGN KEY (matriculaAlumno) REFERENCES alumno(matricula)
);