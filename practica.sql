-- ==========================================
-- CREACIÓN Y USO DE BASE DE DATOS (Opcional en MySQL/SQL Server)
-- ==========================================
-- CREATE DATABASE tienda_practica;
-- USE tienda_practica;

-- ==========================================
-- 1. DDL - CREATE (3 tablas)
-- ==========================================
CREATE DATABASE IF NOT EXISTS tienda_practica;
USE tienda_practica;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- ==========================================
-- 2. DDL - ALTER (2 por tabla)
-- ==========================================

-- ALTER para Clientes (2)
ALTER TABLE Clientes ADD telefono VARCHAR(20);
ALTER TABLE Clientes ADD CONSTRAINT uq_correo UNIQUE (correo);

-- ALTER para Productos (2)
ALTER TABLE Productos ADD stock INT DEFAULT 0;
ALTER TABLE Productos ADD categoria VARCHAR(50);

-- ALTER para Pedidos (2)
ALTER TABLE Pedidos ADD fecha_pedido DATE;
ALTER TABLE Pedidos ADD estado VARCHAR(30) DEFAULT 'Pendiente';

-- ==========================================
-- 3. DML - INSERT (3 por cada tabla)
-- ==========================================

-- INSERT para Clientes (3)
INSERT INTO Clientes (id_cliente, nombre, correo, telefono)
VALUES (1, 'Ana López', 'ana@email.com', '5512345678');

INSERT INTO Clientes (id_cliente, nombre, correo, telefono)
VALUES (2, 'Carlos Ruiz', 'carlos@email.com', '5523456789');

INSERT INTO Clientes (id_cliente, nombre, correo, telefono)
VALUES (3, 'María Pérez', 'maria@email.com', '5534567890');

-- INSERT para Productos (3)
INSERT INTO Productos (id_producto, nombre, precio, stock, categoria)
VALUES (1, 'Laptop', 15000.00, 10, 'Electrónica');

INSERT INTO Productos (id_producto, nombre, precio, stock, categoria)
VALUES (2, 'Mouse', 350.00, 50, 'Accesorios');

INSERT INTO Productos (id_producto, nombre, precio, stock, categoria)
VALUES (3, 'Teclado', 800.00, 30, 'Accesorios');

-- INSERT para Pedidos (3)
INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido, estado)
VALUES (1, 1, 1, 1, '2026-11-20', 'Enviado');

INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido, estado)
VALUES (2, 2, 2, 2, '2026-11-20', 'Pendiente');

INSERT INTO Pedidos (id_pedido, id_cliente, id_producto, cantidad, fecha_pedido, estado)
VALUES (3, 3, 3, 1, '2026-11-20', 'Pendiente');

-- ==========================================
-- 4. DML - SELECT (2 por cada tabla)
-- ==========================================

-- SELECT para Clientes (2)
SELECT * FROM Clientes;
SELECT nombre, correo FROM Clientes WHERE id_cliente = 1;

-- SELECT para Productos (2)
SELECT * FROM Productos;
SELECT nombre, precio FROM Productos WHERE precio > 500;

-- SELECT para Pedidos (2)
SELECT * FROM Pedidos;
SELECT id_pedido, id_cliente, cantidad FROM Pedidos WHERE estado = 'Pendiente';

-- ==========================================
-- 5. DML - UPDATE (1 por cada tabla)
-- ==========================================

-- UPDATE para Clientes (1)
UPDATE Clientes
SET telefono = '5599999999'
WHERE id_cliente = 1;

-- UPDATE para Productos (1)
UPDATE Productos
SET precio = 14500.00
WHERE id_producto = 1;

-- UPDATE para Pedidos (1)
UPDATE Pedidos
SET estado = 'Entregado'
WHERE id_pedido = 1;

-- ==========================================
-- 6. DML - DELETE (2 por cada tabla)
-- ==========================================

-- DELETE para Pedidos (2)
DELETE FROM Pedidos WHERE id_pedido = 2;
DELETE FROM Pedidos WHERE id_pedido = 3;

-- DELETE para Productos (2)
DELETE FROM Productos WHERE id_producto = 2;
DELETE FROM Productos WHERE id_producto = 3;

-- DELETE para Clientes (2)
DELETE FROM Clientes WHERE id_cliente = 2;
DELETE FROM Clientes WHERE id_cliente = 3;

-- ==========================================
-- 7. DDL - DROP (1 tabla)
-- ==========================================

DROP TABLE Pedidos;
