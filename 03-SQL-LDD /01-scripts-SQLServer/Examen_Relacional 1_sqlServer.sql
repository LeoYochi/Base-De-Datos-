CREATE DATABASE ExamenRelacional1;
GO

USE ExamenRelacional1;
GO

CREATE TABLE INSTRUCTOR(
    ssn INT NOT NULL,
    Lname NVARCHAR(50) NOT NULL,
    Fname NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_instructor PRIMARY KEY (ssn)
);
GO

CREATE TABLE CLASS(
    coursenum NVARCHAR(50) NOT NULL,
    year NVARCHAR(50) NOT NULL,
    term NVARCHAR(50) NOT NULL,
    secion NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_class PRIMARY KEY (coursenum, year, term, secion)
);
GO

CREATE TABLE TEACHES(
    ssn INT NOT NULL,
    coursenum NVARCHAR(50) NOT NULL,
    year NVARCHAR(50) NOT NULL,
    term NVARCHAR(50) NOT NULL,
    secion NVARCHAR(50) NOT NULL,
      CONSTRAINT pk_teaches PRIMARY KEY (ssn, coursenum, year, term, secion),
    
    CONSTRAINT fk_teaches_instructor FOREIGN KEY (ssn)
        REFERENCES INSTRUCTOR(ssn),
    
    CONSTRAINT fk_teaches_class FOREIGN KEY (coursenum, year, term, secion)
        REFERENCES CLASS(coursenum, year, term, secion)
);
GO











