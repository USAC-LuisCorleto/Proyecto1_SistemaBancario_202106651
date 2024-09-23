-- Script de creación de tablas y llaves foráneas para la base de datos JP Morgan
-- Luis Carlos Corleto Marroquín - 202106651

-- Tablas y llaves primarias

CREATE TABLE clientes (
    cliente_id INTEGER NOT NULL,
    nombre     VARCHAR2(15) NOT NULL,
    apellido   VARCHAR2(15) NOT NULL,
    telefono   VARCHAR2(15) NOT NULL,
    PRIMARY KEY (cliente_id)
);

CREATE TABLE cuentas (
    cuenta_id      INTEGER NOT NULL,
    titular_cuenta INTEGER NOT NULL,
    tipo_cuenta    INTEGER NOT NULL,
    numero_cuenta  VARCHAR2(20) NOT NULL,
    saldo          NUMBER(10, 2) NOT NULL,
    PRIMARY KEY (cuenta_id)
);

CREATE TABLE departamentos (
    departamento_id     INTEGER NOT NULL,
    nombre_departamento VARCHAR2(30) NOT NULL,
    PRIMARY KEY (departamento_id)
);

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

CREATE TABLE estados_prestamo (
    estado_prestamo_id INTEGER NOT NULL,
    estado             VARCHAR2(25) NOT NULL,
    PRIMARY KEY (estado_prestamo_id)
);

CREATE TABLE estados_tarjeta (
    estado_tarjeta_id INTEGER NOT NULL,
    estado            VARCHAR2(15) NOT NULL,
    PRIMARY KEY (estado_tarjeta_id)
);

CREATE TABLE municipios (
    municipio_id     INTEGER NOT NULL,
    departamento_id  INTEGER NOT NULL,
    nombre_municipio VARCHAR2(30) NOT NULL,
    direccion        VARCHAR2(50) NOT NULL,
    codigo_postal    VARCHAR2(5) NOT NULL,
    PRIMARY KEY (municipio_id)
);

CREATE TABLE prestamos (
    prestamo_id     INTEGER NOT NULL,
    prestatario     INTEGER,
    estado_prestamo INTEGER NOT NULL,
    monto_prestamo  NUMBER(10, 2) NOT NULL,
    tasa_interes    NUMBER(5, 2) NOT NULL,
    fecha_des       DATE NOT NULL,
    fecha_ven       DATE NOT NULL,
    saldo_pendiente NUMBER(10, 2) NOT NULL,
    PRIMARY KEY (prestamo_id)
);

CREATE TABLE roles (
    rol_id INTEGER NOT NULL,
    rol    VARCHAR2(50) NOT NULL,
    PRIMARY KEY (rol_id)
);

CREATE TABLE sucursales (
    sucursal_id     INTEGER NOT NULL,
    departamento_id INTEGER NOT NULL,
    tipo_sucursal   INTEGER NOT NULL,
    nombre          VARCHAR2(30) NOT NULL,
    telefono        VARCHAR2(15) NOT NULL,
    PRIMARY KEY (sucursal_id)
);

CREATE TABLE tarjetas_credito (
    tarjeta_id      INTEGER NOT NULL,
    titular_tarjeta INTEGER,
    estado_tarjeta  INTEGER NOT NULL,
    numero_tarjeta  VARCHAR2(16) NOT NULL,
    limite_credito  NUMBER(10, 2) NOT NULL,
    saldo_actual    NUMBER(10, 2) NOT NULL,
    fecha_emi       DATE NOT NULL,
    fecha_exp       DATE NOT NULL,
    fecha_corte     DATE,
    dia_ciclo       INTEGER,
    PRIMARY KEY (tarjeta_id)
);

CREATE TABLE tipos_cuenta (
    tipo_cuenta_id INTEGER NOT NULL,
    tipo           VARCHAR2(25) NOT NULL,
    PRIMARY KEY (tipo_cuenta_id)
);

CREATE TABLE tipos_sucursal (
    tipo_sucursal_id INTEGER NOT NULL,
    tipo             VARCHAR2(15) NOT NULL,
    PRIMARY KEY (tipo_sucursal_id)
);

CREATE TABLE tipos_transaccion (
    tipo_transaccion_id INTEGER NOT NULL,
    tipo                VARCHAR2(20) NOT NULL,
    PRIMARY KEY (tipo_transaccion_id)
);

CREATE TABLE transacciones (
    transaccion_id   INTEGER NOT NULL,
    cliente_emisor   INTEGER,
    sucursal_id      INTEGER NOT NULL,
    tipo_transaccion INTEGER NOT NULL,
    cuenta_emisora   VARCHAR2(20) NOT NULL,
    cuenta_receptora VARCHAR2(20) NOT NULL,
    monto            NUMBER(10, 2) NOT NULL,
    fecha            DATE NOT NULL,
    hora             DATE NOT NULL,
    descripcion      VARCHAR2(100) NOT NULL,
    PRIMARY KEY (transaccion_id)
);

-- Llaves foráneas

ALTER TABLE cuentas
    ADD CONSTRAINT fk_cuentas_clientes FOREIGN KEY (titular_cuenta)
    REFERENCES clientes (cliente_id);

ALTER TABLE cuentas
    ADD CONSTRAINT fk_cuentas_tipos FOREIGN KEY (tipo_cuenta)
    REFERENCES tipos_cuenta (tipo_cuenta_id);

ALTER TABLE empleados
    ADD CONSTRAINT fk_empleados_departamentos FOREIGN KEY (departamento_id)
    REFERENCES departamentos (departamento_id);

ALTER TABLE empleados
    ADD CONSTRAINT fk_empleados_roles FOREIGN KEY (rol_id)
    REFERENCES roles (rol_id);

ALTER TABLE empleados
    ADD CONSTRAINT fk_empleados_sucursales FOREIGN KEY (sucursal_id)
    REFERENCES sucursales (sucursal_id);

ALTER TABLE municipios
    ADD CONSTRAINT fk_municipios_departamentos FOREIGN KEY (departamento_id)
    REFERENCES departamentos (departamento_id);

ALTER TABLE prestamos
    ADD CONSTRAINT fk_prestamos_clientes FOREIGN KEY (prestatario)
    REFERENCES clientes (cliente_id);

ALTER TABLE prestamos
    ADD CONSTRAINT fk_prestamos_estado FOREIGN KEY (estado_prestamo)
    REFERENCES estados_prestamo (estado_prestamo_id);

ALTER TABLE sucursales
    ADD CONSTRAINT fk_sucursales_departamentos FOREIGN KEY (departamento_id)
    REFERENCES departamentos (departamento_id);

ALTER TABLE sucursales
    ADD CONSTRAINT fk_sucursales_tipos FOREIGN KEY (tipo_sucursal)
    REFERENCES tipos_sucursal (tipo_sucursal_id);

ALTER TABLE tarjetas_credito
    ADD CONSTRAINT fk_tarjetas_clientes FOREIGN KEY (titular_tarjeta)
    REFERENCES clientes (cliente_id);

ALTER TABLE tarjetas_credito
    ADD CONSTRAINT fk_tarjetas_estado FOREIGN KEY (estado_tarjeta)
    REFERENCES estados_tarjeta (estado_tarjeta_id);

ALTER TABLE transacciones
    ADD CONSTRAINT fk_transacciones_tipo FOREIGN KEY (tipo_transaccion)
    REFERENCES tipos_transaccion (tipo_transaccion_id);

ALTER TABLE transacciones
    ADD CONSTRAINT fk_transacciones_clientes FOREIGN KEY (cliente_emisor)
    REFERENCES clientes (cliente_id);

ALTER TABLE transacciones
    ADD CONSTRAINT fk_transacciones_sucursales FOREIGN KEY (sucursal_id)
    REFERENCES sucursales (sucursal_id);
