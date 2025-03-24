--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-24 09:59:39

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
-- TOC entry 4817 (class 1262 OID 16405)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- TOC entry 4818 (class 0 OID 0)
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
    estado character varying(50) NOT NULL
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
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 219
-- Name: servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_id_seq OWNED BY public.servicio.id;


--
-- TOC entry 222 (class 1259 OID 16428)
-- Name: serviciodetalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.serviciodetalle (
    id integer NOT NULL,
    idservicio integer NOT NULL,
    detalle text NOT NULL
);


ALTER TABLE public.serviciodetalle OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16427)
-- Name: serviciodetalle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serviciodetalle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.serviciodetalle_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 221
-- Name: serviciodetalle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.serviciodetalle_id_seq OWNED BY public.serviciodetalle.id;


--
-- TOC entry 4648 (class 2604 OID 16410)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 4649 (class 2604 OID 16419)
-- Name: servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN id SET DEFAULT nextval('public.servicio_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16431)
-- Name: serviciodetalle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serviciodetalle ALTER COLUMN id SET DEFAULT nextval('public.serviciodetalle_id_seq'::regclass);


--
-- TOC entry 4807 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombre, dni, telefono, "contraseña") FROM stdin;
\.


--
-- TOC entry 4809 (class 0 OID 16416)
-- Dependencies: 220
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (id, idcliente, asunto, estado) FROM stdin;
\.


--
-- TOC entry 4811 (class 0 OID 16428)
-- Dependencies: 222
-- Data for Name: serviciodetalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.serviciodetalle (id, idservicio, detalle) FROM stdin;
\.


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 2, true);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 219
-- Name: servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_seq', 2, true);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 221
-- Name: serviciodetalle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serviciodetalle_id_seq', 2, true);


--
-- TOC entry 4652 (class 2606 OID 16414)
-- Name: cliente cliente_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_dni_key UNIQUE (dni);


--
-- TOC entry 4654 (class 2606 OID 16412)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4656 (class 2606 OID 16421)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 4658 (class 2606 OID 16435)
-- Name: serviciodetalle serviciodetalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serviciodetalle
    ADD CONSTRAINT serviciodetalle_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16422)
-- Name: servicio servicio_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(id) ON DELETE CASCADE;


--
-- TOC entry 4660 (class 2606 OID 16436)
-- Name: serviciodetalle serviciodetalle_idservicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.serviciodetalle
    ADD CONSTRAINT serviciodetalle_idservicio_fkey FOREIGN KEY (idservicio) REFERENCES public.servicio(id) ON DELETE CASCADE;


-- Completed on 2025-03-24 09:59:39

--
-- PostgreSQL database dump complete
--

