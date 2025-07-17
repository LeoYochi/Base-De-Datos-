CREATE DATABASE ExamenRelacional1;
USE ExamenRelacional1;

CREATE TABLE INSTRUCTOR (
    ssn INT NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    PRIMARY KEY (ssn)
);

CREATE TABLE CLASS (
    coursenum VARCHAR(50) NOT NULL,
    year VARCHAR(50) NOT NULL,
    term VARCHAR(50) NOT NULL,
    secion VARCHAR(50) NOT NULL,
    PRIMARY KEY (coursenum, year, term, secion)
);

CREATE TABLE TEACHES (
    ssn INT NOT NULL,
    coursenum VARCHAR(50) NOT NULL,
    year VARCHAR(50) NOT NULL,
    term VARCHAR(50) NOT NULL,
    secion VARCHAR(50) NOT NULL,
    PRIMARY KEY (ssn, coursenum, year, term, secion),

    FOREIGN KEY (ssn) REFERENCES INSTRUCTOR(ssn),
    FOREIGN KEY (coursenum, year, term, secion)
        REFERENCES CLASS(coursenum, year, term, secion)
);
