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
    tipo                VARCHAR2(25) NOT NULL,
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

-- Secuencias y datos de prueba
CREATE SEQUENCE clientes_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE cuentas_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE tarjetas_credito_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE prestamos_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE sucursales_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE municipios_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE empleados_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE transacciones_seq START WITH 1 INCREMENT BY 1;

-- Inserts
-- Clientes
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Luis', 'Gómez', '+502 31275090');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Carlos', 'Marroquín', '+502 31275091');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Ana', 'Pérez', '+502 31275092');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Jorge', 'Rodríguez', '+502 31275093');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'María', 'Hernández', '+502 31275094');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Laura', 'Santos', '+502 31275095');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Juan', 'Cruz', '+502 31275096');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Diana', 'López', '+502 31275097');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Fernando', 'García', '+502 31275098');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Sofía', 'Martínez', '+502 31275099');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Diego', 'Ortega', '+502 31275100');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Andrea', 'Morales', '+502 31275101');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Pablo', 'Ramírez', '+502 31275102');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Lucía', 'Fernández', '+502 31275103');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Camila', 'Jiménez', '+502 31275104');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Ricardo', 'Ruiz', '+502 31275105');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Valeria', 'Castillo', '+502 31275106');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Sebastián', 'Gómez', '+502 31275107');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Gabriela', 'Vásquez', '+502 31275108');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Miguel', 'Flores', '+502 31275109');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Elena', 'Chávez', '+502 31275110');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Cristina', 'Díaz', '+502 31275111');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Roberto', 'Méndez', '+502 31275112');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Daniela', 'Torres', '+502 31275113');
INSERT INTO clientes (cliente_id, nombre, apellido, telefono) VALUES (clientes_seq.NEXTVAL, 'Tomás', 'Álvarez', '+502 31275114');

-- Tipos de cuenta
INSERT INTO tipos_cuenta (tipo_cuenta_id, tipo) VALUES (1, 'Ahorro');
INSERT INTO tipos_cuenta (tipo_cuenta_id, tipo) VALUES (2, 'Monetaria');

-- Cuentas
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 1, 1, '1234567890', 1500.75);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 2, 2, '2345678901', 2500.50);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 3, 1, '3456789012', 3600.30);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 4, 2, '4567890123', 1800.90);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 5, 1, '5678901234', 5400.00);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 6, 2, '6789012345', 300.50);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 7, 1, '7890123456', 7200.75);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 8, 2, '8901234567', 900.20);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 9, 1, '9012345678', 4750.60);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 10, 2, '0123456789', 6800.10);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 11, 1, '1234509876', 3300.00);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 12, 2, '2345609876', 1250.30);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 13, 1, '3456709876', 7550.45);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 14, 2, '4567809876', 2400.75);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 15, 1, '5678909876', 650.50);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 16, 2, '6789009876', 3800.95);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 17, 1, '7890109876', 2900.60);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 18, 2, '8901209876', 9500.10);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 19, 1, '9012309876', 1200.75);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 20, 2, '0123409876', 3150.80);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 21, 1, '1234560987', 4800.50);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 22, 2, '2345670987', 2100.40);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 23, 1, '3456780987', 6250.25);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 24, 2, '4567890987', 8050.10);
INSERT INTO cuentas (cuenta_id, titular_cuenta, tipo_cuenta, numero_cuenta, saldo) VALUES (cuentas_seq.NEXTVAL, 25, 1, '5678900987', 1300.00);

-- Estados de tarjeta
INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) VALUES (1, 'Activa');
INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) VALUES (2, 'Cancelada');
INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) VALUES (3, 'Bloqueada');
INSERT INTO estados_tarjeta (estado_tarjeta_id, estado) VALUES (4, 'Obstruida');

-- Tarjetas de crédito
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 1, 1, '1234567812345678', 10000, 1500, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2031-02-08', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 30);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 2, 2, '2345678923456789', 15000, 2000, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2030-06-17', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), 10);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 3, 1, '3456789034567890', 12000, 3000, TO_DATE('2022-09-15', 'YYYY-MM-DD'), TO_DATE('2029-10-22', 'YYYY-MM-DD'), TO_DATE('2022-10-07', 'YYYY-MM-DD'), 7);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 4, 3, '4567890145678901', 8000, 500, TO_DATE('2021-07-20', 'YYYY-MM-DD'), TO_DATE('2028-08-27', 'YYYY-MM-DD'), TO_DATE('2021-08-15', 'YYYY-MM-DD'), 15);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 5, 1, '5678901256789012', 20000, 7500, TO_DATE('2020-11-01', 'YYYY-MM-DD'), TO_DATE('2027-12-08', 'YYYY-MM-DD'), TO_DATE('2020-11-30', 'YYYY-MM-DD'), 30);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 6, 4, '6789012367890123', 5000, 1000, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2031-04-22', 'YYYY-MM-DD'), TO_DATE('2024-04-14', 'YYYY-MM-DD'), 14);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 7, 1, '7890123478901234', 9000, 6500, TO_DATE('2023-02-05', 'YYYY-MM-DD'), TO_DATE('2030-03-12', 'YYYY-MM-DD'), TO_DATE('2023-03-04', 'YYYY-MM-DD'), 4);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 8, 2, '8901234589012345', 18000, 2500, TO_DATE('2022-12-25', 'YYYY-MM-DD'), TO_DATE('2030-01-31', 'YYYY-MM-DD'), TO_DATE('2023-01-24', 'YYYY-MM-DD'), 24);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 9, 3, '9012345690123456', 16000, 12000, TO_DATE('2021-08-10', 'YYYY-MM-DD'), TO_DATE('2028-09-17', 'YYYY-MM-DD'), TO_DATE('2021-09-09', 'YYYY-MM-DD'), 9);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 10, 1, '0123456701234567', 25000, 5000, TO_DATE('2020-10-30', 'YYYY-MM-DD'), TO_DATE('2027-12-06', 'YYYY-MM-DD'), TO_DATE('2020-11-29', 'YYYY-MM-DD'), 29);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 11, 4, '1234567810987654', 6000, 250, TO_DATE('2023-06-18', 'YYYY-MM-DD'), TO_DATE('2030-07-25', 'YYYY-MM-DD'), TO_DATE('2023-07-17', 'YYYY-MM-DD'), 17);
INSERT INTO tarjetas_credito (tarjeta_id, titular_tarjeta, estado_tarjeta, numero_tarjeta, limite_credito, saldo_actual, fecha_emi, fecha_exp, fecha_corte, dia_ciclo) VALUES (tarjetas_credito_seq.NEXTVAL, 12, 2, '2345678921098765', 30000, 15000, TO_DATE('2024-04-25', 'YYYY-MM-DD'), TO_DATE('2031-06-02', 'YYYY-MM-DD'), TO_DATE('2024-05-24', 'YYYY-MM-DD'), 24);

-- Estados de préstamo
INSERT INTO estados_prestamo (estado_prestamo_id, estado) VALUES (1, 'Realizado');
INSERT INTO estados_prestamo (estado_prestamo_id, estado) VALUES (2, 'En Proceso');
INSERT INTO estados_prestamo (estado_prestamo_id, estado) VALUES (3, 'Cancelado');
INSERT INTO estados_prestamo (estado_prestamo_id, estado) VALUES (4, 'Pagando');
INSERT INTO estados_prestamo (estado_prestamo_id, estado) VALUES (5, 'Finalizado');

-- Prestamos
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 1, 1, 50000, 5.5, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2028-05-10', 'YYYY-MM-DD'), 40000);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 2, 4, 25000, 6.0, TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2027-03-01', 'YYYY-MM-DD'), 12000);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 3, 2, 10000, 4.8, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2026-11-15', 'YYYY-MM-DD'), 10000);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 4, 5, 60000, 7.0, TO_DATE('2021-09-05', 'YYYY-MM-DD'), TO_DATE('2026-09-05', 'YYYY-MM-DD'), 0);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 5, 1, 45000, 5.0, TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_DATE('2029-01-20', 'YYYY-MM-DD'), 45000);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 6, 3, 15000, 4.5, TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'), 0);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 7, 4, 30000, 6.3, TO_DATE('2023-04-18', 'YYYY-MM-DD'), TO_DATE('2028-04-18', 'YYYY-MM-DD'), 15000);
INSERT INTO prestamos (prestamo_id, prestatario, estado_prestamo, monto_prestamo, tasa_interes, fecha_des, fecha_ven, saldo_pendiente) VALUES (prestamos_seq.NEXTVAL, 8, 1, 20000, 4.9, TO_DATE('2021-12-22', 'YYYY-MM-DD'), TO_DATE('2026-12-22', 'YYYY-MM-DD'), 10000);

-- Departamentos
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (1, 'Guatemala');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (2, 'Escuintla');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (3, 'Sacatepéquez');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (4, 'Chimaltenango');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (5, 'Quetzaltenango');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (6, 'Huehuetenango');
INSERT INTO departamentos (departamento_id, nombre_departamento) VALUES (7, 'Petén');

-- Tipos de sucursal
INSERT INTO tipos_sucursal (tipo_sucursal_id, tipo) VALUES (1, 'Sucursal');
INSERT INTO tipos_sucursal (tipo_sucursal_id, tipo) VALUES (2, 'Agencia');

-- Sucursales
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 1, 1, 'Sucursal Central', '+502 31271001');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 1, 2, 'Agencia Zona 10', '+502 31271002');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 2, 1, 'Sucursal Escuintla', '+502 31271003');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 2, 2, 'Agencia Puerto San José', '+502 31271004');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 3, 1, 'Sucursal Antigua Guatemala', '+502 31271005');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 4, 2, 'Agencia Chimaltenango', '+502 31271006');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 5, 1, 'Sucursal Quetzaltenango', '+502 31271007');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 6, 2, 'Agencia Huehuetenango', '+502 31271008');
INSERT INTO sucursales (sucursal_id, departamento_id, tipo_sucursal, nombre, telefono) VALUES (sucursales_seq.NEXTVAL, 7, 1, 'Sucursal Santa Elena Petén', '+502 31271009');

-- Municipios
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 1, 'Guatemala', 'Zona 1, Centro Histórico', '01001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 1, 'Mixco', 'Calzada Roosevelt 19-00', '01057');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 1, 'Villa Nueva', 'Km 15.5 Carretera al Pacífico', '01064');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 2, 'Escuintla', 'Avenida Centroamérica', '05001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 2, 'Puerto San José', 'Km 98 Carretera al Puerto', '05009');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 3, 'Antigua Guatemala', 'Calle del Arco', '03001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 4, 'Chimaltenango', 'Avenida 2 de Octubre', '04001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 5, 'Quetzaltenango', 'Avenida Las Américas', '09001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 6, 'Huehuetenango', 'Calle Real Zona 1', '13001');
INSERT INTO municipios (municipio_id, departamento_id, nombre_municipio, direccion, codigo_postal) VALUES (municipios_seq.NEXTVAL, 7, 'Santa Elena', 'Avenida La Libertad', '17001');

-- Roles
INSERT INTO roles (rol_id, rol) VALUES (1, 'Gerente General');
INSERT INTO roles (rol_id, rol) VALUES (2, 'Cajero');
INSERT INTO roles (rol_id, rol) VALUES (3, 'Asesor de Servicios');
INSERT INTO roles (rol_id, rol) VALUES (4, 'Analista de Crédito');
INSERT INTO roles (rol_id, rol) VALUES (5, 'Supervisor de Sucursal');
INSERT INTO roles (rol_id, rol) VALUES (6, 'Seguridad');

-- Empleados
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 1, 1, 1, 'Carlos', 'Ramírez', '+502 31272001');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 1, 1, 2, 'Laura', 'Fernández', '+502 31272002');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 2, 1, 3, 'Jorge', 'Pérez', '+502 31272003');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 3, 3, 4, 'Ana', 'Martínez', '+502 31272004');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 4, 4, 5, 'Roberto', 'González', '+502 31272005');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 5, 5, 6, 'Diana', 'Santos', '+502 31272006');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 6, 6, 1, 'Mario', 'López', '+502 31272007');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 7, 7, 2, 'Sofía', 'Hernández', '+502 31272008');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 1, 1, 3, 'Gabriel', 'Morales', '+502 31272009');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 2, 2, 4, 'Cristina', 'Vásquez', '+502 31272010');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 3, 3, 5, 'Pablo', 'Rodríguez', '+502 31272011');
INSERT INTO empleados (empleado_id, sucursal_id, departamento_id, rol_id, nombre, apellido, telefono) VALUES (empleados_seq.NEXTVAL, 4, 4, 6, 'Elena', 'Castillo', '+502 31272012');

-- Tipos de transacción
INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) VALUES (1, 'Inmediata');
INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) VALUES (2, 'ACH');
INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) VALUES (3, 'Transferencia Interna');
INSERT INTO tipos_transaccion (tipo_transaccion_id, tipo) VALUES (4, 'Pago Servicios');

-- Transacciones
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 1, 1, 1, '1234567890', '2345678901', 500.50, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('12:30:00', 'HH24:MI:SS'), 'Transferencia Inmediata');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 2, 1, 2, '2345678901', '3456789012', 1000.75, TO_DATE('2024-09-02', 'YYYY-MM-DD'), TO_DATE('09:45:00', 'HH24:MI:SS'), 'Transferencia ACH');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 3, 2, 3, '3456789012', '4567890123', 200.00, TO_DATE('2024-09-03', 'YYYY-MM-DD'), TO_DATE('15:00:00', 'HH24:MI:SS'), 'Pago de Servicios');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 4, 3, 4, '4567890123', '5678901234', 750.80, TO_DATE('2024-09-04', 'YYYY-MM-DD'), TO_DATE('11:20:00', 'HH24:MI:SS'), 'Transferencia Interna');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 5, 4, 1, '5678901234', '6789012345', 320.25, TO_DATE('2024-09-05', 'YYYY-MM-DD'), TO_DATE('10:10:00', 'HH24:MI:SS'), 'ACH');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 6, 5, 2, '6789012345', '7890123456', 1500.90, TO_DATE('2024-09-06', 'YYYY-MM-DD'), TO_DATE('14:40:00', 'HH24:MI:SS'), 'Transferencia Inmediata');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 7, 6, 3, '7890123456', '8901234567', 250.50, TO_DATE('2024-09-07', 'YYYY-MM-DD'), TO_DATE('16:50:00', 'HH24:MI:SS'), 'Pago Servicios');
INSERT INTO transacciones (transaccion_id, cliente_emisor, sucursal_id, tipo_transaccion, cuenta_emisora, cuenta_receptora, monto, fecha, hora, descripcion) VALUES (transacciones_seq.NEXTVAL, 7, 7, 4, '8901234567', '9012345678', 600.75, TO_DATE('2024-09-08', 'YYYY-MM-DD'), TO_DATE('13:15:00', 'HH24:MI:SS'), 'Transferencia Interna');