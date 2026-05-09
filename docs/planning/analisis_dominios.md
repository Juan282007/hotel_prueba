# Analisis de dominios - Sistema hotelero

## Objetivo

Definir los dominios funcionales que organizan la base de datos del sistema hotelero en PostgreSQL. Este analisis sirve como referencia para mantener consistencia entre schemas, tablas, DML, DCL, HU, changelogs y documentacion.

La entrega conserva 8 dominios oficiales. No se crea un dominio tecnico adicional ni se separa configuration en varios dominios.

## Criterios usados para definir dominios

| Criterio | Aplicacion en la entrega |
|----------|--------------------------|
| Responsabilidad funcional | Cada dominio agrupa entidades que cumplen una funcion clara dentro de la operacion hotelera. |
| Cohesion de datos | Las tablas de un dominio comparten reglas de negocio y relaciones cercanas. |
| Trazabilidad con HU | Las historias HU-09 a HU-18 se organizan alrededor de estos dominios, en parejas para evitar historias con tres dominios mezclados. |
| Separacion tecnica | DDL, DML, DCL, TCL y rollbacks respetan la misma division. |
| Evitar dominios artificiales | No se crea `common`, `configuration_core`, `configuration_precio` ni `01_ddl/10_configuration`. |

## Dominios oficiales

| # | Dominio | Schema PostgreSQL | Carpeta DDL | Proposito |
|---|---------|-------------------|-------------|-----------|
| 1 | Configuration | `configuration` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/configuration/` | Centraliza datos maestros: clientes, personas, empresa, empleados, metodos de pago, tipos de dia y precios. |
| 2 | Security | `security` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/security/` | Gestiona usuarios, roles, permisos, modulos, vistas y relaciones de acceso. |
| 3 | Distribution | `distribution` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/distribution/` | Organiza sedes, habitaciones, tipos, estados, catalogo y disponibilidad. |
| 4 | Service delivery | `service_delivery` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/service_delivery/` | Controla reservas, cancelaciones, estadias, check in y check out. |
| 5 | Inventory | `inventory` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/inventory/` | Administra proveedores, productos, servicios, ventas, seguimiento y disponibilidad de inventory. |
| 6 | Billing | `billing` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/billing/` | Maneja pre factura, factura, pagos parciales y detalle de compra. |
| 7 | Notification | `notification` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/notification/` | Agrupa promociones, alertas, terminos, condiciones y fidelizacion. |
| 8 | Maintenance | `maintenance` | `entregables/estructura-base-datos/db-structure 1/01_ddl/03_tables/maintenance/` | Registra maintenance de habitacion, uso, remodelacion y dashboard operativo. |

## Tablas relacionadas por dominio

Esta seccion conecta cada dominio con sus tablas reales en DDL. En total, el modelo tiene 46 tablas distribuidas en los 8 schemas oficiales.

### Configuration

| Tabla | Relacion funcional |
|-------|--------------------|
| `customer` | Registra clientes del hotel y datos de contacto para reservas, billing y notification. |
| `person` | Centraliza informacion personal usada por empleados, usuarios y procesos internos. |
| `company` | Define la empresa hotelera que agrupa sedes y configuracion legal. |
| `day_type` | Clasifica dias normales, fines de semana, feriados o temporadas para reglas de precio. |
| `payment_method` | Define medios de pago usados en pagos parciales y billing. |
| `legal_information` | Conserva informacion legal asociada a la empresa. |
| `employee` | Registra empleados que participan en recepcion, inventory, maintenance y operacion. |
| `price` | Define valores por tipo de habitacion y tipo de dia para calcular reservas. |

### Security

| Tabla | Relacion funcional |
|-------|--------------------|
| `role` | Define perfiles de acceso como administrator, developer o QA. |
| `permission` | Registra acciones permitidas dentro del sistema. |
| `module` | Agrupa funcionalidades principales del sistema hotelero. |
| `screen` | Representa pantallas o vistas asociadas a modulos. |
| `app_user` | Registra usuarios de autenticacion, incluido `ariel5253`. |
| `app_user_role` | Relaciona usuarios con roles. |
| `role_permission` | Relaciona roles con permisos. |
| `module_screen` | Relaciona modulos con vistas para control de acceso. |

### Distribution

| Tabla | Relacion funcional |
|-------|--------------------|
| `branch` | Registra sedes o ubicaciones del hotel. |
| `room_type` | Define categorias de habitacion como sencilla, doble o suite. |
| `room_status` | Define estados operativos de habitaciones. |
| `room` | Registra habitaciones fisicas por sede, tipo y estado. |
| `room_availability` | Controla disponibilidad por habitacion y rango de fechas. |
| `room_catalog` | Relaciona habitaciones con precios y datos comerciales del catalogo. |

### Service delivery

| Tabla | Relacion funcional |
|-------|--------------------|
| `room_reservation` | Registra reservas de clientes sobre habitaciones y fechas. |
| `room_cancellation` | Registra cancelaciones y motivos asociados a una reserva. |
| `stay` | Controla la estadia activa o finalizada del cliente. |
| `check_in` | Registra ingreso del cliente y cambio operativo inicial. |
| `check_out` | Registra salida del cliente y cierre de la estadia. |

### Inventory

| Tabla | Relacion funcional |
|-------|--------------------|
| `supplier` | Registra proveedores de productos y servicios. |
| `product` | Define productos disponibles para venta o consumo. |
| `service` | Define servicios adicionales ofrecidos al cliente. |
| `product_sale` | Registra venta o consumo de productos durante una estadia. |
| `service_sale` | Registra venta o consumo de servicios durante una estadia. |
| `product_tracking` | Lleva trazabilidad de movimientos de inventory. |
| `inventory_availability` | Controla disponibilidad actual de productos o servicios. |

### Billing

| Tabla | Relacion funcional |
|-------|--------------------|
| `pre_invoice` | Calcula valores previos a la factura final de una estadia. |
| `invoice` | Registra la factura emitida y su estado. |
| `partial_payment` | Registra abonos o pagos parciales asociados a reservas. |
| `purchase_detail` | Detalla productos y servicios cobrados en la factura. |

### Notification

| Tabla | Relacion funcional |
|-------|--------------------|
| `promotion` | Registra promociones asociadas a la operacion comercial. |
| `alert` | Registra alertas operativas relacionadas con clientes o reservas. |
| `terms_condition` | Versiona terminos y condiciones aplicables. |
| `customer_loyalty` | Registra informacion de fidelizacion y relacion con clientes. |

### Maintenance

| Tabla | Relacion funcional |
|-------|--------------------|
| `room_maintenance` | Registra maintenances asociados a habitaciones. |
| `maintenance_usage` | Controla uso o afectacion operativa durante maintenance. |
| `maintenance_remodeling` | Registra remodelaciones o intervenciones mayores. |
| `maintenance_dashboard` | Consolida informacion para seguimiento operativo de maintenance. |

## Relacion entre dominios

| Relacion | Descripcion |
|----------|-------------|
| Configuration -> Distribution | La empresa y los datos maestros soportan la creacion de sedes, habitaciones y catalogos. |
| Configuration -> Service delivery | Clientes y precios se usan para reservas y calculos de valor estimado. |
| Distribution -> Service delivery | Las reservas dependen de habitaciones disponibles y sus estados operativos. |
| Service delivery -> Billing | Las estadias y reservas alimentan pre facturas, pagos y facturas. |
| Inventory -> Billing | Productos y servicios consumidos durante la estadia generan detalles de compra. |
| Service delivery -> Notification | Reservas y clientes permiten generar alertas o comunicaciones operativas. |
| Distribution -> Maintenance | Las habitaciones pueden bloquearse o marcarse por maintenance. |
| Security -> Todos los dominios | Usuarios, roles y permisos controlan acceso a modulos y vistas del sistema. |

## Alcance por HU

| HU | Dominios relacionados | Entregable |
|----|-----------------------|------------|
| HU-09 | Configuration y security | Primer grupo de tablas de dominio. |
| HU-10 | Distribution y prestacion de servicios | Segundo grupo de tablas de dominio. |
| HU-11 | Inventory y billing | Tercer grupo de tablas de dominio. |
| HU-12 | Notification y maintenance | Cuarto grupo de tablas de dominio. |
| HU-15 | Configuration y security | Inserts de datos base para esos dominios. |
| HU-16 | Distribution y prestacion de servicios | Inserts de habitaciones, reservas y estadias. |
| HU-17 | Inventory y billing | Inserts de inventory, ventas, prefacturas, facturas y pagos. |
| HU-18 | Notification y maintenance | Inserts de promociones, alertas, fidelizacion y maintenance. |

## Decisiones de separacion

### Configuration

Configuration se mantiene como un solo dominio porque agrupa datos maestros transversales. Separarlo en `configuration_core` y `configuration_precio` agregaria un noveno dominio innecesario y romperia la consistencia de HU, DML y documentacion.

### Notification y maintenance

Notification y maintenance se mantienen separados porque responden a responsabilidades distintas:

- Notification comunica eventos, promociones, alertas, terminos y fidelizacion.
- Maintenance controla estados operativos de habitaciones, remodelaciones, uso y tablero operativo.

### Configuracion tecnica

No se crea `01_ddl/10_configuration` ni schema `common`. Los tipos y elementos compartidos se ubican dentro de los dominios oficiales, principalmente en `configuration` cuando aplican a datos maestros.

## Reglas de consistencia

- Los schemas oficiales deben ser exactamente 8.
- Cada dominio debe tener archivo DDL e insert DML separado.
- Las HU y el tablero no deben mencionar 9 dominios.
- Los changelogs deben seguir la misma estructura por DDL, DML, DCL y TCL.
- Los rollbacks deben conservar estructura espejo.
- Cualquier cambio de dominio debe actualizar documentacion, HU, changelog y smoke test.

## Validaciones sugeridas

```sql
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN (
  'configuration',
  'distribution',
  'service_delivery',
  'billing',
  'inventory',
  'notification',
  'security',
  'maintenance'
)
ORDER BY schema_name;
```

```sql
SELECT COUNT(*) AS schemas_oficiales
FROM information_schema.schemata
WHERE schema_name IN (
  'configuration',
  'distribution',
  'service_delivery',
  'billing',
  'inventory',
  'notification',
  'security',
  'maintenance'
);
```

El resultado esperado para `schemas_oficiales` es `8`.

