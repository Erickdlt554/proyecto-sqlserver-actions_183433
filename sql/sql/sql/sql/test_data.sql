USE EmpresaDB;
GO
INSERT INTO Inventario VALUES ('Laptop',10),('Monitor',10),('Teclado',20);

INSERT INTO Ventas(Producto,Cantidad) VALUES('Laptop',3);
INSERT INTO Ventas(Producto,Cantidad) VALUES('Monitor',5);

--Aqui va la insercion mult
INSERT INTO Ventas(Producto,Cantidad)
VALUES('Teclado',2),('Laptop',1),('Monitor',1);
GO
SELECT * FROM Ventas;
SELECT * FROM AuditoriaVentas;
SELECT * FROM Inventario;
GO
