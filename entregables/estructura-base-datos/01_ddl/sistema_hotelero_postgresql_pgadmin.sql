-- PostgreSQL / pgAdmin version converted from the original MySQL script
-- Important: pgAdmin connects to one database at a time.
-- 1) Create the database manually in pgAdmin, or run this separately while connected to postgres:
--    CREATE DATABASE sistema_hotelero;
-- 2) Then connect pgAdmin to sistema_hotelero and run the rest of this file.

BEGIN;

DROP TABLE IF EXISTS modulo_vista CASCADE;
DROP TABLE IF EXISTS rol_permiso CASCADE;
DROP TABLE IF EXISTS usuario_rol CASCADE;
DROP TABLE IF EXISTS dashboard_mantenimiento CASCADE;
DROP TABLE IF EXISTS mantenimiento_remodelacion CASCADE;
DROP TABLE IF EXISTS mantenimiento_uso CASCADE;
DROP TABLE IF EXISTS mantenimiento_habitacion CASCADE;
DROP TABLE IF EXISTS fidelizacion_cliente CASCADE;
DROP TABLE IF EXISTS termino_condicion CASCADE;
DROP TABLE IF EXISTS alerta CASCADE;
DROP TABLE IF EXISTS promocion CASCADE;
DROP TABLE IF EXISTS disponibilidad_inventario CASCADE;
DROP TABLE IF EXISTS seguimiento_producto CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS servicio CASCADE;
DROP TABLE IF EXISTS proveedor CASCADE;
DROP TABLE IF EXISTS detalle_compra CASCADE;
DROP TABLE IF EXISTS pago_parcial CASCADE;
DROP TABLE IF EXISTS factura CASCADE;
DROP TABLE IF EXISTS pre_factura CASCADE;
DROP TABLE IF EXISTS venta_servicio CASCADE;
DROP TABLE IF EXISTS venta_producto CASCADE;
DROP TABLE IF EXISTS check_out CASCADE;
DROP TABLE IF EXISTS check_in CASCADE;
DROP TABLE IF EXISTS estadia CASCADE;
DROP TABLE IF EXISTS catalogo_habitacion CASCADE;
DROP TABLE IF EXISTS disponibilidad_habitacion CASCADE;
DROP TABLE IF EXISTS cancelacion_habitacion CASCADE;
DROP TABLE IF EXISTS reserva_habitacion CASCADE;
DROP TABLE IF EXISTS habitacion CASCADE;
DROP TABLE IF EXISTS estado_habitacion CASCADE;
DROP TABLE IF EXISTS tipo_habitacion CASCADE;
DROP TABLE IF EXISTS sede CASCADE;
DROP TABLE IF EXISTS metodo_pago CASCADE;
DROP TABLE IF EXISTS tipo_dia CASCADE;
DROP TABLE IF EXISTS empleado CASCADE;
DROP TABLE IF EXISTS informacion_legal CASCADE;
DROP TABLE IF EXISTS precio CASCADE;
DROP TABLE IF EXISTS empresa CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS vista CASCADE;
DROP TABLE IF EXISTS modulo CASCADE;
DROP TABLE IF EXISTS permiso CASCADE;
DROP TABLE IF EXISTS rol CASCADE;
DROP TABLE IF EXISTS persona CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE cliente (
  id BIGSERIAL NOT NULL,
  tipo_documento VARCHAR(30) NOT NULL,
  numero_documento VARCHAR(40) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  telefono VARCHAR(40) NULL,
  correo VARCHAR(160) NULL,
  direccion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_cliente_documento UNIQUE (tipo_documento, numero_documento),
  CONSTRAINT uk_cliente_correo UNIQUE (correo)
);

CREATE TABLE persona (
  id BIGSERIAL NOT NULL,
  tipo_documento VARCHAR(30) NOT NULL,
  numero_documento VARCHAR(40) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  telefono VARCHAR(40) NULL,
  correo VARCHAR(160) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_persona_documento UNIQUE (tipo_documento, numero_documento),
  CONSTRAINT uk_persona_correo UNIQUE (correo)
);

CREATE TABLE rol (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_rol_nombre UNIQUE (nombre)
);

CREATE TABLE permiso (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  descripcion VARCHAR(255) NULL,
  accion VARCHAR(80) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_permiso_nombre_accion UNIQUE (nombre, accion)
);

CREATE TABLE modulo (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255) NULL,
  ruta_base VARCHAR(160) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_modulo_nombre UNIQUE (nombre),
  CONSTRAINT uk_modulo_ruta_base UNIQUE (ruta_base)
);

CREATE TABLE vista (
  id BIGSERIAL NOT NULL,
  modulo_id BIGINT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  descripcion VARCHAR(255) NULL,
  ruta VARCHAR(180) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_vista_modulo_ruta UNIQUE (modulo_id, ruta),
  CONSTRAINT fk_vista_modulo FOREIGN KEY (modulo_id) REFERENCES modulo (id)
);

CREATE TABLE usuario (
  id BIGSERIAL NOT NULL,
  persona_id BIGINT NOT NULL,
  username VARCHAR(80) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  ultimo_acceso TIMESTAMP NULL,
  bloqueado BOOLEAN NOT NULL DEFAULT FALSE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_usuario_persona UNIQUE (persona_id),
  CONSTRAINT uk_usuario_username UNIQUE (username),
  CONSTRAINT fk_usuario_persona FOREIGN KEY (persona_id) REFERENCES persona (id)
);

CREATE TABLE empresa (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(160) NOT NULL,
  nit VARCHAR(40) NOT NULL,
  razon_social VARCHAR(180) NOT NULL,
  telefono VARCHAR(40) NULL,
  correo VARCHAR(160) NULL,
  direccion VARCHAR(255) NULL,
  sitio_web VARCHAR(180) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_empresa_nit UNIQUE (nit)
);

CREATE TABLE tipo_dia (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(255) NULL,
  fecha DATE NULL,
  aplica_temporada BOOLEAN NOT NULL DEFAULT FALSE,
  aplica_feriado BOOLEAN NOT NULL DEFAULT FALSE,
  aplica_especial BOOLEAN NOT NULL DEFAULT FALSE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_tipo_dia_nombre_fecha UNIQUE (nombre, fecha)
);

CREATE TABLE metodo_pago (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(255) NULL,
  requiere_referencia BOOLEAN NOT NULL DEFAULT FALSE,
  permite_pago_parcial BOOLEAN NOT NULL DEFAULT TRUE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_metodo_pago_nombre UNIQUE (nombre)
);

CREATE TABLE informacion_legal (
  id BIGSERIAL NOT NULL,
  empresa_id BIGINT NOT NULL,
  tipo_documento_legal VARCHAR(80) NOT NULL,
  numero_documento_legal VARCHAR(80) NOT NULL,
  descripcion TEXT NULL,
  fecha_expedicion DATE NULL,
  fecha_vencimiento DATE NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_informacion_legal_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id)
);

CREATE INDEX ix_informacion_legal_empresa ON informacion_legal (empresa_id);

CREATE TABLE empleado (
  id BIGSERIAL NOT NULL,
  persona_id BIGINT NOT NULL,
  cargo VARCHAR(100) NOT NULL,
  fecha_ingreso DATE NOT NULL,
  telefono_laboral VARCHAR(40) NULL,
  correo_laboral VARCHAR(160) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_empleado_persona UNIQUE (persona_id),
  CONSTRAINT uk_empleado_correo_laboral UNIQUE (correo_laboral),
  CONSTRAINT fk_empleado_persona FOREIGN KEY (persona_id) REFERENCES persona (id)
);

CREATE TABLE sede (
  id BIGSERIAL NOT NULL,
  empresa_id BIGINT NOT NULL,
  nombre VARCHAR(160) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  ciudad VARCHAR(120) NOT NULL,
  telefono VARCHAR(40) NULL,
  correo VARCHAR(160) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_sede_empresa_nombre UNIQUE (empresa_id, nombre),
  CONSTRAINT fk_sede_empresa FOREIGN KEY (empresa_id) REFERENCES empresa (id)
);

CREATE TABLE tipo_habitacion (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(255) NULL,
  capacidad_base SMALLINT NOT NULL,
  capacidad_maxima SMALLINT NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_tipo_habitacion_nombre UNIQUE (nombre),
  CONSTRAINT ck_tipo_habitacion_capacidad CHECK (capacidad_maxima >= capacidad_base)
);

CREATE TABLE estado_habitacion (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(255) NULL,
  permite_reserva BOOLEAN NOT NULL DEFAULT FALSE,
  permite_check_in BOOLEAN NOT NULL DEFAULT FALSE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_estado_habitacion_nombre UNIQUE (nombre)
);

CREATE TABLE habitacion (
  id BIGSERIAL NOT NULL,
  sede_id BIGINT NOT NULL,
  tipo_habitacion_id BIGINT NOT NULL,
  estado_habitacion_id BIGINT NOT NULL,
  numero VARCHAR(20) NOT NULL,
  piso SMALLINT NULL,
  capacidad SMALLINT NOT NULL,
  descripcion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_habitacion_sede_numero UNIQUE (sede_id, numero),
  CONSTRAINT fk_habitacion_sede FOREIGN KEY (sede_id) REFERENCES sede (id),
  CONSTRAINT fk_habitacion_tipo FOREIGN KEY (tipo_habitacion_id) REFERENCES tipo_habitacion (id),
  CONSTRAINT fk_habitacion_estado FOREIGN KEY (estado_habitacion_id) REFERENCES estado_habitacion (id)
);

CREATE INDEX ix_habitacion_tipo ON habitacion (tipo_habitacion_id);
CREATE INDEX ix_habitacion_estado ON habitacion (estado_habitacion_id);

CREATE TABLE precio (
  id BIGSERIAL NOT NULL,
  tipo_habitacion_id BIGINT NOT NULL,
  tipo_dia_id BIGINT NOT NULL,
  valor DECIMAL(12,2) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NULL,
  condicion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_precio_tipo_dia_inicio UNIQUE (tipo_habitacion_id, tipo_dia_id, fecha_inicio),
  CONSTRAINT fk_precio_tipo_habitacion FOREIGN KEY (tipo_habitacion_id) REFERENCES tipo_habitacion (id),
  CONSTRAINT fk_precio_tipo_dia FOREIGN KEY (tipo_dia_id) REFERENCES tipo_dia (id),
  CONSTRAINT ck_precio_valor CHECK (valor >= 0)
);

CREATE INDEX ix_precio_tipo_habitacion ON precio (tipo_habitacion_id);
CREATE INDEX ix_precio_tipo_dia ON precio (tipo_dia_id);

CREATE TABLE reserva_habitacion (
  id BIGSERIAL NOT NULL,
  cliente_id BIGINT NOT NULL,
  habitacion_id BIGINT NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NOT NULL,
  cantidad_persona SMALLINT NOT NULL,
  estado_reserva VARCHAR(40) NOT NULL DEFAULT 'PENDIENTE',
  valor_estimado DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_reserva_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT fk_reserva_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion (id),
  CONSTRAINT ck_reserva_fechas CHECK (fecha_fin > fecha_inicio)
);

CREATE INDEX ix_reserva_cliente ON reserva_habitacion (cliente_id);
CREATE INDEX ix_reserva_habitacion_fecha ON reserva_habitacion (habitacion_id, fecha_inicio, fecha_fin);

CREATE TABLE cancelacion_habitacion (
  id BIGSERIAL NOT NULL,
  reserva_habitacion_id BIGINT NOT NULL,
  motivo VARCHAR(255) NOT NULL,
  fecha_cancelacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  aplica_penalidad BOOLEAN NOT NULL DEFAULT FALSE,
  valor_penalidad DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_cancelacion_reserva UNIQUE (reserva_habitacion_id),
  CONSTRAINT fk_cancelacion_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id),
  CONSTRAINT ck_cancelacion_penalidad CHECK (valor_penalidad >= 0)
);

CREATE TABLE disponibilidad_habitacion (
  id BIGSERIAL NOT NULL,
  habitacion_id BIGINT NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  motivo_no_disponible VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_disponibilidad_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion (id),
  CONSTRAINT ck_disponibilidad_fechas CHECK (fecha_fin > fecha_inicio)
);

CREATE INDEX ix_disponibilidad_habitacion_fecha ON disponibilidad_habitacion (habitacion_id, fecha_inicio, fecha_fin);

CREATE TABLE catalogo_habitacion (
  id BIGSERIAL NOT NULL,
  habitacion_id BIGINT NOT NULL,
  titulo VARCHAR(160) NOT NULL,
  descripcion TEXT NULL,
  precio_base DECIMAL(12,2) NOT NULL DEFAULT 0,
  visible BOOLEAN NOT NULL DEFAULT TRUE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_catalogo_habitacion UNIQUE (habitacion_id),
  CONSTRAINT fk_catalogo_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion (id),
  CONSTRAINT ck_catalogo_precio CHECK (precio_base >= 0)
);

CREATE TABLE estadia (
  id BIGSERIAL NOT NULL,
  reserva_habitacion_id BIGINT NOT NULL,
  cliente_id BIGINT NOT NULL,
  habitacion_id BIGINT NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NULL,
  estado_estadia VARCHAR(40) NOT NULL DEFAULT 'ACTIVA',
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_estadia_reserva UNIQUE (reserva_habitacion_id),
  CONSTRAINT fk_estadia_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id),
  CONSTRAINT fk_estadia_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT fk_estadia_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion (id)
);

CREATE INDEX ix_estadia_cliente ON estadia (cliente_id);
CREATE INDEX ix_estadia_habitacion ON estadia (habitacion_id);

CREATE TABLE check_in (
  id BIGSERIAL NOT NULL,
  reserva_habitacion_id BIGINT NOT NULL,
  empleado_id BIGINT NOT NULL,
  fecha_hora_ingreso TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  observacion TEXT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_check_in_reserva UNIQUE (reserva_habitacion_id),
  CONSTRAINT fk_check_in_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id),
  CONSTRAINT fk_check_in_empleado FOREIGN KEY (empleado_id) REFERENCES empleado (id)
);

CREATE INDEX ix_check_in_empleado ON check_in (empleado_id);

CREATE TABLE check_out (
  id BIGSERIAL NOT NULL,
  estadia_id BIGINT NOT NULL,
  empleado_id BIGINT NOT NULL,
  fecha_hora_salida TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  observacion TEXT NULL,
  valor_total DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_check_out_estadia UNIQUE (estadia_id),
  CONSTRAINT fk_check_out_estadia FOREIGN KEY (estadia_id) REFERENCES estadia (id),
  CONSTRAINT fk_check_out_empleado FOREIGN KEY (empleado_id) REFERENCES empleado (id),
  CONSTRAINT ck_check_out_valor CHECK (valor_total >= 0)
);

CREATE INDEX ix_check_out_empleado ON check_out (empleado_id);

CREATE TABLE proveedor (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(160) NOT NULL,
  nit VARCHAR(40) NULL,
  telefono VARCHAR(40) NULL,
  correo VARCHAR(160) NULL,
  direccion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_proveedor_nit UNIQUE (nit)
);

CREATE TABLE producto (
  id BIGSERIAL NOT NULL,
  proveedor_id BIGINT NULL,
  nombre VARCHAR(160) NOT NULL,
  descripcion VARCHAR(255) NULL,
  valor_venta DECIMAL(12,2) NOT NULL DEFAULT 0,
  stock_actual INTEGER NOT NULL DEFAULT 0,
  stock_minimo INTEGER NOT NULL DEFAULT 0,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_producto_nombre UNIQUE (nombre),
  CONSTRAINT fk_producto_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor (id),
  CONSTRAINT ck_producto_valores CHECK (valor_venta >= 0 AND stock_actual >= 0 AND stock_minimo >= 0)
);

CREATE INDEX ix_producto_proveedor ON producto (proveedor_id);

CREATE TABLE servicio (
  id BIGSERIAL NOT NULL,
  nombre VARCHAR(160) NOT NULL,
  descripcion VARCHAR(255) NULL,
  valor_venta DECIMAL(12,2) NOT NULL DEFAULT 0,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_servicio_nombre UNIQUE (nombre),
  CONSTRAINT ck_servicio_valor CHECK (valor_venta >= 0)
);

CREATE TABLE venta_producto (
  id BIGSERIAL NOT NULL,
  estadia_id BIGINT NOT NULL,
  producto_id BIGINT NOT NULL,
  cantidad INTEGER NOT NULL,
  valor_unitario DECIMAL(12,2) NOT NULL,
  valor_total DECIMAL(12,2) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_venta_producto_estadia FOREIGN KEY (estadia_id) REFERENCES estadia (id),
  CONSTRAINT fk_venta_producto_producto FOREIGN KEY (producto_id) REFERENCES producto (id),
  CONSTRAINT ck_venta_producto_valores CHECK (cantidad > 0 AND valor_unitario >= 0 AND valor_total >= 0)
);

CREATE INDEX ix_venta_producto_estadia ON venta_producto (estadia_id);
CREATE INDEX ix_venta_producto_producto ON venta_producto (producto_id);

CREATE TABLE venta_servicio (
  id BIGSERIAL NOT NULL,
  estadia_id BIGINT NOT NULL,
  servicio_id BIGINT NOT NULL,
  cantidad INTEGER NOT NULL,
  valor_unitario DECIMAL(12,2) NOT NULL,
  valor_total DECIMAL(12,2) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_venta_servicio_estadia FOREIGN KEY (estadia_id) REFERENCES estadia (id),
  CONSTRAINT fk_venta_servicio_servicio FOREIGN KEY (servicio_id) REFERENCES servicio (id),
  CONSTRAINT ck_venta_servicio_valores CHECK (cantidad > 0 AND valor_unitario >= 0 AND valor_total >= 0)
);

CREATE INDEX ix_venta_servicio_estadia ON venta_servicio (estadia_id);
CREATE INDEX ix_venta_servicio_servicio ON venta_servicio (servicio_id);

CREATE TABLE pre_factura (
  id BIGSERIAL NOT NULL,
  estadia_id BIGINT NOT NULL,
  reserva_habitacion_id BIGINT NOT NULL,
  cliente_id BIGINT NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  impuesto DECIMAL(12,2) NOT NULL DEFAULT 0,
  descuento DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_pre_factura_estadia UNIQUE (estadia_id),
  CONSTRAINT fk_pre_factura_estadia FOREIGN KEY (estadia_id) REFERENCES estadia (id),
  CONSTRAINT fk_pre_factura_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id),
  CONSTRAINT fk_pre_factura_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT ck_pre_factura_valores CHECK (subtotal >= 0 AND impuesto >= 0 AND descuento >= 0 AND total >= 0)
);

CREATE INDEX ix_pre_factura_reserva ON pre_factura (reserva_habitacion_id);
CREATE INDEX ix_pre_factura_cliente ON pre_factura (cliente_id);

CREATE TABLE factura (
  id BIGSERIAL NOT NULL,
  cliente_id BIGINT NOT NULL,
  estadia_id BIGINT NOT NULL,
  numero_factura VARCHAR(60) NOT NULL,
  fecha_emision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  impuesto DECIMAL(12,2) NOT NULL DEFAULT 0,
  descuento DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  estado_factura VARCHAR(40) NOT NULL DEFAULT 'EMITIDA',
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_factura_numero UNIQUE (numero_factura),
  CONSTRAINT uk_factura_estadia UNIQUE (estadia_id),
  CONSTRAINT fk_factura_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT fk_factura_estadia FOREIGN KEY (estadia_id) REFERENCES estadia (id),
  CONSTRAINT ck_factura_valores CHECK (subtotal >= 0 AND impuesto >= 0 AND descuento >= 0 AND total >= 0)
);

CREATE INDEX ix_factura_cliente ON factura (cliente_id);

CREATE TABLE pago_parcial (
  id BIGSERIAL NOT NULL,
  reserva_habitacion_id BIGINT NULL,
  factura_id BIGINT NULL,
  metodo_pago_id BIGINT NOT NULL,
  valor DECIMAL(12,2) NOT NULL,
  fecha_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  referencia_pago VARCHAR(120) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_pago_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id),
  CONSTRAINT fk_pago_factura FOREIGN KEY (factura_id) REFERENCES factura (id),
  CONSTRAINT fk_pago_metodo FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago (id),
  CONSTRAINT ck_pago_valor CHECK (valor > 0),
  CONSTRAINT ck_pago_origen CHECK (reserva_habitacion_id IS NOT NULL OR factura_id IS NOT NULL)
);

CREATE INDEX ix_pago_reserva ON pago_parcial (reserva_habitacion_id);
CREATE INDEX ix_pago_factura ON pago_parcial (factura_id);
CREATE INDEX ix_pago_metodo ON pago_parcial (metodo_pago_id);

CREATE TABLE detalle_compra (
  id BIGSERIAL NOT NULL,
  factura_id BIGINT NOT NULL,
  producto_id BIGINT NULL,
  servicio_id BIGINT NULL,
  descripcion VARCHAR(255) NOT NULL,
  cantidad INTEGER NOT NULL,
  valor_unitario DECIMAL(12,2) NOT NULL,
  valor_total DECIMAL(12,2) NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_detalle_factura FOREIGN KEY (factura_id) REFERENCES factura (id),
  CONSTRAINT fk_detalle_producto FOREIGN KEY (producto_id) REFERENCES producto (id),
  CONSTRAINT fk_detalle_servicio FOREIGN KEY (servicio_id) REFERENCES servicio (id),
  CONSTRAINT ck_detalle_valores CHECK (cantidad > 0 AND valor_unitario >= 0 AND valor_total >= 0),
  CONSTRAINT ck_detalle_item CHECK (producto_id IS NOT NULL OR servicio_id IS NOT NULL)
);

CREATE INDEX ix_detalle_factura ON detalle_compra (factura_id);
CREATE INDEX ix_detalle_producto ON detalle_compra (producto_id);
CREATE INDEX ix_detalle_servicio ON detalle_compra (servicio_id);

CREATE TABLE seguimiento_producto (
  id BIGSERIAL NOT NULL,
  producto_id BIGINT NOT NULL,
  tipo_movimiento VARCHAR(40) NOT NULL,
  cantidad INTEGER NOT NULL,
  fecha_movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  observacion TEXT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_seguimiento_producto FOREIGN KEY (producto_id) REFERENCES producto (id),
  CONSTRAINT ck_seguimiento_cantidad CHECK (cantidad > 0)
);

CREATE INDEX ix_seguimiento_producto ON seguimiento_producto (producto_id, fecha_movimiento);

CREATE TABLE disponibilidad_inventario (
  id BIGSERIAL NOT NULL,
  producto_id BIGINT NULL,
  servicio_id BIGINT NULL,
  cantidad_disponible INTEGER NOT NULL DEFAULT 0,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  observacion VARCHAR(255) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_disponibilidad_inv_producto FOREIGN KEY (producto_id) REFERENCES producto (id),
  CONSTRAINT fk_disponibilidad_inv_servicio FOREIGN KEY (servicio_id) REFERENCES servicio (id),
  CONSTRAINT ck_disponibilidad_inv_item CHECK (producto_id IS NOT NULL OR servicio_id IS NOT NULL),
  CONSTRAINT ck_disponibilidad_inv_cantidad CHECK (cantidad_disponible >= 0)
);

CREATE INDEX ix_disponibilidad_inv_producto ON disponibilidad_inventario (producto_id);
CREATE INDEX ix_disponibilidad_inv_servicio ON disponibilidad_inventario (servicio_id);

CREATE TABLE promocion (
  id BIGSERIAL NOT NULL,
  titulo VARCHAR(160) NOT NULL,
  descripcion TEXT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NULL,
  canal VARCHAR(60) NOT NULL,
  activa BOOLEAN NOT NULL DEFAULT TRUE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id)
);

CREATE INDEX ix_promocion_fecha ON promocion (fecha_inicio, fecha_fin);

CREATE TABLE alerta (
  id BIGSERIAL NOT NULL,
  cliente_id BIGINT NULL,
  reserva_habitacion_id BIGINT NULL,
  titulo VARCHAR(160) NOT NULL,
  mensaje TEXT NOT NULL,
  canal VARCHAR(60) NOT NULL,
  fecha_envio TIMESTAMP NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_alerta_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT fk_alerta_reserva FOREIGN KEY (reserva_habitacion_id) REFERENCES reserva_habitacion (id)
);

CREATE INDEX ix_alerta_cliente ON alerta (cliente_id);
CREATE INDEX ix_alerta_reserva ON alerta (reserva_habitacion_id);

CREATE TABLE termino_condicion (
  id BIGSERIAL NOT NULL,
  titulo VARCHAR(160) NOT NULL,
  contenido TEXT NOT NULL,
  version VARCHAR(40) NOT NULL,
  fecha_vigencia DATE NOT NULL,
  obligatorio BOOLEAN NOT NULL DEFAULT TRUE,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_termino_version UNIQUE (version)
);

CREATE TABLE fidelizacion_cliente (
  id BIGSERIAL NOT NULL,
  cliente_id BIGINT NOT NULL,
  nivel VARCHAR(60) NOT NULL DEFAULT 'BASICO',
  puntos INTEGER NOT NULL DEFAULT 0,
  fecha_ultima_interaccion TIMESTAMP NULL,
  observacion TEXT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_fidelizacion_cliente UNIQUE (cliente_id),
  CONSTRAINT fk_fidelizacion_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
);

CREATE TABLE mantenimiento_habitacion (
  id BIGSERIAL NOT NULL,
  habitacion_id BIGINT NOT NULL,
  empleado_id BIGINT NULL,
  tipo_mantenimiento VARCHAR(60) NOT NULL,
  fecha_inicio TIMESTAMP NOT NULL,
  fecha_fin TIMESTAMP NULL,
  estado_mantenimiento VARCHAR(40) NOT NULL DEFAULT 'PENDIENTE',
  observacion TEXT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_mantenimiento_habitacion FOREIGN KEY (habitacion_id) REFERENCES habitacion (id),
  CONSTRAINT fk_mantenimiento_empleado FOREIGN KEY (empleado_id) REFERENCES empleado (id)
);

CREATE INDEX ix_mantenimiento_habitacion ON mantenimiento_habitacion (habitacion_id, fecha_inicio, fecha_fin);
CREATE INDEX ix_mantenimiento_empleado ON mantenimiento_habitacion (empleado_id);

CREATE TABLE mantenimiento_uso (
  id BIGSERIAL NOT NULL,
  mantenimiento_habitacion_id BIGINT NOT NULL,
  motivo_uso VARCHAR(160) NOT NULL,
  detalle_actividad TEXT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_mantenimiento_uso UNIQUE (mantenimiento_habitacion_id),
  CONSTRAINT fk_mantenimiento_uso_base FOREIGN KEY (mantenimiento_habitacion_id) REFERENCES mantenimiento_habitacion (id)
);

CREATE TABLE mantenimiento_remodelacion (
  id BIGSERIAL NOT NULL,
  mantenimiento_habitacion_id BIGINT NOT NULL,
  descripcion_remodelacion TEXT NOT NULL,
  presupuesto_estimado DECIMAL(12,2) NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_mantenimiento_remodelacion UNIQUE (mantenimiento_habitacion_id),
  CONSTRAINT fk_mantenimiento_remodelacion_base FOREIGN KEY (mantenimiento_habitacion_id) REFERENCES mantenimiento_habitacion (id),
  CONSTRAINT ck_mantenimiento_presupuesto CHECK (presupuesto_estimado IS NULL OR presupuesto_estimado >= 0)
);

CREATE TABLE dashboard_mantenimiento (
  id BIGSERIAL NOT NULL,
  sede_id BIGINT NOT NULL,
  total_habitacion INTEGER NOT NULL DEFAULT 0,
  habitacion_disponible INTEGER NOT NULL DEFAULT 0,
  habitacion_ocupada INTEGER NOT NULL DEFAULT 0,
  habitacion_mantenimiento INTEGER NOT NULL DEFAULT 0,
  fecha_corte TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT fk_dashboard_mantenimiento_sede FOREIGN KEY (sede_id) REFERENCES sede (id)
);

CREATE INDEX ix_dashboard_mantenimiento_sede_fecha ON dashboard_mantenimiento (sede_id, fecha_corte);

CREATE TABLE usuario_rol (
  id BIGSERIAL NOT NULL,
  usuario_id BIGINT NOT NULL,
  rol_id BIGINT NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_usuario_rol UNIQUE (usuario_id, rol_id),
  CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id),
  CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (rol_id) REFERENCES rol (id)
);

CREATE TABLE rol_permiso (
  id BIGSERIAL NOT NULL,
  rol_id BIGINT NOT NULL,
  permiso_id BIGINT NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_rol_permiso UNIQUE (rol_id, permiso_id),
  CONSTRAINT fk_rol_permiso_rol FOREIGN KEY (rol_id) REFERENCES rol (id),
  CONSTRAINT fk_rol_permiso_permiso FOREIGN KEY (permiso_id) REFERENCES permiso (id)
);

CREATE TABLE modulo_vista (
  id BIGSERIAL NOT NULL,
  modulo_id BIGINT NOT NULL,
  vista_id BIGINT NOT NULL,
  created_by BIGINT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_by BIGINT NULL,
  updated_at TIMESTAMP NULL,
  deleted_by BIGINT NULL,
  deleted_at TIMESTAMP NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (id),
  CONSTRAINT uk_modulo_vista UNIQUE (modulo_id, vista_id),
  CONSTRAINT fk_modulo_vista_modulo FOREIGN KEY (modulo_id) REFERENCES modulo (id),
  CONSTRAINT fk_modulo_vista_vista FOREIGN KEY (vista_id) REFERENCES vista (id)
);

CREATE TRIGGER trg_cliente_updated_at
BEFORE UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_persona_updated_at
BEFORE UPDATE ON persona
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_rol_updated_at
BEFORE UPDATE ON rol
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_permiso_updated_at
BEFORE UPDATE ON permiso
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_modulo_updated_at
BEFORE UPDATE ON modulo
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_vista_updated_at
BEFORE UPDATE ON vista
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_usuario_updated_at
BEFORE UPDATE ON usuario
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_empresa_updated_at
BEFORE UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_tipo_dia_updated_at
BEFORE UPDATE ON tipo_dia
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_metodo_pago_updated_at
BEFORE UPDATE ON metodo_pago
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_informacion_legal_updated_at
BEFORE UPDATE ON informacion_legal
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_empleado_updated_at
BEFORE UPDATE ON empleado
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_sede_updated_at
BEFORE UPDATE ON sede
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_tipo_habitacion_updated_at
BEFORE UPDATE ON tipo_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_estado_habitacion_updated_at
BEFORE UPDATE ON estado_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_habitacion_updated_at
BEFORE UPDATE ON habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_precio_updated_at
BEFORE UPDATE ON precio
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_reserva_habitacion_updated_at
BEFORE UPDATE ON reserva_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_cancelacion_habitacion_updated_at
BEFORE UPDATE ON cancelacion_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_disponibilidad_habitacion_updated_at
BEFORE UPDATE ON disponibilidad_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_catalogo_habitacion_updated_at
BEFORE UPDATE ON catalogo_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_estadia_updated_at
BEFORE UPDATE ON estadia
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_check_in_updated_at
BEFORE UPDATE ON check_in
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_check_out_updated_at
BEFORE UPDATE ON check_out
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_proveedor_updated_at
BEFORE UPDATE ON proveedor
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_producto_updated_at
BEFORE UPDATE ON producto
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_servicio_updated_at
BEFORE UPDATE ON servicio
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_venta_producto_updated_at
BEFORE UPDATE ON venta_producto
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_venta_servicio_updated_at
BEFORE UPDATE ON venta_servicio
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_pre_factura_updated_at
BEFORE UPDATE ON pre_factura
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_factura_updated_at
BEFORE UPDATE ON factura
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_pago_parcial_updated_at
BEFORE UPDATE ON pago_parcial
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_detalle_compra_updated_at
BEFORE UPDATE ON detalle_compra
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_seguimiento_producto_updated_at
BEFORE UPDATE ON seguimiento_producto
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_disponibilidad_inventario_updated_at
BEFORE UPDATE ON disponibilidad_inventario
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_promocion_updated_at
BEFORE UPDATE ON promocion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_alerta_updated_at
BEFORE UPDATE ON alerta
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_termino_condicion_updated_at
BEFORE UPDATE ON termino_condicion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_fidelizacion_cliente_updated_at
BEFORE UPDATE ON fidelizacion_cliente
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_mantenimiento_habitacion_updated_at
BEFORE UPDATE ON mantenimiento_habitacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_mantenimiento_uso_updated_at
BEFORE UPDATE ON mantenimiento_uso
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_mantenimiento_remodelacion_updated_at
BEFORE UPDATE ON mantenimiento_remodelacion
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_dashboard_mantenimiento_updated_at
BEFORE UPDATE ON dashboard_mantenimiento
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_usuario_rol_updated_at
BEFORE UPDATE ON usuario_rol
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_rol_permiso_updated_at
BEFORE UPDATE ON rol_permiso
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_modulo_vista_updated_at
BEFORE UPDATE ON modulo_vista
FOR EACH ROW
EXECUTE FUNCTION set_updated_at();

COMMIT;