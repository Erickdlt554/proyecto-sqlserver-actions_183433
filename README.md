# 🗄️ Despliegue automatizado de SQL Server con GitHub Actions y Docker

## 🎯 Objetivo
Automatizar el despliegue de una base de datos Microsoft SQL Server usando Docker y GitHub Actions, con tablas, procedimientos almacenados, triggers y manejo seguro de contraseñas mediante Secrets.

## 🧩 Modelo de datos
- **Ventas**: VentaID, Producto, Cantidad, Fecha
- **AuditoriaVentas**: AuditoriaID, VentaID, FechaRegistro, Mensaje
- **Inventario**: Producto, Existencias

## ⚙️ Procedimiento almacenado
`sp_RegistrarAuditoria`: registra la auditoría de las ventas recibidas y descuenta el inventario.

## 🔄 Trigger
`trg_AuditarVenta`: se ejecuta `AFTER INSERT` en `Ventas` y soporta inserciones múltiples usando la tabla lógica `inserted`.

## 🚀 Workflows
| Archivo | Evento | Función |
|---|---|---|
| `deploy.yml` | push a main / manual | Levanta SQL Server en Docker y ejecuta los scripts |
| `reporte.yml` | diario (cron) / manual | Genera `reporte_ventas.csv` y lo publica como Artifact |

## 🔐 Secrets
Configurar `MSSQL_SA_PASSWORD` en *Settings → Secrets and variables → Actions*.

## 🧪 Pruebas
Resultado esperado tras `test_data.sql`: 5 ventas, 5 registros de auditoría y existencias Laptop 6, Monitor 4, Teclado 18.

## 📚 Conclusión
Este proyecto permite comprender CI/CD, contenedores, T-SQL, triggers set-based y gestión segura de credenciales.
