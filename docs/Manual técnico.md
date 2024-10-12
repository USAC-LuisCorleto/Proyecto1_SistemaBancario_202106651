# Manual Técnico - Sistema Bancario JP Morgan

## Datos del Estudiante
**Nombre:** Luis Carlos Corleto Marroquín
**Carnet:** 202106651
**Curso:** SIstema de Bases de Datos 1 - B

---

## Introducción
Este documento detalla el desarrollo del sistema bancario de JP Morgan, incluyendo la estructura de la base de datos, su modelo conceptual, lógico y físico, así como los scripts utilizados para crear las tablas y realizar inserciones de datos.

El sistema permite gestionar clientes, cuentas, empleados, tarjetas de crédito, préstamos y transacciones, facilitando las operaciones bancarias de manera eficiente.

---

## Modelo Conceptual

A continuación se presenta el modelo conceptual del sistema, el cual define las entidades principales y sus relaciones.

![Diagrama Conceptual](./images/Modelo%20Conceptual.png)

**Entidades principales:**
- **Cliente:** Representa a los clientes del banco.
- **Cuenta:** Cada cliente puede tener una o más cuentas bancarias.
- **Empleado:** Los empleados gestionan las operaciones del banco.
- **Préstamo:** Los clientes pueden solicitar préstamos.
- **Tarjeta de Crédito:** Los clientes pueden tener tarjetas de crédito asociadas a sus cuentas.
- **Transacción:** Representa las operaciones bancarias como depósitos, retiros o transferencias.

---

## Modelo Lógico

En esta sección se presenta el modelo lógico, que especifica los atributos de cada entidad y las relaciones entre ellas, en formato de tablas.

![Diagrama Lógico](./images/Modelo%20logico.png)

### Tablas Principales:
- **Clientes:** Almacena la información básica de los clientes.
- **Cuentas:** Detalla la información de las cuentas bancarias de los clientes.
- **Empleados:** Registra a los empleados del banco.
- **Préstamos:** Almacena información sobre los préstamos solicitados.
- **Tarjetas de Crédito:** Guarda los datos de las tarjetas de crédito emitidas.
- **Transacciones:** Contabiliza cada transacción realizada en el banco.

---

## Modelo Físico

El modelo físico es el siguiente donde:

![Diagrama Físico](./images/Modelo%20relacional.png)

## Explicación del Modelo Relacional

## Clientes
- **Llave Primaria**: `cliente_id`
- **Relaciones**:
  - Un cliente puede tener múltiples cuentas (1:N con `cuentas`)
  - Un cliente puede tener múltiples tarjetas de crédito (1:N con `tarjetas_credito`)
  - Un cliente puede tener múltiples préstamos (1:N con `prestamos`)
  - Un cliente puede realizar múltiples transacciones (1:N con `transacciones`)

## Cuentas
- **Llave Primaria**: `cuenta_id`
- **Llaves Foráneas**: 
  - `titular_cuenta` (referencia a `clientes.cliente_id`)
  - `tipo_cuenta` (referencia a `tipos_cuenta.tipo_cuenta_id`)
- **Relaciones**:
  - Cada cuenta pertenece a un solo cliente (N:1 con `clientes`)
  - Cada cuenta tiene un tipo de cuenta específico (N:1 con `tipos_cuenta`)

## Departamentos
- **Llave Primaria**: `departamento_id`
- **Relaciones**:
  - Un departamento puede tener múltiples municipios (1:N con `municipios`)
  - Un departamento puede tener múltiples sucursales (1:N con `sucursales`)
  - Un departamento puede tener múltiples empleados (1:N con `empleados`)

## Empleados
- **Llave Primaria**: `empleado_id`
- **Llaves Foráneas**:
  - `sucursal_id` (referencia a `sucursales.sucursal_id`)
  - `departamento_id` (referencia a `departamentos.departamento_id`)
  - `rol_id` (referencia a `roles.rol_id`)
- **Relaciones**:
  - Cada empleado trabaja en una sucursal específica (N:1 con `sucursales`)
  - Cada empleado pertenece a un departamento (N:1 con `departamentos`)
  - Cada empleado tiene un rol específico (N:1 con `roles`)

## Estados_Prestamo
- **Llave Primaria**: `estado_prestamo_id`
- **Relaciones**:
  - Un estado de préstamo puede aplicar a múltiples préstamos (1:N con `prestamos`)

## Estados_Tarjeta
- **Llave Primaria**: `estado_tarjeta_id`
- **Relaciones**:
  - Un estado de tarjeta puede aplicar a múltiples tarjetas de crédito (1:N con `tarjetas_credito`)

## Municipios
- **Llave Primaria**: `municipio_id`
- **Llave Foránea**: `departamento_id` (referencia a `departamentos.departamento_id`)
- **Relaciones**:
  - Cada municipio pertenece a un departamento específico (N:1 con `departamentos`)

## Prestamos
- **Llave Primaria**: `prestamo_id`
- **Llaves Foráneas**:
  - `prestatario` (referencia a `clientes.cliente_id`)
  - `estado_prestamo` (referencia a `estados_prestamo.estado_prestamo_id`)
- **Relaciones**:
  - Cada préstamo está asociado a un cliente específico (N:1 con `clientes`)
  - Cada préstamo tiene un estado específico (N:1 con `estados_prestamo`)

## Roles
- **Llave Primaria**: `rol_id`
- **Relaciones**:
  - Un rol puede ser asignado a múltiples empleados (1:N con `empleados`)

## Sucursales
- **Llave Primaria**: `sucursal_id`
- **Llaves Foráneas**:
  - `departamento_id` (referencia a `departamentos.departamento_id`)
  - `tipo_sucursal` (referencia a `tipos_sucursal.tipo_sucursal_id`)
- **Relaciones**:
  - Cada sucursal está ubicada en un departamento específico (N:1 con `departamentos`)
  - Cada sucursal tiene un tipo específico (N:1 con `tipos_sucursal`)
  - Una sucursal puede tener múltiples empleados (1:N con `empleados`)
  - Una sucursal puede manejar múltiples transacciones (1:N con `transacciones`)

## Tarjetas_Credito
- **Llave Primaria**: `tarjeta_id`
- **Llaves Foráneas**:
  - `titular_tarjeta` (referencia a `clientes.cliente_id`)
  - `estado_tarjeta` (referencia a `estados_tarjeta.estado_tarjeta_id`)
- **Relaciones**:
  - Cada tarjeta de crédito pertenece a un cliente específico (N:1 con `clientes`)
  - Cada tarjeta de crédito tiene un estado específico (N:1 con `estados_tarjeta`)

## Tipos_Cuenta
- **Llave Primaria**: `tipo_cuenta_id`
- **Relaciones**:
  - Un tipo de cuenta puede aplicar a múltiples cuentas (1:N con `cuentas`)

## Tipos_Sucursal
- **Llave Primaria**: `tipo_sucursal_id`
- **Relaciones**:
  - Un tipo de sucursal puede aplicar a múltiples sucursales (1:N con `sucursales`)

## Tipos_Transaccion
- **Llave Primaria**: `tipo_transaccion_id`
- **Relaciones**:
  - Un tipo de transacción puede aplicar a múltiples transacciones (1:N con `transacciones`)

## Transacciones
- **Llave Primaria**: `transaccion_id`
- **Llaves Foráneas**:
  - `cliente_emisor` (referencia a `clientes.cliente_id`)
  - `sucursal_id` (referencia a `sucursales.sucursal_id`)
  - `tipo_transaccion` (referencia a `tipos_transaccion.tipo_transaccion_id`)
- **Relaciones**:
  - Cada transacción está asociada a un cliente emisor específico (N:1 con `clientes`)
  - Cada transacción se realiza en una sucursal específica (N:1 con `sucursales`)
  - Cada transacción tiene un tipo específico (N:1 con `tipos_transaccion`)

Este modelo relacional muestra cómo las diferentes entidades del banco están interconectadas. Por ejemplo, un cliente puede tener múltiples cuentas, tarjetas de crédito y préstamos, mientras que cada cuenta, tarjeta o préstamo pertenece a un solo cliente. Similarmente, las sucursales están vinculadas a departamentos y empleados, permitiendo una estructura organizacional clara. Las transacciones están vinculadas a clientes, sucursales y tipos de transacción, lo que permite un seguimiento detallado de todas las operaciones bancarias.

A continuación, se muestra código del script para la creación de algunas tablas, llaves foráneas e inserts de datos.

### Script de Creación de Tablas

**1. Tabla CLIENTES**
   
```sql
CREATE TABLE clientes (
    cliente_id INTEGER NOT NULL,
    nombre     VARCHAR2(15) NOT NULL,
    apellido   VARCHAR2(15) NOT NULL,
    telefono   VARCHAR2(15) NOT NULL,
    PRIMARY KEY (cliente_id)
);
```
Descripción:
La tabla clientes almacena información básica sobre los clientes. Cada cliente tiene un identificador único (cliente_id), junto con su nombre, apellido y número de teléfono.

**2. Tabla CUENTAS**
   
```sql
CREATE TABLE cuentas (
    cuenta_id      INTEGER NOT NULL,
    titular_cuenta INTEGER NOT NULL,
    tipo_cuenta    INTEGER NOT NULL,
    numero_cuenta  VARCHAR2(20) NOT NULL,
    saldo          NUMBER(10, 2) NOT NULL,
    PRIMARY KEY (cuenta_id),
    FOREIGN KEY (titular_cuenta) REFERENCES clientes(cliente_id),
    FOREIGN KEY (tipo_cuenta) REFERENCES tipos_cuenta(tipo_cuenta_id)
);
```
Descripción:
La tabla cuentas almacena información sobre las cuentas bancarias. Cada cuenta tiene un identificador único (cuenta_id), el identificador del cliente (titular_cuenta), el tipo de cuenta (tipo_cuenta), el número de cuenta y el saldo. Además, tiene claves foráneas que referencian a clientes y tipos_cuenta.

**3. Tabla EMPLEADOS**

```sql
CREATE TABLE empleados (
    empleado_id     INTEGER NOT NULL,
    sucursal_id     INTEGER NOT NULL,
    departamento_id INTEGER NOT NULL,
    rol_id          INTEGER NOT NULL,
    nombre          VARCHAR2(15) NOT NULL,
    apellido        VARCHAR2(15) NOT NULL,
    telefono        VARCHAR2(15) NOT NULL,
    PRIMARY KEY (empleado_id)
);
```

Descripción:
La tabla empleados contiene información sobre los empleados del banco. Cada empleado tiene un identificador único (empleado_id), así como su nombre, apellido y número de teléfono. Se relaciona con las tablas de sucursales, departamentos y roles.

**4. Tabla TIPOS DE CUENTA**

```sql
CREATE TABLE tipos_cuenta (
    tipo_cuenta_id INTEGER NOT NULL,
    tipo           VARCHAR2(25) NOT NULL,
    PRIMARY KEY (tipo_cuenta_id)
);
```

Descripción:
La tabla tipos_cuenta almacena los diferentes tipos de cuentas bancarias disponibles, como cuentas de ahorro o corrientes. Cada tipo de cuenta tiene un identificador único (tipo_cuenta_id) y una descripción (tipo).

**5. Tabla SUCURSALES**

```sql
CREATE TABLE sucursales (
    sucursal_id     INTEGER NOT NULL,
    departamento_id INTEGER NOT NULL,
    tipo_sucursal   INTEGER NOT NULL,
    nombre          VARCHAR2(30) NOT NULL,
    telefono        VARCHAR2(15) NOT NULL,
    PRIMARY KEY (sucursal_id)
);
```

Descripción:
La tabla sucursales contiene información sobre las sucursales del banco. Cada sucursal tiene un identificador único (sucursal_id), está asociada a un departamento mediante la clave foránea departamento_id, y almacena el nombre y teléfono de la sucursal.

**6. Tabla DEPARTAMENTOS**

```sql
CREATE TABLE departamentos (
    departamento_id INTEGER NOT NULL,
    nombre          VARCHAR2(30) NOT NULL,
    PRIMARY KEY (departamento_id)
);
```

Descripción:
La tabla departamentos almacena los diferentes departamentos a los que puede pertenecer una sucursal o agencia del banco.

**7. Tabla TRANSACCIONES**

```sql
CREATE TABLE transacciones (
    transaccion_id INTEGER NOT NULL,
    cuenta_id      INTEGER NOT NULL,
    fecha          DATE NOT NULL,
    monto          NUMBER(10, 2) NOT NULL,
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(cuenta_id)
);
```

Descripción:
La tabla transacciones almacena el historial de transacciones realizadas en las cuentas bancarias. Cada transacción tiene un identificador único (transaccion_id), el identificador de la cuenta afectada (cuenta_id), la fecha de la transacción y el monto involucrado.

**8. Tabla ROLES**

```sql
CREATE TABLE roles (
    rol_id  INTEGER NOT NULL,
    nombre  VARCHAR2(20) NOT NULL,
    PRIMARY KEY (rol_id)
);
```

Descripción:
La tabla roles define los diferentes roles que los empleados pueden tener dentro del banco, como cajero, gerente, etc. Cada rol tiene un identificador único (rol_id) y un nombre descriptivo (nombre).

### Explicación de Inserts por Tabla

**Tabla: clientes**

```sql
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) 
VALUES (clientes_seq.NEXTVAL, 'Luis', 'Gómez', '+502 31275090');

INSERT INTO clientes (cliente_id, nombre, apellido, telefono) 
VALUES (clientes_seq.NEXTVAL, 'Carlos', 'Marroquín', '+502 31275091');
```

Estos inserts añaden dos nuevos clientes a la tabla `clientes`. Se utiliza `clientes_seq.NEXTVAL` para generar automáticamente el `cliente_id`.

**Tabla: cuentas**

```sql
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) 
VALUES (cuentas_seq.NEXTVAL, 1, 1, '1234567890', 1500.75);

INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) 
VALUES (cuentas_seq.NEXTVAL, 2, 2, '2345678901', 2500.50);
```

Estos inserts crean dos nuevas cuentas en la tabla `cuentas`. El `cuenta_id` se genera con `cuentas_seq.NEXTVAL`, y se asocian a los clientes con ID 1 y 2 respectivamente.

**Tabla: departamentos**

```sql
INSERT INTO departamentos (departamento_id, nombre_departamento) 
VALUES (1, 'Guatemala');

INSERT INTO departamentos (departamento_id, nombre_departamento) 
VALUES (2, 'Escuintla');
```

Estos inserts agregan dos departamentos a la tabla `departamentos`. En este caso, los IDs se especifican manualmente.

**Tabla: empleados**

```sql
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) 
VALUES (empleados_seq.NEXTVAL, 1, 1, 1, 'Carlos', 'Ramírez', '+502 31272001');

INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) 
VALUES (empleados_seq.NEXTVAL, 1, 1, 2, 'Laura', 'Fernández', '+502 31272002');
```

Estos inserts añaden dos empleados a la tabla `empleados`. Se utiliza `empleados_seq.NEXTVAL` para el `empleado_id`, y se asocian a la sucursal, departamento y rol correspondientes.

**Tabla: estados_prestamo**

```sql
INSERT INTO estados_prestamo (estado_prestamo_id, estado) 
VALUES (1, 'Realizado');

INSERT INTO estados_prestamo (estado_prestamo_id, estado) 
VALUES (2, 'En Proceso');
```

Estos inserts agregan dos estados de préstamo a la tabla `estados_prestamo`. Los IDs se especifican manualmente.

**Tabla: estados_tarjeta**

```sql
INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) 
VALUES (1, 'Activa');

INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) 
VALUES (2, 'Cancelada');
```

Estos inserts añaden dos estados de tarjeta a la tabla `estados_tarjeta`. Los IDs se especifican manualmente.

**Tabla: municipios**

```sql
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) 
VALUES (municipios_seq.NEXTVAL, 1, 'Guatemala', 'Zona 1, Centro Histórico', '01001');

INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) 
VALUES (municipios_seq.NEXTVAL, 1, 'Mixco', 'Calzada Roosevelt 19-00', '01057');
```

Estos inserts agregan dos municipios a la tabla `municipios`. Se usa `municipios_seq.NEXTVAL` para el `municipio_id`, y se asocian al departamento con ID 1.

**Tabla: prestamos**

```sql
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) 
VALUES (prestamos_seq.NEXTVAL, 1, 1, 50000, 5.5, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2028-05-10', 'YYYY-MM-DD'), 40000);

INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) 
VALUES (prestamos_seq.NEXTVAL, 2, 4, 25000, 6.0, TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2027-03-01', 'YYYY-MM-DD'), 12000);
```

Estos inserts crean dos préstamos en la tabla `prestamos`. Se utiliza `prestamos_seq.NEXTVAL` para el `prestamo_id`, y se asocian a los prestatarios con ID 1 y 2 respectivamente.

**Tabla: roles**

```sql
INSERT INTO roles (rol_id, rol) 
VALUES (1, 'Gerente General');

INSERT INTO roles (rol_id, rol) 
VALUES (2, 'Cajero');
```

Estos inserts agregan dos roles a la tabla `roles`. Los IDs se especifican manualmente.

**Tabla: sucursales**

```sql
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) 
VALUES (sucursales_seq.NEXTVAL, 1, 1, 'Sucursal Central', '+502 31271001');

INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) 
VALUES (sucursales_seq.NEXTVAL, 1, 2, 'Agencia Zona 10', '+502 31271002');
```

Estos inserts añaden dos sucursales a la tabla `sucursales`. Se usa `sucursales_seq.NEXTVAL` para el `sucursal_id`, y se asocian al departamento con ID 1.

**Tabla: tarjetas_credito**

```sql
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) 
VALUES (tarjetas_credito_seq.NEXTVAL, 1, 1, '1234567812345678', 10000, 1500, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2031-02-08', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 30);

INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) 
VALUES (tarjetas_credito_seq.NEXTVAL, 2, 2, '2345678923456789', 15000, 2000, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2030-06-17', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), 10);
```

Estos inserts crean dos tarjetas de crédito en la tabla `tarjetas_credito`. Se utiliza `tarjetas_credito_seq.NEXTVAL` para el `tarjeta_id`, y se asocian a los titulares con ID 1 y 2 respectivamente.

**Tabla: tipos_cuenta**

```sql
INSERT INTO tipos_cuenta (tipo_cuenta_id, tipo) 
VALUES (1, 'Ahorro');

INSERT INTO tipos_cuenta (tipo_cuenta_id, tipo) 
VALUES (2, 'Monetaria');
```

Estos inserts agregan dos tipos de cuenta a la tabla `tipos_cuenta`. Los IDs se especifican manualmente.

**Tabla: tipos_sucursal**

```sql
INSERT INTO tipos_sucursal (tipo_sucursal_id, tipo) 
VALUES (1, 'Sucursal');

INSERT INTO tipos_sucursal (tipo_sucursal_id, tipo) 
VALUES (2, 'Agencia');
```

Estos inserts añaden dos tipos de sucursal a la tabla `tipos_sucursal`. Los IDs se especifican manualmente.

**Tabla: tipos_transaccion**

```sql
INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) 
VALUES (1, 'Inmediata');

INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) 
VALUES (2, 'ACH');
```

Estos inserts agregan dos tipos de transacción a la tabla `tipos_transaccion`. Los IDs se especifican manualmente.

**Tabla: transacciones**

```sql
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) 
VALUES (transacciones_seq.NEXTVAL, 1, 1, 1, '1234567890', '2345678901', 500.50, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('12:30:00', 'HH24:MI:SS'), 'Transferencia Inmediata');

INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) 
VALUES (transacciones_seq.NEXTVAL, 2, 1, 2, '2345678901', '3456789012', 1000.75, TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('09:45:00', 'HH24:MI:SS'), 'Transferencia ACH');
```

Estos inserts crean dos transacciones en la tabla `transacciones`. Se utiliza `transacciones_seq.NEXTVAL` para el `transaccion_id`, y se asocian a los clientes emisores con ID 1 y 2 respectivamente.

