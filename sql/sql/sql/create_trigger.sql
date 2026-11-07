USE EmpresaDB;
GO
CREATE TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
 SET NOCOUNT ON;
 DECLARE @lista dbo.VentaIDList;
 INSERT INTO @lista(VentaID) SELECT VentaID FROM inserted;
 EXEC sp_RegistrarAuditoria @lista;
END;
GO
