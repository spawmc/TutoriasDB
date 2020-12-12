-- DROP DATABASE tutorias;
CREATE DATABASE tutorias;
-- SHOW DATABASES;
-- drop DATABASE coordinaciontutoria;
CREATE DATABASE coordinaciontutoria;
use coordinaciontutoria;
CREATE table alumno(
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
CREATE table alumno_tutor(
    matricula VARCHAR(10) NOT NULL,
    numpersonalTutor INT(2) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES alumno(matricula)
);
CREATE table tutor(
    numpersonal INT(2) PRIMARY KEY NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);
CREATE table tutoria(
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
    PRIMARY KEY(
        noTutoria,
        periodoInicio,
        periodoFinal,
        numpersonalTutor
    ),
    FOREIGN KEY (numpersonalTutor) REFERENCES tutor(numpersonal),
    FOREIGN KEY (matriculaAlumno) REFERENCES alumno(matricula)
);