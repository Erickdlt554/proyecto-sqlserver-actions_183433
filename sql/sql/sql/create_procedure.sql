USE EmpresaDB;
GO
CREATE TYPE dbo.VentaIDList AS TABLE(VentaID INT);
GO
CREATE PROCEDURE sp_RegistrarAuditoria
 @Ventas dbo.VentaIDList READONLY
AS
BEGIN
 SET NOCOUNT ON;

 -- Auditoría (por conjuntos)
 INSERT INTO AuditoriaVentas(VentaID, Mensaje)
 SELECT VentaID, 'Venta registrada automáticamente'
 FROM @Ventas;

 -- Reto avanzado: descontar inventario
 UPDATE i
 SET i.Existencias = i.Existencias - v.Total
 FROM Inventario i
 JOIN (SELECT vt.Producto, SUM(vt.Cantidad) AS Total
       FROM Ventas vt
       JOIN @Ventas l ON l.VentaID = vt.VentaID
       GROUP BY vt.Producto) v
   ON v.Producto = i.Producto;
END;
GO
