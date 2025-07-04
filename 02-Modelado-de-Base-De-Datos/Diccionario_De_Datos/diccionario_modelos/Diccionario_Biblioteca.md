# 📘 Diccionario de Datos – Biblioteca

**Libro**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|---------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| Autor        | NVARCHAR    | 20     | ❌  | ❌ | ❌  | ❌   | Solo letras   | -          | Autor       |
| Titulo       | NVARCHAR    | 30     | ❌  | ❌  | ❌   | ❌   | -             | -          | Título      |
| CantidadLibro| VARCHAR     | 10     | ❌ | ❌ | ❌ | ❌    | Solo números  | -          | Cantidad    |
| NumeroISBN   | VARCHAR     | -      | ❌ | ❌  | ❌  | Sí    | Formato ISBN  | -          | ISBN        |
| NumLibro     | INT         | -      | Sí  | ❌  |❌   | Sí    | > 0           | -          | ID libro    |

**presta**

| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia      | Descripción |
|-------------|-------------|--------|-----|-----|------|-------|---------------|-----------------|-------------|
| IdPresta    | INT         | -      | Sí  | ❌  | ❌  | Sí    | > 0           | -               | ID préstamo |
| NumLibro    | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0           | Libro(NumLibro) | Libro       |
| NumLector   | INT         | -      | ❌  | Sí  | ❌   | ❌   | > 0           | LECTOR(NumLector) | Lector     |
| Titulo      | NVARCHAR    | 30     | ❌  | ❌  | ❌   | ❌   | -             | -               | Título      |
| Autor       | NVARCHAR    | 20     | ❌  | ❌  | ❌  | ❌    | Solo letras   | -               | Autor       |
| NombreLector| NVARCHAR    | 20     | ❌  | ❌ | ❌  | ❌    | Solo letras   | -               | Nombre lector |

**lector**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|-----------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumLector       | INT         | -      | Sí  | ❌  | ❌  | Sí    | > 0           | -          | ID lector   |
| NumMembresia    | NVARCHAR    | 30     | ❌  | ❌  | ❌   | Sí    | Alfanumérico  | -          | Membresía   |
| Nombre          | NVARCHAR    | 10     | ❌  | ❌  | ❌  | ❌    | Solo letras   | -          | Nombre      |
| ApellidoPaterno | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras   | -          | Apellido paterno |
| ApellidoMaterno | NVARCHAR    | 10     | ❌  | ❌  | Sí   | ❌    | Solo letras   | -          | Apellido materno |
