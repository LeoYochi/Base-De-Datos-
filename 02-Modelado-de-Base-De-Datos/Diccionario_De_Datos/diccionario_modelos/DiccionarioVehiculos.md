# 📘 Diccionario de Datos – Vehiculos

**Tabla cliente**



| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones                     | Referencia | Descripción                      |
|-------------------|-------------|--------|-----|-----|------|-------|-----------------------------------|------------|----------------------------------|
| CURP              | NVARCHAR    | 18     | Sí  | ❌  | ❌   | Sí    | Formato CURP válido               | -          | Identificador único              |
| Telefono          | NVARCHAR    | 10     | ❌  | ❌  | Sí   | ❌    | Solo números                     | -          | Teléfono del cliente             |
| Nombre            | VARCHAR     | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                      | -          | Nombre del cliente               |
| ApellidoPaterno   | VARCHAR     | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras                      | -          | Apellido paterno                 |
| ApellidoMaterno   | NVARCHAR    | 10     | ❌  | ❌  | Sí   | ❌    | Solo letras                      | -          | Apellido materno                 |
| Direccion         | NVARCHAR    | 20     | ❌  | ❌  | Sí   | ❌    | -                                 | -          | Dirección del cliente            |
| IdCliente         | INT         | -      | ❌  | ❌  | ❌   | Sí    | > 0                               | -          | ID del cliente                   |

**Renta**

| Campo          | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones            | Referencia       | Descripción               |
|----------------|-------------|--------|-----|-----|------|-------|--------------------------|------------------|---------------------------|
| FechaInicio    | DATE        | -      | ❌  | ❌  | ❌   | ❌    | >= CURRENT_DATE          | -                | Fecha inicio renta        |
| FechaTermino   | DATE        | -      | ❌  | ❌  | ❌   | ❌    | > FechaInicio            | -                | Fecha fin renta           |
| IdCliente      | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0                      | CLIENTS(IdCliente)| Cliente asociado          |
| IdVehiculo     | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0                      | Vehiculos(IdVehiculo)| Vehículo rentado        |
| IdRenta        | NVARCHAR    | 20     | Sí  | ❌  | ❌   | Sí    | -                        | -                | ID único de renta         |

**Vehiculos**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones       | Referencia       | Descripción        |
|--------------|-------------|--------|-----|-----|------|-------|---------------------|------------------|--------------------|
| Placa        | NVARCHAR    | 20     | ❌  | ❌  | ❌   | Sí    | Formato válido      | -                | Placa del vehículo |
| Marca        | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Solo letras         | -                | Marca              |
| Modelo       | NVARCHAR    | 10     | ❌  | ❌  | ❌   | ❌    | Letras y números    | -                | Modelo             |
| Año          | DATE        | -      | ❌  | ❌  | ❌   | ❌    | <= CURRENT_DATE     | -                | Año fabricación    |
| IdVehiculo   | INT         | -      | Sí  | ❌  | ❌   | Sí    | > 0                  | -                | ID vehículo        |
| IdSucursal   | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0                  | SUCURSAL(IdSucursal)| Sucursal         |

**Sucursal**

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones | Referencia | Descripción |
|--------------|-------------|--------|-----|-----|------|-------|---------------|------------|-------------|
| NumSucursal  | INT         | -      | Sí  | ❌  | ❌   | Sí    | > 0           | -          | Número sucursal |
| Nombre       | NVARCHAR    | 20     | ❌  | ❌  | ❌   | ❌    | Solo letras   | -          | Nombre sucursal |
| Ubicacion    | NVARCHAR    | 40     | ❌  | ❌  | ❌   | ❌    | -             | -          | Ubicación   |
| IdSucursal   | INT         | -      | ❌  | ❌  | ❌   | Sí    | > 0           | -          | ID sucursal |
| IdVehiculo   | INT         | -      | ❌  | Sí  | ❌   | ❌    | > 0           | Vehiculos(IdVehiculo) | Vehículo |
