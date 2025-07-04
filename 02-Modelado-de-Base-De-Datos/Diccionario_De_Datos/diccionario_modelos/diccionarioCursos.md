# 📘 Diccionario de Datos – Cursos

**Estudiante**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-----------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumEstudiante   | INT         | -      | Sí  | ❌  | ❌   | Sí    | > 0           | -          | Número estudiante |
| Nombre         | NVARCHAR    | 50     | ❌  | ❌  | ❌   | ❌    | Solo letras   | -          | Nombre      |
| ApellidoPaterno| NVARCHAR    | 50     | ❌  | ❌  | ❌   | ❌    | Solo letras   | -          | Apellido paterno |
| ApellidoMaterno| NVARCHAR    | 50     | ❌  | ❌  | Sí   | ❌    | Solo letras   | -          | Apellido materno |
| Matricula      | NVARCHAR    | 50     | ❌  | ❌  | ❌   | Sí    | Alfanumérico  | -          | Matrícula   |

**Curso**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumCurso    | INT         | -      | Sí  | ❌  | ❌   | Sí    | > 0           | -          | Número curso |
| NombreCurso | NVARCHAR    | 30     | ❌  | ❌  | ❌   | ❌    | Solo letras   | -          | Nombre curso |
| CodigoCurso | INT         | -      | ❌  | ❌  | ❌   | Sí    | > 0           | -          | Código curso |

**Inscripcion**

| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia            | Descripción |
|----------------|-------------|--------|-----|-----|------|-------|---------------|-----------------------|-------------|
| NumEstudiante  | INT         | -      | Sí  | Sí  | ❌   | ❌    | > 0           | ESTUDIANTE(NumEstudiante) | Estudiante |
| NumCurso       | INT         | -      | Sí  | Sí  | ❌   | ❌    | > 0           | CURSO(NumCurso)       | Curso       |
| FechaInscripcion | DATE     | -      | ❌  | ❌  | ❌   | ❌    | >= CURRENT_DATE | -                   | Fecha inscripción |
