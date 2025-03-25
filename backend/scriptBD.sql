--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-25 13:46:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4812 (class 1262 OID 16405)
-- Name: TareaServicios; Type: DATABASE; Schema: -; Owner: sergio
--

CREATE DATABASE "TareaServicios" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-ES';


ALTER DATABASE "TareaServicios" OWNER TO sergio;

\connect "TareaServicios"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 24599)
-- Name: Serv_Historial; Type: TABLE; Schema: public; Owner: sergio
--

CREATE TABLE public."Serv_Historial" (
    id integer NOT NULL,
    "IDServicio" integer NOT NULL,
    "Detalle" character varying(500) NOT NULL,
    "Fechayhora" timestamp(2) with time zone NOT NULL
);


ALTER TABLE public."Serv_Historial" OWNER TO sergio;

--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    telefono character varying(20),
    "contraseña" character varying(200) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 220 (class 1259 OID 16416)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    id integer NOT NULL,
    idcliente integer NOT NULL,
    asunto character varying(100) NOT NULL,
    estado character varying(50) NOT NULL,
    detalles character varying(500),
    "ObservacionTec" character varying(500),
    "Fecha_Entrada" timestamp(2) with time zone NOT NULL,
    "Fecha_Salida" timestamp(2) with time zone,
    "Fecha_Creacion" timestamp(2) with time zone NOT NULL,
    "TipoServicio" character varying
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16415)
-- Name: servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicio_id_seq OWNER TO postgres;

--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 219
-- Name: servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_id_seq OWNED BY public.servicio.id;


--
-- TOC entry 4650 (class 2604 OID 16410)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 16419)
-- Name: servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN id SET DEFAULT nextval('public.servicio_id_seq'::regclass);


--
-- TOC entry 4659 (class 2606 OID 24605)
-- Name: Serv_Historial Serv_Historial_pkey; Type: CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public."Serv_Historial"
    ADD CONSTRAINT "Serv_Historial_pkey" PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 16414)
-- Name: cliente cliente_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_dni_key UNIQUE (dni);


--
-- TOC entry 4655 (class 2606 OID 16412)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 16421)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 24606)
-- Name: Serv_Historial FK_HIST_SERVICIO; Type: FK CONSTRAINT; Schema: public; Owner: sergio
--

ALTER TABLE ONLY public."Serv_Historial"
    ADD CONSTRAINT "FK_HIST_SERVICIO" FOREIGN KEY ("IDServicio") REFERENCES public.servicio(id);


--
-- TOC entry 4660 (class 2606 OID 16422)
-- Name: servicio servicio_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(id) ON DELETE CASCADE;


-- Completed on 2025-03-25 13:46:28

--
-- PostgreSQL database dump complete
--

