--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-11 14:46:04 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE sti;
--
-- TOC entry 2820 (class 1262 OID 16384)
-- Name: sti; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sti WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';


ALTER DATABASE sti OWNER TO postgres;

\connect sti

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 250 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 250
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 248 (class 1259 OID 27318)
-- Name: c004t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c004t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    in_registro boolean,
    tx_cladificacion character varying
);


ALTER TABLE public.c004t_acta_aie OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 27316)
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
-- TOC entry 2824 (class 0 OID 0)
-- Dependencies: 247
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c004t_acta_aie_co_aie_seq OWNED BY c004t_acta_aie.co_aie;


--
-- TOC entry 212 (class 1259 OID 25539)
-- Name: c024t_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE c024t_recurso (
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint,
    co_recurso bigint NOT NULL
);


ALTER TABLE public.c024t_recurso OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 26770)
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE c024t_recurso_co_recurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.c024t_recurso_co_recurso_seq OWNER TO postgres;

--
-- TOC entry 2825 (class 0 OID 0)
-- Dependencies: 246
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE c024t_recurso_co_recurso_seq OWNED BY c024t_recurso.co_recurso;


--
-- TOC entry 249 (class 1259 OID 27351)
-- Name: j001t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying
);


ALTER TABLE public.j001t_alcance_forense OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16385)
-- Name: j001t_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j001t_menu (
    co_menu bigint NOT NULL,
    tx_menu character varying,
    co_padre bigint,
    tx_href character varying,
    tx_icono character varying,
    nu_orden bigint,
    tx_sigla character varying
);


ALTER TABLE public.j001t_menu OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16388)
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j001t_menu_co_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j001t_menu_co_menu_seq OWNER TO postgres;

--
-- TOC entry 2826 (class 0 OID 0)
-- Dependencies: 171
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j001t_menu_co_menu_seq OWNED BY j001t_menu.co_menu;


--
-- TOC entry 172 (class 1259 OID 16399)
-- Name: j002t_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j002t_usuario (
    co_usuario bigint NOT NULL,
    tx_indicador character varying,
    nb_empleado character varying,
    ap_empleado character varying,
    co_division bigint,
    co_rol bigint,
    co_region bigint,
    co_negocio bigint
);


ALTER TABLE public.j002t_usuario OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16402)
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j002t_usuario_co_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j002t_usuario_co_usuario_seq OWNER TO postgres;

--
-- TOC entry 2827 (class 0 OID 0)
-- Dependencies: 173
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j002t_usuario_co_usuario_seq OWNED BY j002t_usuario.co_usuario;


--
-- TOC entry 174 (class 1259 OID 16413)
-- Name: j003t_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j003t_rol (
    co_rol bigint NOT NULL,
    tx_rol character varying
);


ALTER TABLE public.j003t_rol OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16416)
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j003_rol_co_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j003_rol_co_rol_seq OWNER TO postgres;

--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 175
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j003_rol_co_rol_seq OWNED BY j003t_rol.co_rol;


--
-- TOC entry 176 (class 1259 OID 16427)
-- Name: j004t_rol_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j004t_rol_menu (
    co_rol_menu bigint NOT NULL,
    co_rol bigint,
    co_menu bigint,
    in_ver boolean
);


ALTER TABLE public.j004t_rol_menu OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16430)
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j004t_rol_menu_co_rol_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j004t_rol_menu_co_rol_menu_seq OWNER TO postgres;

--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 177
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j004t_rol_menu_co_rol_menu_seq OWNED BY j004t_rol_menu.co_rol_menu;


--
-- TOC entry 178 (class 1259 OID 16436)
-- Name: j005t_transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j005t_transaccion (
    co_transaccion bigint NOT NULL,
    fe_transaccion date,
    co_usuario bigint,
    tx_ruta character varying,
    nb_archivo character varying
);


ALTER TABLE public.j005t_transaccion OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16439)
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j005t_transaccion_co_transaccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j005t_transaccion_co_transaccion_seq OWNER TO postgres;

--
-- TOC entry 2830 (class 0 OID 0)
-- Dependencies: 179
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j005t_transaccion_co_transaccion_seq OWNED BY j005t_transaccion.co_transaccion;


--
-- TOC entry 180 (class 1259 OID 16445)
-- Name: j006t_solicitud; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j006t_solicitud (
    co_solicitud bigint NOT NULL,
    tx_serial character varying,
    tx_solicitud character varying,
    fe_solicitud date,
    co_tipo_solicitud bigint,
    archivo bytea,
    mime character varying,
    co_transaccion bigint,
    co_usuario bigint,
    co_region bigint,
    tx_ruta character varying,
    nb_archivo character varying
);


ALTER TABLE public.j006t_solicitud OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16450)
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j006t_solicitud_co_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j006t_solicitud_co_solicitud_seq OWNER TO postgres;

--
-- TOC entry 2831 (class 0 OID 0)
-- Dependencies: 181
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j006t_solicitud_co_solicitud_seq OWNED BY j006t_solicitud.co_solicitud;


--
-- TOC entry 182 (class 1259 OID 16460)
-- Name: j007t_region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j007t_region (
    co_region bigint NOT NULL,
    tx_region character varying,
    tx_sigla character varying
);


ALTER TABLE public.j007t_region OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16463)
-- Name: j007t_region_co_region_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j007t_region_co_region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j007t_region_co_region_seq OWNER TO postgres;

--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 183
-- Name: j007t_region_co_region_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j007t_region_co_region_seq OWNED BY j007t_region.co_region;


--
-- TOC entry 184 (class 1259 OID 16474)
-- Name: j008t_division; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j008t_division (
    co_division bigint NOT NULL,
    tx_division character varying,
    tx_sigla character varying,
    co_negocio bigint
);


ALTER TABLE public.j008t_division OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16477)
-- Name: j008t_division_co_division_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j008t_division_co_division_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j008t_division_co_division_seq OWNER TO postgres;

--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 185
-- Name: j008t_division_co_division_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j008t_division_co_division_seq OWNED BY j008t_division.co_division;


--
-- TOC entry 186 (class 1259 OID 16500)
-- Name: j009t_serial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j009t_serial (
    co_tp_documento bigint,
    nu_serial bigint,
    nu_anio numeric,
    co_serial bigint NOT NULL,
    tx_nomenclatura character varying,
    co_region bigint
);


ALTER TABLE public.j009t_serial OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16560)
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j009t_serial_co_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j009t_serial_co_serial_seq OWNER TO postgres;

--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 187
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j009t_serial_co_serial_seq OWNED BY j009t_serial.co_serial;


--
-- TOC entry 188 (class 1259 OID 16595)
-- Name: j010t_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j010t_evaluacion (
    co_evaluacion bigint NOT NULL,
    tx_serial character varying,
    tx_titulo character varying,
    fe_evaluacion date,
    co_transaccion bigint,
    co_usuario bigint,
    co_region bigint,
    tx_ruta character varying,
    nb_archivo character varying,
    co_solicitud bigint
);


ALTER TABLE public.j010t_evaluacion OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16598)
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j010t_evaluacion_co_evaluacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j010t_evaluacion_co_evaluacion_seq OWNER TO postgres;

--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 189
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j010t_evaluacion_co_evaluacion_seq OWNED BY j010t_evaluacion.co_evaluacion;


--
-- TOC entry 190 (class 1259 OID 16641)
-- Name: j011t_vulnerabilidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j011t_vulnerabilidad (
    co_vulnerabilidad bigint NOT NULL,
    tx_vulnerabilidad character varying,
    fe_vulnerabilidad date,
    co_transaccion bigint NOT NULL,
    in_aplicacion boolean,
    in_cerrado boolean
);


ALTER TABLE public.j011t_vulnerabilidad OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16644)
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j011t_vulnerabilidad_co_vulnerabilidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j011t_vulnerabilidad_co_vulnerabilidad_seq OWNER TO postgres;

--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 191
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j011t_vulnerabilidad_co_vulnerabilidad_seq OWNED BY j011t_vulnerabilidad.co_vulnerabilidad;


--
-- TOC entry 192 (class 1259 OID 16676)
-- Name: j012t_cronograma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j012t_cronograma (
    co_cronograma bigint NOT NULL,
    tx_descripcion character varying,
    fe_cronograma date,
    co_transaccion_enlace bigint,
    co_transaccion bigint,
    tx_serial character varying,
    co_usuario bigint
);


ALTER TABLE public.j012t_cronograma OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16679)
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j012t_cronograma_co_cronograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j012t_cronograma_co_cronograma_seq OWNER TO postgres;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 193
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j012t_cronograma_co_cronograma_seq OWNED BY j012t_cronograma.co_cronograma;


--
-- TOC entry 194 (class 1259 OID 16708)
-- Name: j013t_vul_cronograma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j013t_vul_cronograma (
    co_vulnerabilidad bigint NOT NULL,
    co_cronograma bigint NOT NULL,
    in_cerrada boolean,
    co_vul_cronograma bigint NOT NULL
);


ALTER TABLE public.j013t_vul_cronograma OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16713)
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j013t_vul_cronograma_co_vul_cronograma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j013t_vul_cronograma_co_vul_cronograma_seq OWNER TO postgres;

--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 195
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j013t_vul_cronograma_co_vul_cronograma_seq OWNED BY j013t_vul_cronograma.co_vul_cronograma;


--
-- TOC entry 197 (class 1259 OID 24870)
-- Name: j014t_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j014t_negocio (
    co_negocio bigint NOT NULL,
    tx_negocio character varying,
    tx_sigla character varying
);


ALTER TABLE public.j014t_negocio OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24868)
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j014t_negocio_co_negocio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j014t_negocio_co_negocio_seq OWNER TO postgres;

--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 196
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j014t_negocio_co_negocio_seq OWNED BY j014t_negocio.co_negocio;


--
-- TOC entry 198 (class 1259 OID 24916)
-- Name: j015t_region_negocio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j015t_region_negocio (
    co_region bigint NOT NULL,
    co_negocio bigint NOT NULL,
    co_region_negocio bigint NOT NULL,
    co_division bigint
);


ALTER TABLE public.j015t_region_negocio OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24932)
-- Name: j016t_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j016t_forense (
    co_forense bigint NOT NULL,
    fe_apertura date,
    fe_cierre date,
    co_usuario_apertura bigint,
    co_usuario_cierre bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    in_abierto boolean,
    tx_descripcion_solicitud character varying,
    tx_caso_aaii character varying,
    co_alcance_forense bigint,
    tx_descripcion_entorno character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j016t_forense OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24935)
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j016t_forense_co_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j016t_forense_co_forense_seq OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 200
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j016t_forense_co_forense_seq OWNED BY j016t_forense.co_forense;


--
-- TOC entry 201 (class 1259 OID 24946)
-- Name: j017t_alcance_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j017t_alcance_forense (
    co_alcance_forense bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j017t_alcance_forense OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24959)
-- Name: j018t_informe_forense; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j018t_informe_forense (
    co_informe_forense bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_revisa bigint,
    co_aprueba bigint,
    tx_resultados character varying,
    tx_conclusiones character varying,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j018t_informe_forense OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24957)
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j018t_informe_forense_co_informe_forense_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j018t_informe_forense_co_informe_forense_seq OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 202
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j018t_informe_forense_co_informe_forense_seq OWNED BY j018t_informe_forense.co_informe_forense;


--
-- TOC entry 204 (class 1259 OID 25116)
-- Name: j019t_participantes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j019t_participantes (
    co_participante bigint NOT NULL,
    co_usuario_elabora bigint,
    co_forense bigint,
    co_informe_recomendaciones bigint,
    co_informe_incidente bigint,
    co_informe_forense bigint,
    co_informe_depuracion bigint,
    co_mantenimiento bigint,
    co_doumento_normativo bigint
);


ALTER TABLE public.j019t_participantes OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25201)
-- Name: j020t_acta_acc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j020t_acta_acc (
    co_acc bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    fe_destruye date,
    co_destruye bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    in_abierta boolean
);


ALTER TABLE public.j020t_acta_acc OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25199)
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j020t_acta_acc_co_acc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j020t_acta_acc_co_acc_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 205
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j020t_acta_acc_co_acc_seq OWNED BY j020t_acta_acc.co_acc;


--
-- TOC entry 208 (class 1259 OID 25259)
-- Name: j021t_acta_aie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j021t_acta_aie (
    co_aie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j021t_acta_aie OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25257)
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j021t_acta_aie_co_aie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j021t_acta_aie_co_aie_seq OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 207
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j021t_acta_aie_co_aie_seq OWNED BY j021t_acta_aie.co_aie;


--
-- TOC entry 210 (class 1259 OID 25364)
-- Name: j022t_acta_anie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j022t_acta_anie (
    co_anie bigint NOT NULL,
    fe_emision date,
    co_forense bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_elabora bigint,
    co_custodio_niega bigint,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    in_abierta boolean
);


ALTER TABLE public.j022t_acta_anie OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25362)
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j022t_acta_anie_co_anie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j022t_acta_anie_co_anie_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 209
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j022t_acta_anie_co_anie_seq OWNED BY j022t_acta_anie.co_anie;


--
-- TOC entry 211 (class 1259 OID 25419)
-- Name: j023t_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j023t_evidencia (
    co_evidencia bigint NOT NULL,
    fe_registro date,
    co_registro bigint,
    co_acc bigint,
    co_aie bigint,
    tx_descripcion_coleccion text,
    fe_coleccion_evidencia date,
    co_colecta bigint,
    co_recurso bigint,
    tx_nombre_recurso bigint,
    tx_serial_recurso bigint,
    tx_marca_recurso text,
    tx_modelo_recurso bigint,
    tx_numero_activo bigint,
    co_tipo_evidencia bigint,
    co_estado_evidencia bigint,
    co_lugar_seguro bigint,
    co_repositorio bigint,
    co_custodio_sti bigint,
    tx_observaciones text,
    update_at timestamp without time zone,
    co_update_at bigint
);


ALTER TABLE public.j023t_evidencia OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25565)
-- Name: j025t_tipo_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j025t_tipo_evidencia (
    co_tipo_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j025t_tipo_evidencia OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25585)
-- Name: j026t_estado_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j026t_estado_evidencia (
    co_estado_evidencia bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j026t_estado_evidencia OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25618)
-- Name: j027t_lugar_seguro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j027t_lugar_seguro (
    co_lugar_seguro bigint NOT NULL,
    tx_ubicacion_fisica character varying,
    tx_gerencia_custodia character varying,
    co_custodio bigint,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j027t_lugar_seguro OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25638)
-- Name: j028t_repositorio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j028t_repositorio (
    co_repositorio bigint NOT NULL,
    tx_nombre character varying,
    tx_direccion_ip character varying,
    co_custodio bigint,
    tx_observaciones character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j028t_repositorio OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25676)
-- Name: j029t_historico_evidencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j029t_historico_evidencia (
    co_historico_evidencia bigint,
    co_evidencia bigint,
    fe_cambio_estado date,
    co_cambia_estado bigint,
    tx_estado_anterior character varying,
    tx_lugar_anterior character varying,
    tx_custodio_anterior character varying,
    tx_repositorio_anterior character varying,
    tx_observaciones character varying,
    update_at timestamp without time zone
);


ALTER TABLE public.j029t_historico_evidencia OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26149)
-- Name: j030t_informe_recomendaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j030t_informe_recomendaciones (
    co_informe_recomendaciones bigint NOT NULL,
    fe_emision date,
    co_accion bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_revisa bigint,
    co_aprueba bigint,
    tx_resumen_ejecutivo character varying,
    tx_antecedentes text,
    tx_situacion_actual text,
    tx_preocupacion text,
    tx_recomendaciones text,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j030t_informe_recomendaciones OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 26147)
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j030t_informe_recomendaciones_co_informe_recomendaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j030t_informe_recomendaciones_co_informe_recomendaciones_seq OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 218
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j030t_informe_recomendaciones_co_informe_recomendaciones_seq OWNED BY j030t_informe_recomendaciones.co_informe_recomendaciones;


--
-- TOC entry 220 (class 1259 OID 26206)
-- Name: j031t_accion_recomendada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j031t_accion_recomendada (
    co_accion bigint NOT NULL,
    tx_descripcion character varying,
    tx_responsable_ejecutar character varying,
    co_responsable_sti_ejecutar bigint,
    fecha_a_ejecutar date,
    fecha_ejecutada date,
    tx_seguimiento text,
    tx_observaciones character varying,
    in_abierto boolean,
    created_at date,
    co_created_at bigint,
    updated_at timestamp without time zone,
    co_update_at bigint,
    co_incidente bigint,
    co_forense bigint,
    co_monitoreo bigint,
    co_depuracion bigint
);


ALTER TABLE public.j031t_accion_recomendada OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26258)
-- Name: j032t_seriales_enlaces_ir; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j032t_seriales_enlaces_ir (
    co_enlaces_ir bigint NOT NULL,
    co_informe_recomendaciones bigint,
    co_forense bigint,
    co_incidente bigint,
    co_depuracion bigint
);


ALTER TABLE public.j032t_seriales_enlaces_ir OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26288)
-- Name: j033t_procesos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j033t_procesos (
    co_proceso bigint NOT NULL,
    tx_proceso character varying,
    tx_sigla character varying
);


ALTER TABLE public.j033t_procesos OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26286)
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j033t_procesos_co_proceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j033t_procesos_co_proceso_seq OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 222
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j033t_procesos_co_proceso_seq OWNED BY j033t_procesos.co_proceso;


--
-- TOC entry 225 (class 1259 OID 26301)
-- Name: j034t_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j034t_incidente (
    co_incidente bigint NOT NULL,
    fe_apertura date,
    fe_escalado date,
    fe_cierre date,
    co_usuario_apertura bigint,
    co_usuario_escala bigint,
    co_usuario_cierre bigint,
    co_region bigint,
    co_negocio bigint,
    co_division bigint,
    tx_serial character varying,
    co_estado bigint,
    co_tipo_incidente bigint,
    co_tipo_hecho bigint,
    tx_descripcion character varying,
    fe_incio_hecho date,
    fe_fin_hecho date,
    tx_causa character varying,
    tx_metologia_herramientas character varying,
    tx_observaciones character varying,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint,
    tx_acciones_tomadas character varying
);


ALTER TABLE public.j034t_incidente OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26299)
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j034t_incidente_co_incidente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j034t_incidente_co_incidente_seq OWNER TO postgres;

--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 224
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j034t_incidente_co_incidente_seq OWNED BY j034t_incidente.co_incidente;


--
-- TOC entry 226 (class 1259 OID 26387)
-- Name: j035t_servicios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j035t_servicios (
    co_servicios bigint NOT NULL,
    tx_servicio character varying,
    tx_valor_impacto bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j035t_servicios OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 26393)
-- Name: j036t_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j036t_principio (
    co_principio bigint NOT NULL,
    tx_principio character varying,
    tx_descripcion character varying
);


ALTER TABLE public.j036t_principio OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 26403)
-- Name: j037t_incidente_principio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j037t_incidente_principio (
    co_incidente_principio bigint NOT NULL,
    co_incidente bigint,
    co_principio bigint
);


ALTER TABLE public.j037t_incidente_principio OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26420)
-- Name: j038t_incidente_servicios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j038t_incidente_servicios (
    co_incidente_servicios bigint NOT NULL,
    co_incidente bigint,
    co_servicios bigint
);


ALTER TABLE public.j038t_incidente_servicios OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 26443)
-- Name: j039t_herramienta_utilizada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j039t_herramienta_utilizada (
    co_herramienta_utilizada bigint,
    co_herramientas bigint,
    co_incidente bigint,
    co_forense bigint,
    co_inventario bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j039t_herramienta_utilizada OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 26437)
-- Name: j040t_tipo_herramientas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j040t_tipo_herramientas (
    co_tipo_herramientas bigint NOT NULL,
    tx_tipo_herramienta bigint,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone
);


ALTER TABLE public.j040t_tipo_herramientas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 26440)
-- Name: j041t_herramientas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j041t_herramientas (
    co_herramientas bigint NOT NULL,
    tx_herramienta bigint,
    co_tipo_herramientas bigint,
    created_at date,
    updated_at timestamp without time zone
);


ALTER TABLE public.j041t_herramientas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 26446)
-- Name: j042t_estado_incidente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j042t_estado_incidente (
    co_estado_incidente bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j042t_estado_incidente OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 26466)
-- Name: j043t_tipo_incidentes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j043t_tipo_incidentes (
    co_tipo_incidentes bigint NOT NULL,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone,
    tx_tipo_incidentes character varying
);


ALTER TABLE public.j043t_tipo_incidentes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 26469)
-- Name: j044t_tipo_hechos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j044t_tipo_hechos (
    co_tipo_hechos bigint NOT NULL,
    co_created_at bigint,
    co_update_at bigint,
    created_at date,
    updated_at timestamp without time zone,
    tx_tipo_hechos character varying,
    co_tipo_incidente bigint
);


ALTER TABLE public.j044t_tipo_hechos OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26472)
-- Name: j045t_referencia_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j045t_referencia_marco (
    co_referencia_marco bigint NOT NULL,
    co_marco_normativo bigint,
    co_incidente bigint,
    co_recomendaciones bigint,
    co_monitoreo bigint,
    co_forense bigint,
    co_depuracion bigint,
    co_cumple boolean,
    co_accion bigint
);


ALTER TABLE public.j045t_referencia_marco OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 26475)
-- Name: j046t_marco_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j046t_marco_normativo (
    co_marco_normativo bigint NOT NULL,
    co_documento bigint,
    tx_codigo_marco character varying,
    tx_descripcion bigint,
    co_created_at bigint,
    co_updated_at bigint,
    created_at date,
    update_at timestamp without time zone
);


ALTER TABLE public.j046t_marco_normativo OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26515)
-- Name: j047t_documento_normativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j047t_documento_normativo (
    co_documento_normativo bigint NOT NULL,
    co_tipo_marco bigint,
    tx_titulo character varying,
    tx_descripcion character varying,
    tx_revision bigint,
    co_estado bigint,
    fe_aprueba1 date,
    co_aprueba1 bigint,
    fe_aprueba2 date,
    co_aprueba2 bigint,
    fe_elimina1 date,
    co_elimina1 bigint,
    fe_elimina2 date,
    co_elimina2 bigint,
    tx_observaciones text,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j047t_documento_normativo OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 26564)
-- Name: j048t_estado_documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j048t_estado_documento (
    co_estado_documento bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j048t_estado_documento OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26609)
-- Name: j049t_tipo_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j049t_tipo_marco (
    co_tipo_marco bigint NOT NULL,
    tx_descripcion character varying,
    tx_siglas character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j049t_tipo_marco OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 26648)
-- Name: j050t_informe_marco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j050t_informe_marco (
    co_informe_marco bigint NOT NULL,
    fe_emision date,
    tx_serial character varying,
    co_tipo_revision bigint,
    tx_version bigint,
    co_tipo_documento bigint,
    tx_titulo character varying,
    co_justificacion bigint,
    tx_justificacion character varying,
    tx_descripcion text,
    tx_observaciones text,
    tx_ruta character varying,
    nb_archivo character varying,
    created_at date,
    update_at timestamp without time zone,
    co_usuario_created bigint,
    co_usuario_update bigint
);


ALTER TABLE public.j050t_informe_marco OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 26646)
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE j050t_informe_marco_co_informe_marco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.j050t_informe_marco_co_informe_marco_seq OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 241
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE j050t_informe_marco_co_informe_marco_seq OWNED BY j050t_informe_marco.co_informe_marco;


--
-- TOC entry 243 (class 1259 OID 26669)
-- Name: j051t_tipo_revision; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j051t_tipo_revision (
    co_tipo_revision bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j051t_tipo_revision OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 26690)
-- Name: j052t_tipo_justificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE j052t_tipo_justificacion (
    co_tipo_justificacion bigint NOT NULL,
    tx_descripcion character varying,
    created_at date,
    update_at date,
    co_usuario_created bigint,
    co_usuario_updated bigint
);


ALTER TABLE public.j052t_tipo_justificacion OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26766)
-- Name: negocio_division; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW negocio_division AS
 SELECT j014t_negocio.tx_negocio AS "Negocio",
    j008t_division.tx_division AS "Division"
   FROM j014t_negocio,
    j008t_division
  WHERE (j014t_negocio.co_negocio = j008t_division.co_negocio)
  ORDER BY j014t_negocio.co_negocio;


ALTER TABLE public.negocio_division OWNER TO postgres;

--
-- TOC entry 2232 (class 2604 OID 27321)
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c004t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('c004t_acta_aie_co_aie_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 26772)
-- Name: co_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso ALTER COLUMN co_recurso SET DEFAULT nextval('c024t_recurso_co_recurso_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 16390)
-- Name: co_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_menu ALTER COLUMN co_menu SET DEFAULT nextval('j001t_menu_co_menu_seq'::regclass);


--
-- TOC entry 2209 (class 2604 OID 16404)
-- Name: co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario ALTER COLUMN co_usuario SET DEFAULT nextval('j002t_usuario_co_usuario_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 16418)
-- Name: co_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j003t_rol ALTER COLUMN co_rol SET DEFAULT nextval('j003_rol_co_rol_seq'::regclass);


--
-- TOC entry 2211 (class 2604 OID 16432)
-- Name: co_rol_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu ALTER COLUMN co_rol_menu SET DEFAULT nextval('j004t_rol_menu_co_rol_menu_seq'::regclass);


--
-- TOC entry 2212 (class 2604 OID 16441)
-- Name: co_transaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_transaccion ALTER COLUMN co_transaccion SET DEFAULT nextval('j005t_transaccion_co_transaccion_seq'::regclass);


--
-- TOC entry 2213 (class 2604 OID 16452)
-- Name: co_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud ALTER COLUMN co_solicitud SET DEFAULT nextval('j006t_solicitud_co_solicitud_seq'::regclass);


--
-- TOC entry 2214 (class 2604 OID 16465)
-- Name: co_region; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j007t_region ALTER COLUMN co_region SET DEFAULT nextval('j007t_region_co_region_seq'::regclass);


--
-- TOC entry 2215 (class 2604 OID 16479)
-- Name: co_division; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j008t_division ALTER COLUMN co_division SET DEFAULT nextval('j008t_division_co_division_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 16562)
-- Name: co_serial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial ALTER COLUMN co_serial SET DEFAULT nextval('j009t_serial_co_serial_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 16600)
-- Name: co_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion ALTER COLUMN co_evaluacion SET DEFAULT nextval('j010t_evaluacion_co_evaluacion_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 16646)
-- Name: co_vulnerabilidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j011t_vulnerabilidad ALTER COLUMN co_vulnerabilidad SET DEFAULT nextval('j011t_vulnerabilidad_co_vulnerabilidad_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 16681)
-- Name: co_cronograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma ALTER COLUMN co_cronograma SET DEFAULT nextval('j012t_cronograma_co_cronograma_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 16715)
-- Name: co_vul_cronograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma ALTER COLUMN co_vul_cronograma SET DEFAULT nextval('j013t_vul_cronograma_co_vul_cronograma_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 24873)
-- Name: co_negocio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j014t_negocio ALTER COLUMN co_negocio SET DEFAULT nextval('j014t_negocio_co_negocio_seq'::regclass);


--
-- TOC entry 2222 (class 2604 OID 24937)
-- Name: co_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense ALTER COLUMN co_forense SET DEFAULT nextval('j016t_forense_co_forense_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 24962)
-- Name: co_informe_forense; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense ALTER COLUMN co_informe_forense SET DEFAULT nextval('j018t_informe_forense_co_informe_forense_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 25204)
-- Name: co_acc; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc ALTER COLUMN co_acc SET DEFAULT nextval('j020t_acta_acc_co_acc_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 25262)
-- Name: co_aie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie ALTER COLUMN co_aie SET DEFAULT nextval('j021t_acta_aie_co_aie_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 25367)
-- Name: co_anie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie ALTER COLUMN co_anie SET DEFAULT nextval('j022t_acta_anie_co_anie_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 26152)
-- Name: co_informe_recomendaciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones ALTER COLUMN co_informe_recomendaciones SET DEFAULT nextval('j030t_informe_recomendaciones_co_informe_recomendaciones_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 26291)
-- Name: co_proceso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j033t_procesos ALTER COLUMN co_proceso SET DEFAULT nextval('j033t_procesos_co_proceso_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 26304)
-- Name: co_incidente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente ALTER COLUMN co_incidente SET DEFAULT nextval('j034t_incidente_co_incidente_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 26651)
-- Name: co_informe_marco; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco ALTER COLUMN co_informe_marco SET DEFAULT nextval('j050t_informe_marco_co_informe_marco_seq'::regclass);


--
-- TOC entry 2814 (class 0 OID 27318)
-- Dependencies: 248
-- Data for Name: c004t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 247
-- Name: c004t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c004t_acta_aie_co_aie_seq', 1, false);


--
-- TOC entry 2779 (class 0 OID 25539)
-- Dependencies: 212
-- Data for Name: c024t_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO c024t_recurso VALUES ('LAPTOP', NULL, NULL, NULL, NULL, 1);
INSERT INTO c024t_recurso VALUES ('DESKTOP', NULL, NULL, NULL, NULL, 2);
INSERT INTO c024t_recurso VALUES ('ALL IN ONE', NULL, NULL, NULL, NULL, 3);
INSERT INTO c024t_recurso VALUES ('DISCO DURO EXTERNO', NULL, NULL, NULL, NULL, 4);
INSERT INTO c024t_recurso VALUES ('TABLETA', NULL, NULL, NULL, NULL, 5);
INSERT INTO c024t_recurso VALUES ('TELEFONO', NULL, NULL, NULL, NULL, 6);
INSERT INTO c024t_recurso VALUES ('PENDRIVE', NULL, NULL, NULL, NULL, 7);
INSERT INTO c024t_recurso VALUES ('MEMORIA EXTERNA', NULL, NULL, NULL, NULL, 8);
INSERT INTO c024t_recurso VALUES ('CAMARA FOTOGRAFICA', NULL, NULL, NULL, NULL, 9);
INSERT INTO c024t_recurso VALUES ('CAMARA DE VIDEO', NULL, NULL, NULL, NULL, 10);
INSERT INTO c024t_recurso VALUES ('GPS', NULL, NULL, NULL, NULL, 11);
INSERT INTO c024t_recurso VALUES ('IMPRESORA', NULL, NULL, NULL, NULL, 12);
INSERT INTO c024t_recurso VALUES ('SERVIDOR', NULL, NULL, NULL, NULL, 13);
INSERT INTO c024t_recurso VALUES ('APLICACION', NULL, NULL, NULL, NULL, 14);
INSERT INTO c024t_recurso VALUES ('BASE DE DATOS', NULL, NULL, NULL, NULL, 15);
INSERT INTO c024t_recurso VALUES ('ROUTER', NULL, NULL, NULL, NULL, 16);
INSERT INTO c024t_recurso VALUES ('ROUTER INALAMBRICO', NULL, NULL, NULL, NULL, 17);
INSERT INTO c024t_recurso VALUES ('SWITCH', NULL, NULL, NULL, NULL, 18);
INSERT INTO c024t_recurso VALUES ('IDS / IPS', NULL, NULL, NULL, NULL, 19);
INSERT INTO c024t_recurso VALUES ('FIREWALL', NULL, NULL, NULL, NULL, 20);
INSERT INTO c024t_recurso VALUES ('FILTRADO DE CONTENIDO WEB', NULL, NULL, NULL, NULL, 21);
INSERT INTO c024t_recurso VALUES ('UPS', NULL, NULL, NULL, NULL, 22);


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 246
-- Name: c024t_recurso_co_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('c024t_recurso_co_recurso_seq', 22, true);


--
-- TOC entry 2815 (class 0 OID 27351)
-- Dependencies: 249
-- Data for Name: j001t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2737 (class 0 OID 16385)
-- Dependencies: 170
-- Data for Name: j001t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j001t_menu VALUES (47, 'Permisologia de Acceso Logico', 50, NULL, NULL, 1, 'PAL');
INSERT INTO j001t_menu VALUES (25, 'Lista de Chequeo para la Evaluación de Planes', 5, NULL, NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (26, 'Lista de Chequeo para la Prueba de Planes', 5, NULL, NULL, 7, NULL);
INSERT INTO j001t_menu VALUES (52, 'Inventario de la Plataforma de Seguridad', 48, NULL, NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (29, 'Bitácora', 6, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (30, 'Identificación de contenedores de medios de respaldo', 6, NULL, NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (31, 'Autorización de traslado de medios de respaldo', 6, 'J041tHerramientas', NULL, 5, NULL);
INSERT INTO j001t_menu VALUES (32, 'Bitácora de entrada/salida de medios de respaldo', 6, NULL, NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (33, 'Pruebas de Respaldo de Data Crítica', 6, NULL, NULL, 7, NULL);
INSERT INTO j001t_menu VALUES (34, 'Acta Escenarios de Contingencia', 6, NULL, NULL, 8, NULL);
INSERT INTO j001t_menu VALUES (35, 'Cronograma de Mitigación de Vulnerabilidades', 4, NULL, NULL, 3, 'CMV');
INSERT INTO j001t_menu VALUES (27, 'Claves de Máximo Privilegio', 6, NULL, NULL, 1, 'CMP');
INSERT INTO j001t_menu VALUES (22, 'Plan de Contingencia', 5, NULL, NULL, 3, 'PC');
INSERT INTO j001t_menu VALUES (23, 'Plan Operativo', 5, NULL, NULL, 4, 'PO');
INSERT INTO j001t_menu VALUES (1, 'Evaluación de STI', 36, '../../', 'AS', 1, 'ESTI');
INSERT INTO j001t_menu VALUES (18, 'Solicitud de Análisis de Riesgo Lógico', 4, NULL, NULL, 1, 'SARL');
INSERT INTO j001t_menu VALUES (19, 'Informe de Análisis de Riesgo Lógico', 4, NULL, NULL, 2, 'IARL');
INSERT INTO j001t_menu VALUES (20, 'Solicitud de Planes de Continuidad', 5, NULL, NULL, 1, 'SPC');
INSERT INTO j001t_menu VALUES (13, 'Solicitud de Autorización de Análisis de Impacto', 3, NULL, NULL, 1, 'SAI');
INSERT INTO j001t_menu VALUES (58, 'Control Licencias Lenel', 50, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (53, 'Planes de Contigencia de la Plataforma de Seguridad', 48, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (54, 'Mantenimientos de la Plataforma de Seguridad', 48, NULL, NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (55, 'Planes Operativos de la Plataforma de Seguridad', 48, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (38, 'Incidentes de Seguridad', 37, NULL, NULL, 1, 'IS');
INSERT INTO j001t_menu VALUES (50, 'Control de Acceso Logico', 37, NULL, NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (48, 'Gestion de Plataforma de Seguridad', 37, NULL, NULL, 5, 'IPS');
INSERT INTO j001t_menu VALUES (70, 'Regiones STI', 67, 'J007tRegion', NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (65, 'Lugares para Resguardo de Evidencias Fisicas', 60, 'J027tLugarSeguro', NULL, 2, 'LREF');
INSERT INTO j001t_menu VALUES (37, 'Protección Lógica', 0, NULL, NULL, 2, 'PL');
INSERT INTO j001t_menu VALUES (66, 'Repositorios para Resguardo de Evidencias Digitales', 60, 'J028tRepositorio', NULL, 1, 'RED');
INSERT INTO j001t_menu VALUES (68, 'Negocios STI', 67, 'J014tNegocio', NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (15, 'Cuestionario de Análisis de Impacto ', 3, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (63, 'Tipos de Evidencias', 60, 'J025tTipoEvidencia', NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (59, 'Registro de Evidencias ', 40, 'J023tEvidencia', NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (64, 'Estados de las Evidencias', 60, 'J026tEstadoEvidencia', NULL, 5, NULL);
INSERT INTO j001t_menu VALUES (69, 'Divisiones STI', 67, 'J008tDivision', NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (11, 'Autorización para Prueba de Penetración', 2, NULL, NULL, 1, 'APP');
INSERT INTO j001t_menu VALUES (12, 'Informe de Prueba de Penetración', 2, NULL, NULL, 2, 'IPP');
INSERT INTO j001t_menu VALUES (14, 'Informe de Análisis de Impacto', 3, NULL, NULL, 2, 'IAIP');
INSERT INTO j001t_menu VALUES (16, 'Matriz de Impacto de Activos de Información', 3, NULL, NULL, 4, 'MIA');
INSERT INTO j001t_menu VALUES (17, 'Matriz de Dependencia Activos Intangibles', 3, NULL, NULL, 5, 'MD');
INSERT INTO j001t_menu VALUES (21, 'Plan Maestro de Continuidad', 5, NULL, NULL, 2, 'PMC');
INSERT INTO j001t_menu VALUES (24, 'Informe de Evaluación/Prueba a Planes', 5, NULL, NULL, 5, 'IEPC');
INSERT INTO j001t_menu VALUES (28, 'Identificación de sobre y seguimiento', 6, NULL, NULL, 2, 'SCMP');
INSERT INTO j001t_menu VALUES (8, 'Solicitud de Evaluación de STI', 1, 'IEL/solicitud', NULL, 1, 'SEL');
INSERT INTO j001t_menu VALUES (9, 'Informe de Evaluación de STI.', 1, 'IEL/listaInforme', NULL, 2, 'IEL');
INSERT INTO j001t_menu VALUES (2, 'Prueba de Penetración', 36, NULL, NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (3, 'Análisis de Impacto del Negocio', 36, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (4, 'Análisis de Riesgo Lógico', 36, NULL, NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (5, 'Planes de Continuidad', 36, NULL, NULL, 5, NULL);
INSERT INTO j001t_menu VALUES (6, 'Resguardo de claves de máximo privilegio', 36, NULL, NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (7, 'Traslado, Resguardo y Prueba de los medios de respaldo', 36, NULL, NULL, 7, NULL);
INSERT INTO j001t_menu VALUES (45, 'Informe de Analisis Forense', 40, 'J018tInformeForense', NULL, 2, 'IAF');
INSERT INTO j001t_menu VALUES (36, 'Evaluación,Respuesta y Contingencia', 0, NULL, NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (44, 'Acta de Negación de Inspección de Equipos', 40, 'J022tActaAnie', NULL, 5, 'ANIE');
INSERT INTO j001t_menu VALUES (76, 'DM - Marco Normativo', 73, NULL, NULL, 7, NULL);
INSERT INTO j001t_menu VALUES (43, 'Acta de Inspección de Equipos', 40, 'J021tActaAie', NULL, 4, 'AIE');
INSERT INTO j001t_menu VALUES (42, 'Acta de Cadena de Custodia', 40, 'J020tActaAcc', NULL, 3, 'ACC');
INSERT INTO j001t_menu VALUES (39, 'Informe de Incidente de Seguridad', 38, NULL, NULL, 2, 'IIS');
INSERT INTO j001t_menu VALUES (40, 'Analisis Forense', 37, NULL, NULL, 2, 'AF');
INSERT INTO j001t_menu VALUES (46, 'Informe de Depuracion de Acceso Logico', 50, NULL, NULL, 2, 'IDAL');
INSERT INTO j001t_menu VALUES (49, 'Registro de Analisis Forense', 40, 'J016tForense ', NULL, 1, 'RAF');
INSERT INTO j001t_menu VALUES (72, 'Negocios por Region', 67, 'J015tRegionNegocio', NULL, 5, NULL);
INSERT INTO j001t_menu VALUES (57, 'Seguimiento de Acciones Recomendadas - AF', 40, NULL, NULL, 8, ' ');
INSERT INTO j001t_menu VALUES (56, 'Seguimiento de Acciones Recomendadas - IS', 38, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (60, 'DM - Analisis Forense', 40, NULL, NULL, 9, NULL);
INSERT INTO j001t_menu VALUES (61, 'Alcance de los Analisis Forense', 60, 'J017tAlcanceForense', NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (41, 'Informe de Recomendaciones', 40, NULL, NULL, 7, 'IR');
INSERT INTO j001t_menu VALUES (71, 'Procesos STI', 67, 'J033tProcesos', NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (62, 'Tipos de Recursos Tecnologicos', 60, 'J024tRecurso', NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (67, 'Datos Maestros', 0, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (74, 'Documento de Marco Normativo', 73, 'J047tDocumentoNormativo', NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (80, 'Tipo de Justificación del Informe de Marco Normativo', 76, 'J052tTipoJustificacion', NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (79, 'Tipo de Informe de Marco Normativo', 76, 'J051tTipoRevision', NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (78, 'Estado del Documento de Marco Normativo', 76, 'J048tEstadoDocumento', NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (81, 'Detalle del Marco Normativo', 73, 'J046tMarcoNormativo', NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (51, 'Registro de Incidente de Seguridad', 38, 'J034tIncidente', NULL, 1, 'RIS');
INSERT INTO j001t_menu VALUES (75, 'Informe de Marco Normativo', 73, 'J050tInformeMarco', NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (77, 'Tipo de Documento Normativo', 76, 'J049tTipoMarco', NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (73, 'Arquitectura Preventiva de Seguridad', 0, NULL, NULL, 4, NULL);
INSERT INTO j001t_menu VALUES (10, 'Cronograma de Mitigación de Vulnerabilidades', 69, 'htttt', 'h', 3, 'CMV');
INSERT INTO j001t_menu VALUES (83, 'Tipificacion de Incidentes de Seguridad', 82, 'J043tTipoIncidentes', NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (84, 'Tipificacion de Hechos', 82, 'J044tTipoHechos', NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (85, 'Estado del Incidente', 82, 'J042tEstadoIncidente', NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (89, 'Principios de Seguridad', 67, 'J036tPrincipio', NULL, 6, NULL);
INSERT INTO j001t_menu VALUES (86, 'Tipo de Plataforma de Seguridad', 90, 'J040tTipoHerramientas', NULL, 1, NULL);
INSERT INTO j001t_menu VALUES (87, 'Listado de Herramienta de Seguridad', 90, 'J041tHerramientas', NULL, 2, NULL);
INSERT INTO j001t_menu VALUES (88, 'Tipos de Servicios Tecnologicos', 67, 'J035tServicios', NULL, 7, NULL);
INSERT INTO j001t_menu VALUES (82, 'DM - Incidentes de Seguridad', 38, NULL, NULL, 8, NULL);
INSERT INTO j001t_menu VALUES (90, 'DM - Plataforma de Seguridad', 48, NULL, NULL, 3, NULL);
INSERT INTO j001t_menu VALUES (91, 'Principios Afectados por Incidente', 38, 'J037tIncidentePrincipio', NULL, NULL, NULL);
INSERT INTO j001t_menu VALUES (92, 'Servicios Afectados en el Incidente', 38, 'J038tIncidenteServicios', NULL, NULL, NULL);
INSERT INTO j001t_menu VALUES (93, 'Herramientas de Seguridad Utilizadas', 38, 'J039tHerramientaUtilizada', NULL, NULL, NULL);
INSERT INTO j001t_menu VALUES (94, 'Marco Normativo Referenciado', 38, 'J045tReferenciaMarco', NULL, NULL, NULL);
INSERT INTO j001t_menu VALUES (0, 'Raiz', 0, '//', 'img', 12, 'ABC');


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 171
-- Name: j001t_menu_co_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j001t_menu_co_menu_seq', 51, true);


--
-- TOC entry 2739 (class 0 OID 16399)
-- Dependencies: 172
-- Data for Name: j002t_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j002t_usuario VALUES (1, 'camarilloj', 'Joel', 'Camarillo', 1, 1, 1, 1);
INSERT INTO j002t_usuario VALUES (2, 'vivasts', 'Tibisay', 'Vivas', NULL, 1, 1, 14);
INSERT INTO j002t_usuario VALUES (4, 'carrilloaw', 'Adam', 'Carrillo', 2, 2, 3, 13);
INSERT INTO j002t_usuario VALUES (6, 'dubuca', 'Andres', 'Dubuc', 1, 1, 1, 1);
INSERT INTO j002t_usuario VALUES (7, 'cortesj', 'Joel', 'Cortes', 13, 1, 1, 14);
INSERT INTO j002t_usuario VALUES (5, 'parisra', 'Rafael', 'Paris', 1, 1, 3, 1);
INSERT INTO j002t_usuario VALUES (13, 'AAA', 'SSS', 'DDD', 14, 1, 2, 9);


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 173
-- Name: j002t_usuario_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j002t_usuario_co_usuario_seq', 13, true);


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 175
-- Name: j003_rol_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j003_rol_co_rol_seq', 1, true);


--
-- TOC entry 2741 (class 0 OID 16413)
-- Dependencies: 174
-- Data for Name: j003t_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j003t_rol VALUES (1, 'Administrador');
INSERT INTO j003t_rol VALUES (2, 'Consulta');
INSERT INTO j003t_rol VALUES (3, 'Registrador');
INSERT INTO j003t_rol VALUES (4, 'Aprobador');


--
-- TOC entry 2743 (class 0 OID 16427)
-- Dependencies: 176
-- Data for Name: j004t_rol_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j004t_rol_menu VALUES (35, 1, 35, true);
INSERT INTO j004t_rol_menu VALUES (37, 1, 37, true);
INSERT INTO j004t_rol_menu VALUES (92, 1, 92, true);
INSERT INTO j004t_rol_menu VALUES (40, 1, 40, true);
INSERT INTO j004t_rol_menu VALUES (41, 1, 41, true);
INSERT INTO j004t_rol_menu VALUES (42, 1, 42, true);
INSERT INTO j004t_rol_menu VALUES (43, 1, 43, true);
INSERT INTO j004t_rol_menu VALUES (38, 1, 38, true);
INSERT INTO j004t_rol_menu VALUES (39, 1, 39, true);
INSERT INTO j004t_rol_menu VALUES (44, 1, 44, true);
INSERT INTO j004t_rol_menu VALUES (45, 1, 45, true);
INSERT INTO j004t_rol_menu VALUES (46, 1, 46, true);
INSERT INTO j004t_rol_menu VALUES (47, 1, 47, true);
INSERT INTO j004t_rol_menu VALUES (48, 1, 48, true);
INSERT INTO j004t_rol_menu VALUES (49, 1, 49, true);
INSERT INTO j004t_rol_menu VALUES (50, 1, 50, true);
INSERT INTO j004t_rol_menu VALUES (51, 1, 51, true);
INSERT INTO j004t_rol_menu VALUES (52, 1, 52, true);
INSERT INTO j004t_rol_menu VALUES (53, 1, 53, true);
INSERT INTO j004t_rol_menu VALUES (54, 1, 54, true);
INSERT INTO j004t_rol_menu VALUES (55, 1, 55, true);
INSERT INTO j004t_rol_menu VALUES (57, 1, 57, true);
INSERT INTO j004t_rol_menu VALUES (56, 1, 56, true);
INSERT INTO j004t_rol_menu VALUES (58, 1, 58, true);
INSERT INTO j004t_rol_menu VALUES (59, 1, 59, true);
INSERT INTO j004t_rol_menu VALUES (1, 1, 23, true);
INSERT INTO j004t_rol_menu VALUES (2, 1, 24, true);
INSERT INTO j004t_rol_menu VALUES (3, 1, 25, true);
INSERT INTO j004t_rol_menu VALUES (4, 1, 26, true);
INSERT INTO j004t_rol_menu VALUES (5, 1, 27, true);
INSERT INTO j004t_rol_menu VALUES (6, 1, 28, true);
INSERT INTO j004t_rol_menu VALUES (7, 1, 29, true);
INSERT INTO j004t_rol_menu VALUES (8, 1, 30, true);
INSERT INTO j004t_rol_menu VALUES (9, 1, 31, true);
INSERT INTO j004t_rol_menu VALUES (10, 1, 32, true);
INSERT INTO j004t_rol_menu VALUES (11, 1, 33, true);
INSERT INTO j004t_rol_menu VALUES (12, 1, 34, true);
INSERT INTO j004t_rol_menu VALUES (13, 1, 1, true);
INSERT INTO j004t_rol_menu VALUES (14, 1, 2, true);
INSERT INTO j004t_rol_menu VALUES (15, 1, 3, true);
INSERT INTO j004t_rol_menu VALUES (16, 1, 4, true);
INSERT INTO j004t_rol_menu VALUES (17, 1, 5, true);
INSERT INTO j004t_rol_menu VALUES (18, 1, 6, true);
INSERT INTO j004t_rol_menu VALUES (19, 1, 7, true);
INSERT INTO j004t_rol_menu VALUES (20, 1, 8, true);
INSERT INTO j004t_rol_menu VALUES (21, 1, 9, true);
INSERT INTO j004t_rol_menu VALUES (22, 1, 10, true);
INSERT INTO j004t_rol_menu VALUES (23, 1, 11, true);
INSERT INTO j004t_rol_menu VALUES (24, 1, 12, true);
INSERT INTO j004t_rol_menu VALUES (25, 1, 13, true);
INSERT INTO j004t_rol_menu VALUES (26, 1, 14, true);
INSERT INTO j004t_rol_menu VALUES (27, 1, 15, true);
INSERT INTO j004t_rol_menu VALUES (28, 1, 16, true);
INSERT INTO j004t_rol_menu VALUES (29, 1, 17, true);
INSERT INTO j004t_rol_menu VALUES (30, 1, 18, true);
INSERT INTO j004t_rol_menu VALUES (31, 1, 19, true);
INSERT INTO j004t_rol_menu VALUES (32, 1, 20, true);
INSERT INTO j004t_rol_menu VALUES (33, 1, 21, true);
INSERT INTO j004t_rol_menu VALUES (34, 1, 22, true);
INSERT INTO j004t_rol_menu VALUES (61, 1, 61, true);
INSERT INTO j004t_rol_menu VALUES (60, 1, 60, true);
INSERT INTO j004t_rol_menu VALUES (62, 1, 62, true);
INSERT INTO j004t_rol_menu VALUES (63, 1, 63, true);
INSERT INTO j004t_rol_menu VALUES (64, 1, 64, true);
INSERT INTO j004t_rol_menu VALUES (65, 1, 65, true);
INSERT INTO j004t_rol_menu VALUES (66, 1, 66, true);
INSERT INTO j004t_rol_menu VALUES (67, 1, 67, true);
INSERT INTO j004t_rol_menu VALUES (93, 1, 93, true);
INSERT INTO j004t_rol_menu VALUES (94, 1, 94, true);
INSERT INTO j004t_rol_menu VALUES (36, 1, 36, true);
INSERT INTO j004t_rol_menu VALUES (72, 1, 72, true);
INSERT INTO j004t_rol_menu VALUES (68, 1, 68, true);
INSERT INTO j004t_rol_menu VALUES (69, 1, 69, true);
INSERT INTO j004t_rol_menu VALUES (70, 1, 70, true);
INSERT INTO j004t_rol_menu VALUES (71, 1, 71, true);
INSERT INTO j004t_rol_menu VALUES (73, 1, 73, true);
INSERT INTO j004t_rol_menu VALUES (74, 1, 74, true);
INSERT INTO j004t_rol_menu VALUES (75, 1, 75, true);
INSERT INTO j004t_rol_menu VALUES (76, 1, 76, true);
INSERT INTO j004t_rol_menu VALUES (77, 1, 77, true);
INSERT INTO j004t_rol_menu VALUES (78, 1, 78, true);
INSERT INTO j004t_rol_menu VALUES (79, 1, 79, true);
INSERT INTO j004t_rol_menu VALUES (80, 1, 80, true);
INSERT INTO j004t_rol_menu VALUES (81, 1, 81, true);
INSERT INTO j004t_rol_menu VALUES (82, 1, 82, true);
INSERT INTO j004t_rol_menu VALUES (83, 1, 83, true);
INSERT INTO j004t_rol_menu VALUES (84, 1, 84, true);
INSERT INTO j004t_rol_menu VALUES (85, 1, 85, true);
INSERT INTO j004t_rol_menu VALUES (86, 1, 86, true);
INSERT INTO j004t_rol_menu VALUES (87, 1, 87, true);
INSERT INTO j004t_rol_menu VALUES (88, 1, 88, true);
INSERT INTO j004t_rol_menu VALUES (89, 1, 89, true);
INSERT INTO j004t_rol_menu VALUES (90, 1, 90, true);
INSERT INTO j004t_rol_menu VALUES (91, 1, 90, true);


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 177
-- Name: j004t_rol_menu_co_rol_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j004t_rol_menu_co_rol_menu_seq', 35, true);


--
-- TOC entry 2745 (class 0 OID 16436)
-- Dependencies: 178
-- Data for Name: j005t_transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j005t_transaccion VALUES (1, '2014-10-06', 1, '/var/www/html/sti/documentos/IEL/2014/10/solicitud/EPOC-COC-SEL-14-10-06.doc', 'EPOC-COC-SEL-14-10-06.doc');
INSERT INTO j005t_transaccion VALUES (4, '2014-10-06', 1, '/var/www/html/sti/documentos/IEL/2014/10/Informe/EPOC-COC-IEL-14-10-06.doc', 'EPOC-COC-IEL-14-10-06.doc');
INSERT INTO j005t_transaccion VALUES (5, '2014-10-07', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (6, '2014-10-07', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (7, '2014-10-07', 1, '/var/www/html/sti/documentos/IEL/2014/10/Informe/EPOC-COC-IEL-14-10-07.pdf', 'EPOC-COC-IEL-14-10-07.pdf');
INSERT INTO j005t_transaccion VALUES (8, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (9, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (10, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (11, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (12, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (13, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (14, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (15, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (16, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (17, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (18, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (19, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (21, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (22, '2014-10-08', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (20, '2014-10-08', 1, '/var/www/html/sti/documentos/CMV/2014/10//EPOC-COC-CMV-14-10-13.doc', 'EPOC-COC-CMV-14-10-13.doc');
INSERT INTO j005t_transaccion VALUES (23, '2014-10-08', 1, '/var/www/html/sti/documentos/CMV/2014/10/EPOC-COC-CMV-14-10-16.pdf', 'EPOC-COC-CMV-14-10-16.pdf');
INSERT INTO j005t_transaccion VALUES (24, '2014-10-09', 1, '/var/www/html/sti/documentos/CMV/2014/10/EPOC-COC-CMV-14-10-17.pdf', 'EPOC-COC-CMV-14-10-17.pdf');
INSERT INTO j005t_transaccion VALUES (25, '2014-10-27', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (26, '2014-11-04', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (27, '2014-11-12', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (28, '2014-11-12', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (29, '2014-11-12', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (30, '2014-12-30', 1, '/var/www/html/sti/documentos/IEL/2014/12/solicitudEPOC-COC-SEL-2014-12-011.doc', 'EPOC-COC-SEL-2014-12-011.doc');
INSERT INTO j005t_transaccion VALUES (31, '2014-12-30', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (32, '2015-04-17', 1, '/var/www/html/sti/documentos/IEL/2015/04/solicitudEPOC-COC-SEL-2015-04-001.txt', 'EPOC-COC-SEL-2015-04-001.txt');
INSERT INTO j005t_transaccion VALUES (33, '2015-04-17', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (34, '2015-04-17', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (35, '2015-04-22', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (36, '2015-04-22', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (37, '2015-05-15', 1, '/var/www/html/sti/documentos/IEL/2015/05/solicitudEPOC-COC-SEL-2015-05-003.DOC', 'EPOC-COC-SEL-2015-05-003.DOC');
INSERT INTO j005t_transaccion VALUES (38, '2015-05-15', 1, '/var/www/html/sti/documentos/IEL/2015/05/solicitudEPOC-COC-SEL-2015-05-004.pdf', 'EPOC-COC-SEL-2015-05-004.pdf');
INSERT INTO j005t_transaccion VALUES (39, '2015-05-15', 1, '/var/www/html/sti/documentos/IEL/2015/05/InformeEPOC-COC-IEL-2015-05-003.pdf', 'EPOC-COC-IEL-2015-05-003.pdf');
INSERT INTO j005t_transaccion VALUES (40, '2015-07-28', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (41, '2015-07-28', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (42, '2015-07-28', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (43, '2015-07-28', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (44, '2015-09-28', 1, NULL, NULL);
INSERT INTO j005t_transaccion VALUES (45, '2015-09-30', 1, NULL, NULL);


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 179
-- Name: j005t_transaccion_co_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j005t_transaccion_co_transaccion_seq', 45, true);


--
-- TOC entry 2747 (class 0 OID 16445)
-- Dependencies: 180
-- Data for Name: j006t_solicitud; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j006t_solicitud VALUES (21, 'EPOC-COC-SEL-14-09-04', 'centinela', '2014-09-30', 8, NULL, NULL, NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/09/solicitud/E5000_OCCP04_OLEO_V1.0.pdf', 'E5000_OCCP04_OLEO_V1.0.pdf');
INSERT INTO j006t_solicitud VALUES (19, 'EPOC-COC-SEL-14-09-02', 'SISGEM', '2014-09-30', 8, NULL, NULL, NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/10/solicitud/EPOC-COR-CMV-2014-08-026.pdf', 'EPOC-COR-CMV-2014-08-026.pdf');
INSERT INTO j006t_solicitud VALUES (20, 'EPOC-COC-SEL-14-09-03', 'WINDOWS', '2014-09-30', 8, NULL, NULL, NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/10/solicitud/minuta reunion E25K.pdf.pgp', 'minuta reunion E25K.pdf.pgp');
INSERT INTO j006t_solicitud VALUES (18, 'EPOC-COC-SEL-14-09-01', 'HP EVA2d', '2014-09-30', 8, NULL, NULL, NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/09/solicitud/EPOC-COC-CMV-2014-09-027.doc', 'EPOC-COC-CMV-2014-09-027.doc');
INSERT INTO j006t_solicitud VALUES (22, 'EPOC-COC-SEL-14-10-05', 'HP EVA2d', '2014-10-01', 8, NULL, NULL, NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/10/solicitud/Solicitud-ARL-E25K.pdf.pgp', 'Solicitud-ARL-E25K.pdf.pgp');
INSERT INTO j006t_solicitud VALUES (23, 'EPOC-COC-SEL-14-10-06', 'prueba', '2014-10-06', 8, NULL, NULL, 1, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (24, 'EPOC-COC-SEL-14-10-07', NULL, '2014-10-07', 8, NULL, NULL, 5, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (25, 'EPOC-COC-SEL-14-10-08', NULL, '2014-10-07', 8, NULL, NULL, 6, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (26, 'EPOC-COC-SEL-2014-11-009', 'ARL HOSPITAL COROMOTO', '2014-11-04', 8, NULL, NULL, 26, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (27, 'EPOC-COC-SEL-2014-11-010', 'KAli', '2014-11-12', 8, NULL, NULL, 27, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (28, 'EPOC-COC-SEL-2014-12-011', 'Seguridad en Tecnologías de Información para Exploración y Producción Occidente', '2014-12-30', 8, NULL, NULL, 30, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (29, 'EPOC-COC-SEL-2015-04-001', 'SISCOMBF LA SALINA', '2015-04-17', 8, NULL, NULL, 32, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (30, 'EPOC-COC-SEL-2015-04-002', 'fffffff', '2015-04-22', 8, NULL, NULL, 35, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (31, 'EPOC-COC-SEL-2015-05-003', 'evaluacion xspoc', '2015-05-15', 8, NULL, NULL, 37, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (32, 'EPOC-COC-SEL-2015-05-004', 'sicombf', '2015-05-15', 8, NULL, NULL, 38, 1, 1, NULL, NULL);
INSERT INTO j006t_solicitud VALUES (33, 'EPOC-COC-SEL-2015-07-005', 'Evaluación Xspoc', '2015-07-28', 8, NULL, NULL, 40, 1, 1, NULL, NULL);


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 181
-- Name: j006t_solicitud_co_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j006t_solicitud_co_solicitud_seq', 33, true);


--
-- TOC entry 2749 (class 0 OID 16460)
-- Dependencies: 182
-- Data for Name: j007t_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j007t_region VALUES (1, 'Centro', 'CEN');
INSERT INTO j007t_region VALUES (2, 'Oriente', 'ORI');
INSERT INTO j007t_region VALUES (3, 'Occidente', 'OCC');


--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 183
-- Name: j007t_region_co_region_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j007t_region_co_region_seq', 3, true);


--
-- TOC entry 2751 (class 0 OID 16474)
-- Dependencies: 184
-- Data for Name: j008t_division; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j008t_division VALUES (1, 'Costa Occidental', 'COC', 1);
INSERT INTO j008t_division VALUES (2, 'Costa Orienta', 'COR', 1);
INSERT INTO j008t_division VALUES (3, 'Costa Afuera', 'CAF', 5);
INSERT INTO j008t_division VALUES (4, 'Furrial', 'FUR', 5);
INSERT INTO j008t_division VALUES (5, 'Punta de Mata', 'PDM', 5);
INSERT INTO j008t_division VALUES (6, 'Ayacucho', 'AYA', 4);
INSERT INTO j008t_division VALUES (7, 'Boyaca', 'BOY', 4);
INSERT INTO j008t_division VALUES (8, 'Carabobo', 'CAR', 4);
INSERT INTO j008t_division VALUES (9, 'Mejoramiento', 'MEJ', 4);
INSERT INTO j008t_division VALUES (10, 'Complejo Refinador Paraguana', 'CRP', 13);
INSERT INTO j008t_division VALUES (11, 'El Palito', 'PAL', 13);
INSERT INTO j008t_division VALUES (12, 'Puerto La Cruz', 'PLC', 13);
INSERT INTO j008t_division VALUES (13, 'Metro Occidente', 'MOC', 9);
INSERT INTO j008t_division VALUES (14, 'Oriente', 'ORI', 9);
INSERT INTO j008t_division VALUES (16, 'Junin', 'JUN', 4);
INSERT INTO j008t_division VALUES (15, 'Centro Occidente', 'OCC', 9);


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 185
-- Name: j008t_division_co_division_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j008t_division_co_division_seq', 2, true);


--
-- TOC entry 2753 (class 0 OID 16500)
-- Dependencies: 186
-- Data for Name: j009t_serial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j009t_serial VALUES (8, 1, 2014, 23, 'EPOC-COC-SEL-14-09-01', 1);
INSERT INTO j009t_serial VALUES (8, 2, 2014, 24, 'EPOC-COC-SEL-14-09-02', 1);
INSERT INTO j009t_serial VALUES (8, 3, 2014, 25, 'EPOC-COC-SEL-14-09-03', 1);
INSERT INTO j009t_serial VALUES (8, 4, 2014, 26, 'EPOC-COC-SEL-14-09-04', 1);
INSERT INTO j009t_serial VALUES (8, 5, 2014, 27, 'EPOC-COC-SEL-14-10-05', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 28, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 29, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 30, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 31, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 32, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2014, 33, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (9, 1, 2014, 34, 'EPOC-COC-IEL-14-10-01', 1);
INSERT INTO j009t_serial VALUES (9, 2, 2014, 35, 'EPOC-COC-IEL-14-10-02', 1);
INSERT INTO j009t_serial VALUES (9, 3, 2014, 36, 'EPOC-COC-IEL-14-10-03', 1);
INSERT INTO j009t_serial VALUES (9, 4, 2014, 37, 'EPOC-COC-IEL-14-10-04', 1);
INSERT INTO j009t_serial VALUES (9, 5, 2014, 38, 'EPOC-COC-IEL-14-10-05', 1);
INSERT INTO j009t_serial VALUES (8, 6, 2014, 39, 'EPOC-COC-SEL-14-10-06', 1);
INSERT INTO j009t_serial VALUES (9, 6, 2014, 42, 'EPOC-COC-IEL-14-10-06', 1);
INSERT INTO j009t_serial VALUES (8, 7, 2014, 43, 'EPOC-COC-SEL-14-10-07', 1);
INSERT INTO j009t_serial VALUES (8, 8, 2014, 44, 'EPOC-COC-SEL-14-10-08', 1);
INSERT INTO j009t_serial VALUES (9, 7, 2014, 45, 'EPOC-COC-IEL-14-10-07', 1);
INSERT INTO j009t_serial VALUES (10, 1, 2014, 46, 'EPOC-COC-CMV-14-10-01', 1);
INSERT INTO j009t_serial VALUES (10, 2, 2014, 47, 'EPOC-COC-CMV-14-10-02', 1);
INSERT INTO j009t_serial VALUES (10, 3, 2014, 48, 'EPOC-COC-CMV-14-10-03', 1);
INSERT INTO j009t_serial VALUES (10, 4, 2014, 49, 'EPOC-COC-CMV-14-10-04', 1);
INSERT INTO j009t_serial VALUES (10, 5, 2014, 50, 'EPOC-COC-CMV-14-10-05', 1);
INSERT INTO j009t_serial VALUES (10, 6, 2014, 51, 'EPOC-COC-CMV-14-10-06', 1);
INSERT INTO j009t_serial VALUES (10, 7, 2014, 52, 'EPOC-COC-CMV-14-10-07', 1);
INSERT INTO j009t_serial VALUES (10, 8, 2014, 53, 'EPOC-COC-CMV-14-10-08', 1);
INSERT INTO j009t_serial VALUES (10, 9, 2014, 54, 'EPOC-COC-CMV-14-10-09', 1);
INSERT INTO j009t_serial VALUES (10, 10, 2014, 55, 'EPOC-COC-CMV-14-10-10', 1);
INSERT INTO j009t_serial VALUES (10, 11, 2014, 56, 'EPOC-COC-CMV-14-10-11', 1);
INSERT INTO j009t_serial VALUES (10, 12, 2014, 57, 'EPOC-COC-CMV-14-10-12', 1);
INSERT INTO j009t_serial VALUES (10, 13, 2014, 58, 'EPOC-COC-CMV-14-10-13', 1);
INSERT INTO j009t_serial VALUES (10, 14, 2014, 59, 'EPOC-COC-CMV-14-10-14', 1);
INSERT INTO j009t_serial VALUES (10, 15, 2014, 60, 'EPOC-COC-CMV-14-10-15', 1);
INSERT INTO j009t_serial VALUES (10, 16, 2014, 61, 'EPOC-COC-CMV-14-10-16', 1);
INSERT INTO j009t_serial VALUES (10, 17, 2014, 62, 'EPOC-COC-CMV-14-10-17', 1);
INSERT INTO j009t_serial VALUES (10, 18, 2014, 63, 'EPOC-COC-CMV-14-10-18', 1);
INSERT INTO j009t_serial VALUES (8, 9, 2014, 64, 'EPOC-COC-SEL-2014-11-009', 1);
INSERT INTO j009t_serial VALUES (8, 10, 2014, 65, 'EPOC-COC-SEL-2014-11-010', 1);
INSERT INTO j009t_serial VALUES (9, 8, 2014, 66, 'EPOC-COC-IEL-2014-11-008', 1);
INSERT INTO j009t_serial VALUES (10, 19, 2014, 67, 'EPOC-COC-CMV-2014-11-019', 1);
INSERT INTO j009t_serial VALUES (8, 11, 2014, 68, 'EPOC-COC-SEL-2014-12-011', 1);
INSERT INTO j009t_serial VALUES (9, 9, 2014, 69, 'EPOC-COC-IEL-2014-12-009', 1);
INSERT INTO j009t_serial VALUES (8, 1, 2015, 70, 'EPOC-COC-SEL-2015-04-001', 1);
INSERT INTO j009t_serial VALUES (9, 1, 2015, 71, 'EPOC-COC-IEL-2015-04-001', 1);
INSERT INTO j009t_serial VALUES (10, 1, 2015, 72, 'EPOC-COC-CMV-2015-04-001', 1);
INSERT INTO j009t_serial VALUES (8, 2, 2015, 73, 'EPOC-COC-SEL-2015-04-002', 1);
INSERT INTO j009t_serial VALUES (9, 2, 2015, 74, 'EPOC-COC-IEL-2015-04-002', 1);
INSERT INTO j009t_serial VALUES (8, 3, 2015, 75, 'EPOC-COC-SEL-2015-05-003', 1);
INSERT INTO j009t_serial VALUES (8, 4, 2015, 76, 'EPOC-COC-SEL-2015-05-004', 1);
INSERT INTO j009t_serial VALUES (9, 3, 2015, 77, 'EPOC-COC-IEL-2015-05-003', 1);
INSERT INTO j009t_serial VALUES (8, 5, 2015, 78, 'EPOC-COC-SEL-2015-07-005', 1);
INSERT INTO j009t_serial VALUES (9, 4, 2015, 79, 'EPOC-COC-IEL-2015-07-004', 1);
INSERT INTO j009t_serial VALUES (10, 2, 2015, 80, 'EPOC-COC-CMV-2015-07-002', 1);
INSERT INTO j009t_serial VALUES (10, 3, 2015, 81, 'EPOC-COC-CMV-2015-07-003', 1);
INSERT INTO j009t_serial VALUES (9, 5, 2015, 82, 'CEN-COC-IEL-2015-09-005', 1);
INSERT INTO j009t_serial VALUES (9, 6, 2015, 83, 'CEN-COC-IEL-2015-09-006', 1);


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 187
-- Name: j009t_serial_co_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j009t_serial_co_serial_seq', 83, true);


--
-- TOC entry 2755 (class 0 OID 16595)
-- Dependencies: 188
-- Data for Name: j010t_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j010t_evaluacion VALUES (3, 'EPOC-COC-IEL-14-10-01', 'dddddd', '2014-10-03', NULL, 1, 1, NULL, NULL, 20);
INSERT INTO j010t_evaluacion VALUES (4, 'EPOC-COC-IEL-14-10-01', 'sds', '2014-10-03', NULL, 1, 1, NULL, NULL, 18);
INSERT INTO j010t_evaluacion VALUES (5, 'EPOC-COC-IEL-14-10-02', 'sdsdsd', '2014-10-03', NULL, 1, 1, NULL, NULL, 22);
INSERT INTO j010t_evaluacion VALUES (6, 'EPOC-COC-IEL-14-10-03', 'sss', '2014-10-03', NULL, 1, 1, NULL, NULL, 18);
INSERT INTO j010t_evaluacion VALUES (7, 'EPOC-COC-IEL-14-10-04', 'sdfds', '2014-10-03', NULL, 1, 1, NULL, NULL, 18);
INSERT INTO j010t_evaluacion VALUES (8, 'EPOC-COC-IEL-14-10-05', 'asdasd', '2014-10-03', NULL, 1, 1, NULL, NULL, 20);
INSERT INTO j010t_evaluacion VALUES (1, 'EPOC-COC-IEL-14-10-01', 'sdfsdf', '2014-10-03', NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/10/Informe/minuta reunion E25K.pdf.pgp', 'minuta reunion E25K.pdf.pgp', 21);
INSERT INTO j010t_evaluacion VALUES (2, 'EPOC-COC-IEL-14-10-01', 'sdfdsf', '2014-10-03', NULL, 1, 1, '/var/www/html/sti/documentos/IEL/2014/10/Informe/Solicitud-ARL-E25K.pdf.pgp', 'Solicitud-ARL-E25K.pdf.pgp', 19);
INSERT INTO j010t_evaluacion VALUES (11, 'EPOC-COC-IEL-14-10-06', 'sdfsf', '2014-10-06', 4, 1, 1, NULL, NULL, 19);
INSERT INTO j010t_evaluacion VALUES (12, 'EPOC-COC-IEL-14-10-07', 'sdddddd', '2014-10-07', 7, 1, 1, NULL, NULL, 22);
INSERT INTO j010t_evaluacion VALUES (13, 'EPOC-COC-IEL-2014-11-008', 'IEL Kali', '2014-11-12', 28, 1, 1, NULL, NULL, 27);
INSERT INTO j010t_evaluacion VALUES (14, 'EPOC-COC-IEL-2014-12-009', 'Seguridad en Tecnologías de Información para Exploración y Producción Occidente', '2014-12-30', 31, 1, 1, NULL, NULL, 28);
INSERT INTO j010t_evaluacion VALUES (15, 'EPOC-COC-IEL-2015-04-001', 'IEL SISCOMBF', '2015-04-17', 33, 1, 1, NULL, NULL, 29);
INSERT INTO j010t_evaluacion VALUES (16, 'EPOC-COC-IEL-2015-04-002', 'ggggggg', '2015-04-22', 36, 1, 1, NULL, NULL, 30);
INSERT INTO j010t_evaluacion VALUES (17, 'EPOC-COC-IEL-2015-05-003', 'IEL SISCOMBF', '2015-05-15', 39, 1, 1, NULL, NULL, 32);
INSERT INTO j010t_evaluacion VALUES (18, 'EPOC-COC-IEL-2015-07-004', 'IES xspoc', '2015-07-28', 41, 1, 1, NULL, NULL, 33);
INSERT INTO j010t_evaluacion VALUES (19, 'CEN-COC-IEL-2015-09-005', 'Informe de ERC', '2015-09-28', 44, 1, 1, NULL, NULL, 19);
INSERT INTO j010t_evaluacion VALUES (20, 'CEN-COC-IEL-2015-09-006', 'Informe 1', '2015-09-30', 45, 1, 1, NULL, NULL, 20);


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 189
-- Name: j010t_evaluacion_co_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j010t_evaluacion_co_evaluacion_seq', 20, true);


--
-- TOC entry 2757 (class 0 OID 16641)
-- Dependencies: 190
-- Data for Name: j011t_vulnerabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j011t_vulnerabilidad VALUES (12, 'delibjdjjjj', '2014-10-07', 7, true, false);
INSERT INTO j011t_vulnerabilidad VALUES (13, 'aaa', '2014-10-07', 4, true, false);
INSERT INTO j011t_vulnerabilidad VALUES (14, 'sdfs', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (15, 'ffff', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (16, 'sssssss', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (17, 'fffffff', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (18, 'sssssss', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (19, 'ssdsddsdssds', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (20, 'sddfdfd', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (21, 'ssssss', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (22, 'ssssssss', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (23, 'sssssss', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (24, 'ddasasdsadsa', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (25, 'sddffdsfsdf', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (26, 'sddsddsdsds', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (27, 'sddfsdfdsf', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (28, 'vvvvvvvvvvvvvvvvv', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (29, 'jjjjjjjjjjjjjjjjjjjj', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (30, 'qqqqqqqqqqqqqqqqq', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (31, 'aaaaaaaaaaaaaaaaaaaa', '2014-10-08', 7, false, false);
INSERT INTO j011t_vulnerabilidad VALUES (32, 'ASDSADSA', '2015-04-17', 33, false, false);


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 191
-- Name: j011t_vulnerabilidad_co_vulnerabilidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j011t_vulnerabilidad_co_vulnerabilidad_seq', 32, true);


--
-- TOC entry 2759 (class 0 OID 16676)
-- Dependencies: 192
-- Data for Name: j012t_cronograma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j012t_cronograma VALUES (13, 'HP EVA', '2014-10-08', 4, 20, 'EPOC-COC-CMV-14-10-13', 1);
INSERT INTO j012t_cronograma VALUES (16, 'SISGEM', '2014-10-08', 7, 23, 'EPOC-COC-CMV-14-10-16', 1);
INSERT INTO j012t_cronograma VALUES (17, 'hhhhhh', '2014-10-09', 7, 24, 'EPOC-COC-CMV-14-10-17', 1);
INSERT INTO j012t_cronograma VALUES (18, 'HHH', '2014-10-27', 4, 25, 'EPOC-COC-CMV-14-10-18', 1);
INSERT INTO j012t_cronograma VALUES (19, 'dfdsfds', '2014-11-12', 28, 29, 'EPOC-COC-CMV-2014-11-019', 1);
INSERT INTO j012t_cronograma VALUES (20, 'LA SALINA', '2015-04-17', 33, 34, 'EPOC-COC-CMV-2015-04-001', 1);
INSERT INTO j012t_cronograma VALUES (21, 'ddddd', '2015-07-28', 41, 42, 'EPOC-COC-CMV-2015-07-002', 1);
INSERT INTO j012t_cronograma VALUES (22, 'ddddd', '2015-07-28', 41, 43, 'EPOC-COC-CMV-2015-07-003', 1);


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 193
-- Name: j012t_cronograma_co_cronograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j012t_cronograma_co_cronograma_seq', 22, true);


--
-- TOC entry 2761 (class 0 OID 16708)
-- Dependencies: 194
-- Data for Name: j013t_vul_cronograma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j013t_vul_cronograma VALUES (13, 13, false, 23);
INSERT INTO j013t_vul_cronograma VALUES (12, 16, false, 26);
INSERT INTO j013t_vul_cronograma VALUES (14, 16, false, 27);
INSERT INTO j013t_vul_cronograma VALUES (15, 16, false, 28);
INSERT INTO j013t_vul_cronograma VALUES (16, 16, false, 29);
INSERT INTO j013t_vul_cronograma VALUES (17, 16, false, 30);
INSERT INTO j013t_vul_cronograma VALUES (18, 16, false, 31);
INSERT INTO j013t_vul_cronograma VALUES (19, 16, false, 32);
INSERT INTO j013t_vul_cronograma VALUES (20, 16, false, 33);
INSERT INTO j013t_vul_cronograma VALUES (21, 16, false, 34);
INSERT INTO j013t_vul_cronograma VALUES (22, 16, false, 35);
INSERT INTO j013t_vul_cronograma VALUES (23, 16, false, 36);
INSERT INTO j013t_vul_cronograma VALUES (24, 16, false, 37);
INSERT INTO j013t_vul_cronograma VALUES (25, 16, false, 38);
INSERT INTO j013t_vul_cronograma VALUES (26, 16, false, 39);
INSERT INTO j013t_vul_cronograma VALUES (27, 16, false, 40);
INSERT INTO j013t_vul_cronograma VALUES (28, 16, false, 41);
INSERT INTO j013t_vul_cronograma VALUES (29, 16, false, 42);
INSERT INTO j013t_vul_cronograma VALUES (30, 16, false, 43);
INSERT INTO j013t_vul_cronograma VALUES (31, 16, false, 44);
INSERT INTO j013t_vul_cronograma VALUES (12, 17, false, 45);
INSERT INTO j013t_vul_cronograma VALUES (14, 17, false, 46);
INSERT INTO j013t_vul_cronograma VALUES (15, 17, false, 47);
INSERT INTO j013t_vul_cronograma VALUES (16, 17, false, 48);
INSERT INTO j013t_vul_cronograma VALUES (17, 17, false, 49);
INSERT INTO j013t_vul_cronograma VALUES (18, 17, false, 50);
INSERT INTO j013t_vul_cronograma VALUES (19, 17, false, 51);
INSERT INTO j013t_vul_cronograma VALUES (20, 17, false, 52);
INSERT INTO j013t_vul_cronograma VALUES (21, 17, false, 53);
INSERT INTO j013t_vul_cronograma VALUES (22, 17, false, 54);
INSERT INTO j013t_vul_cronograma VALUES (23, 17, false, 55);
INSERT INTO j013t_vul_cronograma VALUES (24, 17, false, 56);
INSERT INTO j013t_vul_cronograma VALUES (25, 17, false, 57);
INSERT INTO j013t_vul_cronograma VALUES (26, 17, false, 58);
INSERT INTO j013t_vul_cronograma VALUES (27, 17, false, 59);
INSERT INTO j013t_vul_cronograma VALUES (28, 17, false, 60);
INSERT INTO j013t_vul_cronograma VALUES (29, 17, false, 61);
INSERT INTO j013t_vul_cronograma VALUES (30, 17, false, 62);
INSERT INTO j013t_vul_cronograma VALUES (31, 17, false, 63);
INSERT INTO j013t_vul_cronograma VALUES (13, 18, false, 64);


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 195
-- Name: j013t_vul_cronograma_co_vul_cronograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j013t_vul_cronograma_co_vul_cronograma_seq', 64, true);


--
-- TOC entry 2764 (class 0 OID 24870)
-- Dependencies: 197
-- Data for Name: j014t_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j014t_negocio VALUES (1, 'Exploración y Producción Occidente', 'EPOC');
INSERT INTO j014t_negocio VALUES (2, 'Bariven', 'BRV');
INSERT INTO j014t_negocio VALUES (3, 'Comercio y Suministro', 'CYS');
INSERT INTO j014t_negocio VALUES (4, 'Exploración y Producción  Faja', 'EPFA');
INSERT INTO j014t_negocio VALUES (5, 'Exploración y Producción Oriente', 'EPOR');
INSERT INTO j014t_negocio VALUES (6, 'Ingenieria en Construcción', 'IYC');
INSERT INTO j014t_negocio VALUES (7, 'Intevep', 'INTVP');
INSERT INTO j014t_negocio VALUES (8, 'Metropolitana', 'MET');
INSERT INTO j014t_negocio VALUES (9, 'Gas', 'GAS');
INSERT INTO j014t_negocio VALUES (10, 'PDVSA Industrial', 'PDV-IND');
INSERT INTO j014t_negocio VALUES (11, 'PDVSA Naval', 'PDV-NAV');
INSERT INTO j014t_negocio VALUES (12, 'PDVSA Servicios', 'PDV-SER');
INSERT INTO j014t_negocio VALUES (13, 'Refinacion', 'REF');
INSERT INTO j014t_negocio VALUES (14, 'Corporativo', 'COR');
INSERT INTO j014t_negocio VALUES (15, 'Exploración y Producción Costa Afuera', 'EP');


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 196
-- Name: j014t_negocio_co_negocio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j014t_negocio_co_negocio_seq', 2, true);


--
-- TOC entry 2765 (class 0 OID 24916)
-- Dependencies: 198
-- Data for Name: j015t_region_negocio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j015t_region_negocio VALUES (2, 5, 14, 4);
INSERT INTO j015t_region_negocio VALUES (1, 6, 16, NULL);
INSERT INTO j015t_region_negocio VALUES (1, 7, 17, NULL);
INSERT INTO j015t_region_negocio VALUES (1, 8, 18, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 10, 23, NULL);
INSERT INTO j015t_region_negocio VALUES (1, 11, 25, NULL);
INSERT INTO j015t_region_negocio VALUES (2, 10, 22, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 1, 1, 1);
INSERT INTO j015t_region_negocio VALUES (3, 13, 30, 10);
INSERT INTO j015t_region_negocio VALUES (3, 1, 2, 2);
INSERT INTO j015t_region_negocio VALUES (1, 13, 28, 11);
INSERT INTO j015t_region_negocio VALUES (2, 13, 29, 12);
INSERT INTO j015t_region_negocio VALUES (1, 14, 31, NULL);
INSERT INTO j015t_region_negocio VALUES (2, 15, 32, NULL);
INSERT INTO j015t_region_negocio VALUES (1, 2, 3, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 4, 9, 6);
INSERT INTO j015t_region_negocio VALUES (2, 4, 11, 8);
INSERT INTO j015t_region_negocio VALUES (2, 4, 12, 9);
INSERT INTO j015t_region_negocio VALUES (2, 4, 13, 16);
INSERT INTO j015t_region_negocio VALUES (3, 9, 21, 15);
INSERT INTO j015t_region_negocio VALUES (2, 9, 20, 14);
INSERT INTO j015t_region_negocio VALUES (1, 9, 19, 13);
INSERT INTO j015t_region_negocio VALUES (2, 5, 15, 7);
INSERT INTO j015t_region_negocio VALUES (3, 2, 5, NULL);
INSERT INTO j015t_region_negocio VALUES (2, 4, 10, 5);
INSERT INTO j015t_region_negocio VALUES (1, 3, 6, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 10, 26, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 12, 27, NULL);
INSERT INTO j015t_region_negocio VALUES (2, 3, 7, NULL);
INSERT INTO j015t_region_negocio VALUES (2, 2, 4, NULL);
INSERT INTO j015t_region_negocio VALUES (3, 3, 8, NULL);


--
-- TOC entry 2766 (class 0 OID 24932)
-- Dependencies: 199
-- Data for Name: j016t_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j016t_forense VALUES (1, '2015-07-01', '2015-07-01', 1, 1, 2, 1, 1, '2222', false, '222', '222', 1, '22', '22', '222', '2015-07-16', '2015-07-30 00:00:00', 2222, 1);
INSERT INTO j016t_forense VALUES (2, '2015-07-09', '2015-07-16', 1, 1, 3, 2, 6, '222', false, '222', '222', 1, '22', '22', 'sdfsd', '2015-07-15', '2015-07-30 00:00:00', 33323, 1);


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 200
-- Name: j016t_forense_co_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j016t_forense_co_forense_seq', 2, true);


--
-- TOC entry 2768 (class 0 OID 24946)
-- Dependencies: 201
-- Data for Name: j017t_alcance_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j017t_alcance_forense VALUES (1, 'Coleccion de Evidencia', NULL, NULL, NULL, NULL);
INSERT INTO j017t_alcance_forense VALUES (2, 'Analisis de Evidencias', NULL, NULL, NULL, NULL);
INSERT INTO j017t_alcance_forense VALUES (3, 'Coleccion y Analisis', NULL, NULL, NULL, NULL);
INSERT INTO j017t_alcance_forense VALUES (4, 'Recuperacion de Informacion sin Analizar', NULL, NULL, NULL, NULL);


--
-- TOC entry 2770 (class 0 OID 24959)
-- Dependencies: 203
-- Data for Name: j018t_informe_forense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 202
-- Name: j018t_informe_forense_co_informe_forense_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j018t_informe_forense_co_informe_forense_seq', 1, false);


--
-- TOC entry 2771 (class 0 OID 25116)
-- Dependencies: 204
-- Data for Name: j019t_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2773 (class 0 OID 25201)
-- Dependencies: 206
-- Data for Name: j020t_acta_acc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 205
-- Name: j020t_acta_acc_co_acc_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j020t_acta_acc_co_acc_seq', 1, false);


--
-- TOC entry 2775 (class 0 OID 25259)
-- Dependencies: 208
-- Data for Name: j021t_acta_aie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 207
-- Name: j021t_acta_aie_co_aie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j021t_acta_aie_co_aie_seq', 1, false);


--
-- TOC entry 2777 (class 0 OID 25364)
-- Dependencies: 210
-- Data for Name: j022t_acta_anie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 209
-- Name: j022t_acta_anie_co_anie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j022t_acta_anie_co_anie_seq', 1, false);


--
-- TOC entry 2778 (class 0 OID 25419)
-- Dependencies: 211
-- Data for Name: j023t_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2780 (class 0 OID 25565)
-- Dependencies: 213
-- Data for Name: j025t_tipo_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j025t_tipo_evidencia VALUES (1, 'FISICA ORIGINAL', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (2, 'FISICA CON EVIDENCIA DIGITAL', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (3, 'IMAGEN FORENSE ORIGINAL', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (4, 'IMAGEN FORENSE COPIA', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (5, 'ARCHIVOS COLECTADOS ORIGINALES', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (6, 'ARCHIVOS RECUPERADOS DESDE LA IMAGEN ORIGINALES', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (7, 'ARCHIVOS COPIADOS PARA RESGUARDO', NULL, NULL, NULL, NULL);
INSERT INTO j025t_tipo_evidencia VALUES (8, 'ARCHIVOS COPIADOS PARA ENTREGA FUERA DE STI', NULL, NULL, NULL, NULL);


--
-- TOC entry 2781 (class 0 OID 25585)
-- Dependencies: 214
-- Data for Name: j026t_estado_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j026t_estado_evidencia VALUES (1, 'EN CUSTODIA PERSONAL DE STI', NULL, NULL, NULL, NULL);
INSERT INTO j026t_estado_evidencia VALUES (2, 'RESGUARDADA EN LUGAR SEGURO', NULL, NULL, NULL, NULL);
INSERT INTO j026t_estado_evidencia VALUES (3, 'ENTREGADA FUERA DE STI', NULL, NULL, NULL, NULL);
INSERT INTO j026t_estado_evidencia VALUES (4, 'DESTRUIDA', NULL, NULL, NULL, NULL);
INSERT INTO j026t_estado_evidencia VALUES (5, 'RESGUARDADA EN REPOSITORIO DIGITAL', NULL, NULL, NULL, NULL);


--
-- TOC entry 2782 (class 0 OID 25618)
-- Dependencies: 215
-- Data for Name: j027t_lugar_seguro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2783 (class 0 OID 25638)
-- Dependencies: 216
-- Data for Name: j028t_repositorio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2784 (class 0 OID 25676)
-- Dependencies: 217
-- Data for Name: j029t_historico_evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2786 (class 0 OID 26149)
-- Dependencies: 219
-- Data for Name: j030t_informe_recomendaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 218
-- Name: j030t_informe_recomendaciones_co_informe_recomendaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j030t_informe_recomendaciones_co_informe_recomendaciones_seq', 1, false);


--
-- TOC entry 2787 (class 0 OID 26206)
-- Dependencies: 220
-- Data for Name: j031t_accion_recomendada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2788 (class 0 OID 26258)
-- Dependencies: 221
-- Data for Name: j032t_seriales_enlaces_ir; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2790 (class 0 OID 26288)
-- Dependencies: 223
-- Data for Name: j033t_procesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j033t_procesos VALUES (1, 'Evaluacion, Respuesta y Contingencia', 'ERC');
INSERT INTO j033t_procesos VALUES (2, 'Protección Lógica', 'PL');
INSERT INTO j033t_procesos VALUES (3, 'Arquitectura Preventiva de Seguridad', 'APS');
INSERT INTO j033t_procesos VALUES (4, 'Inteligencia Aplicada a Datos', 'IAD');


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 222
-- Name: j033t_procesos_co_proceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j033t_procesos_co_proceso_seq', 4, true);


--
-- TOC entry 2792 (class 0 OID 26301)
-- Dependencies: 225
-- Data for Name: j034t_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 224
-- Name: j034t_incidente_co_incidente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j034t_incidente_co_incidente_seq', 1, false);


--
-- TOC entry 2793 (class 0 OID 26387)
-- Dependencies: 226
-- Data for Name: j035t_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2794 (class 0 OID 26393)
-- Dependencies: 227
-- Data for Name: j036t_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j036t_principio VALUES (1, 'Disponibilidad', NULL);
INSERT INTO j036t_principio VALUES (2, 'Integridad', NULL);
INSERT INTO j036t_principio VALUES (3, 'Confidencialidad', NULL);
INSERT INTO j036t_principio VALUES (4, 'Autenticidad', NULL);
INSERT INTO j036t_principio VALUES (5, 'Autenticación', NULL);
INSERT INTO j036t_principio VALUES (6, 'No Repudio', NULL);


--
-- TOC entry 2795 (class 0 OID 26403)
-- Dependencies: 228
-- Data for Name: j037t_incidente_principio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2796 (class 0 OID 26420)
-- Dependencies: 229
-- Data for Name: j038t_incidente_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2799 (class 0 OID 26443)
-- Dependencies: 232
-- Data for Name: j039t_herramienta_utilizada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2797 (class 0 OID 26437)
-- Dependencies: 230
-- Data for Name: j040t_tipo_herramientas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2798 (class 0 OID 26440)
-- Dependencies: 231
-- Data for Name: j041t_herramientas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2800 (class 0 OID 26446)
-- Dependencies: 233
-- Data for Name: j042t_estado_incidente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j042t_estado_incidente VALUES (1, 'Abierto', NULL, NULL, 2, 2);
INSERT INTO j042t_estado_incidente VALUES (2, 'Escalado', NULL, NULL, 2, 2);
INSERT INTO j042t_estado_incidente VALUES (3, 'Cerrado', NULL, NULL, 2, 2);


--
-- TOC entry 2801 (class 0 OID 26466)
-- Dependencies: 234
-- Data for Name: j043t_tipo_incidentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j043t_tipo_incidentes VALUES (1, NULL, NULL, NULL, NULL, 'Acceso No Autorizado');
INSERT INTO j043t_tipo_incidentes VALUES (3, NULL, NULL, NULL, NULL, 'Denegación de Servicios');
INSERT INTO j043t_tipo_incidentes VALUES (2, NULL, NULL, NULL, NULL, 'Código Malicioso');
INSERT INTO j043t_tipo_incidentes VALUES (4, NULL, NULL, NULL, NULL, 'Error Humano');
INSERT INTO j043t_tipo_incidentes VALUES (5, NULL, NULL, NULL, NULL, 'Falla de Infraestructura');
INSERT INTO j043t_tipo_incidentes VALUES (6, NULL, NULL, NULL, NULL, 'Insumo Interno');
INSERT INTO j043t_tipo_incidentes VALUES (7, NULL, NULL, NULL, NULL, 'Uso Indebido');
INSERT INTO j043t_tipo_incidentes VALUES (8, NULL, NULL, NULL, NULL, 'Uso No Autorizado');
INSERT INTO j043t_tipo_incidentes VALUES (9, NULL, NULL, NULL, NULL, 'Coacción');


--
-- TOC entry 2802 (class 0 OID 26469)
-- Dependencies: 235
-- Data for Name: j044t_tipo_hechos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j044t_tipo_hechos VALUES (1, NULL, NULL, NULL, NULL, 'Acceso Indebido
', 1);
INSERT INTO j044t_tipo_hechos VALUES (2, NULL, NULL, NULL, NULL, 'Conexión de equipos de terceros sin autorización
', 1);
INSERT INTO j044t_tipo_hechos VALUES (3, NULL, NULL, NULL, NULL, 'Evasión de los controles de seguridad en Internet, utilizando software y herramientas calificadas para tal fin.  
', 1);
INSERT INTO j044t_tipo_hechos VALUES (4, NULL, NULL, NULL, NULL, 'Exploración desde red externa(escaneos)
', 1);
INSERT INTO j044t_tipo_hechos VALUES (5, NULL, NULL, NULL, NULL, 'Exploración desde red PDVSA(escaneos)
', 1);
INSERT INTO j044t_tipo_hechos VALUES (6, NULL, NULL, NULL, NULL, 'Código Malicioso   (virus, troyanos, gusanos, script maliciosos, etc.)
', 2);
INSERT INTO j044t_tipo_hechos VALUES (7, NULL, NULL, NULL, NULL, 'Denegación de Servicios desde red externa
', 3);
INSERT INTO j044t_tipo_hechos VALUES (8, NULL, NULL, NULL, NULL, 'Denegación de Servicios desde red PDVSA
', 3);
INSERT INTO j044t_tipo_hechos VALUES (9, NULL, NULL, NULL, NULL, 'Desconexión de Equipos de la Plataforma sin Autorización
', 4);
INSERT INTO j044t_tipo_hechos VALUES (10, NULL, NULL, NULL, NULL, 'Desconexión de Equipos de Seguridad
', 4);
INSERT INTO j044t_tipo_hechos VALUES (11, NULL, NULL, NULL, NULL, 'Mala Configuración de Equipos (recursos compartidos, claves por defecto, fuera de estandar ,etc)
', 4);
INSERT INTO j044t_tipo_hechos VALUES (12, NULL, NULL, NULL, NULL, 'Capacidad del sistema/recurso desbordada 
', 4);
INSERT INTO j044t_tipo_hechos VALUES (13, NULL, NULL, NULL, NULL, 'Falla de Aplicación
', 4);
INSERT INTO j044t_tipo_hechos VALUES (14, NULL, NULL, NULL, NULL, 'Falla de Base de Datos
', 4);
INSERT INTO j044t_tipo_hechos VALUES (15, NULL, NULL, NULL, NULL, 'Falla de Dispositivo de Red
', 4);
INSERT INTO j044t_tipo_hechos VALUES (16, NULL, NULL, NULL, NULL, 'Falla de Medio de Transmisión (cable, radio, microondas)
', 4);
INSERT INTO j044t_tipo_hechos VALUES (17, NULL, NULL, NULL, NULL, 'Falla de Servidor
', 4);
INSERT INTO j044t_tipo_hechos VALUES (18, NULL, NULL, NULL, NULL, 'Falla del Sistema de Energía Alterno
', 4);
INSERT INTO j044t_tipo_hechos VALUES (19, NULL, NULL, NULL, NULL, 'Falla Eléctrica
', 4);
INSERT INTO j044t_tipo_hechos VALUES (20, NULL, NULL, NULL, NULL, 'Falla en el sistema de refrigeración 
', 4);
INSERT INTO j044t_tipo_hechos VALUES (21, NULL, NULL, NULL, NULL, 'Acceso a sitios Web prohibidos
', 5);
INSERT INTO j044t_tipo_hechos VALUES (22, NULL, NULL, NULL, NULL, 'Falso Positivo 
', 5);
INSERT INTO j044t_tipo_hechos VALUES (23, NULL, NULL, NULL, NULL, 'Suplantación de correo electrónico externo
', 5);
INSERT INTO j044t_tipo_hechos VALUES (24, NULL, NULL, NULL, NULL, 'Alto consumo de ancho de banda en visitas a sitios Web
', 6);
INSERT INTO j044t_tipo_hechos VALUES (25, NULL, NULL, NULL, NULL, 'Almacenamiento de archivos pornográficos en servidores
', 6);
INSERT INTO j044t_tipo_hechos VALUES (26, NULL, NULL, NULL, NULL, 'Almacenamiento de archivos con fines publicitarios en servidores
', 6);
INSERT INTO j044t_tipo_hechos VALUES (27, NULL, NULL, NULL, NULL, 'Almacenamiento de Información Confidencial ó Estrictamente Confidencial, en servidores públicos
', 6);
INSERT INTO j044t_tipo_hechos VALUES (28, NULL, NULL, NULL, NULL, 'Almacenamiento de música, video o imágenes no autorizadas en servidores y equipos de la Corporación
', 6);
INSERT INTO j044t_tipo_hechos VALUES (29, NULL, NULL, NULL, NULL, 'Almacenamiento y/o uso de software no autorizado
', 6);
INSERT INTO j044t_tipo_hechos VALUES (30, NULL, NULL, NULL, NULL, 'Uso compartido de cuentas de acceso lógicos
', 6);
INSERT INTO j044t_tipo_hechos VALUES (31, NULL, NULL, NULL, NULL, 'Uso indebido de privilegios de acceso lógico
', 6);
INSERT INTO j044t_tipo_hechos VALUES (32, NULL, NULL, NULL, NULL, 'Uso indebido de servidores públicos
', 6);
INSERT INTO j044t_tipo_hechos VALUES (33, NULL, NULL, NULL, NULL, 'Correo electrónico
', 6);
INSERT INTO j044t_tipo_hechos VALUES (34, NULL, NULL, NULL, NULL, 'Instalación o uso de dispositivos no autorizados.
', 6);
INSERT INTO j044t_tipo_hechos VALUES (35, NULL, NULL, NULL, NULL, 'Cambio no autorizado en la Plataforma Tecnológica
', 6);
INSERT INTO j044t_tipo_hechos VALUES (36, NULL, NULL, NULL, NULL, 'Acceso y uso bajo coacción
', 6);


--
-- TOC entry 2803 (class 0 OID 26472)
-- Dependencies: 236
-- Data for Name: j045t_referencia_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2804 (class 0 OID 26475)
-- Dependencies: 237
-- Data for Name: j046t_marco_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2805 (class 0 OID 26515)
-- Dependencies: 238
-- Data for Name: j047t_documento_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2806 (class 0 OID 26564)
-- Dependencies: 239
-- Data for Name: j048t_estado_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j048t_estado_documento VALUES (1, 'Creado', NULL, NULL, NULL, NULL);
INSERT INTO j048t_estado_documento VALUES (2, 'Aprobado', NULL, NULL, NULL, NULL);
INSERT INTO j048t_estado_documento VALUES (3, 'Eliminado', NULL, NULL, NULL, NULL);


--
-- TOC entry 2807 (class 0 OID 26609)
-- Dependencies: 240
-- Data for Name: j049t_tipo_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j049t_tipo_marco VALUES (1, 'Politicas de Seguridad de Información', 'PSI', NULL, NULL, NULL, NULL);
INSERT INTO j049t_tipo_marco VALUES (2, 'Normativas de Seguridad de Información', 'NSI', NULL, NULL, NULL, NULL);
INSERT INTO j049t_tipo_marco VALUES (3, 'Lineamientos de Seguridad de Información', 'LSI', NULL, NULL, NULL, NULL);


--
-- TOC entry 2809 (class 0 OID 26648)
-- Dependencies: 242
-- Data for Name: j050t_informe_marco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 241
-- Name: j050t_informe_marco_co_informe_marco_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('j050t_informe_marco_co_informe_marco_seq', 1, false);


--
-- TOC entry 2810 (class 0 OID 26669)
-- Dependencies: 243
-- Data for Name: j051t_tipo_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j051t_tipo_revision VALUES (1, 'Creación de Marco Normativo', NULL, NULL, NULL, NULL);
INSERT INTO j051t_tipo_revision VALUES (2, 'Actualización de Marco Normativo', NULL, NULL, NULL, NULL);
INSERT INTO j051t_tipo_revision VALUES (3, 'Eliminación de Marco Normativo', NULL, NULL, NULL, NULL);


--
-- TOC entry 2811 (class 0 OID 26690)
-- Dependencies: 244
-- Data for Name: j052t_tipo_justificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO j052t_tipo_justificacion VALUES (1, 'Planificado', NULL, NULL, NULL, NULL);
INSERT INTO j052t_tipo_justificacion VALUES (2, 'Cambio Significativo', NULL, NULL, NULL, NULL);


--
-- TOC entry 2299 (class 2606 OID 24950)
-- Name: co_alcance_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT co_alcance_forense PRIMARY KEY (co_alcance_forense);


--
-- TOC entry 2446 (class 2606 OID 26522)
-- Name: co_documento_normativo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT co_documento_normativo PRIMARY KEY (co_documento_normativo);


--
-- TOC entry 2456 (class 2606 OID 26571)
-- Name: co_estado_documento; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT co_estado_documento PRIMARY KEY (co_estado_documento);


--
-- TOC entry 2364 (class 2606 OID 25592)
-- Name: co_estado_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT co_estado_evidencia PRIMARY KEY (co_estado_evidencia);


--
-- TOC entry 2428 (class 2606 OID 26453)
-- Name: co_estado_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT co_estado_incidente PRIMARY KEY (co_estado_incidente);


--
-- TOC entry 2343 (class 2606 OID 25502)
-- Name: co_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT co_evidencia PRIMARY KEY (co_evidencia);


--
-- TOC entry 2368 (class 2606 OID 25625)
-- Name: co_lugar_seguro; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT co_lugar_seguro PRIMARY KEY (co_lugar_seguro);


--
-- TOC entry 2313 (class 2606 OID 25120)
-- Name: co_participantes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT co_participantes PRIMARY KEY (co_participante);


--
-- TOC entry 2372 (class 2606 OID 25645)
-- Name: co_repositorio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT co_repositorio PRIMARY KEY (co_repositorio);


--
-- TOC entry 2360 (class 2606 OID 25572)
-- Name: co_tipo_evidencia; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT co_tipo_evidencia PRIMARY KEY (co_tipo_evidencia);


--
-- TOC entry 2477 (class 2606 OID 26697)
-- Name: co_tipo_justificacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT co_tipo_justificacion PRIMARY KEY (co_tipo_justificacion);


--
-- TOC entry 2460 (class 2606 OID 26616)
-- Name: co_tipo_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT co_tipo_marco PRIMARY KEY (co_tipo_marco);


--
-- TOC entry 2471 (class 2606 OID 26676)
-- Name: co_tipo_revision; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT co_tipo_revision PRIMARY KEY (co_tipo_revision);


--
-- TOC entry 2437 (class 2606 OID 26484)
-- Name: fk_co_referencia_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_referencia_marco PRIMARY KEY (co_referencia_marco);


--
-- TOC entry 2235 (class 2606 OID 16398)
-- Name: j001t_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j001t_menu
    ADD CONSTRAINT j001t_menu_pkey PRIMARY KEY (co_menu);


--
-- TOC entry 2241 (class 2606 OID 16412)
-- Name: j002t_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT j002t_usuario_pkey PRIMARY KEY (co_usuario);


--
-- TOC entry 2245 (class 2606 OID 16426)
-- Name: j003_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j003t_rol
    ADD CONSTRAINT j003_rol_pkey PRIMARY KEY (co_rol);


--
-- TOC entry 2249 (class 2606 OID 16547)
-- Name: j004t_rol_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT j004t_rol_menu_pkey PRIMARY KEY (co_rol_menu);


--
-- TOC entry 2252 (class 2606 OID 16449)
-- Name: j005t_transaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j005t_transaccion
    ADD CONSTRAINT j005t_transaccion_pkey PRIMARY KEY (co_transaccion);


--
-- TOC entry 2257 (class 2606 OID 16521)
-- Name: j006t_solicitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT j006t_solicitud_pkey PRIMARY KEY (co_solicitud);


--
-- TOC entry 2259 (class 2606 OID 16473)
-- Name: j007t_region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j007t_region
    ADD CONSTRAINT j007t_region_pkey PRIMARY KEY (co_region);


--
-- TOC entry 2262 (class 2606 OID 16487)
-- Name: j008t_division_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j008t_division
    ADD CONSTRAINT j008t_division_pkey PRIMARY KEY (co_division);


--
-- TOC entry 2266 (class 2606 OID 16582)
-- Name: j009t_serial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT j009t_serial_pkey PRIMARY KEY (co_serial);


--
-- TOC entry 2271 (class 2606 OID 16609)
-- Name: j010t_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT j010t_evaluacion_pkey PRIMARY KEY (co_evaluacion);


--
-- TOC entry 2278 (class 2606 OID 16689)
-- Name: j012t_cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT j012t_cronograma_pkey PRIMARY KEY (co_cronograma);


--
-- TOC entry 2282 (class 2606 OID 16721)
-- Name: j013t_vul_cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT j013t_vul_cronograma_pkey PRIMARY KEY (co_vul_cronograma);


--
-- TOC entry 2284 (class 2606 OID 24878)
-- Name: j014t_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j014t_negocio
    ADD CONSTRAINT j014t_negocio_pkey PRIMARY KEY (co_negocio);


--
-- TOC entry 2397 (class 2606 OID 26296)
-- Name: j033t_procesos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j033t_procesos
    ADD CONSTRAINT j033t_procesos_pkey PRIMARY KEY (co_proceso);


--
-- TOC entry 2325 (class 2606 OID 25209)
-- Name: pk_co_acc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT pk_co_acc PRIMARY KEY (co_acc);


--
-- TOC entry 2391 (class 2606 OID 26213)
-- Name: pk_co_accion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT pk_co_accion PRIMARY KEY (co_accion);


--
-- TOC entry 2333 (class 2606 OID 25267)
-- Name: pk_co_aie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT pk_co_aie PRIMARY KEY (co_aie);


--
-- TOC entry 2341 (class 2606 OID 25372)
-- Name: pk_co_anie; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT pk_co_anie PRIMARY KEY (co_anie);


--
-- TOC entry 2395 (class 2606 OID 26262)
-- Name: pk_co_enlaces_ir; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT pk_co_enlaces_ir PRIMARY KEY (co_enlaces_ir);


--
-- TOC entry 2297 (class 2606 OID 24942)
-- Name: pk_co_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT pk_co_forense PRIMARY KEY (co_forense);


--
-- TOC entry 2426 (class 2606 OID 26784)
-- Name: pk_co_herramienta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j041t_herramientas
    ADD CONSTRAINT pk_co_herramienta PRIMARY KEY (co_herramientas);


--
-- TOC entry 2409 (class 2606 OID 26309)
-- Name: pk_co_incidente; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT pk_co_incidente PRIMARY KEY (co_incidente);


--
-- TOC entry 2421 (class 2606 OID 26424)
-- Name: pk_co_incidente_servicios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT pk_co_incidente_servicios PRIMARY KEY (co_incidente_servicios);


--
-- TOC entry 2311 (class 2606 OID 24967)
-- Name: pk_co_informe_forense; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT pk_co_informe_forense PRIMARY KEY (co_informe_forense);


--
-- TOC entry 2469 (class 2606 OID 26656)
-- Name: pk_co_informe_marco; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT pk_co_informe_marco PRIMARY KEY (co_informe_marco);


--
-- TOC entry 2384 (class 2606 OID 26157)
-- Name: pk_co_informe_recomendaciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT pk_co_informe_recomendaciones PRIMARY KEY (co_informe_recomendaciones);


--
-- TOC entry 2444 (class 2606 OID 26482)
-- Name: pk_co_marco_normativo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j046t_marco_normativo
    ADD CONSTRAINT pk_co_marco_normativo PRIMARY KEY (co_marco_normativo);


--
-- TOC entry 2413 (class 2606 OID 26400)
-- Name: pk_co_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j036t_principio
    ADD CONSTRAINT pk_co_principio PRIMARY KEY (co_principio);


--
-- TOC entry 2358 (class 2606 OID 26782)
-- Name: pk_co_recurso; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT pk_co_recurso PRIMARY KEY (co_recurso);


--
-- TOC entry 2288 (class 2606 OID 26298)
-- Name: pk_co_region_negocio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT pk_co_region_negocio PRIMARY KEY (co_region_negocio);


--
-- TOC entry 2411 (class 2606 OID 26402)
-- Name: pk_co_servicios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j035t_servicios
    ADD CONSTRAINT pk_co_servicios PRIMARY KEY (co_servicios);


--
-- TOC entry 2435 (class 2606 OID 26731)
-- Name: pk_co_tipo_hechos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j044t_tipo_hechos
    ADD CONSTRAINT pk_co_tipo_hechos PRIMARY KEY (co_tipo_hechos);


--
-- TOC entry 2423 (class 2606 OID 26786)
-- Name: pk_co_tipo_herramienta; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j040t_tipo_herramientas
    ADD CONSTRAINT pk_co_tipo_herramienta PRIMARY KEY (co_tipo_herramientas);


--
-- TOC entry 2432 (class 2606 OID 26729)
-- Name: pk_co_tipo_incidentes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j043t_tipo_incidentes
    ADD CONSTRAINT pk_co_tipo_incidentes PRIMARY KEY (co_tipo_incidentes);


--
-- TOC entry 2273 (class 2606 OID 16661)
-- Name: pk_co_vulnerabilidad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j011t_vulnerabilidad
    ADD CONSTRAINT pk_co_vulnerabilidad PRIMARY KEY (co_vulnerabilidad);


--
-- TOC entry 2417 (class 2606 OID 26407)
-- Name: pk_incidente_principio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT pk_incidente_principio PRIMARY KEY (co_incidente_principio);


--
-- TOC entry 2243 (class 2606 OID 29210)
-- Name: uk_tx_indicador; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT uk_tx_indicador UNIQUE (tx_indicador);


--
-- TOC entry 2344 (class 1259 OID 25514)
-- Name: fki_co_acc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_acc ON j023t_evidencia USING btree (co_acc);


--
-- TOC entry 2375 (class 1259 OID 26252)
-- Name: fki_co_accion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_accion ON j030t_informe_recomendaciones USING btree (co_accion);


--
-- TOC entry 2438 (class 1259 OID 26514)
-- Name: fki_co_accion17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_accion17 ON j045t_referencia_marco USING btree (co_accion);


--
-- TOC entry 2345 (class 1259 OID 25520)
-- Name: fki_co_aie; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aie ON j023t_evidencia USING btree (co_aie);


--
-- TOC entry 2289 (class 1259 OID 24974)
-- Name: fki_co_alcance; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_alcance ON j016t_forense USING btree (co_alcance_forense);


--
-- TOC entry 2302 (class 1259 OID 25093)
-- Name: fki_co_aprueba; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba ON j018t_informe_forense USING btree (co_aprueba);


--
-- TOC entry 2447 (class 1259 OID 26540)
-- Name: fki_co_aprueba10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba10 ON j047t_documento_normativo USING btree (co_aprueba1);


--
-- TOC entry 2448 (class 1259 OID 26546)
-- Name: fki_co_aprueba20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba20 ON j047t_documento_normativo USING btree (co_aprueba2);


--
-- TOC entry 2376 (class 1259 OID 26198)
-- Name: fki_co_aprueba8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_aprueba8 ON j030t_informe_recomendaciones USING btree (co_aprueba);


--
-- TOC entry 2346 (class 1259 OID 25526)
-- Name: fki_co_colecta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_colecta ON j023t_evidencia USING btree (co_colecta);


--
-- TOC entry 2369 (class 1259 OID 25636)
-- Name: fki_co_created_at10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at10 ON j027t_lugar_seguro USING btree (co_usuario_created);


--
-- TOC entry 2373 (class 1259 OID 25656)
-- Name: fki_co_created_at11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at11 ON j028t_repositorio USING btree (co_usuario_created);


--
-- TOC entry 2385 (class 1259 OID 26240)
-- Name: fki_co_created_at12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at12 ON j031t_accion_recomendada USING btree (co_created_at);


--
-- TOC entry 2457 (class 1259 OID 26582)
-- Name: fki_co_created_at15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at15 ON j048t_estado_documento USING btree (co_usuario_created);


--
-- TOC entry 2429 (class 1259 OID 26464)
-- Name: fki_co_created_at18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at18 ON j042t_estado_incidente USING btree (co_usuario_created);


--
-- TOC entry 2449 (class 1259 OID 26533)
-- Name: fki_co_created_at20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at20 ON j047t_documento_normativo USING btree (co_usuario_created);


--
-- TOC entry 2461 (class 1259 OID 26627)
-- Name: fki_co_created_at24; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at24 ON j049t_tipo_marco USING btree (co_usuario_created);


--
-- TOC entry 2355 (class 1259 OID 25552)
-- Name: fki_co_created_at7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at7 ON c024t_recurso USING btree (co_usuario_created);


--
-- TOC entry 2361 (class 1259 OID 25583)
-- Name: fki_co_created_at8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at8 ON j025t_tipo_evidencia USING btree (co_usuario_created);


--
-- TOC entry 2365 (class 1259 OID 25603)
-- Name: fki_co_created_at9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_created_at9 ON j026t_estado_evidencia USING btree (co_usuario_created);


--
-- TOC entry 2279 (class 1259 OID 16727)
-- Name: fki_co_cronograma_vul; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_cronograma_vul ON j013t_vul_cronograma USING btree (co_cronograma);


--
-- TOC entry 2347 (class 1259 OID 25532)
-- Name: fki_co_custodio_sti; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_custodio_sti ON j023t_evidencia USING btree (co_custodio_sti);


--
-- TOC entry 2317 (class 1259 OID 25254)
-- Name: fki_co_destruye4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_destruye4 ON j020t_acta_acc USING btree (co_destruye);


--
-- TOC entry 2236 (class 1259 OID 16499)
-- Name: fki_co_division; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division ON j002t_usuario USING btree (co_division);


--
-- TOC entry 2285 (class 1259 OID 29216)
-- Name: fki_co_division100; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division100 ON j015t_region_negocio USING btree (co_division);


--
-- TOC entry 2398 (class 1259 OID 26345)
-- Name: fki_co_division16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division16 ON j034t_incidente USING btree (co_division);


--
-- TOC entry 2290 (class 1259 OID 25024)
-- Name: fki_co_division2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division2 ON j016t_forense USING btree (co_division);


--
-- TOC entry 2303 (class 1259 OID 25081)
-- Name: fki_co_division3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division3 ON j018t_informe_forense USING btree (co_division);


--
-- TOC entry 2318 (class 1259 OID 25250)
-- Name: fki_co_division4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division4 ON j020t_acta_acc USING btree (co_division);


--
-- TOC entry 2326 (class 1259 OID 25303)
-- Name: fki_co_division5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division5 ON j021t_acta_aie USING btree (co_division);


--
-- TOC entry 2334 (class 1259 OID 25413)
-- Name: fki_co_division6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division6 ON j022t_acta_anie USING btree (co_division);


--
-- TOC entry 2377 (class 1259 OID 26199)
-- Name: fki_co_division8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_division8 ON j030t_informe_recomendaciones USING btree (co_division);


--
-- TOC entry 2450 (class 1259 OID 26552)
-- Name: fki_co_elimina20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elimina20 ON j047t_documento_normativo USING btree (co_elimina1);


--
-- TOC entry 2451 (class 1259 OID 26563)
-- Name: fki_co_elimina22; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_elimina22 ON j047t_documento_normativo USING btree (co_elimina2);


--
-- TOC entry 2452 (class 1259 OID 26589)
-- Name: fki_co_estado_documento; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_documento ON j047t_documento_normativo USING btree (co_estado);


--
-- TOC entry 2348 (class 1259 OID 25617)
-- Name: fki_co_estado_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_evidencia ON j023t_evidencia USING btree (co_estado_evidencia);


--
-- TOC entry 2399 (class 1259 OID 26749)
-- Name: fki_co_estado_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_estado_incidente ON j034t_incidente USING btree (co_estado);


--
-- TOC entry 2304 (class 1259 OID 25058)
-- Name: fki_co_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense ON j018t_informe_forense USING btree (co_forense);


--
-- TOC entry 2386 (class 1259 OID 26386)
-- Name: fki_co_forense12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense12 ON j031t_accion_recomendada USING btree (co_forense);


--
-- TOC entry 2439 (class 1259 OID 26502)
-- Name: fki_co_forense17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense17 ON j045t_referencia_marco USING btree (co_forense);


--
-- TOC entry 2314 (class 1259 OID 25137)
-- Name: fki_co_forense3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense3 ON j019t_participantes USING btree (co_forense);


--
-- TOC entry 2319 (class 1259 OID 25251)
-- Name: fki_co_forense4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense4 ON j020t_acta_acc USING btree (co_forense);


--
-- TOC entry 2327 (class 1259 OID 25304)
-- Name: fki_co_forense5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense5 ON j021t_acta_aie USING btree (co_forense);


--
-- TOC entry 2335 (class 1259 OID 25414)
-- Name: fki_co_forense6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense6 ON j022t_acta_anie USING btree (co_forense);


--
-- TOC entry 2392 (class 1259 OID 26274)
-- Name: fki_co_forense8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_forense8 ON j032t_seriales_enlaces_ir USING btree (co_forense);


--
-- TOC entry 2440 (class 1259 OID 26496)
-- Name: fki_co_incidente17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_incidente17 ON j045t_referencia_marco USING btree (co_incidente);


--
-- TOC entry 2387 (class 1259 OID 26365)
-- Name: fki_co_incidente5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_incidente5 ON j031t_accion_recomendada USING btree (co_incidente);


--
-- TOC entry 2315 (class 1259 OID 25143)
-- Name: fki_co_informe_forense; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_forense ON j019t_participantes USING btree (co_informe_forense);


--
-- TOC entry 2393 (class 1259 OID 26268)
-- Name: fki_co_informe_recomendaciones2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_informe_recomendaciones2 ON j032t_seriales_enlaces_ir USING btree (co_informe_recomendaciones);


--
-- TOC entry 2349 (class 1259 OID 25669)
-- Name: fki_co_lugar_seguro; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_lugar_seguro ON j023t_evidencia USING btree (co_lugar_seguro);


--
-- TOC entry 2441 (class 1259 OID 26490)
-- Name: fki_co_marco_normativo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_marco_normativo ON j045t_referencia_marco USING btree (co_marco_normativo);


--
-- TOC entry 2263 (class 1259 OID 16519)
-- Name: fki_co_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_menu ON j009t_serial USING btree (co_tp_documento);


--
-- TOC entry 2246 (class 1259 OID 16553)
-- Name: fki_co_menu_rol_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_menu_rol_menu ON j004t_rol_menu USING btree (co_rol);


--
-- TOC entry 2260 (class 1259 OID 24884)
-- Name: fki_co_negocio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio ON j008t_division USING btree (co_negocio);


--
-- TOC entry 2237 (class 1259 OID 26285)
-- Name: fki_co_negocio13; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio13 ON j002t_usuario USING btree (co_negocio);


--
-- TOC entry 2400 (class 1259 OID 26346)
-- Name: fki_co_negocio16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio16 ON j034t_incidente USING btree (co_negocio);


--
-- TOC entry 2291 (class 1259 OID 25013)
-- Name: fki_co_negocio2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio2 ON j016t_forense USING btree (co_negocio);


--
-- TOC entry 2305 (class 1259 OID 25075)
-- Name: fki_co_negocio3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio3 ON j018t_informe_forense USING btree (co_negocio);


--
-- TOC entry 2320 (class 1259 OID 25252)
-- Name: fki_co_negocio4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio4 ON j020t_acta_acc USING btree (co_negocio);


--
-- TOC entry 2328 (class 1259 OID 25305)
-- Name: fki_co_negocio5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio5 ON j021t_acta_aie USING btree (co_negocio);


--
-- TOC entry 2336 (class 1259 OID 25415)
-- Name: fki_co_negocio6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio6 ON j022t_acta_anie USING btree (co_negocio);


--
-- TOC entry 2378 (class 1259 OID 26201)
-- Name: fki_co_negocio8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_negocio8 ON j030t_informe_recomendaciones USING btree (co_negocio);


--
-- TOC entry 2350 (class 1259 OID 25564)
-- Name: fki_co_recurso; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_recurso ON j023t_evidencia USING btree (co_recurso);


--
-- TOC entry 2292 (class 1259 OID 24992)
-- Name: fki_co_region; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region ON j016t_forense USING btree (co_region);


--
-- TOC entry 2401 (class 1259 OID 26347)
-- Name: fki_co_region16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region16 ON j034t_incidente USING btree (co_region);


--
-- TOC entry 2306 (class 1259 OID 25069)
-- Name: fki_co_region3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region3 ON j018t_informe_forense USING btree (co_region);


--
-- TOC entry 2321 (class 1259 OID 25253)
-- Name: fki_co_region4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region4 ON j020t_acta_acc USING btree (co_region);


--
-- TOC entry 2329 (class 1259 OID 25306)
-- Name: fki_co_region5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region5 ON j021t_acta_aie USING btree (co_region);


--
-- TOC entry 2337 (class 1259 OID 25416)
-- Name: fki_co_region6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region6 ON j022t_acta_anie USING btree (co_region);


--
-- TOC entry 2379 (class 1259 OID 26202)
-- Name: fki_co_region8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region8 ON j030t_informe_recomendaciones USING btree (co_region);


--
-- TOC entry 2267 (class 1259 OID 16631)
-- Name: fki_co_region_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_eva ON j010t_evaluacion USING btree (co_region);


--
-- TOC entry 2264 (class 1259 OID 16580)
-- Name: fki_co_region_serial; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_serial ON j009t_serial USING btree (co_region);


--
-- TOC entry 2253 (class 1259 OID 16588)
-- Name: fki_co_region_sol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_sol ON j006t_solicitud USING btree (co_region);


--
-- TOC entry 2238 (class 1259 OID 16594)
-- Name: fki_co_region_usuario; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_region_usuario ON j002t_usuario USING btree (co_region);


--
-- TOC entry 2351 (class 1259 OID 25508)
-- Name: fki_co_registro; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_registro ON j023t_evidencia USING btree (co_registro);


--
-- TOC entry 2352 (class 1259 OID 25663)
-- Name: fki_co_repositorio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_repositorio ON j023t_evidencia USING btree (co_repositorio);


--
-- TOC entry 2388 (class 1259 OID 26219)
-- Name: fki_co_responsable_sti; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_responsable_sti ON j031t_accion_recomendada USING btree (co_responsable_sti_ejecutar);


--
-- TOC entry 2307 (class 1259 OID 25087)
-- Name: fki_co_revisa3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_revisa3 ON j018t_informe_forense USING btree (co_revisa);


--
-- TOC entry 2380 (class 1259 OID 26203)
-- Name: fki_co_revisa8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_revisa8 ON j030t_informe_recomendaciones USING btree (co_revisa);


--
-- TOC entry 2239 (class 1259 OID 16545)
-- Name: fki_co_rol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol ON j002t_usuario USING btree (co_rol);


--
-- TOC entry 2247 (class 1259 OID 16559)
-- Name: fki_co_rol_menu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_rol_menu ON j004t_rol_menu USING btree (co_menu);


--
-- TOC entry 2463 (class 1259 OID 26721)
-- Name: fki_co_tipo_documento; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_documento ON j050t_informe_marco USING btree (co_tipo_documento);


--
-- TOC entry 2353 (class 1259 OID 25611)
-- Name: fki_co_tipo_evidencia; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_evidencia ON j023t_evidencia USING btree (co_tipo_evidencia);


--
-- TOC entry 2402 (class 1259 OID 26743)
-- Name: fki_co_tipo_hechos; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_hechos ON j034t_incidente USING btree (co_tipo_hecho);


--
-- TOC entry 2424 (class 1259 OID 26792)
-- Name: fki_co_tipo_herramienta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_herramienta ON j041t_herramientas USING btree (co_tipo_herramientas);


--
-- TOC entry 2433 (class 1259 OID 26761)
-- Name: fki_co_tipo_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_incidente ON j044t_tipo_hechos USING btree (co_tipo_incidente);


--
-- TOC entry 2403 (class 1259 OID 26737)
-- Name: fki_co_tipo_incidentes; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_incidentes ON j034t_incidente USING btree (co_tipo_incidente);


--
-- TOC entry 2464 (class 1259 OID 26727)
-- Name: fki_co_tipo_justificacion; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_justificacion ON j050t_informe_marco USING btree (co_justificacion);


--
-- TOC entry 2465 (class 1259 OID 26715)
-- Name: fki_co_tipo_revision12; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_revision12 ON j050t_informe_marco USING btree (co_tipo_revision);


--
-- TOC entry 2254 (class 1259 OID 16527)
-- Name: fki_co_tipo_solicitud; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_tipo_solicitud ON j006t_solicitud USING btree (co_tipo_solicitud);


--
-- TOC entry 2274 (class 1259 OID 16695)
-- Name: fki_co_transaccion_enlace; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_enlace ON j012t_cronograma USING btree (co_transaccion_enlace);


--
-- TOC entry 2268 (class 1259 OID 16615)
-- Name: fki_co_transaccion_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_eva ON j010t_evaluacion USING btree (co_transaccion);


--
-- TOC entry 2275 (class 1259 OID 16701)
-- Name: fki_co_transaccion_local; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_local ON j012t_cronograma USING btree (co_transaccion);


--
-- TOC entry 2255 (class 1259 OID 16539)
-- Name: fki_co_transaccion_sol; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_transaccion_sol ON j006t_solicitud USING btree (co_transaccion);


--
-- TOC entry 2354 (class 1259 OID 25538)
-- Name: fki_co_update_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at ON j023t_evidencia USING btree (co_update_at);


--
-- TOC entry 2370 (class 1259 OID 25637)
-- Name: fki_co_update_at10; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at10 ON j027t_lugar_seguro USING btree (co_usuario_updated);


--
-- TOC entry 2374 (class 1259 OID 25657)
-- Name: fki_co_update_at11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at11 ON j028t_repositorio USING btree (co_usuario_updated);


--
-- TOC entry 2458 (class 1259 OID 26583)
-- Name: fki_co_update_at15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at15 ON j048t_estado_documento USING btree (co_usuario_updated);


--
-- TOC entry 2430 (class 1259 OID 26465)
-- Name: fki_co_update_at18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at18 ON j042t_estado_incidente USING btree (co_usuario_updated);


--
-- TOC entry 2453 (class 1259 OID 26534)
-- Name: fki_co_update_at20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at20 ON j047t_documento_normativo USING btree (co_usuario_updated);


--
-- TOC entry 2462 (class 1259 OID 26628)
-- Name: fki_co_update_at24; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at24 ON j049t_tipo_marco USING btree (co_usuario_updated);


--
-- TOC entry 2356 (class 1259 OID 25558)
-- Name: fki_co_update_at7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at7 ON c024t_recurso USING btree (co_usuario_updated);


--
-- TOC entry 2362 (class 1259 OID 25584)
-- Name: fki_co_update_at8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at8 ON j025t_tipo_evidencia USING btree (co_usuario_updated);


--
-- TOC entry 2366 (class 1259 OID 25604)
-- Name: fki_co_update_at9; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_update_at9 ON j026t_estado_evidencia USING btree (co_usuario_updated);


--
-- TOC entry 2389 (class 1259 OID 26246)
-- Name: fki_co_updated_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_updated_at ON j031t_accion_recomendada USING btree (co_update_at);


--
-- TOC entry 2293 (class 1259 OID 24980)
-- Name: fki_co_usuario_apertura; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_apertura ON j016t_forense USING btree (co_usuario_apertura);


--
-- TOC entry 2404 (class 1259 OID 26348)
-- Name: fki_co_usuario_apertura16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_apertura16 ON j034t_incidente USING btree (co_usuario_apertura);


--
-- TOC entry 2294 (class 1259 OID 24986)
-- Name: fki_co_usuario_cierre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cierre ON j016t_forense USING btree (co_usuario_cierre);


--
-- TOC entry 2405 (class 1259 OID 26349)
-- Name: fki_co_usuario_cierre16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cierre16 ON j034t_incidente USING btree (co_usuario_cierre);


--
-- TOC entry 2295 (class 1259 OID 25030)
-- Name: fki_co_usuario_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created ON j016t_forense USING btree (co_usuario_update);


--
-- TOC entry 2406 (class 1259 OID 26350)
-- Name: fki_co_usuario_created16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created16 ON j034t_incidente USING btree (co_usuario_update);


--
-- TOC entry 2472 (class 1259 OID 26708)
-- Name: fki_co_usuario_created27; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created27 ON j051t_tipo_revision USING btree (co_usuario_created);


--
-- TOC entry 2466 (class 1259 OID 26667)
-- Name: fki_co_usuario_created28; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created28 ON j050t_informe_marco USING btree (co_usuario_created);


--
-- TOC entry 2473 (class 1259 OID 26687)
-- Name: fki_co_usuario_created29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created29 ON j051t_tipo_revision USING btree (co_usuario_created);


--
-- TOC entry 2300 (class 1259 OID 25046)
-- Name: fki_co_usuario_created3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created3 ON j017t_alcance_forense USING btree (co_usuario_created);


--
-- TOC entry 2308 (class 1259 OID 25109)
-- Name: fki_co_usuario_created4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created4 ON j018t_informe_forense USING btree (co_usuario_created);


--
-- TOC entry 2322 (class 1259 OID 25255)
-- Name: fki_co_usuario_created5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created5 ON j020t_acta_acc USING btree (co_usuario_created);


--
-- TOC entry 2330 (class 1259 OID 25307)
-- Name: fki_co_usuario_created6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created6 ON j021t_acta_aie USING btree (co_usuario_created);


--
-- TOC entry 2338 (class 1259 OID 25417)
-- Name: fki_co_usuario_created7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created7 ON j022t_acta_anie USING btree (co_usuario_created);


--
-- TOC entry 2381 (class 1259 OID 26204)
-- Name: fki_co_usuario_created8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_created8 ON j030t_informe_recomendaciones USING btree (co_usuario_created);


--
-- TOC entry 2276 (class 1259 OID 16707)
-- Name: fki_co_usuario_cron; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_cron ON j012t_cronograma USING btree (co_usuario);


--
-- TOC entry 2316 (class 1259 OID 25126)
-- Name: fki_co_usuario_elabora; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_elabora ON j019t_participantes USING btree (co_usuario_elabora);


--
-- TOC entry 2407 (class 1259 OID 26359)
-- Name: fki_co_usuario_escala; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_escala ON j034t_incidente USING btree (co_usuario_escala);


--
-- TOC entry 2269 (class 1259 OID 16640)
-- Name: fki_co_usuario_eva; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_eva ON j010t_evaluacion USING btree (co_usuario);


--
-- TOC entry 2250 (class 1259 OID 16533)
-- Name: fki_co_usuario_tran; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_tran ON j005t_transaccion USING btree (co_usuario);


--
-- TOC entry 2474 (class 1259 OID 26709)
-- Name: fki_co_usuario_update27; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update27 ON j051t_tipo_revision USING btree (co_usuario_updated);


--
-- TOC entry 2467 (class 1259 OID 26668)
-- Name: fki_co_usuario_update28; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update28 ON j050t_informe_marco USING btree (co_usuario_update);


--
-- TOC entry 2475 (class 1259 OID 26688)
-- Name: fki_co_usuario_update29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update29 ON j051t_tipo_revision USING btree (co_usuario_updated);


--
-- TOC entry 2301 (class 1259 OID 25052)
-- Name: fki_co_usuario_update3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update3 ON j017t_alcance_forense USING btree (co_usuario_updated);


--
-- TOC entry 2309 (class 1259 OID 25115)
-- Name: fki_co_usuario_update4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update4 ON j018t_informe_forense USING btree (co_usuario_update);


--
-- TOC entry 2323 (class 1259 OID 25256)
-- Name: fki_co_usuario_update5; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update5 ON j020t_acta_acc USING btree (co_usuario_update);


--
-- TOC entry 2331 (class 1259 OID 25308)
-- Name: fki_co_usuario_update6; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update6 ON j021t_acta_aie USING btree (co_usuario_update);


--
-- TOC entry 2339 (class 1259 OID 25418)
-- Name: fki_co_usuario_update7; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update7 ON j022t_acta_anie USING btree (co_usuario_update);


--
-- TOC entry 2382 (class 1259 OID 26205)
-- Name: fki_co_usuario_update8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_usuario_update8 ON j030t_informe_recomendaciones USING btree (co_usuario_update);


--
-- TOC entry 2280 (class 1259 OID 16733)
-- Name: fki_co_vulnerabilidad; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_co_vulnerabilidad ON j013t_vul_cronograma USING btree (co_vulnerabilidad);


--
-- TOC entry 2414 (class 1259 OID 26413)
-- Name: fki_incidente; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_incidente ON j037t_incidente_principio USING btree (co_incidente);


--
-- TOC entry 2418 (class 1259 OID 26430)
-- Name: fki_incidente8; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_incidente8 ON j038t_incidente_servicios USING btree (co_incidente);


--
-- TOC entry 2286 (class 1259 OID 24931)
-- Name: fki_negocio_reg; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_negocio_reg ON j015t_region_negocio USING btree (co_negocio);


--
-- TOC entry 2233 (class 1259 OID 29208)
-- Name: fki_padre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_padre ON j001t_menu USING btree (co_padre);


--
-- TOC entry 2415 (class 1259 OID 26419)
-- Name: fki_principio; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_principio ON j037t_incidente_principio USING btree (co_principio);


--
-- TOC entry 2442 (class 1259 OID 26508)
-- Name: fki_recomendaciones; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_recomendaciones ON j045t_referencia_marco USING btree (co_recomendaciones);


--
-- TOC entry 2419 (class 1259 OID 26436)
-- Name: fki_servicios2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_servicios2 ON j038t_incidente_servicios USING btree (co_servicios);


--
-- TOC entry 2454 (class 1259 OID 26634)
-- Name: fki_tipo_marco; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_tipo_marco ON j047t_documento_normativo USING btree (co_tipo_marco);


--
-- TOC entry 2603 (class 2606 OID 26509)
-- Name: co_accion17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT co_accion17 FOREIGN KEY (co_accion) REFERENCES j031t_accion_recomendada(co_accion);


--
-- TOC entry 2550 (class 2606 OID 25509)
-- Name: fk_co_acc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_acc FOREIGN KEY (co_acc) REFERENCES j020t_acta_acc(co_acc);


--
-- TOC entry 2576 (class 2606 OID 26247)
-- Name: fk_co_accion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_accion FOREIGN KEY (co_accion) REFERENCES j031t_accion_recomendada(co_accion);


--
-- TOC entry 2551 (class 2606 OID 25515)
-- Name: fk_co_aie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_aie FOREIGN KEY (co_aie) REFERENCES j021t_acta_aie(co_aie);


--
-- TOC entry 2504 (class 2606 OID 24969)
-- Name: fk_co_alcance; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_alcance FOREIGN KEY (co_alcance_forense) REFERENCES j017t_alcance_forense(co_alcance_forense);


--
-- TOC entry 2519 (class 2606 OID 25088)
-- Name: fk_co_aprueba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_aprueba FOREIGN KEY (co_aprueba) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2613 (class 2606 OID 26535)
-- Name: fk_co_aprueba10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_aprueba10 FOREIGN KEY (co_aprueba1) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2612 (class 2606 OID 26541)
-- Name: fk_co_aprueba20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_aprueba20 FOREIGN KEY (co_aprueba2) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2569 (class 2606 OID 26158)
-- Name: fk_co_aprueba8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_aprueba8 FOREIGN KEY (co_aprueba) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2552 (class 2606 OID 25521)
-- Name: fk_co_colecta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_colecta FOREIGN KEY (co_colecta) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2565 (class 2606 OID 25626)
-- Name: fk_co_created_at10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT fk_co_created_at10 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2567 (class 2606 OID 25646)
-- Name: fk_co_created_at11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT fk_co_created_at11 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2580 (class 2606 OID 26235)
-- Name: fk_co_created_at12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_created_at12 FOREIGN KEY (co_created_at) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2617 (class 2606 OID 26572)
-- Name: fk_co_created_at15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT fk_co_created_at15 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2601 (class 2606 OID 26454)
-- Name: fk_co_created_at18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT fk_co_created_at18 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2615 (class 2606 OID 26523)
-- Name: fk_co_created_at20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_created_at20 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2619 (class 2606 OID 26617)
-- Name: fk_co_created_at24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT fk_co_created_at24 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2559 (class 2606 OID 25547)
-- Name: fk_co_created_at7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT fk_co_created_at7 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2561 (class 2606 OID 25573)
-- Name: fk_co_created_at8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT fk_co_created_at8 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2563 (class 2606 OID 25593)
-- Name: fk_co_created_at9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT fk_co_created_at9 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2499 (class 2606 OID 16722)
-- Name: fk_co_cronograma_vul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT fk_co_cronograma_vul FOREIGN KEY (co_cronograma) REFERENCES j012t_cronograma(co_cronograma);


--
-- TOC entry 2543 (class 2606 OID 25383)
-- Name: fk_co_custodio_niega; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_custodio_niega FOREIGN KEY (co_custodio_niega) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2553 (class 2606 OID 25527)
-- Name: fk_co_custodio_sti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_custodio_sti FOREIGN KEY (co_custodio_sti) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2531 (class 2606 OID 25235)
-- Name: fk_co_destruye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_destruye FOREIGN KEY (co_destruye) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2479 (class 2606 OID 16494)
-- Name: fk_co_division; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_division FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2503 (class 2606 OID 29211)
-- Name: fk_co_division100; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_co_division100 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2584 (class 2606 OID 26310)
-- Name: fk_co_division16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_division16 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2506 (class 2606 OID 25019)
-- Name: fk_co_division2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_division2 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2517 (class 2606 OID 25076)
-- Name: fk_co_division3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_division3 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2527 (class 2606 OID 25215)
-- Name: fk_co_division4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_division4 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2534 (class 2606 OID 25268)
-- Name: fk_co_division5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_division5 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2541 (class 2606 OID 25373)
-- Name: fk_co_division6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_division6 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2570 (class 2606 OID 26163)
-- Name: fk_co_division8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_division8 FOREIGN KEY (co_division) REFERENCES j008t_division(co_division);


--
-- TOC entry 2526 (class 2606 OID 25210)
-- Name: fk_co_elabora4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_elabora4 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2535 (class 2606 OID 25273)
-- Name: fk_co_elabora5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_elabora5 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2542 (class 2606 OID 25378)
-- Name: fk_co_elabora6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_elabora6 FOREIGN KEY (co_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2611 (class 2606 OID 26547)
-- Name: fk_co_elimina10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_elimina10 FOREIGN KEY (co_elimina1) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2610 (class 2606 OID 26558)
-- Name: fk_co_elimina22; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_elimina22 FOREIGN KEY (co_elimina2) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2609 (class 2606 OID 26584)
-- Name: fk_co_estado_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_estado_documento FOREIGN KEY (co_estado) REFERENCES j048t_estado_documento(co_estado_documento);


--
-- TOC entry 2556 (class 2606 OID 25612)
-- Name: fk_co_estado_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_estado_evidencia FOREIGN KEY (co_estado_evidencia) REFERENCES j026t_estado_evidencia(co_estado_evidencia);


--
-- TOC entry 2594 (class 2606 OID 26744)
-- Name: fk_co_estado_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_estado_incidente FOREIGN KEY (co_estado) REFERENCES j042t_estado_incidente(co_estado_incidente);


--
-- TOC entry 2514 (class 2606 OID 25053)
-- Name: fk_co_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_forense FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2578 (class 2606 OID 26381)
-- Name: fk_co_forense12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_forense12 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2605 (class 2606 OID 26497)
-- Name: fk_co_forense17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_forense17 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2523 (class 2606 OID 25132)
-- Name: fk_co_forense3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_forense3 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2528 (class 2606 OID 25220)
-- Name: fk_co_forense4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_forense4 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2536 (class 2606 OID 25278)
-- Name: fk_co_forense5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_forense5 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2544 (class 2606 OID 25388)
-- Name: fk_co_forense6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_forense6 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2583 (class 2606 OID 26269)
-- Name: fk_co_forense8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT fk_co_forense8 FOREIGN KEY (co_forense) REFERENCES j016t_forense(co_forense);


--
-- TOC entry 2606 (class 2606 OID 26491)
-- Name: fk_co_incidente17; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_incidente17 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- TOC entry 2577 (class 2606 OID 26360)
-- Name: fk_co_incidente5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_incidente5 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- TOC entry 2524 (class 2606 OID 25138)
-- Name: fk_co_informe_forense; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_informe_forense FOREIGN KEY (co_informe_forense) REFERENCES j018t_informe_forense(co_informe_forense);


--
-- TOC entry 2525 (class 2606 OID 26253)
-- Name: fk_co_informe_recomendaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_informe_recomendaciones FOREIGN KEY (co_usuario_elabora) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- TOC entry 2582 (class 2606 OID 26263)
-- Name: fk_co_informe_recomendaciones2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j032t_seriales_enlaces_ir
    ADD CONSTRAINT fk_co_informe_recomendaciones2 FOREIGN KEY (co_informe_recomendaciones) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- TOC entry 2558 (class 2606 OID 25664)
-- Name: fk_co_lugar_seguro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_lugar_seguro FOREIGN KEY (co_lugar_seguro) REFERENCES j027t_lugar_seguro(co_lugar_seguro);


--
-- TOC entry 2607 (class 2606 OID 26485)
-- Name: fk_co_marco_normativo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_co_marco_normativo FOREIGN KEY (co_marco_normativo) REFERENCES j046t_marco_normativo(co_marco_normativo);


--
-- TOC entry 2490 (class 2606 OID 16514)
-- Name: fk_co_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT fk_co_menu FOREIGN KEY (co_tp_documento) REFERENCES j001t_menu(co_menu);


--
-- TOC entry 2483 (class 2606 OID 16548)
-- Name: fk_co_menu_rol_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT fk_co_menu_rol_menu FOREIGN KEY (co_rol) REFERENCES j003t_rol(co_rol);


--
-- TOC entry 2489 (class 2606 OID 24879)
-- Name: fk_co_negocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j008t_division
    ADD CONSTRAINT fk_co_negocio FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2482 (class 2606 OID 26280)
-- Name: fk_co_negocio13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_negocio13 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2585 (class 2606 OID 26315)
-- Name: fk_co_negocio16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_negocio16 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2505 (class 2606 OID 25008)
-- Name: fk_co_negocio2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_negocio2 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2516 (class 2606 OID 25070)
-- Name: fk_co_negocio3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_negocio3 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2529 (class 2606 OID 25225)
-- Name: fk_co_negocio4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_negocio4 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2537 (class 2606 OID 25283)
-- Name: fk_co_negocio5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_negocio5 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2545 (class 2606 OID 25393)
-- Name: fk_co_negocio6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_negocio6 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2571 (class 2606 OID 26173)
-- Name: fk_co_negocio8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_negocio8 FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2509 (class 2606 OID 24987)
-- Name: fk_co_region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_region FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2586 (class 2606 OID 26320)
-- Name: fk_co_region16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_region16 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2515 (class 2606 OID 25064)
-- Name: fk_co_region3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_region3 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2530 (class 2606 OID 25230)
-- Name: fk_co_region4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_region4 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2538 (class 2606 OID 25288)
-- Name: fk_co_region5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_region5 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2546 (class 2606 OID 25398)
-- Name: fk_co_region6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_region6 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2572 (class 2606 OID 26178)
-- Name: fk_co_region8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_region8 FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2493 (class 2606 OID 16626)
-- Name: fk_co_region_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_region_eva FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2491 (class 2606 OID 16575)
-- Name: fk_co_region_serial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j009t_serial
    ADD CONSTRAINT fk_co_region_serial FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2488 (class 2606 OID 16583)
-- Name: fk_co_region_sol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_region_sol FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2481 (class 2606 OID 16589)
-- Name: fk_co_region_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_region_usuario FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2549 (class 2606 OID 25503)
-- Name: fk_co_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_registro FOREIGN KEY (co_registro) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2557 (class 2606 OID 25658)
-- Name: fk_co_repositorio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_repositorio FOREIGN KEY (co_repositorio) REFERENCES j028t_repositorio(co_repositorio);


--
-- TOC entry 2579 (class 2606 OID 26214)
-- Name: fk_co_responsable_sti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_responsable_sti FOREIGN KEY (co_responsable_sti_ejecutar) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2518 (class 2606 OID 25082)
-- Name: fk_co_revisa3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_revisa3 FOREIGN KEY (co_revisa) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2573 (class 2606 OID 26183)
-- Name: fk_co_revisa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_revisa8 FOREIGN KEY (co_revisa) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2480 (class 2606 OID 16540)
-- Name: fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j002t_usuario
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES j003t_rol(co_rol);


--
-- TOC entry 2484 (class 2606 OID 16554)
-- Name: fk_co_rol_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j004t_rol_menu
    ADD CONSTRAINT fk_co_rol_menu FOREIGN KEY (co_menu) REFERENCES j001t_menu(co_menu);


--
-- TOC entry 2621 (class 2606 OID 26716)
-- Name: fk_co_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_documento FOREIGN KEY (co_tipo_documento) REFERENCES j046t_marco_normativo(co_marco_normativo);


--
-- TOC entry 2555 (class 2606 OID 25606)
-- Name: fk_co_tipo_evidencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_tipo_evidencia FOREIGN KEY (co_tipo_evidencia) REFERENCES j025t_tipo_evidencia(co_tipo_evidencia);


--
-- TOC entry 2593 (class 2606 OID 26738)
-- Name: fk_co_tipo_hechos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_tipo_hechos FOREIGN KEY (co_tipo_hecho) REFERENCES j044t_tipo_hechos(co_tipo_hechos);


--
-- TOC entry 2599 (class 2606 OID 26787)
-- Name: fk_co_tipo_herramienta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j041t_herramientas
    ADD CONSTRAINT fk_co_tipo_herramienta FOREIGN KEY (co_tipo_herramientas) REFERENCES j040t_tipo_herramientas(co_tipo_herramientas);


--
-- TOC entry 2602 (class 2606 OID 26756)
-- Name: fk_co_tipo_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j044t_tipo_hechos
    ADD CONSTRAINT fk_co_tipo_incidente FOREIGN KEY (co_tipo_incidente) REFERENCES j043t_tipo_incidentes(co_tipo_incidentes);


--
-- TOC entry 2592 (class 2606 OID 26732)
-- Name: fk_co_tipo_incidentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_tipo_incidentes FOREIGN KEY (co_tipo_incidente) REFERENCES j043t_tipo_incidentes(co_tipo_incidentes);


--
-- TOC entry 2620 (class 2606 OID 26722)
-- Name: fk_co_tipo_justificacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_justificacion FOREIGN KEY (co_justificacion) REFERENCES j052t_tipo_justificacion(co_tipo_justificacion);


--
-- TOC entry 2622 (class 2606 OID 26710)
-- Name: fk_co_tipo_revision12; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_tipo_revision12 FOREIGN KEY (co_tipo_revision) REFERENCES j051t_tipo_revision(co_tipo_revision);


--
-- TOC entry 2486 (class 2606 OID 16522)
-- Name: fk_co_tipo_solicitud; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_tipo_solicitud FOREIGN KEY (co_tipo_solicitud) REFERENCES j001t_menu(co_menu);


--
-- TOC entry 2496 (class 2606 OID 16690)
-- Name: fk_co_transaccion_enlace; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_transaccion_enlace FOREIGN KEY (co_transaccion_enlace) REFERENCES j005t_transaccion(co_transaccion);


--
-- TOC entry 2492 (class 2606 OID 16610)
-- Name: fk_co_transaccion_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_transaccion_eva FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- TOC entry 2497 (class 2606 OID 16696)
-- Name: fk_co_transaccion_local; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_transaccion_local FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- TOC entry 2487 (class 2606 OID 16534)
-- Name: fk_co_transaccion_sol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j006t_solicitud
    ADD CONSTRAINT fk_co_transaccion_sol FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- TOC entry 2495 (class 2606 OID 16655)
-- Name: fk_co_transaccion_vul; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j011t_vulnerabilidad
    ADD CONSTRAINT fk_co_transaccion_vul FOREIGN KEY (co_transaccion) REFERENCES j005t_transaccion(co_transaccion);


--
-- TOC entry 2554 (class 2606 OID 25533)
-- Name: fk_co_update_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j023t_evidencia
    ADD CONSTRAINT fk_co_update_at FOREIGN KEY (co_update_at) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2566 (class 2606 OID 25631)
-- Name: fk_co_update_at10; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j027t_lugar_seguro
    ADD CONSTRAINT fk_co_update_at10 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2568 (class 2606 OID 25651)
-- Name: fk_co_update_at11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j028t_repositorio
    ADD CONSTRAINT fk_co_update_at11 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2616 (class 2606 OID 26577)
-- Name: fk_co_update_at15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j048t_estado_documento
    ADD CONSTRAINT fk_co_update_at15 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2600 (class 2606 OID 26459)
-- Name: fk_co_update_at18; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j042t_estado_incidente
    ADD CONSTRAINT fk_co_update_at18 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2614 (class 2606 OID 26528)
-- Name: fk_co_update_at20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_co_update_at20 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2618 (class 2606 OID 26622)
-- Name: fk_co_update_at24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j049t_tipo_marco
    ADD CONSTRAINT fk_co_update_at24 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2560 (class 2606 OID 25553)
-- Name: fk_co_update_at7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY c024t_recurso
    ADD CONSTRAINT fk_co_update_at7 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2562 (class 2606 OID 25578)
-- Name: fk_co_update_at8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j025t_tipo_evidencia
    ADD CONSTRAINT fk_co_update_at8 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2564 (class 2606 OID 25598)
-- Name: fk_co_update_at9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j026t_estado_evidencia
    ADD CONSTRAINT fk_co_update_at9 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2581 (class 2606 OID 26241)
-- Name: fk_co_updated_at; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j031t_accion_recomendada
    ADD CONSTRAINT fk_co_updated_at FOREIGN KEY (co_update_at) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2510 (class 2606 OID 24975)
-- Name: fk_co_usuario_apertura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_apertura FOREIGN KEY (co_usuario_apertura) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2587 (class 2606 OID 26325)
-- Name: fk_co_usuario_apertura16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_apertura16 FOREIGN KEY (co_usuario_apertura) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2511 (class 2606 OID 24981)
-- Name: fk_co_usuario_cierre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_cierre FOREIGN KEY (co_usuario_cierre) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2588 (class 2606 OID 26330)
-- Name: fk_co_usuario_cierre16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_cierre16 FOREIGN KEY (co_usuario_cierre) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2507 (class 2606 OID 25025)
-- Name: fk_co_usuario_created; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_created FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2589 (class 2606 OID 26335)
-- Name: fk_co_usuario_created16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_created16 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2628 (class 2606 OID 26698)
-- Name: fk_co_usuario_created27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT fk_co_usuario_created27 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2624 (class 2606 OID 26657)
-- Name: fk_co_usuario_created28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_usuario_created28 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2626 (class 2606 OID 26677)
-- Name: fk_co_usuario_created29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT fk_co_usuario_created29 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2512 (class 2606 OID 25041)
-- Name: fk_co_usuario_created3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT fk_co_usuario_created3 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2520 (class 2606 OID 25104)
-- Name: fk_co_usuario_created4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_usuario_created4 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2532 (class 2606 OID 25240)
-- Name: fk_co_usuario_created5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_usuario_created5 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2539 (class 2606 OID 25293)
-- Name: fk_co_usuario_created6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_usuario_created6 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2547 (class 2606 OID 25403)
-- Name: fk_co_usuario_created7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_usuario_created7 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2574 (class 2606 OID 26188)
-- Name: fk_co_usuario_created8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_usuario_created8 FOREIGN KEY (co_usuario_created) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2498 (class 2606 OID 16702)
-- Name: fk_co_usuario_cron; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j012t_cronograma
    ADD CONSTRAINT fk_co_usuario_cron FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2522 (class 2606 OID 25121)
-- Name: fk_co_usuario_elabora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j019t_participantes
    ADD CONSTRAINT fk_co_usuario_elabora FOREIGN KEY (co_usuario_elabora) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2591 (class 2606 OID 26354)
-- Name: fk_co_usuario_escala; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_escala FOREIGN KEY (co_usuario_escala) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2494 (class 2606 OID 16635)
-- Name: fk_co_usuario_eva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j010t_evaluacion
    ADD CONSTRAINT fk_co_usuario_eva FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2485 (class 2606 OID 16528)
-- Name: fk_co_usuario_tran; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j005t_transaccion
    ADD CONSTRAINT fk_co_usuario_tran FOREIGN KEY (co_usuario) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2508 (class 2606 OID 25031)
-- Name: fk_co_usuario_update; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j016t_forense
    ADD CONSTRAINT fk_co_usuario_update FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2590 (class 2606 OID 26340)
-- Name: fk_co_usuario_update16; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j034t_incidente
    ADD CONSTRAINT fk_co_usuario_update16 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2627 (class 2606 OID 26703)
-- Name: fk_co_usuario_update27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j052t_tipo_justificacion
    ADD CONSTRAINT fk_co_usuario_update27 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2623 (class 2606 OID 26662)
-- Name: fk_co_usuario_update28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j050t_informe_marco
    ADD CONSTRAINT fk_co_usuario_update28 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2625 (class 2606 OID 26682)
-- Name: fk_co_usuario_update29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j051t_tipo_revision
    ADD CONSTRAINT fk_co_usuario_update29 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2513 (class 2606 OID 25047)
-- Name: fk_co_usuario_update3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j017t_alcance_forense
    ADD CONSTRAINT fk_co_usuario_update3 FOREIGN KEY (co_usuario_updated) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2521 (class 2606 OID 25110)
-- Name: fk_co_usuario_update4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j018t_informe_forense
    ADD CONSTRAINT fk_co_usuario_update4 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2533 (class 2606 OID 25245)
-- Name: fk_co_usuario_update5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j020t_acta_acc
    ADD CONSTRAINT fk_co_usuario_update5 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2540 (class 2606 OID 25298)
-- Name: fk_co_usuario_update6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j021t_acta_aie
    ADD CONSTRAINT fk_co_usuario_update6 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2548 (class 2606 OID 25408)
-- Name: fk_co_usuario_update7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j022t_acta_anie
    ADD CONSTRAINT fk_co_usuario_update7 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2575 (class 2606 OID 26193)
-- Name: fk_co_usuario_update8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j030t_informe_recomendaciones
    ADD CONSTRAINT fk_co_usuario_update8 FOREIGN KEY (co_usuario_update) REFERENCES j002t_usuario(co_usuario);


--
-- TOC entry 2500 (class 2606 OID 16728)
-- Name: fk_co_vulnerabilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j013t_vul_cronograma
    ADD CONSTRAINT fk_co_vulnerabilidad FOREIGN KEY (co_vulnerabilidad) REFERENCES j011t_vulnerabilidad(co_vulnerabilidad);


--
-- TOC entry 2596 (class 2606 OID 26408)
-- Name: fk_incidente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT fk_incidente FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- TOC entry 2598 (class 2606 OID 26425)
-- Name: fk_incidente8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT fk_incidente8 FOREIGN KEY (co_incidente) REFERENCES j034t_incidente(co_incidente);


--
-- TOC entry 2502 (class 2606 OID 24926)
-- Name: fk_negocio_reg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_negocio_reg FOREIGN KEY (co_negocio) REFERENCES j014t_negocio(co_negocio);


--
-- TOC entry 2478 (class 2606 OID 29203)
-- Name: fk_padre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j001t_menu
    ADD CONSTRAINT fk_padre FOREIGN KEY (co_padre) REFERENCES j001t_menu(co_menu);


--
-- TOC entry 2595 (class 2606 OID 26414)
-- Name: fk_principio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j037t_incidente_principio
    ADD CONSTRAINT fk_principio FOREIGN KEY (co_principio) REFERENCES j036t_principio(co_principio);


--
-- TOC entry 2604 (class 2606 OID 26503)
-- Name: fk_recomendaciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j045t_referencia_marco
    ADD CONSTRAINT fk_recomendaciones FOREIGN KEY (co_recomendaciones) REFERENCES j030t_informe_recomendaciones(co_informe_recomendaciones);


--
-- TOC entry 2501 (class 2606 OID 24921)
-- Name: fk_region_neg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j015t_region_negocio
    ADD CONSTRAINT fk_region_neg FOREIGN KEY (co_region) REFERENCES j007t_region(co_region);


--
-- TOC entry 2597 (class 2606 OID 26431)
-- Name: fk_servicios2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j038t_incidente_servicios
    ADD CONSTRAINT fk_servicios2 FOREIGN KEY (co_servicios) REFERENCES j035t_servicios(co_servicios);


--
-- TOC entry 2608 (class 2606 OID 26629)
-- Name: fk_tipo_marco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY j047t_documento_normativo
    ADD CONSTRAINT fk_tipo_marco FOREIGN KEY (co_tipo_marco) REFERENCES j049t_tipo_marco(co_tipo_marco);


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-11 14:46:09 VET

--
-- PostgreSQL database dump complete
--

