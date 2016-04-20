--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-13 09:12:31 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 3077 (class 1262 OID 26793)
-- Dependencies: 3076
-- Name: sgsti; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE sgsti IS 'Base de Datos del Sistema de Gestión de Seguridad en Tecnologías de Informaciín (SGSTI)';


--
-- TOC entry 322 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 322
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 323 (class 3079 OID 27079)
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 323
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


SET search_path = public, pg_catalog;

--
-- TOC entry 377 (class 1255 OID 28581)
-- Name: actualizar_menu(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION actualizar_menu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
  BEGIN

   IF NEW.in_ver = true then
	   update j810t_rol_producto j810t set in_ver = true
		from  j808t_producto j808t
		 where j810t.co_producto = j808t.co_producto and 
		       j808t.co_producto in (select co_padre from j808t_producto where co_producto = NEW.co_producto)
		       and j810t.in_ver = true;
   end if;
      
   RETURN NEW;
  END;
$$;


ALTER FUNCTION public.actualizar_menu() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 27500)
-- Name: c001t_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c001t_forense (
    co_forense bigint NOT NULL,
    fe_apertura date,
    fe_cierre date,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying NOT NULL,
    tx_descripcion_solicitud text,
    tx_caso_aaii character varying,
    co_alcance_forense bigint NOT NULL,
    tx_metologia_herramientas text,
    tx_observaciones text,
    co_transaccion bigint,
    co_clasificacion bigint NOT NULL,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_estado_forense bigint NOT NULL
);


ALTER TABLE public.c001t_forense OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 27498)
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c001t_forense_co_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c001t_forense_co_forense_seq OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 208
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c001t_forense_co_forense_seq OWNED BY c001t_forense.co_forense;


--
-- TOC entry 227 (class 1259 OID 27764)
-- Name: c002t_informe_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c002t_informe_forense (
    co_informe_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_estado_informe bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying NOT NULL,
    tx_descripcion_entorno text,
    tx_resultados text,
    tx_conclusiones text,
    tx_observaciones character varying,
    tx_ruta_pdf character varying,
    nb_archivo_pdf character varying,
    co_transaccion bigint NOT NULL,
    co_clasificacion bigint NOT NULL,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_forense bigint NOT NULL,
    nb_archivo_soporte character varying,
    tx_ruta_soporte character varying
);


ALTER TABLE public.c002t_informe_forense OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 27762)
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c002t_informe_forense_co_informe_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c002t_informe_forense_co_informe_forense_seq OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 226
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c002t_informe_forense_co_informe_forense_seq OWNED BY c002t_informe_forense.co_informe_forense;


--
-- TOC entry 203 (class 1259 OID 27309)
-- Name: c003t_acta_acc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c003t_acta_acc (
    co_acc bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_estado_acta bigint NOT NULL,
    fe_destruye date,
    co_destruye bigint,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    co_elabora bigint NOT NULL,
    co_custodio bigint NOT NULL,
    co_tipo_recurso bigint NOT NULL,
    co_ciudad_acta bigint NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.c003t_acta_acc OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 27307)
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c003t_acta_acc_co_acc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c003t_acta_acc_co_acc_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 202
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c003t_acta_acc_co_acc_seq OWNED BY c003t_acta_acc.co_acc;


--
-- TOC entry 231 (class 1259 OID 27930)
-- Name: c004t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c004t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at time without time zone,
    co_elabora bigint NOT NULL,
    co_custodio bigint NOT NULL,
    co_recurso bigint NOT NULL,
    co_ciudad_acta bigint NOT NULL
);


ALTER TABLE public.c004t_acta_aie OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 27928)
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c004t_acta_aie_co_aie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c004t_acta_aie_co_aie_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 230
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c004t_acta_aie_co_aie_seq OWNED BY c004t_acta_aie.co_aie;


--
-- TOC entry 233 (class 1259 OID 28061)
-- Name: c005t_acta_anie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c005t_acta_anie (
    co_anie bigint NOT NULL,
    fe_emision date NOT NULL,
    co_forense bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_elabora bigint NOT NULL,
    co_niega bigint NOT NULL,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    in_abierta boolean,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at time without time zone
);


ALTER TABLE public.c005t_acta_anie OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 28059)
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c005t_acta_anie_co_anie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c005t_acta_anie_co_anie_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 232
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c005t_acta_anie_co_anie_seq OWNED BY c005t_acta_anie.co_anie;


--
-- TOC entry 207 (class 1259 OID 27414)
-- Name: c006t_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c006t_evidencia (
    co_evidencia bigint NOT NULL,
    fe_registro date,
    co_registra bigint NOT NULL,
    co_acc bigint,
    co_aie bigint,
    tx_descripcion_coleccion character varying,
    fe_coleccion_evidencia date,
    co_colecta bigint NOT NULL,
    co_recurso bigint NOT NULL,
    tx_nombre_recurso character varying,
    tx_serial_recurso character varying,
    tx_marca_recurso character varying,
    tx_modelo_recurso character varying,
    tx_numero_activo character varying,
    co_tipo_evidencia bigint NOT NULL,
    co_estado_evidencia bigint NOT NULL,
    co_lugar_seguro bigint,
    co_repositorio bigint,
    co_custodio_sti bigint,
    tx_observaciones character varying,
    in_abierta boolean,
    co_clasificacion bigint,
    co_transaccion bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_entregado_fuera_sti bigint,
    co_custodio bigint NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c006t_evidencia OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 27412)
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c006t_evidencia_co_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c006t_evidencia_co_evidencia_seq OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 206
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c006t_evidencia_co_evidencia_seq OWNED BY c006t_evidencia.co_evidencia;


--
-- TOC entry 241 (class 1259 OID 28263)
-- Name: c007t_figuras_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c007t_figuras_forense (
    co_figuras_forense bigint NOT NULL,
    co_informe_forense bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    co_clasificacion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c007t_figuras_forense OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 28261)
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c007t_figuras_forense_co_anexos_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c007t_figuras_forense_co_anexos_forense_seq OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 240
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c007t_figuras_forense_co_anexos_forense_seq OWNED BY c007t_figuras_forense.co_figuras_forense;


--
-- TOC entry 239 (class 1259 OID 28254)
-- Name: c008t_anexos_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c008t_anexos_forense (
    co_anexos_forense bigint NOT NULL,
    co_informe_forense bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    co_clasificacion bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c008t_anexos_forense OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 28252)
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c008t_anexos_forense_co_anexos_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c008t_anexos_forense_co_anexos_forense_seq OWNER TO postgres;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 238
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c008t_anexos_forense_co_anexos_forense_seq OWNED BY c008t_anexos_forense.co_anexos_forense;


--
-- TOC entry 280 (class 1259 OID 28847)
-- Name: c805t_rel_transaccion_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c805t_rel_transaccion_principio (
    co_relacion bigint NOT NULL,
    co_transaccion bigint,
    co_principio bigint
);


ALTER TABLE public.c805t_rel_transaccion_principio OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 28850)
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c009t_rel_forense_principio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c009t_rel_forense_principio_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 281
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c009t_rel_forense_principio_co_relacion_seq OWNED BY c805t_rel_transaccion_principio.co_relacion;


--
-- TOC entry 287 (class 1259 OID 28911)
-- Name: c806t_rel_transaccion_marco_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c806t_rel_transaccion_marco_normativo (
    co_relacion bigint NOT NULL,
    co_transaccion bigint,
    co_marco_normativo bigint
);


ALTER TABLE public.c806t_rel_transaccion_marco_normativo OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 28909)
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c010t_rel_forense_marco_normativo_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c010t_rel_forense_marco_normativo_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 286
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c010t_rel_forense_marco_normativo_co_relacion_seq OWNED BY c806t_rel_transaccion_marco_normativo.co_relacion;


--
-- TOC entry 285 (class 1259 OID 28900)
-- Name: c020t_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c020t_incidente (
    co_incidente bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    tx_serial character varying,
    co_estado_incidente bigint NOT NULL,
    co_tipo_incidente bigint NOT NULL,
    co_tipo_hecho bigint NOT NULL,
    tx_descripcion character varying,
    fe_incio_hecho date,
    fe_fin_hecho date,
    tx_causa character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    tx_ruta_pdf character varying,
    nb_archivo_pdf character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint NOT NULL,
    co_usuario_update bigint NOT NULL,
    tx_acciones_tomadas character varying
);


ALTER TABLE public.c020t_incidente OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 28898)
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c020t_incidente_co_incidente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c020t_incidente_co_incidente_seq OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 284
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c020t_incidente_co_incidente_seq OWNED BY c020t_incidente.co_incidente;


--
-- TOC entry 296 (class 1259 OID 28981)
-- Name: c021t_rel_incidente_servicio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c021t_rel_incidente_servicio (
    co_relacion bigint NOT NULL,
    co_incidente bigint,
    co_servicio bigint
);


ALTER TABLE public.c021t_rel_incidente_servicio OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 28984)
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c021t_rel_incidente_servicio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c021t_rel_incidente_servicio_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 297
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c021t_rel_incidente_servicio_co_relacion_seq OWNED BY c021t_rel_incidente_servicio.co_relacion;


--
-- TOC entry 269 (class 1259 OID 28712)
-- Name: c060_inventario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c060_inventario (
    co_equipo bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_tipo bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_etiqueta_sti character varying NOT NULL,
    co_estado bigint NOT NULL,
    tx_nombre_equipo character varying NOT NULL,
    tx_funsion_equipo character varying NOT NULL,
    co_so bigint NOT NULL,
    tx_etiqueta_activo character varying NOT NULL,
    tx_serial_hardware character varying NOT NULL,
    tx_marca_hardware character varying NOT NULL,
    tx_modelo_hardware character varying NOT NULL,
    co_ciudad bigint NOT NULL,
    co_edificio bigint NOT NULL,
    tx_direccion_ubicacion character varying NOT NULL,
    tx_detalle_ubicacion character varying NOT NULL,
    co_centro_dato bigint NOT NULL,
    co_rack bigint NOT NULL,
    tx_ubicacion_llave character varying NOT NULL,
    in_respaldo_automatizado boolean NOT NULL,
    in_bloqueo_inactividad boolean NOT NULL,
    in_adiministradores_personalizados boolean NOT NULL,
    in_politica_password boolean NOT NULL,
    in_sincronizacion_reloj boolean NOT NULL,
    in_monitoreado boolean NOT NULL,
    in_inf_actualizada boolean NOT NULL,
    in_log_activo boolean NOT NULL,
    co_nivel_criticidad bigint NOT NULL,
    tx_observaciones text,
    tx_ruta_respaldo_configuraciones character varying NOT NULL,
    co_num_inventario bigint NOT NULL
);


ALTER TABLE public.c060_inventario OWNER TO postgres;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN c060_inventario.tx_direccion_ubicacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c060_inventario.tx_direccion_ubicacion IS 'ciudad-edificio-piso/oficina';


--
-- TOC entry 267 (class 1259 OID 28708)
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_centro_dato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_centro_dato_seq OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 267
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_centro_dato_seq OWNED BY c060_inventario.co_centro_dato;


--
-- TOC entry 265 (class 1259 OID 28704)
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_ciudad_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 265
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_ciudad_seq OWNED BY c060_inventario.co_ciudad;


--
-- TOC entry 262 (class 1259 OID 28698)
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_custodio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_custodio_seq OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 262
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_custodio_seq OWNED BY c060_inventario.co_custodio;


--
-- TOC entry 260 (class 1259 OID 28694)
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_division_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 260
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_division_seq OWNED BY c060_inventario.co_division;


--
-- TOC entry 266 (class 1259 OID 28706)
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_edificio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_edificio_seq OWNER TO postgres;

--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 266
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_edificio_seq OWNED BY c060_inventario.co_edificio;


--
-- TOC entry 257 (class 1259 OID 28688)
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_equipo_seq OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 257
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_equipo_seq OWNED BY c060_inventario.co_equipo;


--
-- TOC entry 263 (class 1259 OID 28700)
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_estado_seq OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 263
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_estado_seq OWNED BY c060_inventario.co_estado;


--
-- TOC entry 259 (class 1259 OID 28692)
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_negocio_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 259
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_negocio_seq OWNED BY c060_inventario.co_negocio;


--
-- TOC entry 270 (class 1259 OID 28730)
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_nivel_criticidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_nivel_criticidad_seq OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 270
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_nivel_criticidad_seq OWNED BY c060_inventario.co_nivel_criticidad;


--
-- TOC entry 279 (class 1259 OID 28788)
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_num_inventario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_num_inventario_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 279
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_num_inventario_seq OWNED BY c060_inventario.co_num_inventario;


--
-- TOC entry 268 (class 1259 OID 28710)
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_rack_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_rack_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 268
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_rack_seq OWNED BY c060_inventario.co_rack;


--
-- TOC entry 258 (class 1259 OID 28690)
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_region_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 258
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_region_seq OWNED BY c060_inventario.co_region;


--
-- TOC entry 264 (class 1259 OID 28702)
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_so_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_so_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 264
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_so_seq OWNED BY c060_inventario.co_so;


--
-- TOC entry 261 (class 1259 OID 28696)
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c060_inventario_co_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c060_inventario_co_tipo_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 261
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c060_inventario_co_tipo_seq OWNED BY c060_inventario.co_tipo;


--
-- TOC entry 177 (class 1259 OID 26961)
-- Name: c120t_aprobacion_acceso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c120t_aprobacion_acceso (
    co_aprobacion_acceso bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint NOT NULL,
    co_tipo_acceso bigint NOT NULL,
    co_perfil_solicitado bigint NOT NULL,
    tx_indicador_solicitante character varying NOT NULL,
    co_gerencia_solicitante bigint NOT NULL,
    tx_justificacion character varying NOT NULL,
    tx_gerente_aprobador_solicitante character varying NOT NULL,
    num_caso_siga numeric NOT NULL,
    co_estado_aprobador bigint NOT NULL,
    nb_ruta_soporte character varying,
    tx_observacion text
);


ALTER TABLE public.c120t_aprobacion_acceso OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 26959)
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_aprobacion_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_aprobacion_acceso_seq OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 176
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_aprobacion_acceso_seq OWNED BY c120t_aprobacion_acceso.co_aprobacion_acceso;


--
-- TOC entry 180 (class 1259 OID 26979)
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_division_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 180
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_division_seq OWNED BY c120t_aprobacion_acceso.co_division;


--
-- TOC entry 184 (class 1259 OID 27009)
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_estado_aprobador_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_estado_aprobador_seq OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 184
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_estado_aprobador_seq OWNED BY c120t_aprobacion_acceso.co_estado_aprobador;


--
-- TOC entry 183 (class 1259 OID 27000)
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_gerencia_solicitante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_gerencia_solicitante_seq OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 183
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_gerencia_solicitante_seq OWNED BY c120t_aprobacion_acceso.co_gerencia_solicitante;


--
-- TOC entry 179 (class 1259 OID 26972)
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_negocio_seq OWNER TO postgres;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 179
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_negocio_seq OWNED BY c120t_aprobacion_acceso.co_negocio;


--
-- TOC entry 182 (class 1259 OID 26991)
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_perfil_solicitado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_perfil_solicitado_seq OWNER TO postgres;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 182
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_perfil_solicitado_seq OWNED BY c120t_aprobacion_acceso.co_perfil_solicitado;


--
-- TOC entry 178 (class 1259 OID 26966)
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_region_seq OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 178
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_region_seq OWNED BY c120t_aprobacion_acceso.co_region;


--
-- TOC entry 181 (class 1259 OID 26985)
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c120t_aprobacion_acceso_co_tipo_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c120t_aprobacion_acceso_co_tipo_acceso_seq OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 181
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c120t_aprobacion_acceso_co_tipo_acceso_seq OWNED BY c120t_aprobacion_acceso.co_tipo_acceso;


--
-- TOC entry 170 (class 1259 OID 26797)
-- Name: c140t_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c140t_depuracion (
    co_depuracion bigint NOT NULL,
    co_region integer NOT NULL,
    co_negocio integer NOT NULL,
    co_division integer NOT NULL,
    co_tipo_depuracion integer NOT NULL,
    co_equipo integer NOT NULL,
    co_sistema integer NOT NULL,
    co_estado_depuracion integer NOT NULL,
    fe_mes_planificado date,
    tx_serial_depuracion character varying,
    fe_depuracion date,
    tx_indicador_responsable character varying,
    tx_resumen text,
    nu_total_accesos numeric,
    nu_total_depuracion numeric,
    tx_observaciones text,
    co_clasificacion integer,
    nb_anexos_soporte character varying,
    tx_ruta_anexo_soporte character varying,
    nb_anexos_informe character varying,
    tx_ruta_anexo_informe character varying,
    created_at date,
    updated_at date,
    co_transaccion integer,
    ar_anexo_soporte bytea,
    mime_anexo_soporte character varying
);


ALTER TABLE public.c140t_depuracion OWNER TO postgres;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 170
-- Name: TABLE c140t_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE c140t_depuracion IS 'Tabla de Depuracion de Accesos Logicos';


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_depuracion IS 'clave primaria autoincremental';


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_region; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_region IS 'clave primaria de la tabla region';


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_negocio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_negocio IS 'clave primaria de la tabla negocio';


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_division; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_division IS 'clave primaria de la tabla division';


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_tipo_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_tipo_depuracion IS 'Codigo tipo de depuracion';


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_equipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_equipo IS 'Codigo tipo de equipo';


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_sistema; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_sistema IS 'Codigo tipo de sistemas';


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_estado_depuracion IS 'Codigo tipo de Estado de la depuracion';


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.fe_mes_planificado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.fe_mes_planificado IS 'Mes planificado de la depuracion';


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_serial_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_serial_depuracion IS 'Serial de informe de depuracion';


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.fe_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.fe_depuracion IS 'Fecha del informe de depuracion';


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_indicador_responsable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_indicador_responsable IS 'Indicador del responsable de la depuracion';


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_resumen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_resumen IS 'Resumen ejecutivo de la depueracion';


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.nu_total_accesos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nu_total_accesos IS 'Numero total de accesos logicos de la apliacion o del sistema';


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.nu_total_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nu_total_depuracion IS 'Numero total de accesos o cuentas a depurar';


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_observaciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_observaciones IS 'Observaciones adicionales de la depuracion';


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_clasificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_clasificacion IS 'Codigo de la clasificacion del informe';


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.nb_anexos_soporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nb_anexos_soporte IS 'Anexos o Sorte que van al final del informe';


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_ruta_anexo_soporte; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_ruta_anexo_soporte IS 'Ruta de Anexos o Sorte que van al final del informe';


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.nb_anexos_informe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.nb_anexos_informe IS 'Anexos o Sorte que van dentro del informe';


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.tx_ruta_anexo_informe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.tx_ruta_anexo_informe IS 'Ruta Anexos o Sorte que van dentro del informe';


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.created_at IS 'Fecha de la cracion del regitro';


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.updated_at IS 'Fecha de modificiacion del registro';


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN c140t_depuracion.co_transaccion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c140t_depuracion.co_transaccion IS 'Codigo de la transaccion';


--
-- TOC entry 171 (class 1259 OID 26800)
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c140t_depuracion_co_depuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c140t_depuracion_co_depuracion_seq OWNER TO postgres;

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 171
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c140t_depuracion_co_depuracion_seq OWNED BY c140t_depuracion.co_depuracion;


--
-- TOC entry 249 (class 1259 OID 28595)
-- Name: c141t_rel_criterio_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c141t_rel_criterio_depuracion (
    co_relacion bigint NOT NULL,
    co_depuracion integer NOT NULL,
    co_criterio integer NOT NULL,
    nu_depurar numeric NOT NULL,
    created_at date NOT NULL,
    update_at date
);


ALTER TABLE public.c141t_rel_criterio_depuracion OWNER TO postgres;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE c141t_rel_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE c141t_rel_criterio_depuracion IS 'Tabla relacion de la tabla criterio de depuracion con la tabla depuracion';


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.co_relacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_relacion IS 'Clave primaria de la tabla relacion';


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.co_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_depuracion IS 'codigo de la clave primara de la tabla depuracion';


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.co_criterio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.co_criterio IS 'codigo de la clave primara de la tabla criterio';


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.nu_depurar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.nu_depurar IS 'Numero a depurar';


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.created_at IS 'Fecha de creacion de registro';


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN c141t_rel_criterio_depuracion.update_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN c141t_rel_criterio_depuracion.update_at IS 'fecha de modificacion del registro';


--
-- TOC entry 250 (class 1259 OID 28598)
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c141t_rel_criterio_depuracion_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c141t_rel_criterio_depuracion_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 250
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c141t_rel_criterio_depuracion_co_relacion_seq OWNED BY c141t_rel_criterio_depuracion.co_relacion;


--
-- TOC entry 316 (class 1259 OID 29131)
-- Name: c200t_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c200t_evaluacion (
    co_evaluacion bigint NOT NULL,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_gerencia_solicitante bigint,
    co_persona_solicitante bigint,
    co_clasificacion bigint,
    tx_observaciones character varying,
    co_transaccion bigint
);


ALTER TABLE public.c200t_evaluacion OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 29134)
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c160t_evaluacion_co_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c160t_evaluacion_co_evaluacion_seq OWNER TO postgres;

--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 317
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c160t_evaluacion_co_evaluacion_seq OWNED BY c200t_evaluacion.co_evaluacion;


--
-- TOC entry 318 (class 1259 OID 29143)
-- Name: c201t_rel_evaluacion_activo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c201t_rel_evaluacion_activo (
    co_relacion bigint NOT NULL,
    co_evaluacion bigint,
    co_activo bigint
);


ALTER TABLE public.c201t_rel_evaluacion_activo OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 29149)
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c201t_rel_evaluacion_activo_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c201t_rel_evaluacion_activo_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 320
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c201t_rel_evaluacion_activo_co_relacion_seq OWNED BY c201t_rel_evaluacion_activo.co_relacion;


--
-- TOC entry 319 (class 1259 OID 29146)
-- Name: c203t_rel_informe_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c203t_rel_informe_evaluacion (
    co_informe bigint NOT NULL,
    co_evaluacion bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_estado_informe bigint,
    tx_titulo character varying
);


ALTER TABLE public.c203t_rel_informe_evaluacion OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 29155)
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c203t_rel_informe_evaluacion_co_informe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c203t_rel_informe_evaluacion_co_informe_seq OWNER TO postgres;

--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 321
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c203t_rel_informe_evaluacion_co_informe_seq OWNED BY c203t_rel_informe_evaluacion.co_informe;


--
-- TOC entry 213 (class 1259 OID 27566)
-- Name: c801t_transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c801t_transaccion (
    co_transaccion bigint NOT NULL,
    co_producto bigint,
    nu_valor bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c801t_transaccion OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 27564)
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c801t_transaccion_co_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c801t_transaccion_co_transaccion_seq OWNER TO postgres;

--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 212
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c801t_transaccion_co_transaccion_seq OWNED BY c801t_transaccion.co_transaccion;


--
-- TOC entry 215 (class 1259 OID 27572)
-- Name: c802t_cadena_aprobacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c802t_cadena_aprobacion (
    co_cadena_aprobacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    co_persona bigint NOT NULL,
    co_accion bigint NOT NULL,
    fe_accion date,
    tx_observacion character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.c802t_cadena_aprobacion OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27570)
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c802t_cadena_aprobacion_co_cadena_aprobacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c802t_cadena_aprobacion_co_cadena_aprobacion_seq OWNER TO postgres;

--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 214
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c802t_cadena_aprobacion_co_cadena_aprobacion_seq OWNED BY c802t_cadena_aprobacion.co_cadena_aprobacion;


--
-- TOC entry 288 (class 1259 OID 28929)
-- Name: c803t_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c803t_accion (
    co_accion bigint NOT NULL,
    co_transaccion bigint,
    tx_descripcion character varying,
    co_tipo_control bigint,
    co_categoria_accion character varying,
    in_abierto boolean,
    created_at timestamp with time zone,
    update_at timestamp with time zone,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c803t_accion OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 28932)
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c803t_accion_co_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c803t_accion_co_accion_seq OWNER TO postgres;

--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 289
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c803t_accion_co_accion_seq OWNED BY c803t_accion.co_accion;


--
-- TOC entry 290 (class 1259 OID 28942)
-- Name: c804t_seguimiento_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c804t_seguimiento_accion (
    co_seguimiento_accion bigint NOT NULL,
    co_accion bigint,
    co_estado_accion bigint,
    co_responsable_sti bigint,
    co_responsable_ejecutar bigint,
    co_gerencia_responsable bigint,
    fe_planificada_ejecutar date,
    fe_seguimiento_sti date,
    tx_respuesta_responsable text,
    tx_observaciones character varying,
    nb_archivo_evidencia character varying,
    tx_ruta_evidencia character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.c804t_seguimiento_accion OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 28945)
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c804t_seguimiento_accion_co_seguimiento_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c804t_seguimiento_accion_co_seguimiento_accion_seq OWNER TO postgres;

--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 291
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c804t_seguimiento_accion_co_seguimiento_accion_seq OWNED BY c804t_seguimiento_accion.co_seguimiento_accion;


--
-- TOC entry 205 (class 1259 OID 27359)
-- Name: j001t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j001t_alcance_forense OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 27357)
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j001t_alcance_forense_co_alcance_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j001t_alcance_forense_co_alcance_forense_seq OWNER TO postgres;

--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 204
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j001t_alcance_forense_co_alcance_forense_seq OWNED BY j001t_alcance_forense.co_alcance_forense;


--
-- TOC entry 217 (class 1259 OID 27640)
-- Name: j002t_tipo_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j002t_tipo_evidencia (
    co_tipo_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j002t_tipo_evidencia OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27638)
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j002t_tipo_evidencia_co_tipo_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j002t_tipo_evidencia_co_tipo_evidencia_seq OWNER TO postgres;

--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 216
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j002t_tipo_evidencia_co_tipo_evidencia_seq OWNED BY j002t_tipo_evidencia.co_tipo_evidencia;


--
-- TOC entry 219 (class 1259 OID 27651)
-- Name: j003t_estado_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j003t_estado_evidencia (
    co_estado_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j003t_estado_evidencia OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27649)
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j003t_estado_evidencia_co_estado_evidencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j003t_estado_evidencia_co_estado_evidencia_seq OWNER TO postgres;

--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 218
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j003t_estado_evidencia_co_estado_evidencia_seq OWNED BY j003t_estado_evidencia.co_estado_evidencia;


--
-- TOC entry 221 (class 1259 OID 27662)
-- Name: j004t_estado_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j004t_estado_forense (
    co_estado_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j004t_estado_forense OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 27660)
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j004t_estado_forense_co_estado_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j004t_estado_forense_co_estado_forense_seq OWNER TO postgres;

--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 220
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j004t_estado_forense_co_estado_forense_seq OWNED BY j004t_estado_forense.co_estado_forense;


--
-- TOC entry 229 (class 1259 OID 27890)
-- Name: j005t_estado_acta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j005t_estado_acta (
    co_estado_acta bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j005t_estado_acta OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 27888)
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j005t_estado_acta_co_estado_acta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j005t_estado_acta_co_estado_acta_seq OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 228
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j005t_estado_acta_co_estado_acta_seq OWNED BY j005t_estado_acta.co_estado_acta;


--
-- TOC entry 235 (class 1259 OID 28235)
-- Name: j006t_lugar_seguro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j006t_lugar_seguro (
    co_lugar_seguro bigint NOT NULL,
    tx_titulo character varying NOT NULL,
    tx_ubicacion_fisica character varying,
    co_gerencia bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_observaciones character varying,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp with time zone NOT NULL,
    co_ciudad bigint,
    co_localidad bigint
);


ALTER TABLE public.j006t_lugar_seguro OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28233)
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j006t_lugar_seguro_co_lugar_seguro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j006t_lugar_seguro_co_lugar_seguro_seq OWNER TO postgres;

--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 234
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j006t_lugar_seguro_co_lugar_seguro_seq OWNED BY j006t_lugar_seguro.co_lugar_seguro;


--
-- TOC entry 237 (class 1259 OID 28244)
-- Name: j007t_repositorio_digital; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j007t_repositorio_digital (
    co_repositorio_digital bigint NOT NULL,
    tx_titulo character varying NOT NULL,
    tx_direccion_ip character varying,
    co_gerencia bigint NOT NULL,
    co_custodio bigint NOT NULL,
    tx_observaciones character varying,
    co_clasificacion bigint NOT NULL,
    co_transaccion bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp with time zone NOT NULL
);


ALTER TABLE public.j007t_repositorio_digital OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 28242)
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j007t_repositorio_digital_co_repositorio_digital_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j007t_repositorio_digital_co_repositorio_digital_seq OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 236
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j007t_repositorio_digital_co_repositorio_digital_seq OWNED BY j007t_repositorio_digital.co_repositorio_digital;


--
-- TOC entry 272 (class 1259 OID 28744)
-- Name: j061_sistema_operativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j061_sistema_operativo (
    co_so bigint NOT NULL,
    tx_nombre_sistema_operativo_version text NOT NULL
);


ALTER TABLE public.j061_sistema_operativo OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 28742)
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j061_sistema_operativo_co_so_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j061_sistema_operativo_co_so_seq OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 271
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j061_sistema_operativo_co_so_seq OWNED BY j061_sistema_operativo.co_so;


--
-- TOC entry 274 (class 1259 OID 28753)
-- Name: j062_interfaces; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j062_interfaces (
    co_interfaz bigint NOT NULL,
    tx_nombre_interfaz character varying NOT NULL,
    tx_ip character varying NOT NULL,
    tx_mac character varying NOT NULL,
    co_equipo bigint NOT NULL,
    co_equipo_conectado bigint NOT NULL,
    tx_observaciones character varying
);


ALTER TABLE public.j062_interfaces OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 28770)
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_equipo_conectado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_equipo_conectado_seq OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 276
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_equipo_conectado_seq OWNED BY j062_interfaces.co_equipo_conectado;


--
-- TOC entry 275 (class 1259 OID 28760)
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_equipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_equipo_seq OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 275
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_equipo_seq OWNED BY j062_interfaces.co_equipo;


--
-- TOC entry 273 (class 1259 OID 28751)
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j062_interfaces_co_interfaz_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j062_interfaces_co_interfaz_seq OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 273
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j062_interfaces_co_interfaz_seq OWNED BY j062_interfaces.co_interfaz;


--
-- TOC entry 278 (class 1259 OID 28781)
-- Name: j063_aplicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j063_aplicacion (
    co_aplicacion bigint NOT NULL,
    tx_nombre_aplicacion character varying NOT NULL
);


ALTER TABLE public.j063_aplicacion OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 28779)
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j063_aplicacion_co_aplicacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j063_aplicacion_co_aplicacion_seq OWNER TO postgres;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 277
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j063_aplicacion_co_aplicacion_seq OWNED BY j063_aplicacion.co_aplicacion;


--
-- TOC entry 255 (class 1259 OID 28661)
-- Name: j140t_criterio_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j140t_criterio_depuracion (
    tx_descripcoin text NOT NULL,
    created_at date NOT NULL,
    updated_at date,
    co_criterio bigint NOT NULL
);


ALTER TABLE public.j140t_criterio_depuracion OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE j140t_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j140t_criterio_depuracion IS 'Tabla de criterios de depuracion';


--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN j140t_criterio_depuracion.tx_descripcoin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.tx_descripcoin IS 'Descricion del criterio de depuracion';


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN j140t_criterio_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.created_at IS 'fecha de creacion del registro';


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN j140t_criterio_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.updated_at IS 'Fecha de modificacion del registro';


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN j140t_criterio_depuracion.co_criterio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j140t_criterio_depuracion.co_criterio IS 'clave primaria de la tabla criterio ';


--
-- TOC entry 256 (class 1259 OID 28667)
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j140t_criterio_depuracion_co_criterio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j140t_criterio_depuracion_co_criterio_seq OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 256
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j140t_criterio_depuracion_co_criterio_seq OWNED BY j140t_criterio_depuracion.co_criterio;


--
-- TOC entry 251 (class 1259 OID 28607)
-- Name: j141t_tipo_acceso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j141t_tipo_acceso (
    co_acceso bigint NOT NULL,
    tx_tipo_acceso text NOT NULL,
    created_at date NOT NULL,
    update_at date
);


ALTER TABLE public.j141t_tipo_acceso OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE j141t_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j141t_tipo_acceso IS 'Tipos de accesos que se usan en la depuracion';


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN j141t_tipo_acceso.co_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.co_acceso IS 'clave primaria de la tabla de tipos de accesos';


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN j141t_tipo_acceso.tx_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.tx_tipo_acceso IS 'Descripcion del tipo de acceso';


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN j141t_tipo_acceso.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.created_at IS 'Fecha de creacion del registro';


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN j141t_tipo_acceso.update_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j141t_tipo_acceso.update_at IS 'Fecha de modificacion del registro';


--
-- TOC entry 252 (class 1259 OID 28610)
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j141t_tipo_acceso_co_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j141t_tipo_acceso_co_acceso_seq OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 252
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j141t_tipo_acceso_co_acceso_seq OWNED BY j141t_tipo_acceso.co_acceso;


--
-- TOC entry 253 (class 1259 OID 28619)
-- Name: j142t_estado_depuracion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j142t_estado_depuracion (
    co_estado_depuracion bigint NOT NULL,
    tx_estado_depuracion character varying NOT NULL,
    created_at date NOT NULL,
    updated_at date
);


ALTER TABLE public.j142t_estado_depuracion OWNER TO postgres;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE j142t_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j142t_estado_depuracion IS 'Tabla del estado de las depuraciones';


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN j142t_estado_depuracion.co_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.co_estado_depuracion IS 'Clave primaria de estado de depuraciones';


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN j142t_estado_depuracion.tx_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.tx_estado_depuracion IS 'descripcion del estado de la depuracion';


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN j142t_estado_depuracion.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.created_at IS 'Fecha de creacion del registro';


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN j142t_estado_depuracion.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j142t_estado_depuracion.updated_at IS 'Fecha de modificacon del registro';


--
-- TOC entry 254 (class 1259 OID 28622)
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j142t_estado_depuracion_co_estado_depuracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j142t_estado_depuracion_co_estado_depuracion_seq OWNER TO postgres;

--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 254
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j142t_estado_depuracion_co_estado_depuracion_seq OWNED BY j142t_estado_depuracion.co_estado_depuracion;


--
-- TOC entry 282 (class 1259 OID 28856)
-- Name: j801t_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j801t_principio (
    co_principio bigint NOT NULL,
    tx_principio character varying
);


ALTER TABLE public.j801t_principio OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 28859)
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j801t_principio_co_principio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j801t_principio_co_principio_seq OWNER TO postgres;

--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 283
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j801t_principio_co_principio_seq OWNED BY j801t_principio.co_principio;


--
-- TOC entry 223 (class 1259 OID 27707)
-- Name: j802t_clasificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j802t_clasificacion (
    co_clasificacion bigint NOT NULL,
    tx_clasificacion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j802t_clasificacion OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 27705)
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j802t_clasificacion_co_clasificacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j802t_clasificacion_co_clasificacion_seq OWNER TO postgres;

--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 222
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j802t_clasificacion_co_clasificacion_seq OWNED BY j802t_clasificacion.co_clasificacion;


--
-- TOC entry 225 (class 1259 OID 27753)
-- Name: j803t_estado_informe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j803t_estado_informe (
    co_estado_informe bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j803t_estado_informe OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 27751)
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j803t_estado_informe_co_estado_informe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j803t_estado_informe_co_estado_informe_seq OWNER TO postgres;

--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 224
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j803t_estado_informe_co_estado_informe_seq OWNED BY j803t_estado_informe.co_estado_informe;


--
-- TOC entry 243 (class 1259 OID 28290)
-- Name: j804t_gerencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j804t_gerencia (
    co_gerencia bigint NOT NULL,
    tx_descripcion character varying,
    tx_sigla character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j804t_gerencia OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 28288)
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j804t_gerencia_co_gerencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j804t_gerencia_co_gerencia_seq OWNER TO postgres;

--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 242
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j804t_gerencia_co_gerencia_seq OWNED BY j804t_gerencia.co_gerencia;


--
-- TOC entry 245 (class 1259 OID 28400)
-- Name: j805t_tipo_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j805t_tipo_recurso (
    co_tipo_recurso bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint
);


ALTER TABLE public.j805t_tipo_recurso OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 28398)
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j805t_tipo_recurso_co_tipo_recurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j805t_tipo_recurso_co_tipo_recurso_seq OWNER TO postgres;

--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 244
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j805t_tipo_recurso_co_tipo_recurso_seq OWNED BY j805t_tipo_recurso.co_tipo_recurso;


--
-- TOC entry 172 (class 1259 OID 26922)
-- Name: j806t_ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j806t_ciudad (
    co_ciudad bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j806t_ciudad OWNER TO postgres;

--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 172
-- Name: TABLE j806t_ciudad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE j806t_ciudad IS 'Listado de Ciudades';


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 172
-- Name: COLUMN j806t_ciudad.co_ciudad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN j806t_ciudad.co_ciudad IS 'clave primaria';


--
-- TOC entry 173 (class 1259 OID 26925)
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j806t_ciudad_co_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j806t_ciudad_co_ciudad_seq OWNER TO postgres;

--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 173
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j806t_ciudad_co_ciudad_seq OWNED BY j806t_ciudad.co_ciudad;


--
-- TOC entry 175 (class 1259 OID 26936)
-- Name: j807t_localidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j807t_localidad (
    co_localidad bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_transaccion bigint
);


ALTER TABLE public.j807t_localidad OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 26934)
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j807t_localidad_co_localidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j807t_localidad_co_localidad_seq OWNER TO postgres;

--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 174
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j807t_localidad_co_localidad_seq OWNED BY j807t_localidad.co_localidad;


--
-- TOC entry 186 (class 1259 OID 27024)
-- Name: j808t_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j808t_producto (
    co_producto bigint NOT NULL,
    tx_producto character varying,
    co_padre bigint,
    tx_href character varying,
    tx_icono character varying,
    nu_orden bigint,
    tx_sigla character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    co_transaccion bigint
);


ALTER TABLE public.j808t_producto OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 27022)
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j808t_producto_co_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j808t_producto_co_producto_seq OWNER TO postgres;

--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 185
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j808t_producto_co_producto_seq OWNED BY j808t_producto.co_producto;


--
-- TOC entry 189 (class 1259 OID 27130)
-- Name: j809t_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j809t_rol (
    co_rol bigint NOT NULL,
    tx_rol character varying
);


ALTER TABLE public.j809t_rol OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 27128)
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j809t_rol_co_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j809t_rol_co_rol_seq OWNER TO postgres;

--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 188
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j809t_rol_co_rol_seq OWNED BY j809t_rol.co_rol;


--
-- TOC entry 191 (class 1259 OID 27157)
-- Name: j810t_rol_producto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j810t_rol_producto (
    co_rol_producto bigint NOT NULL,
    co_rol bigint,
    co_producto bigint,
    in_ver boolean
);


ALTER TABLE public.j810t_rol_producto OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 27155)
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j810t_rol_producto_co_rol_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j810t_rol_producto_co_rol_producto_seq OWNER TO postgres;

--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 190
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j810t_rol_producto_co_rol_producto_seq OWNED BY j810t_rol_producto.co_rol_producto;


--
-- TOC entry 193 (class 1259 OID 27186)
-- Name: j811t_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j811t_usuario (
    co_usuario bigint NOT NULL,
    tx_indicador character varying,
    co_persona bigint,
    co_rol bigint
);


ALTER TABLE public.j811t_usuario OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 27184)
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j811t_usuario_co_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j811t_usuario_co_usuario_seq OWNER TO postgres;

--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 192
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j811t_usuario_co_usuario_seq OWNED BY j811t_usuario.co_usuario;


--
-- TOC entry 194 (class 1259 OID 27195)
-- Name: j812_persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j812_persona (
    co_persona bigint NOT NULL,
    nb_persona character varying,
    ap_persona character varying,
    co_division bigint NOT NULL,
    co_rol bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL
);


ALTER TABLE public.j812_persona OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 27198)
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j812_persona_co_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j812_persona_co_persona_seq OWNER TO postgres;

--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 195
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j812_persona_co_persona_seq OWNED BY j812_persona.co_persona;


--
-- TOC entry 197 (class 1259 OID 27217)
-- Name: j813t_region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j813t_region (
    co_region bigint NOT NULL,
    tx_region character varying,
    tx_sigla character varying
);


ALTER TABLE public.j813t_region OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 27215)
-- Name: j813t_region_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j813t_region_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j813t_region_co_region_seq OWNER TO postgres;

--
-- TOC entry 3202 (class 0 OID 0)
-- Dependencies: 196
-- Name: j813t_region_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j813t_region_co_region_seq OWNED BY j813t_region.co_region;


--
-- TOC entry 199 (class 1259 OID 27229)
-- Name: j814t_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j814t_negocio (
    co_negocio bigint NOT NULL,
    tx_negocio character varying,
    tx_sigla character varying
);


ALTER TABLE public.j814t_negocio OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 27227)
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j814t_negocio_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j814t_negocio_co_negocio_seq OWNER TO postgres;

--
-- TOC entry 3203 (class 0 OID 0)
-- Dependencies: 198
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j814t_negocio_co_negocio_seq OWNED BY j814t_negocio.co_negocio;


--
-- TOC entry 201 (class 1259 OID 27240)
-- Name: j815t_division; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j815t_division (
    co_division bigint NOT NULL,
    tx_division character varying,
    tx_sigla character varying
);


ALTER TABLE public.j815t_division OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 27238)
-- Name: j815t_division_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j815t_division_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j815t_division_co_division_seq OWNER TO postgres;

--
-- TOC entry 3204 (class 0 OID 0)
-- Dependencies: 200
-- Name: j815t_division_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j815t_division_co_division_seq OWNED BY j815t_division.co_division;


--
-- TOC entry 210 (class 1259 OID 27546)
-- Name: j816t_rel_region_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j816t_rel_region_negocio (
    co_relacion bigint NOT NULL,
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_division bigint
);


ALTER TABLE public.j816t_rel_region_negocio OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 27549)
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j816t_rel_region_negocio_co_relacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j816t_rel_region_negocio_co_relacion_seq OWNER TO postgres;

--
-- TOC entry 3205 (class 0 OID 0)
-- Dependencies: 211
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j816t_rel_region_negocio_co_relacion_seq OWNED BY j816t_rel_region_negocio.co_relacion;


--
-- TOC entry 248 (class 1259 OID 28565)
-- Name: j817t_proceso_sti; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j817t_proceso_sti (
    co_proceso_sti bigint NOT NULL,
    tx_descripcion character varying,
    tx_sigla character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_transaccion bigint NOT NULL
);


ALTER TABLE public.j817t_proceso_sti OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 28563)
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j817t_proceso_sti_co_proceso_sti_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j817t_proceso_sti_co_proceso_sti_seq OWNER TO postgres;

--
-- TOC entry 3206 (class 0 OID 0)
-- Dependencies: 247
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j817t_proceso_sti_co_proceso_sti_seq OWNED BY j817t_proceso_sti.co_proceso_sti;


--
-- TOC entry 293 (class 1259 OID 28956)
-- Name: j818t_categoria_control; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j818t_categoria_control (
    co_categoria_control bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j818t_categoria_control OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 28954)
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j818t_tipo_control_co_tipo_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j818t_tipo_control_co_tipo_control_seq OWNER TO postgres;

--
-- TOC entry 3207 (class 0 OID 0)
-- Dependencies: 292
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j818t_tipo_control_co_tipo_control_seq OWNED BY j818t_categoria_control.co_categoria_control;


--
-- TOC entry 301 (class 1259 OID 29009)
-- Name: j819t_estado_control; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j819t_estado_control (
    co_estado_control bigint NOT NULL,
    tx_descripcion character varying,
    nu_valor bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint,
    tx_estado_control character varying
);


ALTER TABLE public.j819t_estado_control OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 29007)
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j819t_estado_control_co_estado_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j819t_estado_control_co_estado_control_seq OWNER TO postgres;

--
-- TOC entry 3208 (class 0 OID 0)
-- Dependencies: 300
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j819t_estado_control_co_estado_control_seq OWNED BY j819t_estado_control.co_estado_control;


--
-- TOC entry 295 (class 1259 OID 28974)
-- Name: j820t_tipo_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j820t_tipo_accion (
    co_tipo_accion bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j820t_tipo_accion OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 28972)
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j820t_tipo_accion_co_tipo_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j820t_tipo_accion_co_tipo_accion_seq OWNER TO postgres;

--
-- TOC entry 3209 (class 0 OID 0)
-- Dependencies: 294
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j820t_tipo_accion_co_tipo_accion_seq OWNED BY j820t_tipo_accion.co_tipo_accion;


--
-- TOC entry 303 (class 1259 OID 29029)
-- Name: j821t_estado_accion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j821t_estado_accion (
    co_estado_accion bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j821t_estado_accion OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 29027)
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j821t_estado_accion_co_estado_accion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j821t_estado_accion_co_estado_accion_seq OWNER TO postgres;

--
-- TOC entry 3210 (class 0 OID 0)
-- Dependencies: 302
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j821t_estado_accion_co_estado_accion_seq OWNED BY j821t_estado_accion.co_estado_accion;


--
-- TOC entry 305 (class 1259 OID 29040)
-- Name: j822t_nivel_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j822t_nivel_riesgo (
    co_nivel_riesgo bigint NOT NULL,
    tx_nivel_riesgo character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j822t_nivel_riesgo OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 29038)
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j822t_nivel_riesgo_co_nivel_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j822t_nivel_riesgo_co_nivel_riesgo_seq OWNER TO postgres;

--
-- TOC entry 3211 (class 0 OID 0)
-- Dependencies: 304
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j822t_nivel_riesgo_co_nivel_riesgo_seq OWNED BY j822t_nivel_riesgo.co_nivel_riesgo;


--
-- TOC entry 307 (class 1259 OID 29051)
-- Name: j823t_nivel_impacto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j823t_nivel_impacto (
    co_nivel_impacto bigint NOT NULL,
    tx_nivel_impacto character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j823t_nivel_impacto OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 29049)
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j823t_nivel_impacto_co_nivel_impacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j823t_nivel_impacto_co_nivel_impacto_seq OWNER TO postgres;

--
-- TOC entry 3212 (class 0 OID 0)
-- Dependencies: 306
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j823t_nivel_impacto_co_nivel_impacto_seq OWNED BY j823t_nivel_impacto.co_nivel_impacto;


--
-- TOC entry 309 (class 1259 OID 29062)
-- Name: j824t_nivel_amenaza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j824t_nivel_amenaza (
    co_nivel_amenaza bigint NOT NULL,
    tx_nivel_amenaza character varying,
    nu_valor bigint,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j824t_nivel_amenaza OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 29060)
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j824t_nivel_amenaza_co_nivel_amenaza_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j824t_nivel_amenaza_co_nivel_amenaza_seq OWNER TO postgres;

--
-- TOC entry 3213 (class 0 OID 0)
-- Dependencies: 308
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j824t_nivel_amenaza_co_nivel_amenaza_seq OWNED BY j824t_nivel_amenaza.co_nivel_amenaza;


--
-- TOC entry 311 (class 1259 OID 29074)
-- Name: j825t_matriz_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j825t_matriz_riesgo (
    co_matriz_riesgo bigint NOT NULL,
    co_impacto bigint,
    co_amenaza bigint,
    co_riesgo bigint,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j825t_matriz_riesgo OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 29072)
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j825t_matriz_riesgo_co_matriz_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j825t_matriz_riesgo_co_matriz_riesgo_seq OWNER TO postgres;

--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 310
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j825t_matriz_riesgo_co_matriz_riesgo_seq OWNED BY j825t_matriz_riesgo.co_matriz_riesgo;


--
-- TOC entry 313 (class 1259 OID 29105)
-- Name: j826t_opciones_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j826t_opciones_riesgo (
    co_opciones_riesgo bigint NOT NULL,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint
);


ALTER TABLE public.j826t_opciones_riesgo OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 29103)
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j826t_opciones_riesgo_co_opciones_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j826t_opciones_riesgo_co_opciones_riesgo_seq OWNER TO postgres;

--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 312
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j826t_opciones_riesgo_co_opciones_riesgo_seq OWNED BY j826t_opciones_riesgo.co_opciones_riesgo;


--
-- TOC entry 315 (class 1259 OID 29116)
-- Name: j827t_tipo_riesgo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j827t_tipo_riesgo (
    co_tipo_riesgo bigint NOT NULL,
    tx_tipo_riesgo character varying,
    tx_descripcion character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    co_created_at bigint,
    co_updated_at bigint,
    co_valor_riesgo bigint NOT NULL
);


ALTER TABLE public.j827t_tipo_riesgo OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 29114)
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j827t_tipo_riesgo_co_tipo_riesgo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j827t_tipo_riesgo_co_tipo_riesgo_seq OWNER TO postgres;

--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 314
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j827t_tipo_riesgo_co_tipo_riesgo_seq OWNED BY j827t_tipo_riesgo.co_tipo_riesgo;


--
-- TOC entry 299 (class 1259 OID 28992)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session (
    sess_id bigint NOT NULL,
    sess_data character varying,
    sess_time time with time zone
);


ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 28990)
-- Name: session_sess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_sess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_sess_id_seq OWNER TO postgres;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 298
-- Name: session_sess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_sess_id_seq OWNED BY session.sess_id;


--
-- TOC entry 246 (class 1259 OID 28511)
-- Name: vista_rol_producto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vista_rol_producto AS
 SELECT j810.co_rol_producto,
    j810.co_rol,
    j808.co_producto,
    ( SELECT count(j808t_producto.co_producto) AS count
           FROM j808t_producto
          WHERE (j808t_producto.co_padre = j808.co_producto)) AS cant
   FROM (j810t_rol_producto j810
     JOIN j808t_producto j808 ON ((j810.co_producto = j808.co_producto)));


ALTER TABLE public.vista_rol_producto OWNER TO postgres;

--
-- TOC entry 2447 (class 2604 OID 27503)
-- Name: co_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense ALTER COLUMN co_forense SET DEFAULT nextval('c001t_forense_co_forense_seq'::regclass);


--
-- TOC entry 2456 (class 2604 OID 27767)
-- Name: co_informe_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense ALTER COLUMN co_informe_forense SET DEFAULT nextval('c002t_informe_forense_co_informe_forense_seq'::regclass);


--
-- TOC entry 2444 (class 2604 OID 27312)
-- Name: co_acc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc ALTER COLUMN co_acc SET DEFAULT nextval('c003t_acta_acc_co_acc_seq'::regclass);


--
-- TOC entry 2458 (class 2604 OID 27933)
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('c004t_acta_aie_co_aie_seq'::regclass);


--
-- TOC entry 2459 (class 2604 OID 28064)
-- Name: co_anie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie ALTER COLUMN co_anie SET DEFAULT nextval('c005t_acta_anie_co_anie_seq'::regclass);


--
-- TOC entry 2446 (class 2604 OID 27417)
-- Name: co_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia ALTER COLUMN co_evidencia SET DEFAULT nextval('c006t_evidencia_co_evidencia_seq'::regclass);


--
-- TOC entry 2463 (class 2604 OID 28266)
-- Name: co_figuras_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense ALTER COLUMN co_figuras_forense SET DEFAULT nextval('c007t_figuras_forense_co_anexos_forense_seq'::regclass);


--
-- TOC entry 2462 (class 2604 OID 28257)
-- Name: co_anexos_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense ALTER COLUMN co_anexos_forense SET DEFAULT nextval('c008t_anexos_forense_co_anexos_forense_seq'::regclass);


--
-- TOC entry 2492 (class 2604 OID 28903)
-- Name: co_incidente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c020t_incidente ALTER COLUMN co_incidente SET DEFAULT nextval('c020t_incidente_co_incidente_seq'::regclass);


--
-- TOC entry 2498 (class 2604 OID 28986)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c021t_rel_incidente_servicio ALTER COLUMN co_relacion SET DEFAULT nextval('c021t_rel_incidente_servicio_co_relacion_seq'::regclass);


--
-- TOC entry 2471 (class 2604 OID 28715)
-- Name: co_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_equipo SET DEFAULT nextval('c060_inventario_co_equipo_seq'::regclass);


--
-- TOC entry 2472 (class 2604 OID 28716)
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_region SET DEFAULT nextval('c060_inventario_co_region_seq'::regclass);


--
-- TOC entry 2473 (class 2604 OID 28717)
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_negocio SET DEFAULT nextval('c060_inventario_co_negocio_seq'::regclass);


--
-- TOC entry 2474 (class 2604 OID 28718)
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_division SET DEFAULT nextval('c060_inventario_co_division_seq'::regclass);


--
-- TOC entry 2475 (class 2604 OID 28719)
-- Name: co_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_tipo SET DEFAULT nextval('c060_inventario_co_tipo_seq'::regclass);


--
-- TOC entry 2476 (class 2604 OID 28720)
-- Name: co_custodio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_custodio SET DEFAULT nextval('c060_inventario_co_custodio_seq'::regclass);


--
-- TOC entry 2477 (class 2604 OID 28721)
-- Name: co_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_estado SET DEFAULT nextval('c060_inventario_co_estado_seq'::regclass);


--
-- TOC entry 2478 (class 2604 OID 28722)
-- Name: co_so; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_so SET DEFAULT nextval('c060_inventario_co_so_seq'::regclass);


--
-- TOC entry 2479 (class 2604 OID 28723)
-- Name: co_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_ciudad SET DEFAULT nextval('c060_inventario_co_ciudad_seq'::regclass);


--
-- TOC entry 2480 (class 2604 OID 28724)
-- Name: co_edificio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_edificio SET DEFAULT nextval('c060_inventario_co_edificio_seq'::regclass);


--
-- TOC entry 2481 (class 2604 OID 28725)
-- Name: co_centro_dato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_centro_dato SET DEFAULT nextval('c060_inventario_co_centro_dato_seq'::regclass);


--
-- TOC entry 2482 (class 2604 OID 28726)
-- Name: co_rack; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_rack SET DEFAULT nextval('c060_inventario_co_rack_seq'::regclass);


--
-- TOC entry 2483 (class 2604 OID 28732)
-- Name: co_nivel_criticidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_nivel_criticidad SET DEFAULT nextval('c060_inventario_co_nivel_criticidad_seq'::regclass);


--
-- TOC entry 2484 (class 2604 OID 28790)
-- Name: co_num_inventario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c060_inventario ALTER COLUMN co_num_inventario SET DEFAULT nextval('c060_inventario_co_num_inventario_seq'::regclass);


--
-- TOC entry 2435 (class 2604 OID 26964)
-- Name: co_aprobacion_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c120t_aprobacion_acceso ALTER COLUMN co_aprobacion_acceso SET DEFAULT nextval('c120t_aprobacion_acceso_co_aprobacion_acceso_seq'::regclass);


--
-- TOC entry 2432 (class 2604 OID 26802)
-- Name: co_depuracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c140t_depuracion ALTER COLUMN co_depuracion SET DEFAULT nextval('c140t_depuracion_co_depuracion_seq'::regclass);


--
-- TOC entry 2467 (class 2604 OID 28600)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c141t_rel_criterio_depuracion ALTER COLUMN co_relacion SET DEFAULT nextval('c141t_rel_criterio_depuracion_co_relacion_seq'::regclass);


--
-- TOC entry 2508 (class 2604 OID 29136)
-- Name: co_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c200t_evaluacion ALTER COLUMN co_evaluacion SET DEFAULT nextval('c160t_evaluacion_co_evaluacion_seq'::regclass);


--
-- TOC entry 2509 (class 2604 OID 29151)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c201t_rel_evaluacion_activo ALTER COLUMN co_relacion SET DEFAULT nextval('c201t_rel_evaluacion_activo_co_relacion_seq'::regclass);


--
-- TOC entry 2510 (class 2604 OID 29157)
-- Name: co_informe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c203t_rel_informe_evaluacion ALTER COLUMN co_informe SET DEFAULT nextval('c203t_rel_informe_evaluacion_co_informe_seq'::regclass);


--
-- TOC entry 2449 (class 2604 OID 27569)
-- Name: co_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c801t_transaccion ALTER COLUMN co_transaccion SET DEFAULT nextval('c801t_transaccion_co_transaccion_seq'::regclass);


--
-- TOC entry 2450 (class 2604 OID 27575)
-- Name: co_cadena_aprobacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c802t_cadena_aprobacion ALTER COLUMN co_cadena_aprobacion SET DEFAULT nextval('c802t_cadena_aprobacion_co_cadena_aprobacion_seq'::regclass);


--
-- TOC entry 2494 (class 2604 OID 28934)
-- Name: co_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c803t_accion ALTER COLUMN co_accion SET DEFAULT nextval('c803t_accion_co_accion_seq'::regclass);


--
-- TOC entry 2495 (class 2604 OID 28947)
-- Name: co_seguimiento_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c804t_seguimiento_accion ALTER COLUMN co_seguimiento_accion SET DEFAULT nextval('c804t_seguimiento_accion_co_seguimiento_accion_seq'::regclass);


--
-- TOC entry 2490 (class 2604 OID 28852)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio ALTER COLUMN co_relacion SET DEFAULT nextval('c009t_rel_forense_principio_co_relacion_seq'::regclass);


--
-- TOC entry 2493 (class 2604 OID 28914)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c806t_rel_transaccion_marco_normativo ALTER COLUMN co_relacion SET DEFAULT nextval('c010t_rel_forense_marco_normativo_co_relacion_seq'::regclass);


--
-- TOC entry 2445 (class 2604 OID 27362)
-- Name: co_alcance_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_alcance_forense ALTER COLUMN co_alcance_forense SET DEFAULT nextval('j001t_alcance_forense_co_alcance_forense_seq'::regclass);


--
-- TOC entry 2451 (class 2604 OID 27643)
-- Name: co_tipo_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_tipo_evidencia ALTER COLUMN co_tipo_evidencia SET DEFAULT nextval('j002t_tipo_evidencia_co_tipo_evidencia_seq'::regclass);


--
-- TOC entry 2452 (class 2604 OID 27654)
-- Name: co_estado_evidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_estado_evidencia ALTER COLUMN co_estado_evidencia SET DEFAULT nextval('j003t_estado_evidencia_co_estado_evidencia_seq'::regclass);


--
-- TOC entry 2453 (class 2604 OID 27665)
-- Name: co_estado_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_estado_forense ALTER COLUMN co_estado_forense SET DEFAULT nextval('j004t_estado_forense_co_estado_forense_seq'::regclass);


--
-- TOC entry 2457 (class 2604 OID 27893)
-- Name: co_estado_acta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_estado_acta ALTER COLUMN co_estado_acta SET DEFAULT nextval('j005t_estado_acta_co_estado_acta_seq'::regclass);


--
-- TOC entry 2460 (class 2604 OID 28238)
-- Name: co_lugar_seguro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro ALTER COLUMN co_lugar_seguro SET DEFAULT nextval('j006t_lugar_seguro_co_lugar_seguro_seq'::regclass);


--
-- TOC entry 2461 (class 2604 OID 28247)
-- Name: co_repositorio_digital; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital ALTER COLUMN co_repositorio_digital SET DEFAULT nextval('j007t_repositorio_digital_co_repositorio_digital_seq'::regclass);


--
-- TOC entry 2485 (class 2604 OID 28747)
-- Name: co_so; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j061_sistema_operativo ALTER COLUMN co_so SET DEFAULT nextval('j061_sistema_operativo_co_so_seq'::regclass);


--
-- TOC entry 2486 (class 2604 OID 28756)
-- Name: co_interfaz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_interfaz SET DEFAULT nextval('j062_interfaces_co_interfaz_seq'::regclass);


--
-- TOC entry 2487 (class 2604 OID 28762)
-- Name: co_equipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_equipo SET DEFAULT nextval('j062_interfaces_co_equipo_seq'::regclass);


--
-- TOC entry 2488 (class 2604 OID 28772)
-- Name: co_equipo_conectado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j062_interfaces ALTER COLUMN co_equipo_conectado SET DEFAULT nextval('j062_interfaces_co_equipo_conectado_seq'::regclass);


--
-- TOC entry 2489 (class 2604 OID 28784)
-- Name: co_aplicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j063_aplicacion ALTER COLUMN co_aplicacion SET DEFAULT nextval('j063_aplicacion_co_aplicacion_seq'::regclass);


--
-- TOC entry 2470 (class 2604 OID 28669)
-- Name: co_criterio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j140t_criterio_depuracion ALTER COLUMN co_criterio SET DEFAULT nextval('j140t_criterio_depuracion_co_criterio_seq'::regclass);


--
-- TOC entry 2468 (class 2604 OID 28612)
-- Name: co_acceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j141t_tipo_acceso ALTER COLUMN co_acceso SET DEFAULT nextval('j141t_tipo_acceso_co_acceso_seq'::regclass);


--
-- TOC entry 2469 (class 2604 OID 28624)
-- Name: co_estado_depuracion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j142t_estado_depuracion ALTER COLUMN co_estado_depuracion SET DEFAULT nextval('j142t_estado_depuracion_co_estado_depuracion_seq'::regclass);


--
-- TOC entry 2491 (class 2604 OID 28861)
-- Name: co_principio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j801t_principio ALTER COLUMN co_principio SET DEFAULT nextval('j801t_principio_co_principio_seq'::regclass);


--
-- TOC entry 2454 (class 2604 OID 27710)
-- Name: co_clasificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j802t_clasificacion ALTER COLUMN co_clasificacion SET DEFAULT nextval('j802t_clasificacion_co_clasificacion_seq'::regclass);


--
-- TOC entry 2455 (class 2604 OID 27756)
-- Name: co_estado_informe; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j803t_estado_informe ALTER COLUMN co_estado_informe SET DEFAULT nextval('j803t_estado_informe_co_estado_informe_seq'::regclass);


--
-- TOC entry 2464 (class 2604 OID 28293)
-- Name: co_gerencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j804t_gerencia ALTER COLUMN co_gerencia SET DEFAULT nextval('j804t_gerencia_co_gerencia_seq'::regclass);


--
-- TOC entry 2465 (class 2604 OID 28403)
-- Name: co_tipo_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j805t_tipo_recurso ALTER COLUMN co_tipo_recurso SET DEFAULT nextval('j805t_tipo_recurso_co_tipo_recurso_seq'::regclass);


--
-- TOC entry 2433 (class 2604 OID 26927)
-- Name: co_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j806t_ciudad ALTER COLUMN co_ciudad SET DEFAULT nextval('j806t_ciudad_co_ciudad_seq'::regclass);


--
-- TOC entry 2434 (class 2604 OID 26939)
-- Name: co_localidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j807t_localidad ALTER COLUMN co_localidad SET DEFAULT nextval('j807t_localidad_co_localidad_seq'::regclass);


--
-- TOC entry 2436 (class 2604 OID 27027)
-- Name: co_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto ALTER COLUMN co_producto SET DEFAULT nextval('j808t_producto_co_producto_seq'::regclass);


--
-- TOC entry 2437 (class 2604 OID 27133)
-- Name: co_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j809t_rol ALTER COLUMN co_rol SET DEFAULT nextval('j809t_rol_co_rol_seq'::regclass);


--
-- TOC entry 2438 (class 2604 OID 27160)
-- Name: co_rol_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto ALTER COLUMN co_rol_producto SET DEFAULT nextval('j810t_rol_producto_co_rol_producto_seq'::regclass);


--
-- TOC entry 2439 (class 2604 OID 27189)
-- Name: co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario ALTER COLUMN co_usuario SET DEFAULT nextval('j811t_usuario_co_usuario_seq'::regclass);


--
-- TOC entry 2440 (class 2604 OID 27200)
-- Name: co_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona ALTER COLUMN co_persona SET DEFAULT nextval('j812_persona_co_persona_seq'::regclass);


--
-- TOC entry 2441 (class 2604 OID 27220)
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j813t_region ALTER COLUMN co_region SET DEFAULT nextval('j813t_region_co_region_seq'::regclass);


--
-- TOC entry 2442 (class 2604 OID 27232)
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j814t_negocio ALTER COLUMN co_negocio SET DEFAULT nextval('j814t_negocio_co_negocio_seq'::regclass);


--
-- TOC entry 2443 (class 2604 OID 27243)
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j815t_division ALTER COLUMN co_division SET DEFAULT nextval('j815t_division_co_division_seq'::regclass);


--
-- TOC entry 2448 (class 2604 OID 27551)
-- Name: co_relacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio ALTER COLUMN co_relacion SET DEFAULT nextval('j816t_rel_region_negocio_co_relacion_seq'::regclass);


--
-- TOC entry 2466 (class 2604 OID 28568)
-- Name: co_proceso_sti; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j817t_proceso_sti ALTER COLUMN co_proceso_sti SET DEFAULT nextval('j817t_proceso_sti_co_proceso_sti_seq'::regclass);


--
-- TOC entry 2496 (class 2604 OID 28959)
-- Name: co_categoria_control; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j818t_categoria_control ALTER COLUMN co_categoria_control SET DEFAULT nextval('j818t_tipo_control_co_tipo_control_seq'::regclass);


--
-- TOC entry 2500 (class 2604 OID 29012)
-- Name: co_estado_control; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j819t_estado_control ALTER COLUMN co_estado_control SET DEFAULT nextval('j819t_estado_control_co_estado_control_seq'::regclass);


--
-- TOC entry 2497 (class 2604 OID 28977)
-- Name: co_tipo_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j820t_tipo_accion ALTER COLUMN co_tipo_accion SET DEFAULT nextval('j820t_tipo_accion_co_tipo_accion_seq'::regclass);


--
-- TOC entry 2501 (class 2604 OID 29032)
-- Name: co_estado_accion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j821t_estado_accion ALTER COLUMN co_estado_accion SET DEFAULT nextval('j821t_estado_accion_co_estado_accion_seq'::regclass);


--
-- TOC entry 2502 (class 2604 OID 29043)
-- Name: co_nivel_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j822t_nivel_riesgo ALTER COLUMN co_nivel_riesgo SET DEFAULT nextval('j822t_nivel_riesgo_co_nivel_riesgo_seq'::regclass);


--
-- TOC entry 2503 (class 2604 OID 29054)
-- Name: co_nivel_impacto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j823t_nivel_impacto ALTER COLUMN co_nivel_impacto SET DEFAULT nextval('j823t_nivel_impacto_co_nivel_impacto_seq'::regclass);


--
-- TOC entry 2504 (class 2604 OID 29065)
-- Name: co_nivel_amenaza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j824t_nivel_amenaza ALTER COLUMN co_nivel_amenaza SET DEFAULT nextval('j824t_nivel_amenaza_co_nivel_amenaza_seq'::regclass);


--
-- TOC entry 2505 (class 2604 OID 29077)
-- Name: co_matriz_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo ALTER COLUMN co_matriz_riesgo SET DEFAULT nextval('j825t_matriz_riesgo_co_matriz_riesgo_seq'::regclass);


--
-- TOC entry 2506 (class 2604 OID 29108)
-- Name: co_opciones_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j826t_opciones_riesgo ALTER COLUMN co_opciones_riesgo SET DEFAULT nextval('j826t_opciones_riesgo_co_opciones_riesgo_seq'::regclass);


--
-- TOC entry 2507 (class 2604 OID 29119)
-- Name: co_tipo_riesgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j827t_tipo_riesgo ALTER COLUMN co_tipo_riesgo SET DEFAULT nextval('j827t_tipo_riesgo_co_tipo_riesgo_seq'::regclass);


--
-- TOC entry 2499 (class 2604 OID 28995)
-- Name: sess_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session ALTER COLUMN sess_id SET DEFAULT nextval('session_sess_id_seq'::regclass);


--
-- TOC entry 2960 (class 0 OID 27500)
-- Dependencies: 209
-- Data for Name: c001t_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO c001t_forense (co_forense, fe_apertura, fe_cierre, co_region, co_negocio, co_division, tx_serial, tx_titulo, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_metologia_herramientas, tx_observaciones, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_estado_forense) VALUES (2, '2015-10-02', NULL, 2, 2, 1, NULL, 'Prueba', 'ssss', 'ffff', 1, NULL, 'ssss', NULL, 1, true, '2015-10-02 13:19:05-04:30', NULL, 1);
INSERT INTO c001t_forense (co_forense, fe_apertura, fe_cierre, co_region, co_negocio, co_division, tx_serial, tx_titulo, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_metologia_herramientas, tx_observaciones, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_estado_forense) VALUES (3, '2015-10-02', NULL, 3, 1, 1, NULL, 'laptop ', 'Solicitaron recuperar archivos borrados de una laptop', 'xxx', 1, NULL, 'Datos de Prueba', NULL, 1, true, '2015-10-02 00:00:00-04:30', NULL, 1);
INSERT INTO c001t_forense (co_forense, fe_apertura, fe_cierre, co_region, co_negocio, co_division, tx_serial, tx_titulo, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_metologia_herramientas, tx_observaciones, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_estado_forense) VALUES (4, '2015-10-05', NULL, 1, 2, 1, NULL, 'Verificación maquina rafael', 'Problema con visitas de paginas no autorizadas', '123456', 1, NULL, 'Verificar la maquina del usuario', 4, 1, true, '2015-10-05 16:42:07-04:30', NULL, 1);
INSERT INTO c001t_forense (co_forense, fe_apertura, fe_cierre, co_region, co_negocio, co_division, tx_serial, tx_titulo, tx_descripcion_solicitud, tx_caso_aaii, co_alcance_forense, tx_metologia_herramientas, tx_observaciones, co_transaccion, co_clasificacion, in_abierto, created_at, update_at, co_estado_forense) VALUES (5, '2015-11-09', NULL, 1, 2, 1, NULL, 'ssssss', 'ddddd', '22222', 1, NULL, 'ddddd', 5, 2, true, '2015-11-09 15:12:06-04:30', NULL, 1);


--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 208
-- Name: c001t_forense_co_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c001t_forense_co_forense_seq', 5, true);


--
-- TOC entry 2978 (class 0 OID 27764)
-- Dependencies: 227
-- Data for Name: c002t_informe_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 226
-- Name: c002t_informe_forense_co_informe_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c002t_informe_forense_co_informe_forense_seq', 1, false);


--
-- TOC entry 2954 (class 0 OID 27309)
-- Dependencies: 203
-- Data for Name: c003t_acta_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO c003t_acta_acc (co_acc, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_estado_acta, fe_destruye, co_destruye, tx_observaciones, tx_ruta, nb_archivo, in_abierta, co_clasificacion, co_transaccion, created_at, co_elabora, co_custodio, co_tipo_recurso, co_ciudad_acta, updated_at) VALUES (1, '2015-10-02', 2, 1, 1, 1, 'COR-ACC-2015-10-001', 1, NULL, 1, 'Datos de Prueba', '/var/sgsti/corporativo/octubre/', NULL, true, 1, 1, NULL, 1, 1, 1, 1, NULL);
INSERT INTO c003t_acta_acc (co_acc, fe_emision, co_forense, co_region, co_negocio, co_division, tx_serial, co_estado_acta, fe_destruye, co_destruye, tx_observaciones, tx_ruta, nb_archivo, in_abierta, co_clasificacion, co_transaccion, created_at, co_elabora, co_custodio, co_tipo_recurso, co_ciudad_acta, updated_at) VALUES (2, '2015-10-03', 2, 3, 1, 1, 'MET-ACC-2015-10-002', 1, NULL, 1, 'Datos de Prueba', '/var/sgsti/metro/', NULL, true, 1, 1, NULL, 1, 1, 1, 1, NULL);


--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 202
-- Name: c003t_acta_acc_co_acc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c003t_acta_acc_co_acc_seq', 1, false);


--
-- TOC entry 2982 (class 0 OID 27930)
-- Dependencies: 231
-- Data for Name: c004t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 230
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c004t_acta_aie_co_aie_seq', 1, false);


--
-- TOC entry 2984 (class 0 OID 28061)
-- Dependencies: 233
-- Data for Name: c005t_acta_anie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 232
-- Name: c005t_acta_anie_co_anie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c005t_acta_anie_co_anie_seq', 1, false);


--
-- TOC entry 2958 (class 0 OID 27414)
-- Dependencies: 207
-- Data for Name: c006t_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 206
-- Name: c006t_evidencia_co_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c006t_evidencia_co_evidencia_seq', 1, false);


--
-- TOC entry 2992 (class 0 OID 28263)
-- Dependencies: 241
-- Data for Name: c007t_figuras_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 240
-- Name: c007t_figuras_forense_co_anexos_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c007t_figuras_forense_co_anexos_forense_seq', 1, false);


--
-- TOC entry 2990 (class 0 OID 28254)
-- Dependencies: 239
-- Data for Name: c008t_anexos_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 238
-- Name: c008t_anexos_forense_co_anexos_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c008t_anexos_forense_co_anexos_forense_seq', 1, false);


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 281
-- Name: c009t_rel_forense_principio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c009t_rel_forense_principio_co_relacion_seq', 1, false);


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 286
-- Name: c010t_rel_forense_marco_normativo_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c010t_rel_forense_marco_normativo_co_relacion_seq', 1, false);


--
-- TOC entry 3035 (class 0 OID 28900)
-- Dependencies: 285
-- Data for Name: c020t_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 284
-- Name: c020t_incidente_co_incidente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c020t_incidente_co_incidente_seq', 1, false);


--
-- TOC entry 3046 (class 0 OID 28981)
-- Dependencies: 296
-- Data for Name: c021t_rel_incidente_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 297
-- Name: c021t_rel_incidente_servicio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c021t_rel_incidente_servicio_co_relacion_seq', 1, false);


--
-- TOC entry 3019 (class 0 OID 28712)
-- Dependencies: 269
-- Data for Name: c060_inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 267
-- Name: c060_inventario_co_centro_dato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_centro_dato_seq', 1, false);


--
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 265
-- Name: c060_inventario_co_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_ciudad_seq', 1, false);


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 262
-- Name: c060_inventario_co_custodio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_custodio_seq', 1, false);


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 260
-- Name: c060_inventario_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_division_seq', 1, false);


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 266
-- Name: c060_inventario_co_edificio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_edificio_seq', 1, false);


--
-- TOC entry 3235 (class 0 OID 0)
-- Dependencies: 257
-- Name: c060_inventario_co_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_equipo_seq', 1, false);


--
-- TOC entry 3236 (class 0 OID 0)
-- Dependencies: 263
-- Name: c060_inventario_co_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_estado_seq', 1, false);


--
-- TOC entry 3237 (class 0 OID 0)
-- Dependencies: 259
-- Name: c060_inventario_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_negocio_seq', 1, false);


--
-- TOC entry 3238 (class 0 OID 0)
-- Dependencies: 270
-- Name: c060_inventario_co_nivel_criticidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_nivel_criticidad_seq', 1, false);


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 279
-- Name: c060_inventario_co_num_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_num_inventario_seq', 1, false);


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 268
-- Name: c060_inventario_co_rack_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_rack_seq', 1, false);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 258
-- Name: c060_inventario_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_region_seq', 1, false);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 264
-- Name: c060_inventario_co_so_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_so_seq', 1, false);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 261
-- Name: c060_inventario_co_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c060_inventario_co_tipo_seq', 1, false);


--
-- TOC entry 2929 (class 0 OID 26961)
-- Dependencies: 177
-- Data for Name: c120t_aprobacion_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 176
-- Name: c120t_aprobacion_acceso_co_aprobacion_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_aprobacion_acceso_seq', 1, false);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 180
-- Name: c120t_aprobacion_acceso_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_division_seq', 1, false);


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 184
-- Name: c120t_aprobacion_acceso_co_estado_aprobador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_estado_aprobador_seq', 1, false);


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 183
-- Name: c120t_aprobacion_acceso_co_gerencia_solicitante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_gerencia_solicitante_seq', 1, false);


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 179
-- Name: c120t_aprobacion_acceso_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_negocio_seq', 1, false);


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 182
-- Name: c120t_aprobacion_acceso_co_perfil_solicitado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_perfil_solicitado_seq', 1, false);


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 178
-- Name: c120t_aprobacion_acceso_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_region_seq', 1, false);


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 181
-- Name: c120t_aprobacion_acceso_co_tipo_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c120t_aprobacion_acceso_co_tipo_acceso_seq', 1, false);


--
-- TOC entry 2922 (class 0 OID 26797)
-- Dependencies: 170
-- Data for Name: c140t_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 171
-- Name: c140t_depuracion_co_depuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c140t_depuracion_co_depuracion_seq', 1, false);


--
-- TOC entry 2999 (class 0 OID 28595)
-- Dependencies: 249
-- Data for Name: c141t_rel_criterio_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 250
-- Name: c141t_rel_criterio_depuracion_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c141t_rel_criterio_depuracion_co_relacion_seq', 1, false);


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 317
-- Name: c160t_evaluacion_co_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c160t_evaluacion_co_evaluacion_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 29131)
-- Dependencies: 316
-- Data for Name: c200t_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3068 (class 0 OID 29143)
-- Dependencies: 318
-- Data for Name: c201t_rel_evaluacion_activo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 320
-- Name: c201t_rel_evaluacion_activo_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c201t_rel_evaluacion_activo_co_relacion_seq', 1, false);


--
-- TOC entry 3069 (class 0 OID 29146)
-- Dependencies: 319
-- Data for Name: c203t_rel_informe_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 321
-- Name: c203t_rel_informe_evaluacion_co_informe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c203t_rel_informe_evaluacion_co_informe_seq', 1, false);


--
-- TOC entry 2964 (class 0 OID 27566)
-- Dependencies: 213
-- Data for Name: c801t_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO c801t_transaccion (co_transaccion, co_producto, nu_valor, created_at, updated_at) VALUES (1, 1, 1, '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30');
INSERT INTO c801t_transaccion (co_transaccion, co_producto, nu_valor, created_at, updated_at) VALUES (2, 2, 1, '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30');
INSERT INTO c801t_transaccion (co_transaccion, co_producto, nu_valor, created_at, updated_at) VALUES (4, 49, NULL, '2015-10-05 16:42:07-04:30', '2015-10-05 16:42:07-04:30');
INSERT INTO c801t_transaccion (co_transaccion, co_producto, nu_valor, created_at, updated_at) VALUES (5, 49, NULL, '2015-11-09 15:12:06-04:30', '2015-11-09 15:12:06-04:30');


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 212
-- Name: c801t_transaccion_co_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c801t_transaccion_co_transaccion_seq', 5, true);


--
-- TOC entry 2966 (class 0 OID 27572)
-- Dependencies: 215
-- Data for Name: c802t_cadena_aprobacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 214
-- Name: c802t_cadena_aprobacion_co_cadena_aprobacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c802t_cadena_aprobacion_co_cadena_aprobacion_seq', 1, false);


--
-- TOC entry 3038 (class 0 OID 28929)
-- Dependencies: 288
-- Data for Name: c803t_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 289
-- Name: c803t_accion_co_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c803t_accion_co_accion_seq', 1, false);


--
-- TOC entry 3040 (class 0 OID 28942)
-- Dependencies: 290
-- Data for Name: c804t_seguimiento_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 291
-- Name: c804t_seguimiento_accion_co_seguimiento_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c804t_seguimiento_accion_co_seguimiento_accion_seq', 1, false);


--
-- TOC entry 3030 (class 0 OID 28847)
-- Dependencies: 280
-- Data for Name: c805t_rel_transaccion_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3037 (class 0 OID 28911)
-- Dependencies: 287
-- Data for Name: c806t_rel_transaccion_marco_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2956 (class 0 OID 27359)
-- Dependencies: 205
-- Data for Name: j001t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j001t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (1, 'Coleccion de Evidencia', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j001t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (4, 'Recuperacion de Informacion sin Analizar', '2015-10-01 00:00:00-04:30', '2015-01-01 00:00:00-04:30', 1);
INSERT INTO j001t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (2, 'Analisis de Evidencias', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j001t_alcance_forense (co_alcance_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (3, 'Coleccion y Analisis', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 204
-- Name: j001t_alcance_forense_co_alcance_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j001t_alcance_forense_co_alcance_forense_seq', 1, false);


--
-- TOC entry 2968 (class 0 OID 27640)
-- Dependencies: 217
-- Data for Name: j002t_tipo_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (1, 'FISICA ORIGINAL', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (2, 'FISICA CON EVIDENCIA DIGITAL', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (3, 'IMAGEN FORENSE ORIGINAL', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (4, 'IMAGEN FORENSE COPIA', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (5, 'ARCHIVOS COLECTADOS ORIGINALES', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (6, 'ARCHIVOS RECUPERADOS DESDE LA IMAGEN ORIGINALES', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (7, 'ARCHIVOS COPIADOS PARA RESGUARDO', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j002t_tipo_evidencia (co_tipo_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (8, 'ARCHIVOS COPIADOS PARA ENTREGA FUERA DE STI', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 216
-- Name: j002t_tipo_evidencia_co_tipo_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j002t_tipo_evidencia_co_tipo_evidencia_seq', 1, false);


--
-- TOC entry 2970 (class 0 OID 27651)
-- Dependencies: 219
-- Data for Name: j003t_estado_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (1, 'EN CUSTODIA PERSONAL DE STI
', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (2, 'RESGUARDADA EN LUGAR SEGURO', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (3, 'ENTREGADA FUERA DE STI', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (4, 'RESGUARDADA EN REPOSITORIO DIGITAL', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j003t_estado_evidencia (co_estado_evidencia, tx_descripcion, created_at, update_at, co_transaccion) VALUES (5, 'DESTRIUDA', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 218
-- Name: j003t_estado_evidencia_co_estado_evidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j003t_estado_evidencia_co_estado_evidencia_seq', 1, false);


--
-- TOC entry 2972 (class 0 OID 27662)
-- Dependencies: 221
-- Data for Name: j004t_estado_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j004t_estado_forense (co_estado_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (1, 'Abierto', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j004t_estado_forense (co_estado_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (2, 'Cerrado con Resguardos', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j004t_estado_forense (co_estado_forense, tx_descripcion, created_at, update_at, co_transaccion) VALUES (3, 'Cerrado', '2015-10-01 00:00:00-04:30', '2001-10-01 00:00:00-04', 1);


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 220
-- Name: j004t_estado_forense_co_estado_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j004t_estado_forense_co_estado_forense_seq', 1, false);


--
-- TOC entry 2980 (class 0 OID 27890)
-- Dependencies: 229
-- Data for Name: j005t_estado_acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j005t_estado_acta (co_estado_acta, tx_descripcion, created_at, update_at, co_transaccion) VALUES (1, 'Activa', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j005t_estado_acta (co_estado_acta, tx_descripcion, created_at, update_at, co_transaccion) VALUES (2, 'Destruida', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 228
-- Name: j005t_estado_acta_co_estado_acta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j005t_estado_acta_co_estado_acta_seq', 1, false);


--
-- TOC entry 2986 (class 0 OID 28235)
-- Dependencies: 235
-- Data for Name: j006t_lugar_seguro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j006t_lugar_seguro (co_lugar_seguro, tx_titulo, tx_ubicacion_fisica, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at, co_ciudad, co_localidad) VALUES (1, 'Laboratorio Forense Canarias', 'Torre Canarias, Mezzanina, Oficina STI', 1, 1, 'Datos de Prueba', 1, 1, '2015-10-01 00:00:00', '2015-10-01 00:00:00-04:30', 1, 1);
INSERT INTO j006t_lugar_seguro (co_lugar_seguro, tx_titulo, tx_ubicacion_fisica, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at, co_ciudad, co_localidad) VALUES (2, 'Laboratorio Forense Maracaibo', 'Edif Miranda', 1, 1, 'Datos de Prueba', 1, 1, '2015-10-01 00:00:00', '2015-10-01 00:00:00-04:30', 2, 3);


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 234
-- Name: j006t_lugar_seguro_co_lugar_seguro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j006t_lugar_seguro_co_lugar_seguro_seq', 1, false);


--
-- TOC entry 2988 (class 0 OID 28244)
-- Dependencies: 237
-- Data for Name: j007t_repositorio_digital; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j007t_repositorio_digital (co_repositorio_digital, tx_titulo, tx_direccion_ip, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at) VALUES (1, 'Repositorio OCCIDENTE', '162.0.0.0', 1, 1, 'Datos de Prueba', 1, 1, '2015-10-01 00:00:00', '2015-10-01 00:00:00-04:30');
INSERT INTO j007t_repositorio_digital (co_repositorio_digital, tx_titulo, tx_direccion_ip, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at) VALUES (2, 'Repositorio Centro', '167.134.0.0', 1, 1, 'Datos de Prueba', 1, 2, '2015-10-01 00:00:00', '2015-10-01 00:00:00-04:30');
INSERT INTO j007t_repositorio_digital (co_repositorio_digital, tx_titulo, tx_direccion_ip, co_gerencia, co_custodio, tx_observaciones, co_clasificacion, co_transaccion, created_at, update_at) VALUES (3, 'Repositorio ORIENTE', '10.0.0.0', 1, 1, 'Datos de Prueba', 1, 3, '2015-10-01 00:00:00', '2015-10-01 00:00:00-04:30');


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 236
-- Name: j007t_repositorio_digital_co_repositorio_digital_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j007t_repositorio_digital_co_repositorio_digital_seq', 1, false);


--
-- TOC entry 3022 (class 0 OID 28744)
-- Dependencies: 272
-- Data for Name: j061_sistema_operativo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 271
-- Name: j061_sistema_operativo_co_so_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j061_sistema_operativo_co_so_seq', 1, false);


--
-- TOC entry 3024 (class 0 OID 28753)
-- Dependencies: 274
-- Data for Name: j062_interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 276
-- Name: j062_interfaces_co_equipo_conectado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_equipo_conectado_seq', 1, false);


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 275
-- Name: j062_interfaces_co_equipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_equipo_seq', 1, false);


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 273
-- Name: j062_interfaces_co_interfaz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j062_interfaces_co_interfaz_seq', 1, false);


--
-- TOC entry 3028 (class 0 OID 28781)
-- Dependencies: 278
-- Data for Name: j063_aplicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 277
-- Name: j063_aplicacion_co_aplicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j063_aplicacion_co_aplicacion_seq', 1, false);


--
-- TOC entry 3005 (class 0 OID 28661)
-- Dependencies: 255
-- Data for Name: j140t_criterio_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 256
-- Name: j140t_criterio_depuracion_co_criterio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j140t_criterio_depuracion_co_criterio_seq', 1, false);


--
-- TOC entry 3001 (class 0 OID 28607)
-- Dependencies: 251
-- Data for Name: j141t_tipo_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 252
-- Name: j141t_tipo_acceso_co_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j141t_tipo_acceso_co_acceso_seq', 1, false);


--
-- TOC entry 3003 (class 0 OID 28619)
-- Dependencies: 253
-- Data for Name: j142t_estado_depuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 254
-- Name: j142t_estado_depuracion_co_estado_depuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j142t_estado_depuracion_co_estado_depuracion_seq', 1, false);


--
-- TOC entry 3032 (class 0 OID 28856)
-- Dependencies: 282
-- Data for Name: j801t_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 283
-- Name: j801t_principio_co_principio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j801t_principio_co_principio_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 27707)
-- Dependencies: 223
-- Data for Name: j802t_clasificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j802t_clasificacion (co_clasificacion, tx_clasificacion, created_at, updated_at, co_transaccion) VALUES (1, 'Extrictamente Confidencia', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j802t_clasificacion (co_clasificacion, tx_clasificacion, created_at, updated_at, co_transaccion) VALUES (2, 'Confidencia', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j802t_clasificacion (co_clasificacion, tx_clasificacion, created_at, updated_at, co_transaccion) VALUES (3, 'Uso Interno', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j802t_clasificacion (co_clasificacion, tx_clasificacion, created_at, updated_at, co_transaccion) VALUES (4, 'Uso Publico', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 222
-- Name: j802t_clasificacion_co_clasificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j802t_clasificacion_co_clasificacion_seq', 1, false);


--
-- TOC entry 2976 (class 0 OID 27753)
-- Dependencies: 225
-- Data for Name: j803t_estado_informe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (1, 'Registrado', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (2, 'Pendiente por Revision', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (3, 'Pendiente por Aprobacion', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (4, 'Revisado con Comentarios', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (5, 'Aprobado', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j803t_estado_informe (co_estado_informe, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (6, 'No Aprobado', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 224
-- Name: j803t_estado_informe_co_estado_informe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j803t_estado_informe_co_estado_informe_seq', 1, false);


--
-- TOC entry 2994 (class 0 OID 28290)
-- Dependencies: 243
-- Data for Name: j804t_gerencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j804t_gerencia (co_gerencia, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) VALUES (1, 'Gerencia Funcional de Seguridad en Tecnologias de Informacion', 'STI', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j804t_gerencia (co_gerencia, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) VALUES (2, 'Prevencion y Control de Pérdidas', 'PCP', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j804t_gerencia (co_gerencia, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) VALUES (3, 'Automatización, Infomática y Telecomunicaciones', 'AIT', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j804t_gerencia (co_gerencia, tx_descripcion, tx_sigla, created_at, updated_at, co_transaccion) VALUES (4, 'Otra', 'N/A', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 242
-- Name: j804t_gerencia_co_gerencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j804t_gerencia_co_gerencia_seq', 1, false);


--
-- TOC entry 2996 (class 0 OID 28400)
-- Dependencies: 245
-- Data for Name: j805t_tipo_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j805t_tipo_recurso (co_tipo_recurso, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (2, 'Laptop', '2015-10-02 00:00:00-04:30', '2015-10-02 00:00:00-04:30', 2);
INSERT INTO j805t_tipo_recurso (co_tipo_recurso, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (1, 'Desktop', '2015-10-02 00:00:00-04:30', '2015-10-02 00:00:00-04:30', 1);


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 244
-- Name: j805t_tipo_recurso_co_tipo_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j805t_tipo_recurso_co_tipo_recurso_seq', 2, true);


--
-- TOC entry 2924 (class 0 OID 26922)
-- Dependencies: 172
-- Data for Name: j806t_ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (1, 'Caracas', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (2, 'Maracaibo', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (3, 'Puerto La Cruz', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (4, 'San Tomé', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (5, 'Maturín', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);
INSERT INTO j806t_ciudad (co_ciudad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (6, 'Valencia', '2015-10-01 00:00:00-04:30', '2015-10-01 00:00:00-04:30', 1);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 173
-- Name: j806t_ciudad_co_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j806t_ciudad_co_ciudad_seq', 1, false);


--
-- TOC entry 2927 (class 0 OID 26936)
-- Dependencies: 175
-- Data for Name: j807t_localidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (1, 'Campiña', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (2, 'AMUAY', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (3, 'ANACO', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (4, 'APURE', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (5, 'BARINAS ', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (6, 'LA SALINA', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (7, 'CARACAS', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (8, 'CUMANA COSTA AFUERA', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (9, 'EL  PALITO', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (10, 'LA QUIZANDA ', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (11, 'LAGUNILLAS EDO ZULIA', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (12, 'LOS TEQUES ', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (13, 'MARACAIBO', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (14, 'ORIENTE', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (15, 'PORLAMAR', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (16, 'PUERTO LA CRUZ ', NULL, NULL, NULL);
INSERT INTO j807t_localidad (co_localidad, tx_descripcion, created_at, updated_at, co_transaccion) VALUES (17, 'JOSÉ', NULL, NULL, NULL);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 174
-- Name: j807t_localidad_co_localidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j807t_localidad_co_localidad_seq', 17, true);


--
-- TOC entry 2938 (class 0 OID 27024)
-- Dependencies: 186
-- Data for Name: j808t_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (47, 'Permisologia de Acceso Logico', 50, NULL, NULL, 1, 'PAL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (25, 'Lista de Chequeo para la Evaluación de Planes', 5, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (26, 'Lista de Chequeo para la Prueba de Planes', 5, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (52, 'Inventario de la Plataforma de Seguridad', 48, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (29, 'Bitácora', 6, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (30, 'Identificación de contenedores de medios de respaldo', 6, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (32, 'Bitácora de entrada/salida de medios de respaldo', 6, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (33, 'Pruebas de Respaldo de Data Crítica', 6, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (34, 'Acta Escenarios de Contingencia', 6, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (35, 'Cronograma de Mitigación de Vulnerabilidades', 4, NULL, NULL, 3, 'CMV', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (27, 'Claves de Máximo Privilegio', 6, NULL, NULL, 1, 'CMP', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (22, 'Plan de Contingencia', 5, NULL, NULL, 3, 'PC', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (23, 'Plan Operativo', 5, NULL, NULL, 4, 'PO', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (10, 'Cronograma de Mitigación de Vulnerabilidades', 1, NULL, NULL, 3, 'CMV', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (18, 'Solicitud de Análisis de Riesgo Lógico', 4, NULL, NULL, 1, 'SARL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (19, 'Informe de Análisis de Riesgo Lógico', 4, NULL, NULL, 2, 'IARL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (20, 'Solicitud de Planes de Continuidad', 5, NULL, NULL, 1, 'SPC', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (13, 'Solicitud de Autorización de Análisis de Impacto', 3, NULL, NULL, 1, 'SAI', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (58, 'Control Licencias Lenel', 50, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (53, 'Planes de Contigencia de la Plataforma de Seguridad', 48, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (54, 'Mantenimientos de la Plataforma de Seguridad', 48, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (55, 'Planes Operativos de la Plataforma de Seguridad', 48, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (38, 'Incidentes de Seguridad', 37, NULL, NULL, 1, 'IS', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (50, 'Control de Acceso Logico', 37, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (48, 'Gestion de Plataforma de Seguridad', 37, NULL, NULL, 5, 'IPS', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (37, 'Protección Lógica', 0, NULL, NULL, 2, 'PL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (15, 'Cuestionario de Análisis de Impacto ', 3, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (11, 'Autorización para Prueba de Penetración', 2, NULL, NULL, 1, 'APP', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (12, 'Informe de Prueba de Penetración', 2, NULL, NULL, 2, 'IPP', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (14, 'Informe de Análisis de Impacto', 3, NULL, NULL, 2, 'IAIP', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (16, 'Matriz de Impacto de Activos de Información', 3, NULL, NULL, 4, 'MIA', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (17, 'Matriz de Dependencia Activos Intangibles', 3, NULL, NULL, 5, 'MD', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (21, 'Plan Maestro de Continuidad', 5, NULL, NULL, 2, 'PMC', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (24, 'Informe de Evaluación/Prueba a Planes', 5, NULL, NULL, 5, 'IEPC', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (28, 'Identificación de sobre y seguimiento', 6, NULL, NULL, 2, 'SCMP', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (8, 'Solicitud de Evaluación de STI', 1, 'IEL/solicitud', NULL, 1, 'SEL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (9, 'Informe de Evaluación de STI.', 1, 'IEL/listaInforme', NULL, 2, 'IEL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (1, 'Evaluación de STI', 36, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (2, 'Prueba de Penetración', 36, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (3, 'Análisis de Impacto del Negocio', 36, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (4, 'Análisis de Riesgo Lógico', 36, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (5, 'Planes de Continuidad', 36, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (6, 'Resguardo de claves de máximo privilegio', 36, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (7, 'Traslado, Resguardo y Prueba de los medios de respaldo', 36, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (36, 'Evaluación,Respuesta y Contingencia', 0, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (39, 'Informe de Incidente de Seguridad', 38, NULL, NULL, 2, 'IIS', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (46, 'Informe de Depuracion de Acceso Logico', 50, NULL, NULL, 2, 'IDAL', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (57, 'Seguimiento de Acciones Recomendadas - AF', 40, NULL, NULL, 8, ' ', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (56, 'Seguimiento de Acciones Recomendadas - IS', 38, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (44, 'Acta de Negación de Inspección de Equipos', 40, 'C005tActaAnie', NULL, 5, 'ANIE', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (45, 'Control de Evidencias', 40, 'C006tEvidencia', NULL, 2, 'IAF', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (71, 'Procesos STI', 75, 'J817tProcesoSti ', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (51, 'Registro de Incidente de Seguridad', 38, NULL, NULL, 1, 'RIS', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (59, 'Registro de Evidencias ', 40, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (80, 'Tipo de Justificación del Informe de Marco Normativo', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (79, 'Tipo de Informe de Marco Normativo', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (66, 'Repositorios para Resguardo de Evidencias Digitales', 60, 'J007tRepositorioDigital', NULL, NULL, 'RED', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (78, 'Estado del Documento de Marco Normativo', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (73, 'Personas', 75, 'J812Persona', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (67, 'Estados de los Casos Forense', 60, 'J004tEstadoForense', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (69, 'Divisiones STI', 75, 'J815tDivision', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (74, 'Usuario del Sistema', 75, 'J811tUsuario', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (70, 'Regiones STI', 75, 'J813tRegion', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (72, 'Negocios por Region', 75, 'J816tRelRegionNegocio', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (83, 'Tipificacion de Incidentes de Seguridad', 82, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (65, 'Lugares para Resguardo de Evidencias Fisicas', 60, 'J006tLugarSeguro', NULL, NULL, 'LREF', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (64, 'Estados de las Evidencias', 60, 'J003tEstadoEvidencia', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (63, 'Tipos de Evidencias', 60, 'J002tTipoEvidencia', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (62, 'Tipos de Recursos Tecnologicos', 60, 'J805tTipoRecurso', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (68, 'Negocios STI', 75, 'J814tNegocio', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (31, 'Autorización de traslado de medios de respaldo', 6, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (49, 'Registro de Analisis Forense', 40, 'C001tForense', NULL, 1, 'RAF', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (40, 'Analisis Forense', 37, NULL, NULL, 2, 'AF', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (81, 'Detalle del Marco Normativo', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (76, 'DM - Marco Normativo', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (84, 'Tipificacion de Hechos', 82, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (85, 'Estado del Incidente', 82, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (89, 'Principios de Seguridad', 67, NULL, NULL, 6, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (61, 'Alcance de los Analisis Forense', 60, 'J001tAlcanceForense', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (60, 'DM - Analisis Forense', 95, NULL, NULL, 9, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (77, 'Tipo de Documento Normativo', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (75, 'DM - Generales', 95, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (43, 'Acta de Inspección de Equipos', 40, 'C004tActaAie', NULL, 4, 'AIE', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (41, 'Informe de Analisis Forense', 40, 'C002tInformeForense', NULL, 7, 'IR', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (95, 'Configuración', 0, NULL, NULL, 5, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (96, 'Privilegios', 95, 'rol', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (86, 'Tipo de Plataforma de Seguridad', 90, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (87, 'Listado de Herramienta de Seguridad', 90, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (88, 'Tipos de Servicios Tecnologicos', 67, NULL, NULL, 7, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (91, 'Principios Afectados por Incidente', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (92, 'Servicios Afectados en el Incidente', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (93, 'Herramientas de Seguridad Utilizadas', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (94, 'Marco Normativo Referenciado', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (82, 'DM - Incidentes de Seguridad', 95, NULL, NULL, 8, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (90, 'DM - Plataforma de Seguridad', 95, NULL, NULL, 3, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (42, 'Acta de Cadena de Custodia', 40, 'C003tActaAcc', NULL, 3, 'ACC', NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (0, 'raiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO j808t_producto (co_producto, tx_producto, co_padre, tx_href, tx_icono, nu_orden, tx_sigla, created_at, updated_at, co_transaccion) VALUES (97, 'Menu', 95, 'J808tProducto', NULL, 6, NULL, NULL, NULL, NULL);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 185
-- Name: j808t_producto_co_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j808t_producto_co_producto_seq', 97, true);


--
-- TOC entry 2940 (class 0 OID 27130)
-- Dependencies: 189
-- Data for Name: j809t_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j809t_rol (co_rol, tx_rol) VALUES (1, 'Administrador');


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 188
-- Name: j809t_rol_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j809t_rol_co_rol_seq', 1, true);


--
-- TOC entry 2942 (class 0 OID 27157)
-- Dependencies: 191
-- Data for Name: j810t_rol_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (91, 1, 90, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (90, 1, 90, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (67, 1, 67, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (16, 1, 4, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (48, 1, 48, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (82, 1, 82, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (50, 1, 50, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (17, 1, 5, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (18, 1, 6, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (15, 1, 3, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (76, 1, 76, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (1, 1, 23, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (10, 1, 32, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (79, 1, 79, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (26, 1, 14, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (42, 1, 42, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (13, 1, 1, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (36, 1, 36, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (49, 1, 49, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (40, 1, 40, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (37, 1, 37, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (73, 1, 73, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (71, 1, 71, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (70, 1, 70, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (68, 1, 68, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (69, 1, 69, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (72, 1, 72, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (97, 1, 97, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (66, 1, 66, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (65, 1, 65, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (62, 1, 62, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (63, 1, 63, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (64, 1, 64, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (61, 1, 61, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (60, 1, 60, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (95, 1, 95, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (38, 1, 38, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (14, 1, 2, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (23, 1, 11, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (20, 1, 8, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (22, 1, 10, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (8, 1, 30, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (11, 1, 33, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (80, 1, 80, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (39, 1, 39, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (54, 1, 54, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (47, 1, 47, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (3, 1, 25, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (86, 1, 86, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (9, 1, 31, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (87, 1, 87, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (24, 1, 12, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (45, 1, 45, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (46, 1, 46, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (55, 1, 55, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (27, 1, 15, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (28, 1, 16, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (83, 1, 83, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (94, 1, 94, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (84, 1, 84, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (88, 1, 88, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (77, 1, 77, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (4, 1, 26, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (30, 1, 18, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (89, 1, 89, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (33, 1, 21, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (6, 1, 28, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (56, 1, 56, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (53, 1, 53, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (19, 1, 7, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (29, 1, 17, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (93, 1, 93, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (2, 1, 24, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (57, 1, 57, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (51, 1, 51, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (92, 1, 92, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (41, 1, 41, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (35, 1, 35, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (31, 1, 19, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (52, 1, 52, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (5, 1, 27, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (44, 1, 44, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (7, 1, 29, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (85, 1, 85, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (34, 1, 22, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (81, 1, 81, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (32, 1, 20, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (25, 1, 13, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (12, 1, 34, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (58, 1, 58, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (59, 1, 59, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (78, 1, 78, false);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (21, 1, 9, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (96, 1, 96, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (74, 1, 74, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (75, 1, 75, true);
INSERT INTO j810t_rol_producto (co_rol_producto, co_rol, co_producto, in_ver) VALUES (43, 1, 43, false);


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 190
-- Name: j810t_rol_producto_co_rol_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j810t_rol_producto_co_rol_producto_seq', 97, true);


--
-- TOC entry 2944 (class 0 OID 27186)
-- Dependencies: 193
-- Data for Name: j811t_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j811t_usuario (co_usuario, tx_indicador, co_persona, co_rol) VALUES (1, 'camarilloj', 1, NULL);


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 192
-- Name: j811t_usuario_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j811t_usuario_co_usuario_seq', 1, true);


--
-- TOC entry 2945 (class 0 OID 27195)
-- Dependencies: 194
-- Data for Name: j812_persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j812_persona (co_persona, nb_persona, ap_persona, co_division, co_rol, co_region, co_negocio) VALUES (1, 'Joel', 'Camarillo', 1, 1, 1, 1);
INSERT INTO j812_persona (co_persona, nb_persona, ap_persona, co_division, co_rol, co_region, co_negocio) VALUES (2, 'Tibisay', 'Vivas', 1, 1, 3, 1);


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 195
-- Name: j812_persona_co_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j812_persona_co_persona_seq', 2, true);


--
-- TOC entry 2948 (class 0 OID 27217)
-- Dependencies: 197
-- Data for Name: j813t_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j813t_region (co_region, tx_region, tx_sigla) VALUES (2, 'Oriente', 'ORI');
INSERT INTO j813t_region (co_region, tx_region, tx_sigla) VALUES (1, 'Occidente', 'OCC');
INSERT INTO j813t_region (co_region, tx_region, tx_sigla) VALUES (3, 'Centro', 'CEN');


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 196
-- Name: j813t_region_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j813t_region_co_region_seq', 3, true);


--
-- TOC entry 2950 (class 0 OID 27229)
-- Dependencies: 199
-- Data for Name: j814t_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (1, 'Exploración y Producción Occidente', 'EPOC');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (4, 'Exploración y Producción Costa Afuera', 'EP');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (5, 'Refinación ', 'REF');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (6, 'Comercio y Suministro', 'CYS');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (7, 'Gas', 'GAS');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (8, 'Intevep', 'INTVP');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (9, 'Bariven', 'BRV');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (10, 'Ingeniería y Construcción', 'IYC');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (2, 'Exploración y Producción Oriente', 'EPOR');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (3, 'Exploración y Producción Faja', 'EPFA');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (11, 'Pdvsa Servicios', 'PDV-SER');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (12, 'Pdvsa Naval', 'PDV-NAV');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (13, 'Pdvsa Industrial', 'PDV-IND');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (14, 'Gas Comunal', 'GAS-COM');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (15, 'Metropolitana', 'MET');
INSERT INTO j814t_negocio (co_negocio, tx_negocio, tx_sigla) VALUES (16, 'Corporativo', 'COR');


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 198
-- Name: j814t_negocio_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j814t_negocio_co_negocio_seq', 5, true);


--
-- TOC entry 2952 (class 0 OID 27240)
-- Dependencies: 201
-- Data for Name: j815t_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (16, 'Oriente', 'ORI');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (1, 'Costa Oriental', 'COR');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (2, 'Costa Occidental', 'COC');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (3, 'Costa Afuera', 'CAF');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (4, 'Furrial', 'FUR');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (5, 'Punta de Mata', 'PDM');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (6, 'Ayacucho', 'AYA');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (7, 'Boyaca', 'BOY');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (8, 'Carabobo', 'CAR');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (9, 'Junin', 'JUN');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (10, 'Mejoramiento', 'MEJ');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (11, 'Complejo Refinador Paraguana', 'CRP');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (12, 'El Palito', 'PAL');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (13, 'Puerto La Cruz', 'PLC');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (14, 'Metro Occidente', 'MOC');
INSERT INTO j815t_division (co_division, tx_division, tx_sigla) VALUES (15, 'Occidente', 'OCC');


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 200
-- Name: j815t_division_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j815t_division_co_division_seq', 18, true);


--
-- TOC entry 2961 (class 0 OID 27546)
-- Dependencies: 210
-- Data for Name: j816t_rel_region_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (1, 1, 1, 1);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (2, 1, 1, 2);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (3, 2, 2, 4);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (4, 2, 2, 5);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (7, 2, 3, 8);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (8, 2, 3, 9);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (9, 2, 3, 10);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (5, 2, 3, 6);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (6, 2, 2, 7);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (10, 2, 4, 3);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (11, 1, 5, 11);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (12, 3, 5, 12);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (13, 2, 5, 13);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (14, 1, 6, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (15, 2, 6, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (16, 3, 6, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (17, 1, 7, 14);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (18, 2, 7, 15);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (19, 3, 7, 16);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (20, 3, 8, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (21, 1, 9, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (22, 2, 9, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (23, 3, 9, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (24, 1, 10, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (25, 2, 10, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (26, 3, 10, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (27, 1, 11, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (28, 2, 11, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (29, 3, 11, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (30, 3, 12, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (31, 3, 13, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (32, 3, 14, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (33, 3, 15, NULL);
INSERT INTO j816t_rel_region_negocio (co_relacion, co_region, co_negocio, co_division) VALUES (34, 3, 16, NULL);


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 211
-- Name: j816t_rel_region_negocio_co_relacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j816t_rel_region_negocio_co_relacion_seq', 1, true);


--
-- TOC entry 2998 (class 0 OID 28565)
-- Dependencies: 248
-- Data for Name: j817t_proceso_sti; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 247
-- Name: j817t_proceso_sti_co_proceso_sti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j817t_proceso_sti_co_proceso_sti_seq', 1, false);


--
-- TOC entry 3043 (class 0 OID 28956)
-- Dependencies: 293
-- Data for Name: j818t_categoria_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j818t_categoria_control (co_categoria_control, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Preventivo', '2015-11-06 00:00:00-04:30', '2016-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j818t_categoria_control (co_categoria_control, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Correctivo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j818t_categoria_control (co_categoria_control, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Detectivo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j818t_categoria_control (co_categoria_control, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (4, 'Disuasivo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 292
-- Name: j818t_tipo_control_co_tipo_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j818t_tipo_control_co_tipo_control_seq', 1, false);


--
-- TOC entry 3051 (class 0 OID 29009)
-- Dependencies: 301
-- Data for Name: j819t_estado_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (1, 'El control no existe												', 0, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Inexistente');
INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (2, 'El control existe, pero sin procedimiento, se hace de manera empírica y no en todos los negocios', 1, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Inicial');
INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (3, 'El control puede estar procedimientado, pero no esta estandarizado, se aplica en un lugar y en otro no', 2, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Repetible');
INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (4, 'El control esta documentado, tiene su politica de atención, se encuentra estandarizado e implantado en todas partes', 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Implantado');
INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (5, 'El control ya fue auditado exitosamente', 4, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Auditado');
INSERT INTO j819t_estado_control (co_estado_control, tx_descripcion, nu_valor, created_at, updated_at, co_created_at, co_updated_at, tx_estado_control) VALUES (6, 'El control ha sido optimizado en su funcionamiento, ya tiene muchas metricas que han permitido su mejora. Se gestiona de manera oportuna', 5, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 'Gestionado');


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 300
-- Name: j819t_estado_control_co_estado_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j819t_estado_control_co_estado_control_seq', 1, false);


--
-- TOC entry 3045 (class 0 OID 28974)
-- Dependencies: 295
-- Data for Name: j820t_tipo_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Entonación de Herramienta de STI', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Notificación al Usuario', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Solicitud de Mitigación al Centro de Servicios', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (4, 'Solicitud Estrategia Educativa', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (6, 'Solicitud de Consultoría de Seguridad', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (7, 'Solicitud de Analisis Forense', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (5, 'Solicitud de Evaluación de Seguridad', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (8, 'Solicitud de Analisis de Riesgo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (9, 'Solicitud de Depuración de Accesos', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (10, 'Solicitud de Reunión ', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j820t_tipo_accion (co_tipo_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (11, 'Solicitud de Marco Normativo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 294
-- Name: j820t_tipo_accion_co_tipo_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j820t_tipo_accion_co_tipo_accion_seq', 1, false);


--
-- TOC entry 3053 (class 0 OID 29029)
-- Dependencies: 303
-- Data for Name: j821t_estado_accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j821t_estado_accion (co_estado_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Abierto', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j821t_estado_accion (co_estado_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Gestionada', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j821t_estado_accion (co_estado_accion, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Cerrada', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 302
-- Name: j821t_estado_accion_co_estado_accion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j821t_estado_accion_co_estado_accion_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 29040)
-- Dependencies: 305
-- Data for Name: j822t_nivel_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j822t_nivel_riesgo (co_nivel_riesgo, tx_nivel_riesgo, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Alto', 4, 'Si durante el proceso de observación se encuentra una riesgo Alto, hay una fuerte necesidad de medidas correctivas. Un sistema existente puede continuar operativo, pero el plan de acción correctivo debe ser incorporado lo más pronto posible ', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j822t_nivel_riesgo (co_nivel_riesgo, tx_nivel_riesgo, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Bajo', 2, 'Si durante el proceso de observación es descrito el riego como Bajo, el personal de Control de Cambios de los sistemas debe determinar cuales son las acciones correctivas que se requieren o se decide asumir el riesgo', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j822t_nivel_riesgo (co_nivel_riesgo, tx_nivel_riesgo, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Medio', 3, 'Si durante el proceso de observación se determina el rango de riesgo Medio, las acciones correctivas son necesarias y un plan debe ser desarrollado para ser incorporado, estas acciones deben hacerse en un periodo de tiempo
razonable									PDV-PCP-FSTI-023.2: Informe de Análisis de Riesgo Lógico 			
', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 304
-- Name: j822t_nivel_riesgo_co_nivel_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j822t_nivel_riesgo_co_nivel_riesgo_seq', 1, false);


--
-- TOC entry 3057 (class 0 OID 29051)
-- Dependencies: 307
-- Data for Name: j823t_nivel_impacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j823t_nivel_impacto (co_nivel_impacto, tx_nivel_impacto, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Alto', 4, 'Al ocurrir una incidencia puede resultar en pérdidas altamente costosas de gran cantidad de activos o recursos y puede significativamente violar, dañar o impedir el cumplimiento de la misión de la organización, reputación o intereses', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j823t_nivel_impacto (co_nivel_impacto, tx_nivel_impacto, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Medio', 3, 'Al ocurrir una incidencia puede resultar en pérdidas costosas de activos o recursos puede violar, dañar o impedir el cumplimiento de la misión de la organización, reputación o intereses', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j823t_nivel_impacto (co_nivel_impacto, tx_nivel_impacto, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Bajo', 2, 'Al explotar una vulnerabilidad puede resultar en pérdidas de algunos activos o recursos puede afectar la misión de la organización, reputación o intereses', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 306
-- Name: j823t_nivel_impacto_co_nivel_impacto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j823t_nivel_impacto_co_nivel_impacto_seq', 1, false);


--
-- TOC entry 3059 (class 0 OID 29062)
-- Dependencies: 309
-- Data for Name: j824t_nivel_amenaza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j824t_nivel_amenaza (co_nivel_amenaza, tx_nivel_amenaza, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Alto', 4, 'La amenaza es alta (posee alta motivación y capacidad) y los controles para prevenir que la vulnerabilidad sea explotada son ineficientes o no existen', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j824t_nivel_amenaza (co_nivel_amenaza, tx_nivel_amenaza, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Bajo', 2, 'La amenaza es baja y los controles están en un lugar que previenen o al menos impiden significativamente que la vulnerabilidad sea explotada', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j824t_nivel_amenaza (co_nivel_amenaza, tx_nivel_amenaza, nu_valor, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Medio', 3, 'La amenaza es media, pero los controles están en un lugar que pueden impedir que sea explotada de manera exitosa la vulnerabilidad', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 308
-- Name: j824t_nivel_amenaza_co_nivel_amenaza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j824t_nivel_amenaza_co_nivel_amenaza_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 29074)
-- Dependencies: 311
-- Data for Name: j825t_matriz_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 1, 3, 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 1, 2, 2, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 1, 1, 1, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (4, 2, 3, 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (5, 2, 2, 2, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (6, 2, 1, 2, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (7, 3, 3, 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (8, 3, 2, 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j825t_matriz_riesgo (co_matriz_riesgo, co_impacto, co_amenaza, co_riesgo, created_at, updated_at, co_created_at, co_updated_at) VALUES (9, 3, 1, 3, '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 310
-- Name: j825t_matriz_riesgo_co_matriz_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j825t_matriz_riesgo_co_matriz_riesgo_seq', 1, false);


--
-- TOC entry 3063 (class 0 OID 29105)
-- Dependencies: 313
-- Data for Name: j826t_opciones_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j826t_opciones_riesgo (co_opciones_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (2, 'Evitar', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j826t_opciones_riesgo (co_opciones_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (1, 'Asumir', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j826t_opciones_riesgo (co_opciones_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (3, 'Reducir', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);
INSERT INTO j826t_opciones_riesgo (co_opciones_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at) VALUES (4, 'Transferir', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1);


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 312
-- Name: j826t_opciones_riesgo_co_opciones_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j826t_opciones_riesgo_co_opciones_riesgo_seq', 1, false);


--
-- TOC entry 3065 (class 0 OID 29116)
-- Dependencies: 315
-- Data for Name: j827t_tipo_riesgo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j827t_tipo_riesgo (co_tipo_riesgo, tx_tipo_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at, co_valor_riesgo) VALUES (1, 'Riesgo Potencial', 'Riesgo sin ningún tipo de medida/control de seguridad implementado', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 1);
INSERT INTO j827t_tipo_riesgo (co_tipo_riesgo, tx_tipo_riesgo, tx_descripcion, created_at, updated_at, co_created_at, co_updated_at, co_valor_riesgo) VALUES (2, 'Riesgo Residual', 'Resultado hipotético del riesgo una vez todas las medidas de seguridad son efectivas y eficaces, luego de su implementación', '2015-11-06 00:00:00-04:30', '2015-11-06 00:00:00-04:30', 1, 1, 3);


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 314
-- Name: j827t_tipo_riesgo_co_tipo_riesgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j827t_tipo_riesgo_co_tipo_riesgo_seq', 1, false);


--
-- TOC entry 3049 (class 0 OID 28992)
-- Dependencies: 299
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 298
-- Name: session_sess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_sess_id_seq', 1, false);


--
-- TOC entry 2642 (class 2606 OID 28276)
-- Name: co_lugar_seguro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT co_lugar_seguro PRIMARY KEY (co_lugar_seguro);


--
-- TOC entry 2521 (class 2606 OID 27032)
-- Name: j808t_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT j808t_producto_pkey PRIMARY KEY (co_producto);


--
-- TOC entry 2523 (class 2606 OID 27138)
-- Name: j809_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j809t_rol
    ADD CONSTRAINT j809_rol_pkey PRIMARY KEY (co_rol);


--
-- TOC entry 2527 (class 2606 OID 27162)
-- Name: j810t_rol_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT j810t_rol_producto_pkey PRIMARY KEY (co_rol_producto);


--
-- TOC entry 2539 (class 2606 OID 27225)
-- Name: j813t_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j813t_region
    ADD CONSTRAINT j813t_region_pkey PRIMARY KEY (co_region);


--
-- TOC entry 2541 (class 2606 OID 27237)
-- Name: j814t_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j814t_negocio
    ADD CONSTRAINT j814t_negocio_pkey PRIMARY KEY (co_negocio);


--
-- TOC entry 2543 (class 2606 OID 27248)
-- Name: j815t_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j815t_division
    ADD CONSTRAINT j815t_division_pkey PRIMARY KEY (co_division);


--
-- TOC entry 2557 (class 2606 OID 27847)
-- Name: pk_co_acc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT pk_co_acc PRIMARY KEY (co_acc);


--
-- TOC entry 2672 (class 2606 OID 28634)
-- Name: pk_co_acceso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j141t_tipo_acceso
    ADD CONSTRAINT pk_co_acceso PRIMARY KEY (co_acceso);


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 2672
-- Name: CONSTRAINT pk_co_acceso ON j141t_tipo_acceso; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_acceso ON j141t_tipo_acceso IS 'Clave primaria de la tabla tipo de acceso que se usa en la depuracion';


--
-- TOC entry 2630 (class 2606 OID 27938)
-- Name: pk_co_aie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT pk_co_aie PRIMARY KEY (co_aie);


--
-- TOC entry 2560 (class 2606 OID 27636)
-- Name: pk_co_alcance_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j001t_alcance_forense
    ADD CONSTRAINT pk_co_alcance_forense PRIMARY KEY (co_alcance_forense);


--
-- TOC entry 2656 (class 2606 OID 28829)
-- Name: pk_co_anexos_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT pk_co_anexos_forense PRIMARY KEY (co_anexos_forense);


--
-- TOC entry 2640 (class 2606 OID 28069)
-- Name: pk_co_anie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT pk_co_anie PRIMARY KEY (co_anie);


--
-- TOC entry 2690 (class 2606 OID 29006)
-- Name: pk_co_categoria_control; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j818t_categoria_control
    ADD CONSTRAINT pk_co_categoria_control PRIMARY KEY (co_categoria_control);


--
-- TOC entry 2514 (class 2606 OID 28385)
-- Name: pk_co_ciudad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j806t_ciudad
    ADD CONSTRAINT pk_co_ciudad PRIMARY KEY (co_ciudad);


--
-- TOC entry 2603 (class 2606 OID 27715)
-- Name: pk_co_clasificacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j802t_clasificacion
    ADD CONSTRAINT pk_co_clasificacion PRIMARY KEY (co_clasificacion);


--
-- TOC entry 2676 (class 2606 OID 28677)
-- Name: pk_co_criterio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j140t_criterio_depuracion
    ADD CONSTRAINT pk_co_criterio PRIMARY KEY (co_criterio);


--
-- TOC entry 2512 (class 2606 OID 26862)
-- Name: pk_co_depuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c140t_depuracion
    ADD CONSTRAINT pk_co_depuracion PRIMARY KEY (co_depuracion);


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 2512
-- Name: CONSTRAINT pk_co_depuracion ON c140t_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_depuracion ON c140t_depuracion IS 'Clave primaria de la tabla depuracion';


--
-- TOC entry 2698 (class 2606 OID 29037)
-- Name: pk_co_estado_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j821t_estado_accion
    ADD CONSTRAINT pk_co_estado_accion PRIMARY KEY (co_estado_accion);


--
-- TOC entry 2618 (class 2606 OID 27898)
-- Name: pk_co_estado_acta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j005t_estado_acta
    ADD CONSTRAINT pk_co_estado_acta PRIMARY KEY (co_estado_acta);


--
-- TOC entry 2696 (class 2606 OID 29017)
-- Name: pk_co_estado_control; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j819t_estado_control
    ADD CONSTRAINT pk_co_estado_control PRIMARY KEY (co_estado_control);


--
-- TOC entry 2674 (class 2606 OID 28636)
-- Name: pk_co_estado_depuracion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j142t_estado_depuracion
    ADD CONSTRAINT pk_co_estado_depuracion PRIMARY KEY (co_estado_depuracion);


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 2674
-- Name: CONSTRAINT pk_co_estado_depuracion ON j142t_estado_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_estado_depuracion ON j142t_estado_depuracion IS 'Clave primaria de la tabla de estado de depuracion';


--
-- TOC entry 2597 (class 2606 OID 27659)
-- Name: pk_co_estado_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j003t_estado_evidencia
    ADD CONSTRAINT pk_co_estado_evidencia PRIMARY KEY (co_estado_evidencia);


--
-- TOC entry 2600 (class 2606 OID 27670)
-- Name: pk_co_estado_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j004t_estado_forense
    ADD CONSTRAINT pk_co_estado_forense PRIMARY KEY (co_estado_forense);


--
-- TOC entry 2606 (class 2606 OID 27761)
-- Name: pk_co_estado_informe; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j803t_estado_informe
    ADD CONSTRAINT pk_co_estado_informe PRIMARY KEY (co_estado_informe);


--
-- TOC entry 2574 (class 2606 OID 28142)
-- Name: pk_co_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT pk_co_evidencia PRIMARY KEY (co_evidencia);


--
-- TOC entry 2660 (class 2606 OID 28800)
-- Name: pk_co_figuras_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT pk_co_figuras_forense PRIMARY KEY (co_figuras_forense);


--
-- TOC entry 2583 (class 2606 OID 27588)
-- Name: pk_co_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT pk_co_forense PRIMARY KEY (co_forense);


--
-- TOC entry 2663 (class 2606 OID 28298)
-- Name: pk_co_gerencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j804t_gerencia
    ADD CONSTRAINT pk_co_gerencia PRIMARY KEY (co_gerencia);


--
-- TOC entry 2686 (class 2606 OID 28908)
-- Name: pk_co_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c020t_incidente
    ADD CONSTRAINT pk_co_incidente PRIMARY KEY (co_incidente);


--
-- TOC entry 2615 (class 2606 OID 27772)
-- Name: pk_co_informe_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT pk_co_informe_forense PRIMARY KEY (co_informe_forense);


--
-- TOC entry 2517 (class 2606 OID 26944)
-- Name: pk_co_localidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j807t_localidad
    ADD CONSTRAINT pk_co_localidad PRIMARY KEY (co_localidad);


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 2517
-- Name: CONSTRAINT pk_co_localidad ON j807t_localidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_localidad ON j807t_localidad IS 'clave de la tabla';


--
-- TOC entry 2709 (class 2606 OID 29082)
-- Name: pk_co_matriz_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT pk_co_matriz_riesgo PRIMARY KEY (co_matriz_riesgo);


--
-- TOC entry 2704 (class 2606 OID 29070)
-- Name: pk_co_nivel_amenaza; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j824t_nivel_amenaza
    ADD CONSTRAINT pk_co_nivel_amenaza PRIMARY KEY (co_nivel_amenaza);


--
-- TOC entry 2702 (class 2606 OID 29059)
-- Name: pk_co_nivel_impacto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j823t_nivel_impacto
    ADD CONSTRAINT pk_co_nivel_impacto PRIMARY KEY (co_nivel_impacto);


--
-- TOC entry 2700 (class 2606 OID 29048)
-- Name: pk_co_nivel_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j822t_nivel_riesgo
    ADD CONSTRAINT pk_co_nivel_riesgo PRIMARY KEY (co_nivel_riesgo);


--
-- TOC entry 2678 (class 2606 OID 28798)
-- Name: pk_co_num_inventario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c060_inventario
    ADD CONSTRAINT pk_co_num_inventario PRIMARY KEY (co_num_inventario);


--
-- TOC entry 2711 (class 2606 OID 29113)
-- Name: pk_co_opciones_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j826t_opciones_riesgo
    ADD CONSTRAINT pk_co_opciones_riesgo PRIMARY KEY (co_opciones_riesgo);


--
-- TOC entry 2684 (class 2606 OID 28877)
-- Name: pk_co_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j801t_principio
    ADD CONSTRAINT pk_co_principio PRIMARY KEY (co_principio);


--
-- TOC entry 2668 (class 2606 OID 28573)
-- Name: pk_co_proceso_sti; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j817t_proceso_sti
    ADD CONSTRAINT pk_co_proceso_sti PRIMARY KEY (co_proceso_sti);


--
-- TOC entry 2670 (class 2606 OID 28632)
-- Name: pk_co_relacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c141t_rel_criterio_depuracion
    ADD CONSTRAINT pk_co_relacion PRIMARY KEY (co_relacion);


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 2670
-- Name: CONSTRAINT pk_co_relacion ON c141t_rel_criterio_depuracion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_co_relacion ON c141t_rel_criterio_depuracion IS 'Clave primaria de la tabla relacion criterio de depuracion';


--
-- TOC entry 2682 (class 2606 OID 28869)
-- Name: pk_co_relacion1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT pk_co_relacion1 PRIMARY KEY (co_relacion);


--
-- TOC entry 2588 (class 2606 OID 29184)
-- Name: pk_co_relacion10; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT pk_co_relacion10 PRIMARY KEY (co_relacion);


--
-- TOC entry 2688 (class 2606 OID 28916)
-- Name: pk_co_relacion2; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c806t_rel_transaccion_marco_normativo
    ADD CONSTRAINT pk_co_relacion2 PRIMARY KEY (co_relacion);


--
-- TOC entry 2652 (class 2606 OID 28356)
-- Name: pk_co_repositorio_digital; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT pk_co_repositorio_digital PRIMARY KEY (co_repositorio_digital);


--
-- TOC entry 2692 (class 2606 OID 29002)
-- Name: pk_co_tipo_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j820t_tipo_accion
    ADD CONSTRAINT pk_co_tipo_accion PRIMARY KEY (co_tipo_accion);


--
-- TOC entry 2594 (class 2606 OID 27648)
-- Name: pk_co_tipo_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_tipo_evidencia
    ADD CONSTRAINT pk_co_tipo_evidencia PRIMARY KEY (co_tipo_evidencia);


--
-- TOC entry 2666 (class 2606 OID 28408)
-- Name: pk_co_tipo_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j805t_tipo_recurso
    ADD CONSTRAINT pk_co_tipo_recurso PRIMARY KEY (co_tipo_recurso);


--
-- TOC entry 2714 (class 2606 OID 29124)
-- Name: pk_co_tipo_riesgo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j827t_tipo_riesgo
    ADD CONSTRAINT pk_co_tipo_riesgo PRIMARY KEY (co_tipo_riesgo);


--
-- TOC entry 2591 (class 2606 OID 27580)
-- Name: pk_co_transaccion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c801t_transaccion
    ADD CONSTRAINT pk_co_transaccion PRIMARY KEY (co_transaccion);


--
-- TOC entry 2531 (class 2606 OID 27194)
-- Name: pk_co_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT pk_co_usuario PRIMARY KEY (co_usuario);


--
-- TOC entry 2694 (class 2606 OID 29000)
-- Name: pk_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT pk_session_id PRIMARY KEY (sess_id);


--
-- TOC entry 2537 (class 2606 OID 27208)
-- Name: pks_co_persona; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT pks_co_persona PRIMARY KEY (co_persona);


--
-- TOC entry 2561 (class 1259 OID 28154)
-- Name: fki_co_acc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_acc ON c006t_evidencia USING btree (co_acc);


--
-- TOC entry 2562 (class 1259 OID 28160)
-- Name: fki_co_aie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aie ON c006t_evidencia USING btree (co_aie);


--
-- TOC entry 2575 (class 1259 OID 27676)
-- Name: fki_co_alcance_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_alcance_forense ON c001t_forense USING btree (co_alcance_forense);


--
-- TOC entry 2705 (class 1259 OID 29090)
-- Name: fki_co_amenaza; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_amenaza ON j825t_matriz_riesgo USING btree (co_amenaza);


--
-- TOC entry 2643 (class 1259 OID 28391)
-- Name: fki_co_ciudad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad ON j006t_lugar_seguro USING btree (co_ciudad);


--
-- TOC entry 2544 (class 1259 OID 28420)
-- Name: fki_co_ciudad3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad3 ON c003t_acta_acc USING btree (co_ciudad_acta);


--
-- TOC entry 2619 (class 1259 OID 28432)
-- Name: fki_co_ciudad_acta4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_ciudad_acta4 ON c004t_acta_aie USING btree (co_ciudad_acta);


--
-- TOC entry 2576 (class 1259 OID 27688)
-- Name: fki_co_clasificacion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion ON c001t_forense USING btree (co_clasificacion);


--
-- TOC entry 2563 (class 1259 OID 28215)
-- Name: fki_co_clasificacion0; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion0 ON c006t_evidencia USING btree (co_clasificacion);


--
-- TOC entry 2644 (class 1259 OID 28315)
-- Name: fki_co_clasificacion01; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion01 ON j006t_lugar_seguro USING btree (co_clasificacion);


--
-- TOC entry 2607 (class 1259 OID 27845)
-- Name: fki_co_clasificacion1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion1 ON c002t_informe_forense USING btree (co_clasificacion);


--
-- TOC entry 2657 (class 1259 OID 28827)
-- Name: fki_co_clasificacion100; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion100 ON c007t_figuras_forense USING btree (co_clasificacion);


--
-- TOC entry 2545 (class 1259 OID 27921)
-- Name: fki_co_clasificacion2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion2 ON c003t_acta_acc USING btree (co_clasificacion);


--
-- TOC entry 2653 (class 1259 OID 28846)
-- Name: fki_co_clasificacion200; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion200 ON c008t_anexos_forense USING btree (co_clasificacion);


--
-- TOC entry 2620 (class 1259 OID 27968)
-- Name: fki_co_clasificacion4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion4 ON c004t_acta_aie USING btree (co_clasificacion);


--
-- TOC entry 2631 (class 1259 OID 28100)
-- Name: fki_co_clasificacion5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_clasificacion5 ON c005t_acta_anie USING btree (co_clasificacion);


--
-- TOC entry 2564 (class 1259 OID 28166)
-- Name: fki_co_colecta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_colecta ON c006t_evidencia USING btree (co_colecta);


--
-- TOC entry 2565 (class 1259 OID 28922)
-- Name: fki_co_created_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at ON c006t_evidencia USING btree (co_created_at);


--
-- TOC entry 2645 (class 1259 OID 28287)
-- Name: fki_co_custodio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio ON j006t_lugar_seguro USING btree (co_custodio);


--
-- TOC entry 2566 (class 1259 OID 28354)
-- Name: fki_co_custodio02; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio02 ON c006t_evidencia USING btree (co_custodio);


--
-- TOC entry 2649 (class 1259 OID 28383)
-- Name: fki_co_custodio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio2 ON j007t_repositorio_digital USING btree (co_custodio);


--
-- TOC entry 2546 (class 1259 OID 28343)
-- Name: fki_co_custodio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio3 ON c003t_acta_acc USING btree (co_custodio);


--
-- TOC entry 2621 (class 1259 OID 28337)
-- Name: fki_co_custodio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio4 ON c004t_acta_aie USING btree (co_custodio);


--
-- TOC entry 2547 (class 1259 OID 27887)
-- Name: fki_co_destruye; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_destruye ON c003t_acta_acc USING btree (co_destruye);


--
-- TOC entry 2532 (class 1259 OID 27441)
-- Name: fki_co_division; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division ON j812_persona USING btree (co_division);


--
-- TOC entry 2577 (class 1259 OID 27628)
-- Name: fki_co_division1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division1 ON c001t_forense USING btree (co_division);


--
-- TOC entry 2584 (class 1259 OID 29202)
-- Name: fki_co_division10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division10 ON j816t_rel_region_negocio USING btree (co_division);


--
-- TOC entry 2608 (class 1259 OID 27815)
-- Name: fki_co_division2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division2 ON c002t_informe_forense USING btree (co_division);


--
-- TOC entry 2548 (class 1259 OID 27881)
-- Name: fki_co_division3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division3 ON c003t_acta_acc USING btree (co_division);


--
-- TOC entry 2622 (class 1259 OID 27962)
-- Name: fki_co_divison4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_divison4 ON c004t_acta_aie USING btree (co_division);


--
-- TOC entry 2632 (class 1259 OID 28101)
-- Name: fki_co_divison5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_divison5 ON c005t_acta_anie USING btree (co_division);


--
-- TOC entry 2549 (class 1259 OID 28117)
-- Name: fki_co_elabora; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora ON c003t_acta_acc USING btree (co_elabora);


--
-- TOC entry 2623 (class 1259 OID 28128)
-- Name: fki_co_elabora4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora4 ON c004t_acta_aie USING btree (co_elabora);


--
-- TOC entry 2633 (class 1259 OID 28140)
-- Name: fki_co_elabora5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elabora5 ON c005t_acta_anie USING btree (co_elabora);


--
-- TOC entry 2567 (class 1259 OID 28221)
-- Name: fki_co_entregado; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_entregado ON c006t_evidencia USING btree (co_entregado_fuera_sti);


--
-- TOC entry 2550 (class 1259 OID 27905)
-- Name: fki_co_estado_acta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_acta ON c003t_acta_acc USING btree (co_estado_acta);


--
-- TOC entry 2568 (class 1259 OID 28178)
-- Name: fki_co_estado_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_evidencia ON c006t_evidencia USING btree (co_estado_evidencia);


--
-- TOC entry 2609 (class 1259 OID 27821)
-- Name: fki_co_estado_informe; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_informe ON c002t_informe_forense USING btree (co_estado_informe);


--
-- TOC entry 2624 (class 1259 OID 27944)
-- Name: fki_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense ON c004t_acta_aie USING btree (co_forense);


--
-- TOC entry 2610 (class 1259 OID 28111)
-- Name: fki_co_forense1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense1 ON c002t_informe_forense USING btree (co_forense);


--
-- TOC entry 2679 (class 1259 OID 28875)
-- Name: fki_co_forense10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense10 ON c805t_rel_transaccion_principio USING btree (co_transaccion);


--
-- TOC entry 2634 (class 1259 OID 28102)
-- Name: fki_co_forense5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense5 ON c005t_acta_anie USING btree (co_forense);


--
-- TOC entry 2646 (class 1259 OID 28304)
-- Name: fki_co_gerencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_gerencia ON j006t_lugar_seguro USING btree (co_gerencia);


--
-- TOC entry 2650 (class 1259 OID 28367)
-- Name: fki_co_gerencia1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_gerencia1 ON j007t_repositorio_digital USING btree (co_gerencia);


--
-- TOC entry 2706 (class 1259 OID 29096)
-- Name: fki_co_impacto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_impacto ON j825t_matriz_riesgo USING btree (co_impacto);


--
-- TOC entry 2658 (class 1259 OID 28806)
-- Name: fki_co_informe_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense ON c007t_figuras_forense USING btree (co_informe_forense);


--
-- TOC entry 2654 (class 1259 OID 28835)
-- Name: fki_co_informe_forense200; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense200 ON c008t_anexos_forense USING btree (co_informe_forense);


--
-- TOC entry 2647 (class 1259 OID 28397)
-- Name: fki_co_localidad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_localidad ON j006t_lugar_seguro USING btree (co_localidad);


--
-- TOC entry 2533 (class 1259 OID 27467)
-- Name: fki_co_negocio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio ON j812_persona USING btree (co_negocio);


--
-- TOC entry 2578 (class 1259 OID 27617)
-- Name: fki_co_negocio1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio1 ON c001t_forense USING btree (co_negocio);


--
-- TOC entry 2585 (class 1259 OID 29196)
-- Name: fki_co_negocio10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio10 ON j816t_rel_region_negocio USING btree (co_negocio);


--
-- TOC entry 2611 (class 1259 OID 27804)
-- Name: fki_co_negocio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio2 ON c002t_informe_forense USING btree (co_negocio);


--
-- TOC entry 2551 (class 1259 OID 27875)
-- Name: fki_co_negocio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio3 ON c003t_acta_acc USING btree (co_negocio);


--
-- TOC entry 2625 (class 1259 OID 27956)
-- Name: fki_co_negocio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio4 ON c004t_acta_aie USING btree (co_negocio);


--
-- TOC entry 2635 (class 1259 OID 28103)
-- Name: fki_co_negocio5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio5 ON c005t_acta_anie USING btree (co_negocio);


--
-- TOC entry 2636 (class 1259 OID 28134)
-- Name: fki_co_niega; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_niega ON c005t_acta_anie USING btree (co_niega);


--
-- TOC entry 2528 (class 1259 OID 27214)
-- Name: fki_co_persona; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_persona ON j811t_usuario USING btree (co_persona);


--
-- TOC entry 2680 (class 1259 OID 28883)
-- Name: fki_co_princpio1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_princpio1 ON c805t_rel_transaccion_principio USING btree (co_principio);


--
-- TOC entry 2589 (class 1259 OID 27586)
-- Name: fki_co_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto ON c801t_transaccion USING btree (co_producto);


--
-- TOC entry 2518 (class 1259 OID 29179)
-- Name: fki_co_producto_padre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto_padre ON j808t_producto USING btree (co_padre);


--
-- TOC entry 2524 (class 1259 OID 27173)
-- Name: fki_co_producto_rol_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_producto_rol_producto ON j810t_rol_producto USING btree (co_rol);


--
-- TOC entry 2626 (class 1259 OID 28426)
-- Name: fki_co_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_recurso ON c004t_acta_aie USING btree (co_recurso);


--
-- TOC entry 2579 (class 1259 OID 27606)
-- Name: fki_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region ON c001t_forense USING btree (co_region);


--
-- TOC entry 2586 (class 1259 OID 29190)
-- Name: fki_co_region10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region10 ON j816t_rel_region_negocio USING btree (co_region);


--
-- TOC entry 2612 (class 1259 OID 27798)
-- Name: fki_co_region2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region2 ON c002t_informe_forense USING btree (co_region);


--
-- TOC entry 2552 (class 1259 OID 27864)
-- Name: fki_co_region3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region3 ON c003t_acta_acc USING btree (co_region);


--
-- TOC entry 2627 (class 1259 OID 27950)
-- Name: fki_co_region4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region4 ON c004t_acta_aie USING btree (co_region);


--
-- TOC entry 2637 (class 1259 OID 28104)
-- Name: fki_co_region5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region5 ON c005t_acta_anie USING btree (co_region);


--
-- TOC entry 2569 (class 1259 OID 28148)
-- Name: fki_co_registra; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_registra ON c006t_evidencia USING btree (co_registra);


--
-- TOC entry 2707 (class 1259 OID 29102)
-- Name: fki_co_riesgp; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_riesgp ON j825t_matriz_riesgo USING btree (co_riesgo);


--
-- TOC entry 2534 (class 1259 OID 27435)
-- Name: fki_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol ON j812_persona USING btree (co_rol);


--
-- TOC entry 2525 (class 1259 OID 27174)
-- Name: fki_co_rol_producto; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol_producto ON j810t_rol_producto USING btree (co_producto);


--
-- TOC entry 2570 (class 1259 OID 28172)
-- Name: fki_co_tipo_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_evidencia ON c006t_evidencia USING btree (co_tipo_evidencia);


--
-- TOC entry 2553 (class 1259 OID 28414)
-- Name: fki_co_tipo_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_recurso ON c003t_acta_acc USING btree (co_tipo_recurso);


--
-- TOC entry 2580 (class 1259 OID 27682)
-- Name: fki_co_transaccion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion ON c001t_forense USING btree (co_transaccion);


--
-- TOC entry 2648 (class 1259 OID 28326)
-- Name: fki_co_transaccion01; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion01 ON j006t_lugar_seguro USING btree (co_transaccion);


--
-- TOC entry 2558 (class 1259 OID 28443)
-- Name: fki_co_transaccion03; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion03 ON j001t_alcance_forense USING btree (co_transaccion);


--
-- TOC entry 2592 (class 1259 OID 28454)
-- Name: fki_co_transaccion04; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion04 ON j002t_tipo_evidencia USING btree (co_transaccion);


--
-- TOC entry 2595 (class 1259 OID 28460)
-- Name: fki_co_transaccion05; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion05 ON j003t_estado_evidencia USING btree (co_transaccion);


--
-- TOC entry 2598 (class 1259 OID 28471)
-- Name: fki_co_transaccion06; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion06 ON j004t_estado_forense USING btree (co_transaccion);


--
-- TOC entry 2616 (class 1259 OID 28482)
-- Name: fki_co_transaccion07; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion07 ON j005t_estado_acta USING btree (co_transaccion);


--
-- TOC entry 2601 (class 1259 OID 28488)
-- Name: fki_co_transaccion08; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion08 ON j802t_clasificacion USING btree (co_transaccion);


--
-- TOC entry 2604 (class 1259 OID 28499)
-- Name: fki_co_transaccion09; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion09 ON j803t_estado_informe USING btree (co_transaccion);


--
-- TOC entry 2571 (class 1259 OID 28189)
-- Name: fki_co_transaccion1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion1 ON c006t_evidencia USING btree (co_transaccion);


--
-- TOC entry 2661 (class 1259 OID 28510)
-- Name: fki_co_transaccion10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion10 ON j804t_gerencia USING btree (co_transaccion);


--
-- TOC entry 2664 (class 1259 OID 28545)
-- Name: fki_co_transaccion11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion11 ON j805t_tipo_recurso USING btree (co_transaccion);


--
-- TOC entry 2515 (class 1259 OID 28556)
-- Name: fki_co_transaccion14; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion14 ON j807t_localidad USING btree (co_transaccion);


--
-- TOC entry 2519 (class 1259 OID 28562)
-- Name: fki_co_transaccion15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion15 ON j808t_producto USING btree (co_transaccion);


--
-- TOC entry 2613 (class 1259 OID 27834)
-- Name: fki_co_transaccion2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion2 ON c002t_informe_forense USING btree (co_transaccion);


--
-- TOC entry 2554 (class 1259 OID 27927)
-- Name: fki_co_transaccion3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion3 ON c003t_acta_acc USING btree (co_transaccion);


--
-- TOC entry 2628 (class 1259 OID 27974)
-- Name: fki_co_transaccion4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion4 ON c004t_acta_aie USING btree (co_transaccion);


--
-- TOC entry 2638 (class 1259 OID 28105)
-- Name: fki_co_transaccion5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion5 ON c005t_acta_anie USING btree (co_transaccion);


--
-- TOC entry 2572 (class 1259 OID 28928)
-- Name: fki_co_udared_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_udared_at ON c006t_evidencia USING btree (co_updated_at);


--
-- TOC entry 2712 (class 1259 OID 29130)
-- Name: fki_co_valor_riesgo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_valor_riesgo ON j827t_tipo_riesgo USING btree (co_valor_riesgo);


--
-- TOC entry 2581 (class 1259 OID 27704)
-- Name: fki_estado_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_estado_forense ON c001t_forense USING btree (co_estado_forense);


--
-- TOC entry 2535 (class 1259 OID 27461)
-- Name: fki_fks_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_fks_co_region ON j812_persona USING btree (co_region);


--
-- TOC entry 2529 (class 1259 OID 27330)
-- Name: fki_fks_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_fks_co_rol ON j811t_usuario USING btree (co_rol);


--
-- TOC entry 2555 (class 1259 OID 27853)
-- Name: fki_pk_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_pk_co_forense ON c003t_acta_acc USING btree (co_forense);


--
-- TOC entry 2813 (class 2620 OID 28582)
-- Name: actualizar_privilegio; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizar_privilegio AFTER UPDATE ON j810t_rol_producto FOR EACH ROW EXECUTE PROCEDURE actualizar_menu();


--
-- TOC entry 2736 (class 2606 OID 28415)
-- Name: co_ciudad3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT co_ciudad3 FOREIGN KEY (co_ciudad_acta) REFERENCES j806t_ciudad(co_ciudad);


--
-- TOC entry 2727 (class 2606 OID 27859)
-- Name: co_region3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT co_region3 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2740 (class 2606 OID 28149)
-- Name: fk_co_acc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_acc FOREIGN KEY (co_acc) REFERENCES c003t_acta_acc(co_acc);


--
-- TOC entry 2741 (class 2606 OID 28155)
-- Name: fk_co_aie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_aie FOREIGN KEY (co_aie) REFERENCES c004t_acta_aie(co_aie);


--
-- TOC entry 2753 (class 2606 OID 27689)
-- Name: fk_co_alcance_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_alcance_forense FOREIGN KEY (co_alcance_forense) REFERENCES j001t_alcance_forense(co_alcance_forense);


--
-- TOC entry 2811 (class 2606 OID 29085)
-- Name: fk_co_amenaza; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_amenaza FOREIGN KEY (co_amenaza) REFERENCES j824t_nivel_amenaza(co_nivel_amenaza);


--
-- TOC entry 2796 (class 2606 OID 28386)
-- Name: fk_co_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_ciudad FOREIGN KEY (co_ciudad) REFERENCES j806t_ciudad(co_ciudad);


--
-- TOC entry 2783 (class 2606 OID 28427)
-- Name: fk_co_ciudad_acta4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_ciudad_acta4 FOREIGN KEY (co_ciudad_acta) REFERENCES j806t_ciudad(co_ciudad);


--
-- TOC entry 2746 (class 2606 OID 28210)
-- Name: fk_co_clasificacion0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_clasificacion0 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2795 (class 2606 OID 28310)
-- Name: fk_co_clasificacion01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_clasificacion01 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2755 (class 2606 OID 27716)
-- Name: fk_co_clasificacion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_clasificacion1 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2802 (class 2606 OID 28822)
-- Name: fk_co_clasificacion100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT fk_co_clasificacion100 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2770 (class 2606 OID 27840)
-- Name: fk_co_clasificacion2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_clasificacion2 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2800 (class 2606 OID 28841)
-- Name: fk_co_clasificacion200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT fk_co_clasificacion200 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2734 (class 2606 OID 27916)
-- Name: fk_co_clasificacion3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_clasificacion3 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2778 (class 2606 OID 27963)
-- Name: fk_co_clasificacion4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_clasificacion4 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2785 (class 2606 OID 28070)
-- Name: fk_co_clasificacion5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_clasificacion5 FOREIGN KEY (co_clasificacion) REFERENCES j802t_clasificacion(co_clasificacion);


--
-- TOC entry 2742 (class 2606 OID 28161)
-- Name: fk_co_colecta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_colecta FOREIGN KEY (co_colecta) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2748 (class 2606 OID 28917)
-- Name: fk_co_created_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_created_at FOREIGN KEY (co_created_at) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2793 (class 2606 OID 28282)
-- Name: fk_co_custodio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_custodio FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2738 (class 2606 OID 28349)
-- Name: fk_co_custodio02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_custodio02 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2799 (class 2606 OID 28378)
-- Name: fk_co_custodio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT fk_co_custodio2 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2726 (class 2606 OID 28338)
-- Name: fk_co_custodio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_custodio3 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2774 (class 2606 OID 28332)
-- Name: fk_co_custodio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_custodio4 FOREIGN KEY (co_custodio) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2730 (class 2606 OID 27882)
-- Name: fk_co_destruye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_destruye FOREIGN KEY (co_destruye) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2723 (class 2606 OID 27436)
-- Name: fk_co_division; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_division FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2751 (class 2606 OID 27623)
-- Name: fk_co_division1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_division1 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2757 (class 2606 OID 29197)
-- Name: fk_co_division10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_division10 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2768 (class 2606 OID 27810)
-- Name: fk_co_division2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_division2 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2729 (class 2606 OID 27876)
-- Name: fk_co_division3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_division3 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2777 (class 2606 OID 27957)
-- Name: fk_co_divison4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_divison4 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2786 (class 2606 OID 28075)
-- Name: fk_co_divison5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_divison5 FOREIGN KEY (co_division) REFERENCES j815t_division(co_division);


--
-- TOC entry 2781 (class 2606 OID 28123)
-- Name: fk_co_elabora4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_elabora4 FOREIGN KEY (co_elabora) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2791 (class 2606 OID 28135)
-- Name: fk_co_elabora5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_elabora5 FOREIGN KEY (co_elabora) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2747 (class 2606 OID 28216)
-- Name: fk_co_entregado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_entregado FOREIGN KEY (co_entregado_fuera_sti) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2731 (class 2606 OID 27900)
-- Name: fk_co_estado_acta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_estado_acta FOREIGN KEY (co_estado_acta) REFERENCES j005t_estado_acta(co_estado_acta);


--
-- TOC entry 2744 (class 2606 OID 28173)
-- Name: fk_co_estado_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_estado_evidencia FOREIGN KEY (co_estado_evidencia) REFERENCES j003t_estado_evidencia(co_estado_evidencia);


--
-- TOC entry 2772 (class 2606 OID 28270)
-- Name: fk_co_estado_informe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_estado_informe FOREIGN KEY (co_estado_informe) REFERENCES j803t_estado_informe(co_estado_informe);


--
-- TOC entry 2771 (class 2606 OID 28106)
-- Name: fk_co_forense2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_forense2 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- TOC entry 2780 (class 2606 OID 27939)
-- Name: fk_co_forense4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_forense4 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- TOC entry 2787 (class 2606 OID 28080)
-- Name: fk_co_forense5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_forense5 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- TOC entry 2794 (class 2606 OID 28299)
-- Name: fk_co_gerencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_gerencia FOREIGN KEY (co_gerencia) REFERENCES j804t_gerencia(co_gerencia);


--
-- TOC entry 2798 (class 2606 OID 28362)
-- Name: fk_co_gerencia1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_repositorio_digital
    ADD CONSTRAINT fk_co_gerencia1 FOREIGN KEY (co_gerencia) REFERENCES j804t_gerencia(co_gerencia);


--
-- TOC entry 2810 (class 2606 OID 29091)
-- Name: fk_co_impacto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_impacto FOREIGN KEY (co_impacto) REFERENCES j823t_nivel_impacto(co_nivel_impacto);


--
-- TOC entry 2803 (class 2606 OID 28801)
-- Name: fk_co_informe_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c007t_figuras_forense
    ADD CONSTRAINT fk_co_informe_forense FOREIGN KEY (co_informe_forense) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- TOC entry 2801 (class 2606 OID 28830)
-- Name: fk_co_informe_forense200; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c008t_anexos_forense
    ADD CONSTRAINT fk_co_informe_forense200 FOREIGN KEY (co_informe_forense) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- TOC entry 2797 (class 2606 OID 28392)
-- Name: fk_co_localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_localidad FOREIGN KEY (co_localidad) REFERENCES j807t_localidad(co_localidad);


--
-- TOC entry 2725 (class 2606 OID 27462)
-- Name: fk_co_negocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_negocio FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2750 (class 2606 OID 27612)
-- Name: fk_co_negocio1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_negocio1 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2758 (class 2606 OID 29191)
-- Name: fk_co_negocio10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_negocio10 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2767 (class 2606 OID 27799)
-- Name: fk_co_negocio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_negocio2 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2728 (class 2606 OID 27870)
-- Name: fk_co_negocio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_negocio3 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2776 (class 2606 OID 27951)
-- Name: fk_co_negocio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_negocio4 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2788 (class 2606 OID 28085)
-- Name: fk_co_negocio5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_negocio5 FOREIGN KEY (co_negocio) REFERENCES j814t_negocio(co_negocio);


--
-- TOC entry 2784 (class 2606 OID 28327)
-- Name: fk_co_niega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_niega FOREIGN KEY (co_niega) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2720 (class 2606 OID 27209)
-- Name: fk_co_persona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT fk_co_persona FOREIGN KEY (co_persona) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2808 (class 2606 OID 28878)
-- Name: fk_co_princpio1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT fk_co_princpio1 FOREIGN KEY (co_principio) REFERENCES j801t_principio(co_principio);


--
-- TOC entry 2760 (class 2606 OID 27581)
-- Name: fk_co_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c801t_transaccion
    ADD CONSTRAINT fk_co_producto FOREIGN KEY (co_producto) REFERENCES j808t_producto(co_producto);


--
-- TOC entry 2716 (class 2606 OID 29174)
-- Name: fk_co_producto_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT fk_co_producto_padre FOREIGN KEY (co_padre) REFERENCES j808t_producto(co_producto);


--
-- TOC entry 2718 (class 2606 OID 27163)
-- Name: fk_co_producto_rol_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT fk_co_producto_rol_producto FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- TOC entry 2782 (class 2606 OID 28421)
-- Name: fk_co_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_recurso FOREIGN KEY (co_recurso) REFERENCES j805t_tipo_recurso(co_tipo_recurso);


--
-- TOC entry 2752 (class 2606 OID 27601)
-- Name: fk_co_region1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_region1 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2759 (class 2606 OID 29185)
-- Name: fk_co_region10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j816t_rel_region_negocio
    ADD CONSTRAINT fk_co_region10 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2766 (class 2606 OID 27793)
-- Name: fk_co_region2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_region2 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2775 (class 2606 OID 27945)
-- Name: fk_co_region4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_region4 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2789 (class 2606 OID 28090)
-- Name: fk_co_region5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_region5 FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2739 (class 2606 OID 28143)
-- Name: fk_co_registra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_registra FOREIGN KEY (co_registra) REFERENCES j811t_usuario(co_usuario);


--
-- TOC entry 2809 (class 2606 OID 29097)
-- Name: fk_co_riesgp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j825t_matriz_riesgo
    ADD CONSTRAINT fk_co_riesgp FOREIGN KEY (co_riesgo) REFERENCES j822t_nivel_riesgo(co_nivel_riesgo);


--
-- TOC entry 2722 (class 2606 OID 27430)
-- Name: fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- TOC entry 2719 (class 2606 OID 27168)
-- Name: fk_co_rol_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j810t_rol_producto
    ADD CONSTRAINT fk_co_rol_producto FOREIGN KEY (co_producto) REFERENCES j808t_producto(co_producto);


--
-- TOC entry 2743 (class 2606 OID 28167)
-- Name: fk_co_tipo_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_tipo_evidencia FOREIGN KEY (co_tipo_evidencia) REFERENCES j002t_tipo_evidencia(co_tipo_evidencia);


--
-- TOC entry 2735 (class 2606 OID 28409)
-- Name: fk_co_tipo_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_tipo_recurso FOREIGN KEY (co_tipo_recurso) REFERENCES j805t_tipo_recurso(co_tipo_recurso);


--
-- TOC entry 2792 (class 2606 OID 28321)
-- Name: fk_co_transaccion01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_lugar_seguro
    ADD CONSTRAINT fk_co_transaccion01 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2737 (class 2606 OID 28438)
-- Name: fk_co_transaccion03; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_alcance_forense
    ADD CONSTRAINT fk_co_transaccion03 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2761 (class 2606 OID 28449)
-- Name: fk_co_transaccion04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_tipo_evidencia
    ADD CONSTRAINT fk_co_transaccion04 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2762 (class 2606 OID 28455)
-- Name: fk_co_transaccion05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_estado_evidencia
    ADD CONSTRAINT fk_co_transaccion05 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2763 (class 2606 OID 28466)
-- Name: fk_co_transaccion06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_estado_forense
    ADD CONSTRAINT fk_co_transaccion06 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2773 (class 2606 OID 28477)
-- Name: fk_co_transaccion07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_estado_acta
    ADD CONSTRAINT fk_co_transaccion07 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2764 (class 2606 OID 28483)
-- Name: fk_co_transaccion08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j802t_clasificacion
    ADD CONSTRAINT fk_co_transaccion08 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2765 (class 2606 OID 28494)
-- Name: fk_co_transaccion09; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j803t_estado_informe
    ADD CONSTRAINT fk_co_transaccion09 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2756 (class 2606 OID 27694)
-- Name: fk_co_transaccion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_co_transaccion1 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2745 (class 2606 OID 28184)
-- Name: fk_co_transaccion1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_transaccion1 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2804 (class 2606 OID 28505)
-- Name: fk_co_transaccion10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j804t_gerencia
    ADD CONSTRAINT fk_co_transaccion10 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2805 (class 2606 OID 28540)
-- Name: fk_co_transaccion11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j805t_tipo_recurso
    ADD CONSTRAINT fk_co_transaccion11 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2715 (class 2606 OID 28551)
-- Name: fk_co_transaccion14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j807t_localidad
    ADD CONSTRAINT fk_co_transaccion14 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2717 (class 2606 OID 28557)
-- Name: fk_co_transaccion15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j808t_producto
    ADD CONSTRAINT fk_co_transaccion15 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2806 (class 2606 OID 28574)
-- Name: fk_co_transaccion17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j817t_proceso_sti
    ADD CONSTRAINT fk_co_transaccion17 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2769 (class 2606 OID 27829)
-- Name: fk_co_transaccion2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c002t_informe_forense
    ADD CONSTRAINT fk_co_transaccion2 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2732 (class 2606 OID 27922)
-- Name: fk_co_transaccion3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT fk_co_transaccion3 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2779 (class 2606 OID 27969)
-- Name: fk_co_transaccion4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie
    ADD CONSTRAINT fk_co_transaccion4 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2790 (class 2606 OID 28095)
-- Name: fk_co_transaccion5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c005t_acta_anie
    ADD CONSTRAINT fk_co_transaccion5 FOREIGN KEY (co_transaccion) REFERENCES c801t_transaccion(co_transaccion);


--
-- TOC entry 2749 (class 2606 OID 28923)
-- Name: fk_co_udared_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c006t_evidencia
    ADD CONSTRAINT fk_co_udared_at FOREIGN KEY (co_updated_at) REFERENCES j812_persona(co_persona);


--
-- TOC entry 2812 (class 2606 OID 29125)
-- Name: fk_co_valor_riesgo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j827t_tipo_riesgo
    ADD CONSTRAINT fk_co_valor_riesgo FOREIGN KEY (co_valor_riesgo) REFERENCES j822t_nivel_riesgo(co_nivel_riesgo);


--
-- TOC entry 2754 (class 2606 OID 27699)
-- Name: fk_estado_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c001t_forense
    ADD CONSTRAINT fk_estado_forense FOREIGN KEY (co_estado_forense) REFERENCES j004t_estado_forense(co_estado_forense);


--
-- TOC entry 2807 (class 2606 OID 28884)
-- Name: fk_informe_forense_principio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c805t_rel_transaccion_principio
    ADD CONSTRAINT fk_informe_forense_principio FOREIGN KEY (co_transaccion) REFERENCES c002t_informe_forense(co_informe_forense);


--
-- TOC entry 2724 (class 2606 OID 27456)
-- Name: fks_co_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j812_persona
    ADD CONSTRAINT fks_co_region FOREIGN KEY (co_region) REFERENCES j813t_region(co_region);


--
-- TOC entry 2721 (class 2606 OID 27325)
-- Name: fks_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j811t_usuario
    ADD CONSTRAINT fks_co_rol FOREIGN KEY (co_rol) REFERENCES j809t_rol(co_rol);


--
-- TOC entry 2733 (class 2606 OID 27848)
-- Name: pk_co_forense3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c003t_acta_acc
    ADD CONSTRAINT pk_co_forense3 FOREIGN KEY (co_forense) REFERENCES c001t_forense(co_forense);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-13 09:12:49 VET

--
-- PostgreSQL database dump complete
--

