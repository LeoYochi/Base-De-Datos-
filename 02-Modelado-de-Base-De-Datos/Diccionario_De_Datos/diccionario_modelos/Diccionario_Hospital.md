# 📘 Diccionario de Datos – Hospital

**Doctor**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| Cedula            | INT         | -      | Sí  | ❌  | ❌   | Sí    | > 0                               | -          | Cédula profesional               |
| Especialidad      | NVARCHAR    | 30     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -          | Especialidad médica              |
| Nombre            | VARCHAR     | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -          | Nombre del doctor                |
| ApellidoPaterno   | VARCHAR     | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | ❌  | ❌  | Sí   | ❌    | Solo letras                       | -          | Apellido materno                 |

**Paciente**

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| IdPaciente        | NVARCHAR    | 30     | Sí  | ❌  | ❌   | Sí    | -                                 | -          | Identificador único              |
| Nombre            | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -          | Nombre del paciente              |
| ApellidoPaterno   | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | ❌  | ❌  | Sí   | ❌    | Solo letras                       | -          | Apellido materno                 |
| Sintomas          | NVARCHAR    | 50     | ❌  | ❌  | ❌   | ❌    | -                                 | -          | Síntomas del paciente            |

**Atiende**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia          | Descripción               |
|-----------------|-------------|--------|-----|-----|------|-------|-----------------------------------|---------------------|---------------------------|
| FechaAtencion   | DATE        | -      | ❌  | ❌  | ❌   | ❌    | <= CURRENT_DATE                   | -                   | Fecha de atención         |
| Diagnostico     | NVARCHAR    | 50     | ❌  | ❌  | ❌   | ❌    | -                                 | -                   | Diagnóstico médico        |
| NombrePaciente  | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                       | -                   | Nombre del paciente       |
| Cedula          | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0                               | DOCTOR(Cedula)      | Doctor que atendió        |
| IdPaciente      | NVARCHAR    | 20     | ❌  | Sí  | ❌   | ❌    | -                                 | PACIENTE(IdPaciente)| Paciente atendido         
