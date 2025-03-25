--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-25 13:37:15

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
-- TOC entry 4814 (class 1262 OID 16405)
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
-- TOC entry 4808 (class 0 OID 24599)
-- Dependencies: 221
-- Data for Name: Serv_Historial; Type: TABLE DATA; Schema: public; Owner: sergio
--



--
-- TOC entry 4805 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (1, 'sergio', '49956622R', '601058114', 'sergio');
INSERT INTO public.cliente VALUES (4, 'sergio', '22222222R', '601058114', '$2y$10$wBIh.IlfPQjt/VNQn87Fh.xrq7e9x4zXNQgGfvsYvHlVOQGYZx1KO');


--
-- TOC entry 4807 (class 0 OID 16416)
-- Dependencies: 220
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 4, true);


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 219
-- Name: servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_seq', 2, true);


-- Completed on 2025-03-25 13:37:15

--
-- PostgreSQL database dump complete
--

