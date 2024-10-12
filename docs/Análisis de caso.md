# Proyecto 1 - Banco JP Morgan

## Tablas y campos
Identificación de las tablas con sus campos respectivos.

### Clientes
- **ID** - Identificador único (Cliente).
- **Nombre** - Nombre del cliente.
- **Apellido** - Apellido del cliente.
- **Número de cuenta** - Número de cuenta bancaria del cliente.
- **Tipo de cuenta** - Tipo de cuenta bancaria del cliente.
- **Saldo** - Monto monetario en la cuenta.
- **Teléfono** - Número telefónico del cliente.

### Transacciones
- **ID Transacción** - Identificador único (Transacción).
- **ID Cliente** - Identificador único (Cliente).
- **Número de cuenta** - Número de cuenta bancaria del cliente.
- **Tipo de transacción** - Tipo de transacción.
- **Monto** - Monto monetario de la transacción.
- **Fecha** - Fecha en la que se realizó la transacción.
- **Hora** - Hora en la que se realizó la transacción.
- **Descripción** - Descripción corta acerca de la transacción.
- **Sucursal/Agencia** - Sucursal/Agencia emisora.

### Préstamos
- **ID Préstamo** - Identificador único (Préstamo).
- **ID Cliente** - Identificador único (Cliente).
- **Monto del préstamo** - Monto monetario del préstamo.
- **Tasa de interés** - Tasa de intereses aplicada al préstamo.
- **Fecha de desembolso** - Fecha de distribución a los destinatarios.
- **Fecha de vencimiento** - Fecha en la que se debe liquidar el préstamo.
- **Saldo pendiente** - Saldo pendiente.
- **Estado del préstamo** - Estado en el que se encuentra el préstamo.

### Tarjetas de crédito
- **ID Tarjeta** - Identificador único (Tarjeta de crédito).
- **ID Cliente** - Identificador único (Cliente).
- **Número de tarjeta** - 16 números de la tarjeta de crédito.
- **Límite de crédito** - Límite máximo de crédito.
- **Saldo Actual** - Saldo pendiente en la tarjeta.
- **Fecha de emisión** - Fecha en la que se emitió la tarjeta.
- **Fecha de expiración** - Fecha en la que expira la tarjeta.
- **Estado** - Estado de la tarjeta.
- **Fecha de corte** - Fecha en la que se genera el estado de cuenta de la tarjeta.
- **Día del ciclo** - Día del mes en que se cierra el ciclo de facturación.

### Sucursales/Agencias
- **ID** - Identificador único (Sucursal/Agencia).
- **Nombre** - Nombre de la sucursal o agencia.
- **Tipo** - Sucursal o agencia.
- **Departamento** - Departamento en donde se encuentra la sucursal/agencia.
- **Municipio** - Municipio en donde se encuentra la sucursal/agencia.
- **Dirección** - Dirección de la ubicación de la sucursal/agencia.
- **Código postal** - Código postal del área.
- **Teléfono** - Teléfono de la agencia.
- **Horario de atención** - Horario de atención al cliente.
- **Número de empleados** - Número de empleados en la sucursal/agencia.
- **Servicios disponibles** - Servicios que ofrece la sucursal/agencia.

### Empleados
- **ID** - Identificador único (Empleado).
- **Nombre** - Nombre del empleado.
- **Apellido** - Apellido del empleado.
- **Rol** - Posición ejecutiva del empleado.
- **Departamento** - Departamento de la empresa en la que está asignado.
- **Sucursal/Asignación** - Sucursal o agencia en la que está asignado.
- **Teléfono** - Número de teléfono.
- **Fecha de contratación** - Fecha en la que el empleado fue contratado.
- **Salario** - Salario del empleado.
- **Horario de trabajo** - Horario laboral del empleado.

## Tablas y sus atributos

### Tabla Clientes
| Columna          | Descripción                           | Tipo    | Tipo SQL        |
| ---------------- | ------------------------------------- | ------- | --------------- |
| ID               | Identificador único (Cliente)         | Entero  | AUTOINCREMENTAL |
| Nombre           | Nombre del cliente                    | Cadena  | VARCHAR(15)     |
| Apellido         | Apellido del cliente                  | Cadena  | VARCHAR(15)     |
| Número de cuenta | Número de cuenta bancaria del cliente | Cadena  | VARCHAR(10)     |
| Tipo de cuenta   | Tipo de cuenta bancaria del cliente   | Cadena  | VARCHAR(25)     |
| Saldo            | Monto monetario en la cuenta          | Decimal | DECIMAL(10,2)   |
| Teléfono         | Número telefónico del cliente         | Cadena  | VARCHAR(13)     |

### Tabla Transacciones
| Columna             | Descripción                               | Tipo    | Tipo SQL        |
| ------------------- | ----------------------------------------- | ------- | --------------- |
| ID Transacción      | Identificador único (Transacción)         | Entero  | AUTOINCREMENTAL |
| ID Cliente          | Identificador único (Cliente)             | Entero  | INT             |
| Número de cuenta    | Número de cuenta bancaria del cliente     | Cadena  | VARCHAR(20)     |
| Tipo de transacción | Tipo de transacción                       | Cadena  | VARCHAR(25)     |
| Monto               | Monto monetario de la transacción         | Decimal | DECIMAL(10,2)   |
| Fecha               | Fecha en la que se realizó la transacción | Fecha   | DATETIME        |
| Hora                | Hora en la que se realizó la transacción  | Hora    | TIME            |
| Descripción         | Descripción corta de la transacción       | Cadena  | VARCHAR(100)    |
| Sucursal/Agencia    | Sucursal/Agencia emisora                  | Cadena  | VARCHAR(15)     |

### Tabla Préstamos
| Columna              | Descripción                               | Tipo    | Tipo SQL        |
| -------------------- | ----------------------------------------- | ------- | --------------- |
| ID Préstamo          | Identificador único (Préstamo)            | Entero  | AUTOINCREMENTAL |
| ID Cliente           | Identificador único (Cliente)             | Entero  | INT             |
| Monto del préstamo   | Monto monetario del préstamo              | Decimal | DECIMAL(10,2)   |
| Tasa de interés      | Tasa de interés aplicada al préstamo      | Decimal | DECIMAL(5,2)    |
| Fecha de desembolso  | Fecha de distribución del préstamo        | Fecha   | DATETIME        |
| Fecha de vencimiento | Fecha en que se debe liquidar el préstamo | Fecha   | DATETIME        |
| Saldo pendiente      | Saldo pendiente del préstamo              | Decimal | DECIMAL(10,2)   |
| Estado del préstamo  | Estado actual del préstamo                | Cadena  | VARCHAR(15)     |

### Tabla Tarjetas de crédito
| Columna             | Descripción                               | Tipo    | Tipo SQL        |
| ------------------- | ----------------------------------------- | ------- | --------------- |
| ID Tarjeta          | Identificador único (Tarjeta)             | Entero  | AUTOINCREMENTAL |
| ID Cliente          | Identificador único (Cliente)             | Entero  | INT             |
| Número de tarjeta   | Número de tarjeta de crédito (16 dígitos) | Cadena  | VARCHAR(16)     |
| Límite de crédito   | Límite máximo de crédito                  | Decimal | DECIMAL(10,2)   |
| Saldo Actual        | Saldo pendiente en la tarjeta             | Decimal | DECIMAL(10,2)   |
| Fecha de emisión    | Fecha en la que se emitió la tarjeta      | Fecha   | DATETIME        |
| Fecha de expiración | Fecha en la que expira la tarjeta         | Fecha   | DATETIME        |
| Estado              | Estado de la tarjeta                      | Cadena  | VARCHAR(15)     |
| Fecha de corte      | Fecha de generación del estado de cuenta  | Fecha   | DATETIME        |
| Día del ciclo       | Día de cierre del ciclo de facturación    | Entero  | INT             |

### Tabla Sucursales/Agencias
| Columna       | Descripción                            | Tipo   | Tipo SQL        |
| ------------- | -------------------------------------- | ------ | --------------- |
| ID            | Identificador único (Sucursal/Agencia) | Entero | AUTOINCREMENTAL |
| Nombre        | Nombre de la sucursal o agencia        | Cadena | VARCHAR(50)     |
| Tipo          | Sucursal o agencia                     | Cadena | VARCHAR(15)     |
| Departamento  | Departamento donde está la sucursal    | Cadena | VARCHAR(30)     |
| Municipio     | Municipio donde está la sucursal       | Cadena | VARCHAR(30)     |
| Dirección     | Dirección física de la sucursal        | Cadena | VARCHAR(100)    |
| Código postal | Código postal del área                 | Cadena | VARCHAR(5)      |
| Teléfono      | Teléfono de la sucursal                | Cadena | VARCHAR(15)     |

### Tabla Empleados
| Columna             | Descripción                     | Tipo   | Tipo SQL        |
| ------------------- | ------------------------------- | ------ | --------------- |
| ID                  | Identificador único (Empleado)  | Entero | AUTOINCREMENTAL |
| Nombre              | Nombre del empleado             | Cadena | VARCHAR(100)    |
| Apellido            | Apellido del empleado           | Cadena | VARCHAR(100)    |
| Rol                 | Rol del empleado                | Cadena | VARCHAR(50)     |
| Departamento        | Departamento asignado           | Cadena | VARCHAR(100)    |
| Sucursal/Asignación | Sucursal/Agencia asignada       | Cadena | VARCHAR(100)    |
| Teléfono            | Número de teléfono del empleado | Cadena | VARCHAR(15)     |

## Normalización
## Primera forma normal
### Tabla Clientes
Cumple con la primera forma normal.

### Tabla Transacciones
No cumple con la primera forma normal, atributo Número de cuenta debe separarse en cuenta emisora y receptora, atributo Sucursal/Agencia debe separarse o manejar solo Sucursales y solucionarlo con la segunda forma normal.

### Tabla Préstamos
Cumple con la primera forma normal.

### Tabla Tarjetas de Crédito
Cumple con la primera forma normal.

### Tabla Sucursales/Agencias
Cumple con la primera forma normal.

### Tabla Empleados
No cumplea con la primera forma normal, atributo Sucursal/Agencia debe separarse o manejar solo Sucursales y solucionarlo con la segunda forma normal.

## Segunda forma normal
### Tabla Clientes
No cumple con la segunda forma normal, la tabla puede dividirse en 2 tablas, Clientes y Cuenta y Tipo de cuenta respectivamente.

### Tabla Transacciones
No cumple con la segunda forma normal, el atributo Tipo de transacción puede ser otra tabla.

### Tabla Préstamos
No cumple con la segunda forma normal, el atributo Estado del Préstamos puede ser otra tabla.

### Tabla Tarjetas de Crédito
No cumple con la segunda forma normal, el atributo Estado de la tarjeta puede ser otra tabla.

### Tabla Sucursales/Agencias
No cumple con la segunda forma normal, el atributo Tipo (Sucursal/Agencia) puede ser otra tabla, el atributo Departamento y Municipio pueden separarse en 2 tablas.

### Tabla Empleados
No cumple con la segunda forma normal, el atributo rol puede ser otra tabla, tampoco cumple el atributo departamento y sucursal.

## Tercera forma normal

### Tabla Clientes
Tampoco cumple la 3FN. Tipo de cuenta depende de la cuenta, no del cliente, así que movemos eso a otra tabla para eliminar dependencias transitivas.

### Tabla Transacciones
Cumple con la 3FN. Ya movimos Tipo de transacción a otra tabla en la 2FN, así que todo bien.

### Tabla Préstamos
Cumple con la 3FN. Después de separar Estado del Préstamo, ya no hay dependencias transitivas.

### Tabla Tarjetas de Crédito
Cumple con la 3FN también. Al mover Estado de la tarjeta en la 2FN, ya no hay problema acá.

### Tabla Sucursales/Agencias
No cumple. Municipio depende de Departamento, así que necesitamos separarlas en tablas diferentes para eliminar la dependencia transitiva.

### Tabla Empleados
No cumple. Departamento depende de Sucursal, así que habría que mover Departamento a otra tabla para eliminar esa dependencia.

## Tablas normalizadas
### Tabla Clientes
| Columna   | Descripción                     | Tipo   | Tipo SQL        |
| --------- | ------------------------------- | ------ | --------------- |
| ID        | Identificador único (Cliente)   | Entero | AUTOINCREMENTAL |
| ID Cuenta | Llave foránea a la tabla cuenta | Entero | INTEGER         |
| Nombre    | Nombre del cliente              | Cadena | VARCHAR(15)     |
| Apellido  | Apellido del cliente            | Cadena | VARCHAR(15)     |
| Teléfono  | Número telefónico del cliente   | Cadena | VARCHAR(15)     |

### Tabla Cuentas
| Columna          | Descripción                          | Tipo    | Tipo SQL        |
| ---------------- | ------------------------------------ | ------- | --------------- |
| ID               | Identificador único (Cuenta)         | Entero  | AUTOINCREMENTAL |
| ID Tipo Cuenta   | Llave foránea a la tabla Tipo cuenta | Cadena  | INTEGER         |
| Número de cuenta | Número de cuenta del cliente         | Cadena  | VARCHAR(15)     |
| Saldo            | Saldo monetario del cliente          | Decimal | DECIMAL(10,2)   |

### Tabla Tipo Cuentas
| Columna     | Descripción                          | Tipo   | Tipo SQL        |
| ----------- | ------------------------------------ | ------ | --------------- |
| ID          | Identificador único (Tipo de cuenta) | Entero | AUTOINCREMENTAL |
| Tipo Cuenta | Tipo de cuenta                       | Cadena | VARCHAR(25)     |

### Tabla Agencias/Sucursales
| Columna         | Descripción                            | Tipo   | Tipo SQL        |
| --------------- | -------------------------------------- | ------ | --------------- |
| ID              | Identificador único (Sucursal/Agencia) | Entero | AUTOINCREMENTAL |
| ID Departamento | Llave foránea a la tabla Departamento  | Entero | INTEGER         |
| ID Tipo         | Llave foránea a la tabla Tipo          | Entero | INTEGER         |
| Nombre          | Nombre de la sucursal o agencia        | Cadena | VARCHAR(50)     |
| Teléfono        | Teléfono de la sucursal                | Cadena | VARCHAR(15)     |

### Tabla Departamentos
| Columna      | Descripción                        | Tipo   | Tipo SQL        |
| ------------ | ---------------------------------- | ------ | --------------- |
| ID           | Identificador único (Departamento) | Entero | AUTOINCREMENTAL |
| Departamento | Nombre del departamento            | Cadena | VARCHAR(25)     |

### Tabla Municipios
| Columna       | Descripción                      | Tipo   | Tipo SQL        |
| ------------- | -------------------------------- | ------ | --------------- |
| ID            | Identificador único (Municipio)  | Entero | AUTOINCREMENTAL |
| Municipio     | Nombre del municipio             | Cadena | VARCHAR(25)     |
| Dirección     | Dirección de la Sucursal/Agencia | Cadena | VARCHAR(50)     |
| Código Postal | Código postal de la zona         | Cadena | VARCHAR(15)     |


### Tabla Tipo Sucursal/Agencia
| Columna | Descripción                | Tipo   | Tipo SQL        |
| ------- | -------------------------- | ------ | --------------- |
| ID      | Identificador único (Tipo) | Entero | AUTOINCREMENTAL |
| Tipo    | Sucursal o agencia         | Cadena | VARCHAR(25)     |

### Tabla Tarjetas de crédito
| Columna             | Descripción                               | Tipo    | Tipo SQL        |
| ------------------- | ----------------------------------------- | ------- | --------------- |
| ID                  | Identificador único (Tarjeta)             | Entero  | AUTOINCREMENTAL |
| ID Cliente          | Llave foránea a la tabla Cliente          | Entero  | INTEGER         |
| ID Estado           | Llave foránea a la tabla Estado           | Entero  | INTEGER         |
| Número de tarjeta   | Número de tarjeta de crédito (16 dígitos) | Cadena  | VARCHAR(16)     |
| Límite de crédito   | Límite máximo de crédito                  | Decimal | DECIMAL(10,2)   |
| Saldo Actual        | Saldo pendiente en la tarjeta             | Decimal | DECIMAL(10,2)   |
| Fecha de emisión    | Fecha en la que se emitió la tarjeta      | Fecha   | DATETIME        |
| Fecha de expiración | Fecha en la que expira la tarjeta         | Fecha   | DATETIME        |
| Fecha de corte      | Fecha de generación del estado de cuenta  | Fecha   | DATETIME        |
| Día del ciclo       | Día de cierre del ciclo de facturación    | Entero  | INT             |

### Tabla Estado Tarjeta
| Columna | Descripción                          | Tipo   | Tipo SQL        |
| ------- | ------------------------------------ | ------ | --------------- |
| ID      | Identificador único (Estado Tarjeta) | Entero | AUTOINCREMENTAL |
| Estado  | Estado de la tarjeta                 | Cadena | VARCHAR(10)     |

### Tabla Préstamos
| Columna              | Descripción                               | Tipo    | Tipo SQL        |
| -------------------- | ----------------------------------------- | ------- | --------------- |
| ID                   | Identificador único (Préstamo)            | Entero  | AUTOINCREMENTAL |
| ID Cliente           | Identificador único (Cliente)             | Entero  | INTEGER         |
| Monto del préstamo   | Monto monetario del préstamo              | Decimal | DECIMAL(10,2)   |
| Tasa de interés      | Tasa de interés aplicada al préstamo      | Decimal | DECIMAL(5,2)    |
| Fecha de desembolso  | Fecha de distribución del préstamo        | Fecha   | DATETIME        |
| Fecha de vencimiento | Fecha en que se debe liquidar el préstamo | Fecha   | DATETIME        |
| Saldo pendiente      | Saldo pendiente del préstamo              | Decimal | DECIMAL(10,2)   |
| Estado del préstamo  | Llave foránea a la tabla Estado Préstamo  | Entero  | INTEGER         |

### Tabla Estado del Préstamo
| Columna | Descripción                  | Tipo   | Tipo SQL        |
| ------- | ---------------------------- | ------ | --------------- |
| ID      | Identificador único (Estado) | Entero | AUTOINCREMENTAL |
| Estado  | Estado del préstamo          | Cadena | VARCHAR(15)     |

### Tabla Empleados
| Columna             | Descripción                           | Tipo    | Tipo SQL        |
| ------------------- | ------------------------------------- | ------- | --------------- |
| ID                  | Identificador único (Empleado)        | Entero  | AUTOINCREMENTAL |
| Nombre              | Nombre del empleado                   | Cadena  | VARCHAR(100)    |
| Apellido            | Apellido del empleado                 | Cadena  | VARCHAR(100)    |
| Rol                 | Llave foránea a la tabla Rol          | Integer | INTEGER         |
| Departamento        | Llave foránea a la tabla Departamento | Integer | INTEGER         |
| Sucursal/Asignación | Llave foránea a la tabla Sucursal     | Integer | INTEGER         |
| Teléfono            | Número de teléfono del empleado       | Cadena  | VARCHAR(15)     |

### Tabla Roles
| Columna | Descripción               | Tipo   | Tipo SQL        |
| ------- | ------------------------- | ------ | --------------- |
| ID      | Identificador único (Rol) | Entero | AUTOINCREMENTAL |
| Rol     | Rol del Empleado          | Cadena | VARCHAR(100)    |

### Tabla Transacciones
| Columna                  | Descripción                                   | Tipo    | Tipo SQL        |
| ------------------------ | --------------------------------------------- | ------- | --------------- |
| ID                       | Identificador único (Transacción)             | Entero  | AUTOINCREMENTAL |
| ID Cliente               | Identificador único (Cliente)                 | Entero  | INT             |
| Número de cuenta origen  | Número de cuenta bancaria del cliente emisor  | Cadena  | VARCHAR(20)     |
| Número de cuenta destino | Número de cuenta bancaria del cliente recepto | Cadena  | VARCHAR(20)     |
| Tipo de transacción      | Tipo de transacción                           | Entero  | INTEGER         |
| Monto                    | Monto monetario de la transacción             | Decimal | DECIMAL(10,2)   |
| Fecha                    | Fecha en la que se realizó la transacción     | Fecha   | DATETIME        |
| Hora                     | Hora en la que se realizó la transacción      | Hora    | TIME            |
| Descripción              | Descripción corta de la transacción           | Cadena  | VARCHAR(100)    |
| Sucursal/Agencia         | Sucursal/Agencia emisora                      | Cadena  | VARCHAR(15)     |

### Tabla Tipo Transacción
| Columna | Descripción                       | Tipo   | Tipo SQL        |
| ------- | --------------------------------- | ------ | --------------- |
| ID      | Identificador único (Transacción) | Entero | AUTOINCREMENTAL |
| Tipo    | Tipo de transacción               | Cadena | VARCHAR(25)     |

## Tablas Obtenidas
1. Tabla Clientes
2. Tabla Cuentas
3. Tabla Tipo Cuentas
4. Tabla Sucursales/Agencias
5. Tabla Departamentos
6. Tabla Municipios
7. Tabla Tipo Sucursal/Agencia
8. Tabla Tarjetas de Crédito
9. Tabla Estado Tarjeta
10. Tabla Préstamos
11. Tabla Estado del Préstamo
12. Tabla Empleado
13. Tabla Roles
14. Tabla Transacciones
15. Tabla Tipo Transacción

## Matriz de relaciones 
| Tabla              | Cliente  | Cuenta   | Tipo Cuenta | Sucursal  | Tipo Sucursal | Departamento | Municipio | Tarjeta de crédito | Estado Tarjeta | Préstamo | Estado Préstamo | Empleado | Rol     | Transacción | Tipo Transacción |
|--------------------|----------|----------|-------------|-----------|---------------|--------------|-----------|--------------------|----------------|----------|-----------------|----------|---------|-------------|------------------|
| **Cliente**         | -        | Tiene    | No aplica   | No aplica | No aplica     | No aplica    | No aplica | Tiene              | No aplica      | Pide     | No aplica       | No aplica | No aplica| Realiza     | No aplica        |
| **Cuenta**          | Pertenece| -        | Tiene       | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| Genera      | No aplica        |
| **Tipo Cuenta**     | No aplica| No aplica| -           | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| No aplica   | No aplica        |
| **Sucursal**        | No aplica| No aplica| No aplica   | -         | Tiene         | Está en      | Está en   | No aplica          | No aplica      | No aplica| No aplica       | Tiene    | No aplica| Genera      | No aplica        |
| **Tipo Sucursal**   | No aplica| No aplica| No aplica   | No aplica | -             | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| No aplica   | No aplica        |
| **Departamento**    | No aplica| No aplica| No aplica   | No aplica | No aplica     | -            | Pertenece | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| No aplica   | No aplica        |
| **Municipio**       | No aplica| No aplica| No aplica   | No aplica | No aplica     | Pertenece    | -         | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| No aplica   | No aplica        |
| **Tarjeta de crédito**| Pertenece| No aplica| No aplica | No aplica | No aplica     | No aplica    | No aplica | -                  | Tiene          | No aplica| No aplica       | No aplica | No aplica| Genera      | No aplica        |
| **Estado Tarjeta**  | No aplica| No aplica| No aplica   | No aplica | No aplica     | No aplica    | No aplica | No aplica          | -              | No aplica| No aplica       | No aplica | No aplica| No aplica   | No aplica        |
| **Préstamo**        | Pide     | No aplica| No aplica   | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | -        | Tiene           | No aplica | No aplica| No aplica   | No aplica        |
| **Estado Préstamo** | No aplica| No aplica| No aplica   | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| -               | No aplica | No aplica| No aplica   | No aplica        |
| **Empleado**        | No aplica| No aplica| No aplica   | Trabaja   | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | -        | Tiene   | Genera      | No aplica        |
| **Rol**             | No aplica| No aplica| No aplica   | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica| -       | No aplica   | No aplica        |
| **Transacción**     | Realiza  | Afecta   | No aplica   | Ocurre en | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| -           | Es de tipo       |
| **Tipo Transacción**| No aplica| No aplica| No aplica   | No aplica | No aplica     | No aplica    | No aplica | No aplica          | No aplica      | No aplica| No aplica       | No aplica | No aplica| No aplica   | -                |

## Matriz de cardinalidad
| Tabla              | Cliente  | Cuenta   | Tipo Cuenta | Sucursal  | Tipo Sucursal | Departamento | Municipio | Tarjeta de crédito | Estado Tarjeta | Préstamo | Estado Préstamo | Empleado | Rol     | Transacción | Tipo Transacción |
|--------------------|----------|----------|-------------|-----------|---------------|--------------|-----------|--------------------|----------------|----------|-----------------|----------|---------|-------------|------------------|
| **Cliente**         | -        | 1        |             |           |               |              |           |                    |                |          |                 |          |         | 1           |                  |
| **Cuenta**          | N:1      | -        | N:1         |           |               |              |           |                    |                |          |                 |          |         | N:1         |                  |
| **Tipo Cuenta**     |          |          | -           |           |               |              |           |                    |                |          |                 |          |         |             |                  |
| **Sucursal**        |          |          |             | -         | N:1           | 1            |           |                    |                |          |                 |          |         |             |                  |
| **Tipo Sucursal**   |          |          |             |           | -             |              |           |                    |                |          |                 |          |         |             |                  |
| **Departamento**    |          |          |             |           |               | -            |           |                    |                |          |                 | N:1      |         |             |                  |
| **Municipio**       |          |          |             |           |               |              | -         |                    |                |          |                 |          |         |             |                  |
| **Tarjeta de crédito**| 1      |          |             |           |               |              |           | -                  | N:1            |          |                 |          |         |             |                  |
| **Estado Tarjeta**  |          |          |             |           |               |              |           |                    | -              |          |                 |          |         |             |                  |
| **Préstamo**        | 1        |          |             |           |               |              |           |                    |                | -        | N:1             |          |         |             |                  |
| **Estado Préstamo** |          |          |             |           |               |              |           |                    |                |          | -               |          |         |             |                  |
| **Empleado**        |          |          |             |           |               | 1            |           |                    |                |          |                 | -        | N:1     |             |                  |
| **Rol**             |          |          |             |           |               |              |           |                    |                |          |                 |          | -       |             |                  |
| **Transacción**     | 1        | N:1      |             |           |               |              |           |                    |                |          |                 |          |         | -           | N:1              |
| **Tipo Transacción**|          |          |             |           |               |              |           |                    |                |          |                 |          |         |             | -                |


