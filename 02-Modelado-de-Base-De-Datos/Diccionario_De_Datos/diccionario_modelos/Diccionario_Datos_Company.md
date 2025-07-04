
# Diccionario de Datos - COMPANY

**EMPLOYEE**

| Campo     | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones          | Referencia | Descripción                       |
|-----------|--------------|--------|-----|-----|------|--------|-------------------------|------------|-----------------------------------|
| SSN       | CHAR         | 9      | Sí  |     | ❌   | Sí     |                        |            | Número de Seguro Social           |
| FirstName | VARCHAR      | 50     |     |     | No   |        |                        |            | Nombre del empleado               |
| LastName  | VARCHAR      | 50     |     |     | No   |        |                        |            | Apellido del empleado             |
| Address   | VARCHAR      | 100    |     |     | No   |        |                        |            | Dirección del empleado            |
| Salary    | DECIMAL      | 10,2   |     |     | No   |        |                        |            | Salario del empleado              |
| Sex       | CHAR         | 1      |     |     | ❌   |        | [M,F]                  |            | Sexo del empleado                 |

**DEPARTMENT**

| Campo   | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción           |
|---------|--------------|--------|-----|-----|------|--------|----------------|------------|-----------------------|
| Number  | INT          |        | Sí  |     | ❌   | Sí     |                |            | ID del departamento   |
| Name    | VARCHAR      | 50     |     |     | ❌  | Sí     |                |            | Nombre del departamento |
| Location| VARCHAR      | 100    |     |     | ❌  |        |                |            | Ubicación principal   |

**PROJECT**

| Campo   | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción         |
|---------|--------------|--------|-----|-----|------|--------|----------------|------------|---------------------|
| Number  | INT          |        | Sí  |     | ❌   | Sí     |                |            | ID del proyecto     |
| Name    | VARCHAR      | 50     |     |     | ❌   |        |                |            | Nombre del proyecto |
| Location| VARCHAR      | 100    |     |     | ❌   |        |                |            | Ubicación del proyecto |

**DEPENDENT**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción              |
|--------------|--------------|--------|-----|-----|------|--------|----------------|------------|--------------------------|
| Name         | VARCHAR      | 50     | Sí  |     | ❌  |        |                |            | Nombre del dependiente   |
| Sex          | CHAR         | 1      |     |     | ❌   |        | [M,F]          |            | Sexo del dependiente     |
| BirthDay     | DATE         |        |     |     | ❌   |        |                |            | Fecha de nacimiento      |
| RelationShip | VARCHAR      | 30     |     |     | ❌   |        |                |            | Relación con el empleado |
| SSN_Employee | CHAR         | 9      |     | Sí  | ❌   |        |                | EMPLOYEE   | Empleado relacionado     |

**WORKS_FOR**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                 |
|-------------|--------------|--------|-----|-----|------|--------|----------------|-------------|-----------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | ❌   |        |                | EMPLOYEE    | Empleado que trabaja para  |
| DeptNumber  | INT          |        | Sí  | Sí  | ❌   |        |                | DEPARTMENT  | Departamento asignado      |

**WORKS_ON**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción                  |
|-------------|--------------|--------|-----|-----|------|--------|----------------|------------|------------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | ❌   |        |                | EMPLOYEE   | Empleado involucrado        |
| ProjNumber  | INT          |        | Sí  | Sí  | ❌   |        |                | PROJECT    | Proyecto en el que trabaja  |
| Hours       | DECIMAL      | 5,2    |     |     | ❌   |        | >= 0           |            | Horas asignadas             |

**CONTROLS**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                    |
|-------------|--------------|--------|-----|-----|------|--------|--------------|-------------|--------------------------------|
| DeptNumber  | INT          | Sí  | Sí  | ❌   |        |        |              | DEPARTMENT  | Departamento que controla     |
| ProjNumber  | INT          | Sí  | Sí  | ❌   |        |        |              | PROJECT     | Proyecto controlado           |

**SUPERVISION**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción                  |
|--------------|--------------|--------|-----|-----|------|--------|----------------|------------|------------------------------|
| SupervisorSSN| CHAR         | 9      | Sí  | Sí  | ❌   |        |                | EMPLOYEE   | Supervisor                   |
| SubordinateSSN | CHAR       | 9      | Sí  | Sí  | ❌   |        |                | EMPLOYEE   | Empleado supervisado        |

**MANAGES**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia  | Descripción                |
|-------------|--------------|--------|-----|-----|------|--------|----------------|-------------|----------------------------|
| SSN         | CHAR         | 9      | Sí  | Sí  | ❌   |        |                | EMPLOYEE    | Gerente del departamento   |
| DeptNumber  | INT          | Sí     | Sí  | ❌  |      |        |                | DEPARTMENT  | Departamento administrado  |
| StartDay    | DATE         |        |     |     | ❌   |        |                |             | Fecha de inicio de gestión |
