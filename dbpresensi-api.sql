--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-01-04 20:44:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16385)
-- Name: logs; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA logs;


ALTER SCHEMA logs OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 16386)
-- Name: master; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA master;


ALTER SCHEMA master OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16387)
-- Name: permissions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA permissions;


ALTER SCHEMA permissions OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 11
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 10 (class 2615 OID 16388)
-- Name: temp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA temp;


ALTER SCHEMA temp OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16389)
-- Name: tb_logs; Type: TABLE; Schema: logs; Owner: postgres
--

CREATE TABLE logs.tb_logs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type integer,
    aktifitas text,
    data jsonb,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE logs.tb_logs OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16395)
-- Name: tb_logs_id_seq; Type: SEQUENCE; Schema: logs; Owner: postgres
--

CREATE SEQUENCE logs.tb_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs.tb_logs_id_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 207
-- Name: tb_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: logs; Owner: postgres
--

ALTER SEQUENCE logs.tb_logs_id_seq OWNED BY logs.tb_logs.id;


--
-- TOC entry 230 (class 1259 OID 16788)
-- Name: ms_koordinat; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.ms_koordinat (
    id integer NOT NULL,
    urai character varying,
    koordinat character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE master.ms_koordinat OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16786)
-- Name: ms_koordinat_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE master.ms_koordinat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.ms_koordinat_id_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 229
-- Name: ms_koordinat_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE master.ms_koordinat_id_seq OWNED BY master.ms_koordinat.id;


--
-- TOC entry 208 (class 1259 OID 16397)
-- Name: ms_setting; Type: TABLE; Schema: master; Owner: postgres
--

CREATE TABLE master.ms_setting (
    id integer NOT NULL,
    nama_aplikasi character varying,
    nama_singkat_aplikasi character varying,
    logo character varying,
    daerah character varying,
    deskripsi text,
    warna character varying,
    koordinat character varying,
    waktu_lokal character varying
);


ALTER TABLE master.ms_setting OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16403)
-- Name: ms_setting_id_seq; Type: SEQUENCE; Schema: master; Owner: postgres
--

CREATE SEQUENCE master.ms_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE master.ms_setting_id_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 209
-- Name: ms_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: master; Owner: postgres
--

ALTER SEQUENCE master.ms_setting_id_seq OWNED BY master.ms_setting.id;


--
-- TOC entry 210 (class 1259 OID 16405)
-- Name: ps_master_permission; Type: TABLE; Schema: permissions; Owner: postgres
--

CREATE TABLE permissions.ps_master_permission (
    id integer NOT NULL,
    urai character varying,
    keterangan text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    is_menu integer DEFAULT 0,
    parent integer DEFAULT 0 NOT NULL
);


ALTER TABLE permissions.ps_master_permission OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN ps_master_permission.is_menu; Type: COMMENT; Schema: permissions; Owner: postgres
--

COMMENT ON COLUMN permissions.ps_master_permission.is_menu IS '0 or 1';


--
-- TOC entry 211 (class 1259 OID 16413)
-- Name: ps_master_permission_id_seq; Type: SEQUENCE; Schema: permissions; Owner: postgres
--

CREATE SEQUENCE permissions.ps_master_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions.ps_master_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 211
-- Name: ps_master_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: permissions; Owner: postgres
--

ALTER SEQUENCE permissions.ps_master_permission_id_seq OWNED BY permissions.ps_master_permission.id;


--
-- TOC entry 212 (class 1259 OID 16415)
-- Name: ps_permission; Type: TABLE; Schema: permissions; Owner: postgres
--

CREATE TABLE permissions.ps_permission (
    id integer NOT NULL,
    id_ps_role integer,
    id_master_permission integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE permissions.ps_permission OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16418)
-- Name: ps_permission_id_seq; Type: SEQUENCE; Schema: permissions; Owner: postgres
--

CREATE SEQUENCE permissions.ps_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions.ps_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 213
-- Name: ps_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: permissions; Owner: postgres
--

ALTER SEQUENCE permissions.ps_permission_id_seq OWNED BY permissions.ps_permission.id;


--
-- TOC entry 214 (class 1259 OID 16420)
-- Name: ps_role; Type: TABLE; Schema: permissions; Owner: postgres
--

CREATE TABLE permissions.ps_role (
    id integer NOT NULL,
    urai character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    is_opd integer DEFAULT 0
);


ALTER TABLE permissions.ps_role OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16427)
-- Name: ps_role_id_seq; Type: SEQUENCE; Schema: permissions; Owner: postgres
--

CREATE SEQUENCE permissions.ps_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions.ps_role_id_seq OWNER TO postgres;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 215
-- Name: ps_role_id_seq; Type: SEQUENCE OWNED BY; Schema: permissions; Owner: postgres
--

ALTER SEQUENCE permissions.ps_role_id_seq OWNED BY permissions.ps_role.id;


--
-- TOC entry 216 (class 1259 OID 16429)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16436)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 217
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 218 (class 1259 OID 16438)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16441)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 220 (class 1259 OID 16443)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16446)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16452)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 222
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 223 (class 1259 OID 16454)
-- Name: presensi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presensi (
    id integer NOT NULL,
    tipe integer NOT NULL,
    foto character varying,
    koordinat character varying,
    keterangan text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    waktu_presensi time without time zone,
    waktu_masuk time without time zone,
    waktu_keluar time without time zone,
    terlambat character varying,
    lebih_awal character varying
);


ALTER TABLE public.presensi OWNER TO postgres;

--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN presensi.tipe; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.presensi.tipe IS '1 masuk, 2 pulang';


--
-- TOC entry 224 (class 1259 OID 16460)
-- Name: presensi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presensi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presensi_id_seq OWNER TO postgres;

--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 224
-- Name: presensi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presensi_id_seq OWNED BY public.presensi.id;


--
-- TOC entry 225 (class 1259 OID 16462)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp without time zone,
    kodeakses integer,
    foto character varying,
    kodeskpd character varying,
    waktu_masuk time without time zone,
    waktu_keluar time without time zone,
    koordinat jsonb DEFAULT '[]'::jsonb
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16468)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 227 (class 1259 OID 16470)
-- Name: tmp_upload; Type: TABLE; Schema: temp; Owner: postgres
--

CREATE TABLE temp.tmp_upload (
    id integer NOT NULL,
    uuid character varying NOT NULL,
    nama_file character varying,
    nama_file_ori character varying,
    deskripsi text,
    id_user character varying,
    created_at character varying,
    updated_at character varying,
    other character varying
);


ALTER TABLE temp.tmp_upload OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN tmp_upload.id_user; Type: COMMENT; Schema: temp; Owner: postgres
--

COMMENT ON COLUMN temp.tmp_upload.id_user IS '0 = API';


--
-- TOC entry 228 (class 1259 OID 16476)
-- Name: tmp_upload_id_seq; Type: SEQUENCE; Schema: temp; Owner: postgres
--

CREATE SEQUENCE temp.tmp_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE temp.tmp_upload_id_seq OWNER TO postgres;

--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 228
-- Name: tmp_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: temp; Owner: postgres
--

ALTER SEQUENCE temp.tmp_upload_id_seq OWNED BY temp.tmp_upload.id;


--
-- TOC entry 2878 (class 2604 OID 16478)
-- Name: tb_logs id; Type: DEFAULT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY logs.tb_logs ALTER COLUMN id SET DEFAULT nextval('logs.tb_logs_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16791)
-- Name: ms_koordinat id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.ms_koordinat ALTER COLUMN id SET DEFAULT nextval('master.ms_koordinat_id_seq'::regclass);


--
-- TOC entry 2879 (class 2604 OID 16479)
-- Name: ms_setting id; Type: DEFAULT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.ms_setting ALTER COLUMN id SET DEFAULT nextval('master.ms_setting_id_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 16480)
-- Name: ps_master_permission id; Type: DEFAULT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_master_permission ALTER COLUMN id SET DEFAULT nextval('permissions.ps_master_permission_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 16481)
-- Name: ps_permission id; Type: DEFAULT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_permission ALTER COLUMN id SET DEFAULT nextval('permissions.ps_permission_id_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 16482)
-- Name: ps_role id; Type: DEFAULT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_role ALTER COLUMN id SET DEFAULT nextval('permissions.ps_role_id_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 16483)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 16484)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 16485)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 16486)
-- Name: presensi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presensi ALTER COLUMN id SET DEFAULT nextval('public.presensi_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 16487)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16488)
-- Name: tmp_upload id; Type: DEFAULT; Schema: temp; Owner: postgres
--

ALTER TABLE ONLY temp.tmp_upload ALTER COLUMN id SET DEFAULT nextval('temp.tmp_upload_id_seq'::regclass);


--
-- TOC entry 3052 (class 0 OID 16389)
-- Dependencies: 206
-- Data for Name: tb_logs; Type: TABLE DATA; Schema: logs; Owner: postgres
--

INSERT INTO logs.tb_logs VALUES (1525, 2, 1, 'Upload File', '{"ip": "::1", "uuid": "7ccd047f-4e1a-4dd7-b9bc-26213d170380", "request": {"image": {}}, "nama_file": "pixel-png-cute-2.png"}', '2023-10-03 03:56:09', '2023-10-03 03:56:09');
INSERT INTO logs.tb_logs VALUES (1526, 2, 1, 'Update Setting Aplikasi', '{"ip": "::1", "logo": "7ccd047f-4e1a-4dd7-b9bc-26213d170380", "daerah": "Kabupaten Sukoharjo", "mapzoom": "12", "mapcenter_lat": "-7.672624646505", "nama_aplikasi": "Pusat Informasi Spasial Daerah", "mapcenter_long": "110.85203363322", "nama_singkat_aplikasi": "PISDa"}', '2023-10-03 03:56:10', '2023-10-03 03:56:10');
INSERT INTO logs.tb_logs VALUES (1527, 2, 1, 'Update Setting Aplikasi', '{"ip": "::1", "logo": null, "daerah": "Global Intermedia", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-03 03:58:07', '2023-10-03 03:58:07');
INSERT INTO logs.tb_logs VALUES (1528, 2, 1, 'Upload File', '{"ip": "::1", "uuid": "fa0df7c8-8992-4315-b928-42d8045a37fa", "request": {"image": {}}, "nama_file": "genshin-barbara-embarassed-512x512.png"}', '2023-10-03 04:09:32', '2023-10-03 04:09:32');
INSERT INTO logs.tb_logs VALUES (1529, 2, 1, 'Update Profile', '{"ip": "::1", "foto": "fa0df7c8-8992-4315-b928-42d8045a37fa", "name": "Administrator", "email": "admin@gmail.com", "password": null, "password_confirmation": null}', '2023-10-03 04:09:33', '2023-10-03 04:09:33');
INSERT INTO logs.tb_logs VALUES (1530, 2, 1, 'Login Sukses', '{"ip": "::1", "_token": "gU4D0jh5uge2YX7ZRSc50CUCgK1id3ywiEu4UsJK", "captcha": "10058", "password": "adminaja", "username": "admin"}', '2023-10-03 06:22:07', '2023-10-03 06:22:07');
INSERT INTO logs.tb_logs VALUES (1531, 2, 1, 'Hapus Permission Role', '{"ip": "::1", "old": {"id": 7, "urai": "Operator", "is_opd": 0, "created_at": "2022-12-26T06:49:25.000000Z", "created_by": 2, "updated_at": "2022-12-26T06:49:25.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6InJqTFcvWFlYWU1iMnZLT05XUDR3SXc9PSIsInZhbHVlIjoic2tWbndiN0M4bG1nSTdFQitJQVpUQT09IiwibWFjIjoiMTY1ZDQwZTliOTZlYzYxZDVlOTU2MjBiYjRlNmMwNGI1MzIwZTBhMzlhY2M4M2M3MjZkZGE2MjZkOGVhMDg3YiIsInRhZyI6IiJ9"}}', '2023-10-03 06:24:58', '2023-10-03 06:24:58');
INSERT INTO logs.tb_logs VALUES (1532, 2, 1, 'Hapus Permission Role', '{"ip": "::1", "old": {"id": 6, "urai": "OPD", "is_opd": 1, "created_at": "2022-11-11T11:26:11.000000Z", "created_by": 2, "updated_at": "2022-11-11T11:26:11.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6InBnNjI3Ry93VWZDL3MvdGl0Zy94OEE9PSIsInZhbHVlIjoiZjZSbjA4YWhRQU90QVNxYjRJVGljdz09IiwibWFjIjoiZDE0ZmRjYTcwMWUwM2I4OGEzYmMyMzFmMDQxNjVhZmY3NDQ4MGRiY2I5ZmJkNDg1MWYyMTg4MTI0ZjhkZDI0OCIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:00', '2023-10-03 06:25:00');
INSERT INTO logs.tb_logs VALUES (1533, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 81, "urai": "berita-show", "parent": 0, "is_menu": 1, "created_at": "2022-12-26T00:19:41.000000Z", "created_by": 2, "keterangan": "Menu Berita", "updated_at": "2022-12-26T00:19:41.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6IncvdmpCR1A5RFVvaDlUZG9hQi9rT2c9PSIsInZhbHVlIjoiUC93K3pGZE9ZbHdGR3hYOGkyeS9XQT09IiwibWFjIjoiOTAwYTUzNzNhYWNjNjU1ZWE1ODI5MzM2YzhjY2RkYzIyOTdlNWM5YjIzYTZlZDJkMmNhZGUzNGY2NTBiNTg4NiIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:12', '2023-10-03 06:25:12');
INSERT INTO logs.tb_logs VALUES (1534, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 89, "urai": "judul-show", "parent": 0, "is_menu": 1, "created_at": "2023-08-01T07:43:21.000000Z", "created_by": 2, "keterangan": "management aplikasi", "updated_at": "2023-08-01T07:43:21.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6InpYeFhuWmdWekxWdi9nV0tMdVFIT3c9PSIsInZhbHVlIjoiUEM5YUlSbEFrL0VyY1NuOGZ5TTFZdz09IiwibWFjIjoiNjQyMzIzZjIxNmQ1ZGQ1MDM4OTA1ZTg2OTA0NmU5NGY5YmVlNzUxYWYxOTMxNTZmNDc2MzFjZTU2MWYwNWMxZiIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:15', '2023-10-03 06:25:15');
INSERT INTO logs.tb_logs VALUES (1535, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 27, "urai": "kategori-show", "parent": 0, "is_menu": 1, "created_at": "2022-04-12T03:15:05.000000Z", "created_by": 2, "keterangan": "Menu Master Kategori", "updated_at": "2022-04-12T03:15:37.000000Z", "updated_by": 2}, "request": {"id": "eyJpdiI6ImNVVWRoWVkxYWtHU2V4cjgwMW5mR2c9PSIsInZhbHVlIjoiNngyR01qZUJQOHdtbmNWTUFoSER6UT09IiwibWFjIjoiZDM2ZjVjYzlhZGIxNzk4MDRlNGZjOGJhYzE2OTNmZTE1MWFiYmI2MmZjM2RkOTcxMDk1NDdlNDc1NzdiNTUzZSIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:18', '2023-10-03 06:25:18');
INSERT INTO logs.tb_logs VALUES (1536, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 14, "urai": "lokasi-show", "parent": 0, "is_menu": 1, "created_at": "2022-04-11T06:47:58.000000Z", "created_by": 2, "keterangan": "Menu Input Data (admin)", "updated_at": "2022-04-11T06:48:40.000000Z", "updated_by": 2}, "request": {"id": "eyJpdiI6IlRvZCtyejd3M1Y1WXdIWlNobmxzV0E9PSIsInZhbHVlIjoiRXVLNDZjem5ybnY2cGd1UlROOTBSQT09IiwibWFjIjoiMDI1N2Y4ZDM1YzIwNTVhY2U1Yjc4ZDEwNmJlNDk1NjE5ZjNlNTMxZGQ5MDM2NDI1NmVlYTVkZjliMGU0ODM4YSIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:23', '2023-10-03 06:25:23');
INSERT INTO logs.tb_logs VALUES (1537, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 39, "urai": "master-dokumen-show", "parent": 0, "is_menu": 1, "created_at": "2022-04-12T03:38:53.000000Z", "created_by": 2, "keterangan": "Menu Master Form Dokumen", "updated_at": "2022-04-12T03:38:53.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6ImRCUmtCZm5sUHd6Q1VRMEx6S3R6cVE9PSIsInZhbHVlIjoiNS9icE9zWGRlcG5wWVNsRlByMTB2Zz09IiwibWFjIjoiMTk5OTFlYmQ5NWM0NDM1M2I4OWMzNjU1N2U5MTU1OWZjNzZmNWI5NmM4MmM4YTkwYzU1MzQ5ZjI3YTIyNjk5YiIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:26', '2023-10-03 06:25:26');
INSERT INTO logs.tb_logs VALUES (1538, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 35, "urai": "master-jenis-show", "parent": 0, "is_menu": 1, "created_at": "2022-04-12T03:37:44.000000Z", "created_by": 2, "keterangan": "Menu Master Form Inputan", "updated_at": "2022-04-12T03:37:44.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6ImQzWEtERllTdW5OaE84dGxDYkh5MUE9PSIsInZhbHVlIjoiSFdzaXhtbDkvT2I3UDY5SzVRcVBXUT09IiwibWFjIjoiMDk1ZjNiMzViYjA2MzA1MTRhMzI5MDExYTUyMTg5NDEyMDMzYTJkNzFhMWZjZjZkMWU5ZmU3ZDk3MWVlYmZmZSIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:29', '2023-10-03 06:25:29');
INSERT INTO logs.tb_logs VALUES (1539, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 77, "urai": "master-opd-show", "parent": 0, "is_menu": 1, "created_at": "2022-11-11T11:24:26.000000Z", "created_by": 2, "keterangan": "Menu Master OPD", "updated_at": "2022-11-11T11:24:26.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6IlpiT2NJYXp0WGVxOHhkQ2MvSmc0ZEE9PSIsInZhbHVlIjoidkpWeEtWaXFRR0xQdVJCdjZJbXpBQT09IiwibWFjIjoiYTAyYTdlOTU1ODk4NTA2ZDlkNzlmNWRkYTkxMzAwZjNlMTM4MjA1YWRjNmNiYzE4NjkwZTAzMjEyOWYxMmQ0NSIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:31', '2023-10-03 06:25:31');
INSERT INTO logs.tb_logs VALUES (1540, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 93, "urai": "pengaduan-show", "parent": 0, "is_menu": 1, "created_at": "2023-08-01T07:45:54.000000Z", "created_by": 2, "keterangan": "menu pengaduan", "updated_at": "2023-08-01T07:45:54.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6Ik4rdHMzVE5GR3locFIyTjU0d0s5dGc9PSIsInZhbHVlIjoiM0U5SFovQjJpcmptYTg1Y0dyUWVXZz09IiwibWFjIjoiMmY4YjU1MGZmNWY3OTE0ODEwOTIyMDQyMzYxYWYxOWIxOGQyNGU0ZDZiNGRhZmZjZWJjNmZhOWM4MjE0ZWIzYyIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:34', '2023-10-03 06:25:34');
INSERT INTO logs.tb_logs VALUES (1541, 2, 1, 'Hapus Permission Master', '{"ip": "::1", "old": {"id": 82, "urai": "regulasi-show", "parent": 0, "is_menu": 1, "created_at": "2022-12-26T00:20:15.000000Z", "created_by": 2, "keterangan": "Menu Regulasi", "updated_at": "2022-12-26T00:20:15.000000Z", "updated_by": null}, "request": {"id": "eyJpdiI6InBtaDNXMDNXVWRweDBHbzZSaVhYNWc9PSIsInZhbHVlIjoiNlp0blJzY3pPZEM0ZEVvN3NLbmgvQT09IiwibWFjIjoiNWI4NzRhZDUwYWM5OWU2Y2FhMGRjMTAzMmMyMzkwYjk5OTA2NWI2NTk4MTJlNTY3NWIzYzE4YjRmNjczZmUxNiIsInRhZyI6IiJ9"}}', '2023-10-03 06:25:39', '2023-10-03 06:25:39');
INSERT INTO logs.tb_logs VALUES (1542, 2, 1, 'Tambah Role Permission', '{"ip": "::1", "urai": "User", "_token": "Zd59TIVvM3hmVZkKRXZWKyZLJHRhcNhWC1o9qPzt"}', '2023-10-03 06:26:14', '2023-10-03 06:26:14');
INSERT INTO logs.tb_logs VALUES (1543, 2, 1, 'Ubah Permission Role', '{"id": "8", "ip": "::1", "urai": "User", "_token": "Zd59TIVvM3hmVZkKRXZWKyZLJHRhcNhWC1o9qPzt"}', '2023-10-03 06:26:17', '2023-10-03 06:26:17');
INSERT INTO logs.tb_logs VALUES (1544, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6InBSZ29DMlpGc2M0aHZwRzV1SHhVeWc9PSIsInZhbHVlIjoiNld3RmpCVnVYU1ZmQjExUWtjeFVyQT09IiwibWFjIjoiMjFiOTFmZDE1NDhmN2NiYjg0YzY3ZGQ4YjE1ZTJlY2Q5Yjc0M2ZkNmM0MmJkMjYwYjA3NjI3NGEyNTc3ODllZCIsInRhZyI6IiJ9", "ip": "::1", "id_role": "eyJpdiI6ImwwcUFkNFhNUlp1WWN0dnpraWNFTnc9PSIsInZhbHVlIjoiWjQ1RzN1ZXNCNUJqdW04RERER2FqZz09IiwibWFjIjoiZjRlOTI5YTkxNTBmZGM0Yzc4ZDU0Y2ZmNmVhYjI5MWI3MTlmNzk5NTVkNTM2OWVmNjFlODEyMzRiMjM2MzE5ZiIsInRhZyI6IiJ9"}', '2023-10-03 06:26:29', '2023-10-03 06:26:29');
INSERT INTO logs.tb_logs VALUES (1545, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6Ii9tbmt3UXJGK204Q2xncmx1cmdiMUE9PSIsInZhbHVlIjoiem9vQmJIR210aEhrOWtIVG1yN1lGZz09IiwibWFjIjoiN2U4NDIzNGRlMmZmMjA5ZWU4NjQwMzA2YWM0NTQyMjFiYzNkN2ZhMzc3NDk3OThmYTc3YjBkYWQyYWQwMTU5NCIsInRhZyI6IiJ9", "ip": "::1", "id_role": "eyJpdiI6ImwwcUFkNFhNUlp1WWN0dnpraWNFTnc9PSIsInZhbHVlIjoiWjQ1RzN1ZXNCNUJqdW04RERER2FqZz09IiwibWFjIjoiZjRlOTI5YTkxNTBmZGM0Yzc4ZDU0Y2ZmNmVhYjI5MWI3MTlmNzk5NTVkNTM2OWVmNjFlODEyMzRiMjM2MzE5ZiIsInRhZyI6IiJ9"}', '2023-10-03 06:26:32', '2023-10-03 06:26:32');
INSERT INTO logs.tb_logs VALUES (1546, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6IldjVC91YXpGRU40RHcxRVprdVo1bmc9PSIsInZhbHVlIjoiTThwenFkUHd0aWpUdlRtR3d6SEdGUT09IiwibWFjIjoiMDhjZTRhZGExMmNmMWU3MWI2ZWRjZmNiMWRmN2E2ZDc1MTViN2QwZTFjNDg0YTc1NzkxNmRjYTEzNDI3NmNlNSIsInRhZyI6IiJ9", "ip": "::1", "id_role": "eyJpdiI6ImwwcUFkNFhNUlp1WWN0dnpraWNFTnc9PSIsInZhbHVlIjoiWjQ1RzN1ZXNCNUJqdW04RERER2FqZz09IiwibWFjIjoiZjRlOTI5YTkxNTBmZGM0Yzc4ZDU0Y2ZmNmVhYjI5MWI3MTlmNzk5NTVkNTM2OWVmNjFlODEyMzRiMjM2MzE5ZiIsInRhZyI6IiJ9"}', '2023-10-03 06:26:35', '2023-10-03 06:26:35');
INSERT INTO logs.tb_logs VALUES (1547, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6Iml5S2FMU3NnU1F2amFFeXRMUmZ6aHc9PSIsInZhbHVlIjoiS3NDTGwyK3lLd1JDRHJJOXNvajlidz09IiwibWFjIjoiYWFlZmYyYzUzZjA5ZjU5ZDgxZTc2M2NhMjhkZWY4MjZiYjE2ODJmNTZkMTE1ZDkxMDZmZTE2ZjEyMmI4ZGU3MiIsInRhZyI6IiJ9", "ip": "::1", "id_role": "eyJpdiI6ImwwcUFkNFhNUlp1WWN0dnpraWNFTnc9PSIsInZhbHVlIjoiWjQ1RzN1ZXNCNUJqdW04RERER2FqZz09IiwibWFjIjoiZjRlOTI5YTkxNTBmZGM0Yzc4ZDU0Y2ZmNmVhYjI5MWI3MTlmNzk5NTVkNTM2OWVmNjFlODEyMzRiMjM2MzE5ZiIsInRhZyI6IiJ9"}', '2023-10-03 06:26:37', '2023-10-03 06:26:37');
INSERT INTO logs.tb_logs VALUES (1548, 2, 1, 'Hapus Pengguna', '{"ip": "::1", "old": {"id": 11, "foto": null, "name": "Operator", "email": "opr@skh.go.id", "kodeskpd": null, "username": "opr", "kodeakses": 7, "created_at": "2022-12-26T06:50:54.000000Z", "deleted_at": null, "updated_at": "2022-12-26T06:50:54.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IkZyRE91TW0wbEdCTWVvemNQQVdta3c9PSIsInZhbHVlIjoiTG9NVW02MnZPcVZTM3RjaEV2b2wxZz09IiwibWFjIjoiNDIwZDZmNTgxMmY1NzEyZDc3NTczNGIyMzAzMzEzMDEwMTlhOWY5NDY3OWViN2Q0NDQyZGFjYzM3ODgxNTAzNSIsInRhZyI6IiJ9"}}', '2023-10-03 06:26:55', '2023-10-03 06:26:55');
INSERT INTO logs.tb_logs VALUES (1549, 2, 1, 'Hapus Pengguna', '{"ip": "::1", "old": {"id": 13, "foto": null, "name": "Dinas Kesehatan", "email": "dinkes@sukoharjokab.go.id", "kodeskpd": "1.02.0.00.0.00.01.0000", "username": "1.02.0.00.0.00.01.0000", "kodeakses": 6, "created_at": "2023-08-01T05:01:29.000000Z", "deleted_at": null, "updated_at": "2023-08-01T05:01:29.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IlRJT2RjLzVNayszVVdVbzIxcnorSnc9PSIsInZhbHVlIjoib1B1Rm5ySHNUdG00VFB0VzgxZjYyUT09IiwibWFjIjoiZDU5NzgzMjA0MmQ0ZTAzOGMwNmZhYTU4MDQ2MTFiMTg1ZGY4MThjMjgwNDljYzBiNjE1MGQ1ZGYzZjVkNDI4NSIsInRhZyI6IiJ9"}}', '2023-10-03 06:26:58', '2023-10-03 06:26:58');
INSERT INTO logs.tb_logs VALUES (1550, 2, 1, 'Hapus Pengguna', '{"ip": "::1", "old": {"id": 12, "foto": null, "name": "Dinas Pendidikan dan Kebudayaan", "email": "dikbud@sukoharjokab.go.id", "kodeskpd": "1.01.2.22.3.26.06.0000", "username": "1.01.2.22.3.26.06.0000", "kodeakses": 6, "created_at": "2023-08-01T04:58:14.000000Z", "deleted_at": null, "updated_at": "2023-08-01T04:58:14.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6InBHNUNza1ZhbnNrZE1OSks1U0c0UFE9PSIsInZhbHVlIjoiSXZZZ1RIYTFRZzI5Z1FmOFRpMFZ2dz09IiwibWFjIjoiYTU2MDc1ZjQ4MDA1MzIyNmM4MzdjN2M3ZGIxYTA5MGZhOTM3MGQyYzkwN2Y4NmM3Y2RlMTkyYTNhYzNkMWY1ZCIsInRhZyI6IiJ9"}}', '2023-10-03 06:27:01', '2023-10-03 06:27:01');
INSERT INTO logs.tb_logs VALUES (1551, 2, 1, 'Hapus Pengguna', '{"ip": "::1", "old": {"id": 10, "foto": null, "name": "ilham", "email": "ilhamwahyudin365@gmail.com", "kodeskpd": null, "username": "ilham", "kodeakses": 1, "created_at": "2022-10-18T07:41:06.000000Z", "deleted_at": null, "updated_at": "2022-10-18T07:41:06.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IjNMMXdxd2ZrMjBUSnBnQzlUalBGckE9PSIsInZhbHVlIjoiZkdZaE5mYVlZUHVTUFRVR0VPOHVLZz09IiwibWFjIjoiNDljNTJlMGY5M2EwYzE2M2NkM2Y4ZDU1MzEzODk5NTNkYWJmZTg2MDg4ZjI2NDY2NGJmNmUwNzYzYmM3NzhkZSIsInRhZyI6IiJ9"}}', '2023-10-03 06:27:03', '2023-10-03 06:27:03');
INSERT INTO logs.tb_logs VALUES (1552, 2, 1, 'Update Setting Aplikasi', '{"ip": "::1", "logo": null, "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-03 06:29:57', '2023-10-03 06:29:57');
INSERT INTO logs.tb_logs VALUES (1553, 2, 1, 'Tambah Pengguna', '{"ip": "::1", "name": "Test User", "akses": "8", "email": "tes@gmail.com", "_token": "Zd59TIVvM3hmVZkKRXZWKyZLJHRhcNhWC1o9qPzt", "is_opd": "0", "password": "qwerty123", "username": "123456", "password_confirmation": "qwerty123"}', '2023-10-03 06:32:00', '2023-10-03 06:32:00');
INSERT INTO logs.tb_logs VALUES (1554, 2, 1, 'Logout', '{"ip": "::1", "_token": "Zd59TIVvM3hmVZkKRXZWKyZLJHRhcNhWC1o9qPzt"}', '2023-10-03 06:32:05', '2023-10-03 06:32:05');
INSERT INTO logs.tb_logs VALUES (1555, 14, 1, 'Login Sukses', '{"ip": "::1", "_token": "S9hiDLczxbaQhnO11nTcCTVKzJOt8OFusdrJ3v0e", "captcha": "89051", "password": "qwerty123", "username": "123456"}', '2023-10-03 06:32:12', '2023-10-03 06:32:12');
INSERT INTO logs.tb_logs VALUES (1556, 14, 1, 'Logout', '{"ip": "::1", "_token": "pyfh3qr2wY1zYISRfAJA84pz10XNtZBTyCmMc7Ui"}', '2023-10-03 06:32:19', '2023-10-03 06:32:19');
INSERT INTO logs.tb_logs VALUES (1557, 2, 1, 'Login Sukses', '{"ip": "::1", "_token": "8CcuDvSWCvncV2hPPMFV4ILfuEQVg1l47Jbtwt5j", "captcha": "92365", "password": "adminaja", "username": "admin"}', '2023-10-03 06:32:27', '2023-10-03 06:32:27');
INSERT INTO logs.tb_logs VALUES (1561, 14, 1, 'Upload File', '{"ip": "127.0.0.1", "uuid": "58f52963-9d5a-4f34-ae40-b39699c2ec21", "request": {"image": {}}, "nama_file": "download20230803195054.png"}', '2023-10-03 07:23:37', '2023-10-03 07:23:37');
INSERT INTO logs.tb_logs VALUES (1562, 2, 1, 'Update Setting Aplikasi', '{"ip": "::1", "logo": null, "warna": "#ffffff", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-03 07:32:43', '2023-10-03 07:32:43');
INSERT INTO logs.tb_logs VALUES (1563, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "O4sn2tLp86GpCt4whwWVtmtpKPEjpwJ2TRdlPLYY", "captcha": "81024", "password": "adminaja", "username": "admin"}', '2023-10-03 07:57:32', '2023-10-03 07:57:32');
INSERT INTO logs.tb_logs VALUES (1564, 2, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "e7de10be-f01a-4b96-9921-59376b3b9f63", "request": {"image": {}}, "nama_file": "pixel-png-cute-2.png"}', '2023-10-03 07:57:41', '2023-10-03 07:57:41');
INSERT INTO logs.tb_logs VALUES (1565, 2, 1, 'Update Setting Aplikasi', '{"ip": "192.168.255.254", "logo": "e7de10be-f01a-4b96-9921-59376b3b9f63", "warna": "#ffffff", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "koordinat": "-7.813111492789422, 110.37669583357997", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-03 07:57:42', '2023-10-03 07:57:42');
INSERT INTO logs.tb_logs VALUES (1566, 2, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "e2eae184-0d90-495a-9774-92350fabb3fd", "request": {"image": {}}, "nama_file": "genshin-barbara-embarassed-512x512.png"}', '2023-10-03 07:57:54', '2023-10-03 07:57:54');
INSERT INTO logs.tb_logs VALUES (1881, 14, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "V08MJ6m10vKTlLwKoemFdLw7LV0YHXxI7IjF88vM"}', '2023-10-31 13:41:37', '2023-10-31 13:41:37');
INSERT INTO logs.tb_logs VALUES (1567, 2, 1, 'Update Profile', '{"ip": "192.168.255.254", "foto": "e2eae184-0d90-495a-9774-92350fabb3fd", "name": "Administrator", "email": "admin@gmail.com", "password": null, "password_confirmation": null}', '2023-10-03 07:57:55', '2023-10-03 07:57:55');
INSERT INTO logs.tb_logs VALUES (1568, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "7d08dbd7-9e90-4c36-beb7-4c461443c8bd", "request": {"image": {}}, "nama_file": "download20230803195054.png"}', '2023-10-03 08:00:02', '2023-10-03 08:00:02');
INSERT INTO logs.tb_logs VALUES (1569, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "fd000430-c29e-495a-bcad-f407c28e9739", "request": {"image": {}}, "nama_file": "download20230803195054.png"}', '2023-10-03 08:08:32', '2023-10-03 08:08:32');
INSERT INTO logs.tb_logs VALUES (1570, 14, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "qpZNTYCSh7lVEb9y3nJnvIQgwPAgMsnZRMretEo7", "captcha": "85192", "password": "qwerty123", "remember": "true", "username": "123456"}', '2023-10-03 09:03:59', '2023-10-03 09:03:59');
INSERT INTO logs.tb_logs VALUES (1571, 14, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "sXUEWnKYHH0pbPTTHZ74uLY99mI8ALumWrvD2ywh"}', '2023-10-03 09:05:41', '2023-10-03 09:05:41');
INSERT INTO logs.tb_logs VALUES (1572, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "Kr99y2sEzYrpGqAPeVaDWfDO9MYYVKgu1NGCsvbs", "captcha": "20493", "password": "adminaja", "remember": "true", "username": "admin"}', '2023-10-03 09:06:00', '2023-10-03 09:06:00');
INSERT INTO logs.tb_logs VALUES (1573, 2, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "is80r2F7We4fKW1CdwbvvlhT4gfLY81gM4iNFEzJ"}', '2023-10-03 09:31:30', '2023-10-03 09:31:30');
INSERT INTO logs.tb_logs VALUES (1574, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "swi0izwzJn6nvpS2ZPpqTpAtGNScMwPAli8RJX0y", "captcha": "97214", "password": "adminaja", "username": "admin"}', '2023-10-03 09:39:27', '2023-10-03 09:39:27');
INSERT INTO logs.tb_logs VALUES (1575, 14, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "Clp2IcthkkbSAKmR8cWnFN4zXNhZOUVESh2gNgYp", "captcha": "93018", "password": "qwerty123", "username": "123456"}', '2023-10-04 06:18:20', '2023-10-04 06:18:20');
INSERT INTO logs.tb_logs VALUES (1576, 14, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "JIgjM6ZZtQcNYLspNvmVJc1eyXRJPi5pnntulTbG"}', '2023-10-04 07:25:37', '2023-10-04 07:25:37');
INSERT INTO logs.tb_logs VALUES (1577, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "hTl2AFgK5AwfY3ILaEIfjwH2xhBSR1uJE6Z1ZWQM", "captcha": "37245", "password": "adminaja", "username": "admin"}', '2023-10-04 07:25:50', '2023-10-04 07:25:50');
INSERT INTO logs.tb_logs VALUES (1578, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "NQfQ1iBmR0yGXg7Ol6QgZk5US7AOqrAuVcqxShlc", "captcha": "27158", "password": "adminaja", "username": "admin"}', '2023-10-04 07:44:06', '2023-10-04 07:44:06');
INSERT INTO logs.tb_logs VALUES (1579, 2, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "oKcC3w0FvXt5gFrMVHYMpV4tHr7AUamOyTSjNxaG"}', '2023-10-04 08:22:44', '2023-10-04 08:22:44');
INSERT INTO logs.tb_logs VALUES (1580, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "7xJ4ySfqdLno7i6TdNqIwN02p8TuVe7ggohYLNih", "captcha": "98053", "password": "adminaja", "username": "admin"}', '2023-10-04 08:30:57', '2023-10-04 08:30:57');
INSERT INTO logs.tb_logs VALUES (1581, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "a5efe014-9cc6-48bb-9594-94ddb4e63414", "request": {"user": "multipart", "image": {}}, "nama_file": "10541562_18915856-removebg-preview.png"}', '2023-10-04 15:22:04', '2023-10-04 15:22:04');
INSERT INTO logs.tb_logs VALUES (1582, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "yvwEJFEE17hLFb5zWplY9KH1l7XrutDuojGx9zD4", "captcha": "41985", "password": "adminaja", "username": "admin"}', '2023-10-05 08:40:58', '2023-10-05 08:40:58');
INSERT INTO logs.tb_logs VALUES (1583, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "f4469d29-28f3-46c1-9de0-33d3c35a0e10", "request": {"user": "multipart", "image": {}}, "nama_file": "Colorful Illustrative Fall Email Header.png"}', '2023-10-06 01:43:00', '2023-10-06 01:43:00');
INSERT INTO logs.tb_logs VALUES (1584, 14, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "sfIpb6TmmB3ExCSocUZuTzes5prtnOTaw4teGfox", "captcha": "68010", "password": "qwerty123", "username": "123456"}', '2023-10-06 01:46:40', '2023-10-06 01:46:40');
INSERT INTO logs.tb_logs VALUES (1585, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "79266554-bc3e-4625-9333-8f4a683307e5", "request": {"user": "multipart", "image": {}}, "nama_file": "Colorful Illustrative Fall Email Header.png"}', '2023-10-06 01:56:27', '2023-10-06 01:56:27');
INSERT INTO logs.tb_logs VALUES (1586, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "X1NTnoSGBmGxW1i0oYLcFsd23vGgLXHn6GzWbVK8", "captcha": "64357", "password": "adminaja", "username": "admin"}', '2023-10-06 07:46:44', '2023-10-06 07:46:44');
INSERT INTO logs.tb_logs VALUES (1587, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "aecd712c-8a8c-4d51-9303-6bd3316e5d23", "request": {"user": "multipart", "image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:06:41', '2023-10-07 06:06:41');
INSERT INTO logs.tb_logs VALUES (1588, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "28c469f8-de59-49a1-8f6d-137937e1e262", "request": {"user": "multipart", "image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:07:06', '2023-10-07 06:07:06');
INSERT INTO logs.tb_logs VALUES (1589, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "d88b98fc-99ef-4f3b-8614-b2d891d37718", "request": {"image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:08:01', '2023-10-07 06:08:01');
INSERT INTO logs.tb_logs VALUES (1590, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "80ad42d2-84a9-4f50-a559-e4a9d5ee48a2", "request": {"image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:08:04', '2023-10-07 06:08:04');
INSERT INTO logs.tb_logs VALUES (1591, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "7edfbbd3-a8d3-4a22-b622-c4af9a694fbd", "request": {"image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:10:38', '2023-10-07 06:10:38');
INSERT INTO logs.tb_logs VALUES (1592, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "7dc77f72-6ac6-4da2-b43d-32cedf03c3d7", "request": {"image": {}}, "nama_file": "14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png"}', '2023-10-07 06:17:26', '2023-10-07 06:17:26');
INSERT INTO logs.tb_logs VALUES (1593, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "0f14489b-391e-44d1-a5bb-cf139e44a4be", "request": {"image": {}}, "nama_file": "9sMUG4LqRIhQv20d1d5t.jpg"}', '2023-10-07 06:18:04', '2023-10-07 06:18:04');
INSERT INTO logs.tb_logs VALUES (1594, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "c8b974b7-040c-4216-b18d-28c66fd417e4", "request": {"image": {}}, "nama_file": "9sMUG4LqRIhQv20d1d5t.jpg"}', '2023-10-07 06:18:42', '2023-10-07 06:18:42');
INSERT INTO logs.tb_logs VALUES (1595, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "a577ab99-b735-406c-8166-357c672ea95b", "request": {"image": {}}, "nama_file": "M7BJ0RwYHBix62dxGYvf.jpg"}', '2023-10-07 06:44:35', '2023-10-07 06:44:35');
INSERT INTO logs.tb_logs VALUES (1596, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "f05c5e73-11ff-40f9-8cf1-badafe82e6cf", "request": {"image": {}}, "nama_file": "GfsVaGt1KmESowBUKceU.jpg"}', '2023-10-07 06:45:02', '2023-10-07 06:45:02');
INSERT INTO logs.tb_logs VALUES (1597, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "2c6f2d81-6a26-4563-a627-c7abca306121", "request": {"image": {}}, "nama_file": "rBzCZ57Gay8z5EEg2rdD.jpg"}', '2023-10-07 06:51:55', '2023-10-07 06:51:55');
INSERT INTO logs.tb_logs VALUES (1598, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "316f80a3-08a7-43fc-9159-c51be417816b", "request": {"image": {}}, "nama_file": "kNad3GhZRMXKxJLdccPq.jpg"}', '2023-10-07 06:53:37', '2023-10-07 06:53:37');
INSERT INTO logs.tb_logs VALUES (1599, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "bc61c365-7a86-4a29-b878-8b468a74f629", "request": {"image": {}}, "nama_file": "1696727839518.jpg"}', '2023-10-08 01:17:31', '2023-10-08 01:17:31');
INSERT INTO logs.tb_logs VALUES (1600, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "976ed483-e592-4a00-b6b5-7fd1d3ce82ab", "request": {"image": {}}, "nama_file": "1696728129156.jpg"}', '2023-10-08 01:22:21', '2023-10-08 01:22:21');
INSERT INTO logs.tb_logs VALUES (1601, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "a235e661-d613-4671-8e48-8bb872c15a0a", "request": {"image": {}}, "nama_file": "1696728129156.jpg"}', '2023-10-08 01:22:24', '2023-10-08 01:22:24');
INSERT INTO logs.tb_logs VALUES (1602, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "ad7404a4-bbfe-4db7-b3cf-5aac286414b9", "request": {"image": {}}, "nama_file": "1696728129156.jpg"}', '2023-10-08 01:22:27', '2023-10-08 01:22:27');
INSERT INTO logs.tb_logs VALUES (1603, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "66d5efa2-2126-4f86-96b1-39b547d280b8", "request": {"image": {}}, "nama_file": "1696730769486.jpg"}', '2023-10-08 02:06:18', '2023-10-08 02:06:18');
INSERT INTO logs.tb_logs VALUES (1604, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "021e4124-2869-426d-b9a8-29e3eeef7f2a", "request": {"image": {}}, "nama_file": "1696730769486.jpg"}', '2023-10-08 02:06:23', '2023-10-08 02:06:23');
INSERT INTO logs.tb_logs VALUES (1605, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "620019cc-24be-44f3-aa7c-73bddee24b78", "request": {"user": "multipart", "image": {}}, "nama_file": "Colorful Illustrative Fall Email Header.png"}', '2023-10-08 02:09:26', '2023-10-08 02:09:26');
INSERT INTO logs.tb_logs VALUES (1606, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "0b52c4d4-b2d3-41a9-9a11-6fe49108be4a", "request": {"image": {}}, "nama_file": "1696744421439.jpg"}', '2023-10-08 05:53:54', '2023-10-08 05:53:54');
INSERT INTO logs.tb_logs VALUES (1607, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "4ec195da-7775-49a2-a87d-d8566f332649", "request": {"image": {}}, "nama_file": "1696744561740.jpg"}', '2023-10-08 05:56:10', '2023-10-08 05:56:10');
INSERT INTO logs.tb_logs VALUES (1608, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "32116d7b-87bb-4428-bce0-3f750b62c1c9", "request": {"image": {}}, "nama_file": "1696744561740.jpg"}', '2023-10-08 05:56:18', '2023-10-08 05:56:18');
INSERT INTO logs.tb_logs VALUES (1609, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "3d65d815-2505-4ea6-9bd3-b12bd19c5f51", "request": {"image": {}}, "nama_file": "1696744561740.jpg"}', '2023-10-08 05:56:29', '2023-10-08 05:56:29');
INSERT INTO logs.tb_logs VALUES (1610, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "59750e10-5f58-4a7b-ba77-934e52c3954e", "request": {"image": {}}, "nama_file": "1696817958930.jpg"}', '2023-10-09 02:19:28', '2023-10-09 02:19:28');
INSERT INTO logs.tb_logs VALUES (1611, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "16c62899-6b09-4335-a773-40a73705dda5", "request": {"image": {}}, "nama_file": "1696817958930.jpg"}', '2023-10-09 02:19:39', '2023-10-09 02:19:39');
INSERT INTO logs.tb_logs VALUES (1612, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "f66ac341-a933-438e-a70a-d985ccd603b6", "request": {"image": {}}, "nama_file": "1696820144682.jpg"}', '2023-10-09 02:55:53', '2023-10-09 02:55:53');
INSERT INTO logs.tb_logs VALUES (1613, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "a9099fe5-edb2-4980-b6b5-bdb677d3150f", "request": {"image": {}}, "nama_file": "1696820144682.jpg"}', '2023-10-09 02:59:13', '2023-10-09 02:59:13');
INSERT INTO logs.tb_logs VALUES (1614, 14, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "o2xYapJc5AyupjYsGxC7RaoScx7fTsL8voNgb0fh", "captcha": "97083", "password": "qwerty123", "username": "123456"}', '2023-10-09 03:34:45', '2023-10-09 03:34:45');
INSERT INTO logs.tb_logs VALUES (1615, 14, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "0cPmgibqoKQgCXTQt5N7ldeXq3Qu5PXnpXHedEoi"}', '2023-10-09 03:35:19', '2023-10-09 03:35:19');
INSERT INTO logs.tb_logs VALUES (1616, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "GSel2C0tZikLOCOFZHW4f3bnxqqjmPAc7A5q8Nvm", "captcha": "38957", "password": "adminaja", "username": "admin"}', '2023-10-09 03:35:30', '2023-10-09 03:35:30');
INSERT INTO logs.tb_logs VALUES (1617, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "a2322c13-f414-461e-88a8-6584a1938a95", "request": {"image": {}}, "nama_file": "1696833545035.jpg"}', '2023-10-09 06:39:14', '2023-10-09 06:39:14');
INSERT INTO logs.tb_logs VALUES (1618, 14, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "Z6yAXRz9PJVqwVZ4zB5ACtnpAez23cM8QphkopMj", "captcha": "43625", "password": "qwerty123", "username": "123456"}', '2023-10-09 07:27:56', '2023-10-09 07:27:56');
INSERT INTO logs.tb_logs VALUES (1619, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "i4DVfak6WYkUkoEyg7LjrVWXlPIZgOVvzTMaZV8b", "captcha": "91002", "password": "adminaja", "username": "admin"}', '2023-10-09 08:33:11', '2023-10-09 08:33:11');
INSERT INTO logs.tb_logs VALUES (1620, 2, 1, 'Logout', '{"ip": "192.168.255.254", "_token": "VKcF5aMDFlY4WE4bXpw9eL6sSl3sIQtPHsqXLWBZ"}', '2023-10-09 08:54:04', '2023-10-09 08:54:04');
INSERT INTO logs.tb_logs VALUES (1621, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "qCtYz7RcX4VoYYO73gOEE0IRP3SHe05f1EKBC4gT", "captcha": "71459", "password": "adminaja", "username": "admin"}', '2023-10-09 09:02:44', '2023-10-09 09:02:44');
INSERT INTO logs.tb_logs VALUES (1622, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "50f84798-1004-4d4d-af54-aac6aa782261", "request": {"image": {}}, "nama_file": "1696919794309.jpg"}', '2023-10-10 06:36:47', '2023-10-10 06:36:47');
INSERT INTO logs.tb_logs VALUES (1623, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "2039273f-ace8-49ca-909d-1c295a76e084", "request": {"image": {}}, "nama_file": "1696919820468.jpg"}', '2023-10-10 06:37:10', '2023-10-10 06:37:10');
INSERT INTO logs.tb_logs VALUES (1624, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "c1040327-f35c-4b0b-bf86-8e5859abaa2f", "request": {"image": {}}, "nama_file": "ARfKv4sCvaUUCPgvizma.jpg"}', '2023-10-10 16:11:50', '2023-10-10 16:11:50');
INSERT INTO logs.tb_logs VALUES (1625, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "27dcced7-4450-471b-8211-d84370d2cb2e", "request": {"image": {}}, "nama_file": "WA9lK64aEVIpjIgmMqBz.jpg"}', '2023-10-10 16:12:04', '2023-10-10 16:12:04');
INSERT INTO logs.tb_logs VALUES (1626, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "IB6l3EPz5t5fqOvs7kYy3MiKdK1A58VGTzMGc0FG", "captcha": "79201", "password": "adminaja", "username": "admin"}', '2023-10-11 05:59:47', '2023-10-11 05:59:47');
INSERT INTO logs.tb_logs VALUES (1627, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "547e6b84-b173-45d7-96bb-772639eee76d", "request": {"image": {}}, "nama_file": "OwDjAWYGPJDg5sLGU7g7.jpg"}', '2023-10-11 07:12:29', '2023-10-11 07:12:29');
INSERT INTO logs.tb_logs VALUES (1628, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "54d9676a-0c99-4115-8ee2-6b07851a6a1f", "request": {"image": {}}, "nama_file": "PBwhtGFm1hsIupxeY6zV.jpg"}', '2023-10-11 07:13:09', '2023-10-11 07:13:09');
INSERT INTO logs.tb_logs VALUES (1629, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "aa743977-0967-45eb-a390-609b0ba4cd59", "request": {"image": {}}, "nama_file": "PBwhtGFm1hsIupxeY6zV.jpg"}', '2023-10-11 07:13:13', '2023-10-11 07:13:13');
INSERT INTO logs.tb_logs VALUES (1630, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "315e765e-71d8-4f3b-841d-66dfe903c003", "request": {"image": {}}, "nama_file": "8PMABFjFOBdw1Smlw8Gf.jpg"}', '2023-10-11 07:13:43', '2023-10-11 07:13:43');
INSERT INTO logs.tb_logs VALUES (1631, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "d71652f1-0948-4084-a82a-f6bae678d5ad", "request": {"image": {}}, "nama_file": "sOaUq7myHihmYbmd0EvF.jpg"}', '2023-10-11 07:14:21', '2023-10-11 07:14:21');
INSERT INTO logs.tb_logs VALUES (1632, 2, 1, 'Login Sukses', '{"ip": "192.168.255.254", "_token": "yzG03dRbLICxO3uL8OJbswHkQzNsS5c78y6JAdNZ", "captcha": "24061", "password": "adminaja", "username": "admin"}', '2023-10-12 04:00:12', '2023-10-12 04:00:12');
INSERT INTO logs.tb_logs VALUES (1633, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "b9257f55-3e69-47bb-938d-10c7bae5d484", "request": {"image": {}}, "nama_file": "1697083211563.jpg"}', '2023-10-12 04:01:46', '2023-10-12 04:01:46');
INSERT INTO logs.tb_logs VALUES (1634, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "bc90003b-2613-41ce-bf9f-37f9feaf4c08", "request": {"image": {}}, "nama_file": "1697083424349.jpg"}', '2023-10-12 04:04:58', '2023-10-12 04:04:58');
INSERT INTO logs.tb_logs VALUES (1635, 14, 1, 'Upload File', '{"ip": "192.168.255.254", "uuid": "99c27ba2-be2c-43ed-b701-02e303b5dadb", "request": {"image": {}}, "nama_file": "1697083424349.jpg"}', '2023-10-12 04:05:10', '2023-10-12 04:05:10');
INSERT INTO logs.tb_logs VALUES (1636, 14, 1, 'Login Sukses', '{"ip": "118.96.161.182", "_token": "QLX1vnLcv4kz444BC4M0mj3EEXP6z5oxYoCR3C8I", "captcha": "14093", "password": "qwerty123", "username": "123456"}', '2023-10-13 01:58:54', '2023-10-13 01:58:54');
INSERT INTO logs.tb_logs VALUES (1637, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "d34ca1df-6109-4ce2-828a-fe38880dede4", "request": {"image": {}}, "nama_file": "hrYniQ7vn3EnIqNGCy5v.jpg"}', '2023-10-13 07:29:15', '2023-10-13 07:29:15');
INSERT INTO logs.tb_logs VALUES (1638, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "4ac71583-b595-44bf-b011-5e6ae3046215", "request": {"image": {}}, "nama_file": "KNEfI6Y5Rn5ndvv1hqot.jpg"}', '2023-10-13 07:29:41', '2023-10-13 07:29:41');
INSERT INTO logs.tb_logs VALUES (1639, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "9a8fe986-798a-4e7d-a114-52b3a57b971c", "request": {"image": {}}, "nama_file": "KNEfI6Y5Rn5ndvv1hqot.jpg"}', '2023-10-13 07:29:52', '2023-10-13 07:29:52');
INSERT INTO logs.tb_logs VALUES (1640, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "4d3bec9e-1da5-47cc-8fd7-694948fb0042", "request": {"image": {}}, "nama_file": "h9qZab1IP69RyOyM464Q.jpg"}', '2023-10-13 07:36:44', '2023-10-13 07:36:44');
INSERT INTO logs.tb_logs VALUES (1641, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "6a826125-7c61-44a4-9f12-ca9ca792e158", "request": {"image": {}}, "nama_file": "h9qZab1IP69RyOyM464Q.jpg"}', '2023-10-13 07:36:58', '2023-10-13 07:36:58');
INSERT INTO logs.tb_logs VALUES (1642, 14, 1, 'Upload File', '{"ip": "118.96.161.182", "uuid": "7ee74331-433d-4a3f-a4c3-412f0a7cc9d4", "request": {"image": {}}, "nama_file": "h9qZab1IP69RyOyM464Q.jpg"}', '2023-10-13 07:37:05', '2023-10-13 07:37:05');
INSERT INTO logs.tb_logs VALUES (1643, 2, 1, 'Login Sukses', '{"ip": "36.73.116.5", "_token": "P1ocUWtmF06Ga5PGyJxKhdaZoy51xi717G0Wo1YA", "captcha": "90068", "password": "adminaja", "username": "admin"}', '2023-10-16 07:34:47', '2023-10-16 07:34:47');
INSERT INTO logs.tb_logs VALUES (1644, 2, 1, 'Login Sukses', '{"ip": "103.162.60.1", "_token": "QXW1tUzdXNRn0MU0m3IY5gPphpoHN5YfRmYXnN7s", "captcha": "80547", "password": "adminaja", "username": "admin"}', '2023-10-16 07:34:55', '2023-10-16 07:34:55');
INSERT INTO logs.tb_logs VALUES (1645, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "6I7KZzdk0oUeH7A9RsxriBeMF3982XKolp5yQwhK", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-16 07:36:48', '2023-10-16 07:36:48');
INSERT INTO logs.tb_logs VALUES (1646, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "6I7KZzdk0oUeH7A9RsxriBeMF3982XKolp5yQwhK"}', '2023-10-16 07:37:13', '2023-10-16 07:37:13');
INSERT INTO logs.tb_logs VALUES (1647, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "08839a17-04ee-4c15-aca4-a26993068481", "request": {"image": {}}, "nama_file": "sl68fZCcsrbf2sRBnxiR.jpg"}', '2023-10-16 07:44:41', '2023-10-16 07:44:41');
INSERT INTO logs.tb_logs VALUES (1648, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "2a0e22e1-ea4d-4916-aa06-c23292b279af", "request": {"image": {}}, "nama_file": "kmLy2AzZ72n6LeoWNtWG.jpg"}', '2023-10-16 07:45:15', '2023-10-16 07:45:15');
INSERT INTO logs.tb_logs VALUES (1649, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "62bad3e6-4b41-4f6d-8e1c-4fd11adc02f0", "request": {"image": {}}, "nama_file": "kmLy2AzZ72n6LeoWNtWG.jpg"}', '2023-10-16 07:45:21', '2023-10-16 07:45:21');
INSERT INTO logs.tb_logs VALUES (1650, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "ad47ccb5-aa5c-43d0-af66-06064db3d383", "request": {"image": {}}, "nama_file": "ngvpumdt8mQNVsKD4Ohk.jpg"}', '2023-10-16 08:05:36', '2023-10-16 08:05:36');
INSERT INTO logs.tb_logs VALUES (1651, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "0f500985-bf2c-48b3-8fd3-9ef5f191ef8f", "request": {"image": {}}, "nama_file": "i5k8yx3JoOU5L5PQibAl.jpg"}', '2023-10-16 08:07:56', '2023-10-16 08:07:56');
INSERT INTO logs.tb_logs VALUES (1652, 15, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d848c312-ef45-4347-bb50-4924347fdbd9", "request": {"image": {}}, "nama_file": "i5k8yx3JoOU5L5PQibAl.jpg"}', '2023-10-16 08:08:00', '2023-10-16 08:08:00');
INSERT INTO logs.tb_logs VALUES (1653, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "DmyP8S3xo33wqZEZluV6DEuyEdrN4iSThJO63mPZ", "captcha": "90240", "password": "adminaja", "username": "admin"}', '2023-10-16 08:08:38', '2023-10-16 08:08:38');
INSERT INTO logs.tb_logs VALUES (1654, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 15, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-16T07:36:48.000000Z", "deleted_at": null, "updated_at": "2023-10-16T07:36:48.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6Ijg0RmxqMWtYanJiWFNzUlp2UnFtOVE9PSIsInZhbHVlIjoiM25kL01NUkxCNzNsdzhyRit3VGo0dz09IiwibWFjIjoiYWJiOTVjMTk0MWExYzZjYWRjOTAzNjJhNTU2ZWY4Y2VlM2NhYWU2YjI4MDgzYjY5NTgzYzRiYWI1MDM5NTQ3ZiIsInRhZyI6IiJ9"}}', '2023-10-16 08:09:20', '2023-10-16 08:09:20');
INSERT INTO logs.tb_logs VALUES (1655, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "8V2Ek1vhxeEXq1ELOYHODhpUJg6Buc5kLB1Q0pF1", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-16 08:10:09', '2023-10-16 08:10:09');
INSERT INTO logs.tb_logs VALUES (1656, 16, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d928712d-9475-405b-bd32-626a0e320992", "request": {"image": {}}, "nama_file": "IJWA0ehcvrbNfl1QxWjI.jpg"}', '2023-10-16 08:18:49', '2023-10-16 08:18:49');
INSERT INTO logs.tb_logs VALUES (1657, 16, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "64d349f3-db62-40d6-80ec-b5fb7b55c8e2", "request": {"image": {}}, "nama_file": "KS7Ie4aryQGjPyentAop.jpg"}', '2023-10-16 08:19:22', '2023-10-16 08:19:22');
INSERT INTO logs.tb_logs VALUES (1658, 16, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b5e974ea-9856-4fd2-89cf-0ed731be0df7", "request": {"image": {}}, "nama_file": "xK1OjoxGy0vZe9QODvLr.jpg"}', '2023-10-16 08:19:54', '2023-10-16 08:19:54');
INSERT INTO logs.tb_logs VALUES (1659, 16, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d1f64a7c-943f-47f5-8c51-678e108c6de5", "request": {"image": {}}, "nama_file": "cPmBeRgJaOt7LVTnIzNU.jpg"}', '2023-10-16 08:21:00', '2023-10-16 08:21:00');
INSERT INTO logs.tb_logs VALUES (1660, 16, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "35a4947a-8ceb-438f-b564-d4fd8ac6e038", "request": {"image": {}}, "nama_file": "KTzlWhkORFGfS4nP9JOn.jpg"}', '2023-10-16 09:02:33', '2023-10-16 09:02:33');
INSERT INTO logs.tb_logs VALUES (1661, 14, 1, 'Upload File', '{"ip": "36.72.212.155", "uuid": "b248530c-b356-4b9d-89d6-4ea45757396c", "request": {"image": {}}, "nama_file": "1697462605307.jpg"}', '2023-10-16 13:23:31', '2023-10-16 13:23:31');
INSERT INTO logs.tb_logs VALUES (1662, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "14VTnYHfeye314k3PkboDs2CSqeaSyYnstIl1uXN", "captcha": "50984", "password": "adminaja", "username": "admin"}', '2023-10-17 02:10:06', '2023-10-17 02:10:06');
INSERT INTO logs.tb_logs VALUES (1663, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 16, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-16T08:10:09.000000Z", "deleted_at": null, "updated_at": "2023-10-16T08:10:09.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IkJyNUxMOEMvSTUwTGJ3NzBRZDVjTmc9PSIsInZhbHVlIjoiY0ZGTC9NZkhkZlpCclhDb0JPK2I5QT09IiwibWFjIjoiYTAyNjdlYTE2ZGYxZWJlMGVmMDkwOTA0MzNmNzE0MzdkNDI2MzRhYjk1MTFjOTYyZTUzNmVmZjEwOGU1Mjc4OSIsInRhZyI6IiJ9"}}', '2023-10-17 02:41:21', '2023-10-17 02:41:21');
INSERT INTO logs.tb_logs VALUES (1664, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "9P3E4s64kkdTZOmUkwD8xE9dQOpD3cObvg70rvG8", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-17 02:42:09', '2023-10-17 02:42:09');
INSERT INTO logs.tb_logs VALUES (1665, 17, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b8c30f5b-6db3-4d9b-8f22-a68754dd60ae", "request": {"image": {}}, "nama_file": "YOKazW4cAKpHFl0d5k0y.jpg"}', '2023-10-17 03:10:35', '2023-10-17 03:10:35');
INSERT INTO logs.tb_logs VALUES (1666, 17, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "828fb624-3760-4545-8625-bb09cb26ce81", "request": {"image": {}}, "nama_file": "zGrxu7czUjlb0s2c7Qyr.jpg"}', '2023-10-17 03:11:18', '2023-10-17 03:11:18');
INSERT INTO logs.tb_logs VALUES (1667, 17, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "68404c4b-41b5-4ecf-815a-d8549c51f2a4", "request": {"image": {}}, "nama_file": "zGrxu7czUjlb0s2c7Qyr.jpg"}', '2023-10-17 03:11:22', '2023-10-17 03:11:22');
INSERT INTO logs.tb_logs VALUES (1668, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 17, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-17T02:42:09.000000Z", "deleted_at": null, "updated_at": "2023-10-17T02:42:09.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IjFibHVDSmxWQmIyWE5hdEMvam5jM0E9PSIsInZhbHVlIjoiaGlWeUFrajRhQUorRGM1Wm8wcGhyUT09IiwibWFjIjoiZDY5Y2MzMTExNmRlZmY0ZDViMGMwMmQyNGYyMGY5YzBlMzZhNzViMjk0YTY0M2Y5ZGM2YjAwMjM1Nzc1MGFhZSIsInRhZyI6IiJ9"}}', '2023-10-17 03:12:24', '2023-10-17 03:12:24');
INSERT INTO logs.tb_logs VALUES (1669, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "joko mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "9P3E4s64kkdTZOmUkwD8xE9dQOpD3cObvg70rvG8", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-17 03:13:02', '2023-10-17 03:13:02');
INSERT INTO logs.tb_logs VALUES (1670, 2, 1, 'Logout', '{"ip": "103.162.60.0", "_token": "9P3E4s64kkdTZOmUkwD8xE9dQOpD3cObvg70rvG8"}', '2023-10-17 03:23:44', '2023-10-17 03:23:44');
INSERT INTO logs.tb_logs VALUES (1671, 18, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "MpyYQ4O7wm3yKxyF8D4U6SzOx1CzDmDPJUei5ZXt", "captcha": "31490", "password": "jokomardoyo", "username": "tes"}', '2023-10-17 03:23:54', '2023-10-17 03:23:54');
INSERT INTO logs.tb_logs VALUES (1672, 18, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "bcfc9ba8-bcb0-4a98-95df-28bde9b6a99c", "request": {"image": {}}, "nama_file": "3fJXFahQgJhSOpPdTWBO.jpg"}', '2023-10-17 03:28:17', '2023-10-17 03:28:17');
INSERT INTO logs.tb_logs VALUES (1673, 18, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "bca24dfa-a333-41ac-9a8a-e0abbb3f4e3e", "request": {"image": {}}, "nama_file": "vxJ1riHafGIKDfyHPDAZ.jpg"}', '2023-10-17 03:29:17', '2023-10-17 03:29:17');
INSERT INTO logs.tb_logs VALUES (1674, 18, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "27e96717-3c14-40ed-9b3e-ee800bae26f5", "request": {"image": {}}, "nama_file": "cyJbySkqI356QKoGCLmu.jpg"}', '2023-10-17 03:30:00', '2023-10-17 03:30:00');
INSERT INTO logs.tb_logs VALUES (1675, 14, 1, 'Upload File', '{"ip": "114.10.8.191", "uuid": "8f221ae6-6141-4b00-8259-2644dc649bee", "request": {"image": {}}, "nama_file": "1697517035213.jpg"}', '2023-10-17 04:30:46', '2023-10-17 04:30:46');
INSERT INTO logs.tb_logs VALUES (1676, 2, 1, 'Login Sukses', '{"ip": "125.163.150.60", "_token": "5UNQvWtzxZdaELkivdtEds3cokYZk2htgIhRHhG3", "captcha": "76243", "password": "adminaja", "username": "admin"}', '2023-10-17 05:44:28', '2023-10-17 05:44:28');
INSERT INTO logs.tb_logs VALUES (1677, 2, 1, 'Tambah Pengguna', '{"ip": "125.163.150.60", "name": "Coba", "akses": "8", "email": "masuk@gmail.com", "_token": "QANwGGBizfTjl6WWDFQoirBe5uChvDHSrXk1Kvr0", "is_opd": "0", "password": "11111111", "username": "masuk", "password_confirmation": "11111111"}', '2023-10-17 05:47:26', '2023-10-17 05:47:26');
INSERT INTO logs.tb_logs VALUES (1678, 19, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "31335833-f9c0-4e77-8ef3-30181550160d", "request": {"image": {}}, "nama_file": "1697521684705.jpg"}', '2023-10-17 05:48:24', '2023-10-17 05:48:24');
INSERT INTO logs.tb_logs VALUES (1679, 2, 1, 'Login Sukses', '{"ip": "125.163.150.60", "_token": "kATJlXkjsjVCyTmcESPBkFvtkf9NcEhgn903Nvxx", "captcha": "46258", "password": "adminaja", "username": "admin"}', '2023-10-17 06:13:23', '2023-10-17 06:13:23');
INSERT INTO logs.tb_logs VALUES (1680, 2, 1, 'Tambah Pengguna', '{"ip": "125.163.150.60", "name": "p", "akses": "8", "email": "p@gmail.com", "_token": "QANwGGBizfTjl6WWDFQoirBe5uChvDHSrXk1Kvr0", "is_opd": "0", "password": "12345678", "username": "ppp", "password_confirmation": "12345678"}', '2023-10-17 06:50:21', '2023-10-17 06:50:21');
INSERT INTO logs.tb_logs VALUES (1681, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "02613990-c41e-461c-bc1f-172ba0377b1c", "request": {"user": "multipart", "image": {}}, "nama_file": "Riwayat.png"}', '2023-10-17 06:51:48', '2023-10-17 06:51:48');
INSERT INTO logs.tb_logs VALUES (1682, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "2d53a44f-ee8f-4d83-bc96-f65dd40aea86", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-17 09:36:12', '2023-10-17 09:36:12');
INSERT INTO logs.tb_logs VALUES (1683, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "f1ceed20-80c5-41d0-8c0b-fca777e5951f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-17 09:43:30', '2023-10-17 09:43:30');
INSERT INTO logs.tb_logs VALUES (1684, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "da76c81a-d34e-4310-be9d-69be188891dc", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-17 09:45:43', '2023-10-17 09:45:43');
INSERT INTO logs.tb_logs VALUES (1685, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "996167a9-f95a-427f-8b24-97b45c4a6663", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 04:29:41', '2023-10-18 04:29:41');
INSERT INTO logs.tb_logs VALUES (1686, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "9d7e2b87-c020-4604-bc00-6fa34f1f2f07", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 04:33:19', '2023-10-18 04:33:19');
INSERT INTO logs.tb_logs VALUES (1687, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "8e40914b-aadd-4d41-8aa9-5a193d8c1858", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 04:35:29', '2023-10-18 04:35:29');
INSERT INTO logs.tb_logs VALUES (1688, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "90b021a6-7f46-40b6-bf90-d4f46ccf7c71", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 04:35:35', '2023-10-18 04:35:35');
INSERT INTO logs.tb_logs VALUES (1689, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "db4fcb9e-3d34-4c63-88fd-214ed3e93da2", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 04:57:53', '2023-10-18 04:57:53');
INSERT INTO logs.tb_logs VALUES (1690, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "12b9c0e5-cc83-48c0-8998-c551e0f88f26", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:02:04', '2023-10-18 05:02:04');
INSERT INTO logs.tb_logs VALUES (1691, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "0af37202-e308-49ea-b58a-5249553a2588", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:02:28', '2023-10-18 05:02:28');
INSERT INTO logs.tb_logs VALUES (1692, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "1ba6b717-c6de-4082-8e22-9e6c24f9ff22", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:03:13', '2023-10-18 05:03:13');
INSERT INTO logs.tb_logs VALUES (1693, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "5c9567af-9264-4ea3-913d-0a6fd1e10b5b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:03:57', '2023-10-18 05:03:57');
INSERT INTO logs.tb_logs VALUES (1694, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "88ef96f5-f04d-4675-9a5a-6469b2d63b51", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:04:34', '2023-10-18 05:04:34');
INSERT INTO logs.tb_logs VALUES (1695, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "d1f54a56-205e-4406-99cd-1276e2c4a157", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:04:41', '2023-10-18 05:04:41');
INSERT INTO logs.tb_logs VALUES (1696, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "16672455-7696-49dc-aa00-adf8f7841f7b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:05:20', '2023-10-18 05:05:20');
INSERT INTO logs.tb_logs VALUES (1697, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "042d002c-27db-447a-9a23-fb3b86000dde", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:05:59', '2023-10-18 05:05:59');
INSERT INTO logs.tb_logs VALUES (1698, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "6cd24e9b-db2c-436f-86a3-2290f7f69932", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:06:14', '2023-10-18 05:06:14');
INSERT INTO logs.tb_logs VALUES (1699, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "fb0967f4-a143-49d7-9aa4-879acfbe7c68", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:06:52', '2023-10-18 05:06:52');
INSERT INTO logs.tb_logs VALUES (1700, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "f9910aa0-5d96-4237-b307-78e48371319e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:08:25', '2023-10-18 05:08:25');
INSERT INTO logs.tb_logs VALUES (1701, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "7af9dd6d-a76f-4068-bc56-82e340535637", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:08:43', '2023-10-18 05:08:43');
INSERT INTO logs.tb_logs VALUES (1702, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "c7d9ad31-732d-44b1-9d2e-670ca8802be3", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:09:31', '2023-10-18 05:09:31');
INSERT INTO logs.tb_logs VALUES (1703, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "d73f4d51-6036-4a12-8fa9-cd1e6534cf30", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:12:05', '2023-10-18 05:12:05');
INSERT INTO logs.tb_logs VALUES (1704, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "c0fd448c-df9a-47f3-9f15-25f1327aa843", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:14:29', '2023-10-18 05:14:29');
INSERT INTO logs.tb_logs VALUES (1705, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "f48f73b3-0748-4388-b4b9-29d6f6a7cbe4", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:18:39', '2023-10-18 05:18:39');
INSERT INTO logs.tb_logs VALUES (1706, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "86380619-1d17-4d7a-aac7-330f9aa49d3c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:39:38', '2023-10-18 05:39:38');
INSERT INTO logs.tb_logs VALUES (1707, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "75c20014-1d71-4a0b-a323-b3c0227f6a70", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 05:42:47', '2023-10-18 05:42:47');
INSERT INTO logs.tb_logs VALUES (1708, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "62723e6a-d846-486a-8cc9-42fb91a4f9c0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:26:42', '2023-10-18 13:26:42');
INSERT INTO logs.tb_logs VALUES (1709, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "2b110059-4410-4e95-ab01-6b6f5b07de8a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:31:54', '2023-10-18 13:31:54');
INSERT INTO logs.tb_logs VALUES (1710, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "f2d41407-d6ac-4f88-a868-f789c384b129", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:37:41', '2023-10-18 13:37:41');
INSERT INTO logs.tb_logs VALUES (1711, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "a064569b-a25f-4e57-b9de-07eedcbad974", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:39:54', '2023-10-18 13:39:54');
INSERT INTO logs.tb_logs VALUES (1712, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "7daceecf-3816-45ce-bd78-ef6712b0d6e9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:42:56', '2023-10-18 13:42:56');
INSERT INTO logs.tb_logs VALUES (1713, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "087fc1e8-820e-42e4-b115-b9bba8dbb77c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:44:46', '2023-10-18 13:44:46');
INSERT INTO logs.tb_logs VALUES (1714, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "2cc02c26-3a50-46ed-b7b4-a45c362aeeea", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:45:46', '2023-10-18 13:45:46');
INSERT INTO logs.tb_logs VALUES (1715, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "c0f1d674-8154-4157-84ee-e13967e76662", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:46:24', '2023-10-18 13:46:24');
INSERT INTO logs.tb_logs VALUES (1716, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "5d81d2df-8070-45ce-a84c-056523b0b3f5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:49:04', '2023-10-18 13:49:04');
INSERT INTO logs.tb_logs VALUES (1717, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "6990db37-5c10-4d35-923d-8d6bbd5dc459", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:53:11', '2023-10-18 13:53:11');
INSERT INTO logs.tb_logs VALUES (1718, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "f2be9c6c-d757-4dee-a372-07a1d901b843", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:54:26', '2023-10-18 13:54:26');
INSERT INTO logs.tb_logs VALUES (1719, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "c83e2688-4fd8-4ca5-b0b7-0fb1fe87a34a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:55:25', '2023-10-18 13:55:25');
INSERT INTO logs.tb_logs VALUES (1720, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "65affe86-91a1-4ceb-ad7b-f7cf9aa793e1", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 13:55:38', '2023-10-18 13:55:38');
INSERT INTO logs.tb_logs VALUES (1721, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "8fa7e56a-bdd6-4272-8c13-a3672c44ff5b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:06:06', '2023-10-18 14:06:06');
INSERT INTO logs.tb_logs VALUES (1722, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "f9a168eb-bd85-4a7e-a8d3-f5e584ea72b8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:06:26', '2023-10-18 14:06:26');
INSERT INTO logs.tb_logs VALUES (1723, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "ee0e015f-f0e5-40e9-b27c-9167d2c935d7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:15:08', '2023-10-18 14:15:08');
INSERT INTO logs.tb_logs VALUES (1724, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "b13002bf-9ba7-4fb5-9924-775fe24c386f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:17:02', '2023-10-18 14:17:02');
INSERT INTO logs.tb_logs VALUES (1725, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "a94d5e74-3296-4fde-b440-ac21098ddf7e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:25:47', '2023-10-18 14:25:47');
INSERT INTO logs.tb_logs VALUES (1726, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "349848e2-70d3-436a-a5ba-67e980aa1fd9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:27:36', '2023-10-18 14:27:36');
INSERT INTO logs.tb_logs VALUES (1727, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "c52db7a1-4ae9-467d-a881-ab0cc5a008d9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:29:25', '2023-10-18 14:29:25');
INSERT INTO logs.tb_logs VALUES (1728, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "e8812209-678b-4c7e-9d0d-1a5d91a138a7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:31:16', '2023-10-18 14:31:16');
INSERT INTO logs.tb_logs VALUES (1729, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "afdabe7f-d505-4d2b-9f3a-5cddf57d35df", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 14:44:54', '2023-10-18 14:44:54');
INSERT INTO logs.tb_logs VALUES (1730, 18, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "1dfdac5b-5cd7-46c1-a9ca-8ce64b0f8240", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:15:42', '2023-10-18 15:15:42');
INSERT INTO logs.tb_logs VALUES (1731, 18, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "097641f2-2493-4db2-b56c-54371f876964", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:16:34', '2023-10-18 15:16:34');
INSERT INTO logs.tb_logs VALUES (1732, 2, 1, 'Login Sukses', '{"ip": "36.78.41.240", "_token": "oLPIq61uAduEVwzt64sDI4qexm7cHYdXxoyfOyGM", "captcha": "23401", "password": "adminaja", "username": "admin"}', '2023-10-18 15:35:10', '2023-10-18 15:35:10');
INSERT INTO logs.tb_logs VALUES (1733, 2, 1, 'Hapus Pengguna', '{"ip": "36.78.41.240", "old": {"id": 18, "foto": null, "name": "joko mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-17T03:13:02.000000Z", "deleted_at": null, "updated_at": "2023-10-17T03:13:02.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IjhrQTJZR2tmczFtOENUZEdWZ1VZYVE9PSIsInZhbHVlIjoiUXp1MWtGYm5IenJFSENGZWpVeTluUT09IiwibWFjIjoiZTFjODdmYzFhYWRlM2IxZWRlZjliNGY1M2U4MzdlNTE5N2VjZTE4OTA3YTEzMmI1NDhiN2Y4MDc1ZGU4MTAzOCIsInRhZyI6IiJ9"}}', '2023-10-18 15:35:23', '2023-10-18 15:35:23');
INSERT INTO logs.tb_logs VALUES (1734, 2, 1, 'Tambah Pengguna', '{"ip": "36.78.41.240", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "qOOgaRbKmt6EUDCZtlawbZkO2LIejprVZ6gfcyH9", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-18 15:35:58', '2023-10-18 15:35:58');
INSERT INTO logs.tb_logs VALUES (1735, 21, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "a2375135-7dfe-4f68-a56d-40d02a417fca", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:53:28', '2023-10-18 15:53:28');
INSERT INTO logs.tb_logs VALUES (1736, 21, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "3706087a-01ed-4006-a359-9158c142932c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:53:59', '2023-10-18 15:53:59');
INSERT INTO logs.tb_logs VALUES (1737, 21, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "13505d10-048c-4226-a8db-93f3ae62e040", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:54:36', '2023-10-18 15:54:36');
INSERT INTO logs.tb_logs VALUES (1738, 21, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "79b570fd-b58a-4876-ad3a-1f08989d10df", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:58:04', '2023-10-18 15:58:04');
INSERT INTO logs.tb_logs VALUES (1739, 21, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "12069e5b-6720-44b4-9177-f5fc05659a15", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 15:58:58', '2023-10-18 15:58:58');
INSERT INTO logs.tb_logs VALUES (1740, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "36014c20-43d8-4c35-b895-b74e8ab11e2f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-18 16:30:45', '2023-10-18 16:30:45');
INSERT INTO logs.tb_logs VALUES (1741, 21, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b098d2f6-4bfa-42a9-a1ff-104da48a107a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 03:53:49', '2023-10-19 03:53:49');
INSERT INTO logs.tb_logs VALUES (1742, 21, 1, 'Upload File', '{"ip": "103.162.60.0", "uuid": "4f122116-f701-409b-a345-233134d469e0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 03:54:14', '2023-10-19 03:54:14');
INSERT INTO logs.tb_logs VALUES (1743, 21, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "0335add3-0d50-451f-abcc-3211cc8a063f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 03:56:48', '2023-10-19 03:56:48');
INSERT INTO logs.tb_logs VALUES (1744, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "s0FYvYRHCG9Bnlm5Oi0wO1qdGDxf5tFbzaONqQ6h", "captcha": "37409", "password": "adminaja", "username": "admin"}', '2023-10-19 03:57:30', '2023-10-19 03:57:30');
INSERT INTO logs.tb_logs VALUES (1745, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 21, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-18T15:35:58.000000Z", "deleted_at": null, "updated_at": "2023-10-18T15:35:58.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IjVuS0psdzM4MXJnVC9PN2d6QURZSFE9PSIsInZhbHVlIjoiNUFQK2VUVENMV09Kd2NTVk9QcU5mdz09IiwibWFjIjoiODEyZTZkOGQ4YTM2MDBlYjhkYjNhYjM1YjdmZGJmNzM5YTViYjJjMzZjODBhNDNhM2E1ZDRkNjE5M2Y4OWQxZSIsInRhZyI6IiJ9"}}', '2023-10-19 03:57:46', '2023-10-19 03:57:46');
INSERT INTO logs.tb_logs VALUES (1746, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "7OijizNlFjGb2Fd9meAgHnwXw0hfmJLiUMgzzWa3"}', '2023-10-19 03:57:50', '2023-10-19 03:57:50');
INSERT INTO logs.tb_logs VALUES (1747, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "oTgXBuJ68wJ76F3v0RYr7ScUFRBWxuSBVLaKoIXf", "captcha": "19463", "password": "adminaja", "username": "admin"}', '2023-10-19 03:57:59', '2023-10-19 03:57:59');
INSERT INTO logs.tb_logs VALUES (1748, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "EPXZjFIctjkizLjqPUOd4AXrle3k0LCUKtl0iS6o", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-19 03:58:44', '2023-10-19 03:58:44');
INSERT INTO logs.tb_logs VALUES (1749, 22, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "4f742de7-ca07-40d2-8dbc-53f9f51ddb7e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 03:59:20', '2023-10-19 03:59:20');
INSERT INTO logs.tb_logs VALUES (1750, 22, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d0f46fc7-8935-43b4-bd10-13a4df971fce", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 03:59:42', '2023-10-19 03:59:42');
INSERT INTO logs.tb_logs VALUES (1751, 14, 1, 'Upload File', '{"ip": "125.163.150.60", "uuid": "3d8c1fa0-ff5f-452d-9a21-20e3967b6844", "request": {"image": {}}, "nama_file": "main_chart.jpg"}', '2023-10-19 04:44:30', '2023-10-19 04:44:30');
INSERT INTO logs.tb_logs VALUES (1752, 2, 1, 'Login Sukses', '{"ip": "125.163.235.69", "_token": "OQzJeaegcpIgak15Wam3ocL5jKOVzf8FRSPKY6B4", "captcha": "52184", "password": "adminaja", "username": "admin"}', '2023-10-19 06:54:43', '2023-10-19 06:54:43');
INSERT INTO logs.tb_logs VALUES (1753, 2, 1, 'Tambah Pengguna', '{"ip": "125.163.235.69", "name": "fajar", "akses": "8", "email": "fajar@gmai.com", "_token": "yswzWKQteyb0oWGJgN4Fggnm63wErnwRU6xGNiOx", "is_opd": "0", "password": "qwerty123", "username": "fajar", "password_confirmation": "qwerty123"}', '2023-10-19 06:55:17', '2023-10-19 06:55:17');
INSERT INTO logs.tb_logs VALUES (1754, 14, 1, 'Upload File', '{"ip": "125.163.235.69", "uuid": "a4c09478-c750-4e34-afac-c79eb3af917b", "request": {"image": {}}, "nama_file": "Fw6Foh8WcAAJh-Q.jpeg"}', '2023-10-19 06:56:18', '2023-10-19 06:56:18');
INSERT INTO logs.tb_logs VALUES (1755, 23, 1, 'Upload File', '{"ip": "125.163.235.69", "uuid": "bdd09d84-65e8-45df-acaf-fc3d5013f6ea", "request": {"image": {}}, "nama_file": "Fw6Foh8WcAAJh-Q.jpeg"}', '2023-10-19 06:56:26', '2023-10-19 06:56:26');
INSERT INTO logs.tb_logs VALUES (1756, 22, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "de06b166-bc60-4f5c-b9f1-7670f5ded9f3", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 12:33:10', '2023-10-19 12:33:10');
INSERT INTO logs.tb_logs VALUES (1757, 22, 1, 'Upload File', '{"ip": "36.78.41.240", "uuid": "3c1e7d5d-4763-4d97-b03f-641d44ccdfb0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 12:34:04', '2023-10-19 12:34:04');
INSERT INTO logs.tb_logs VALUES (1758, 2, 1, 'Login Sukses', '{"ip": "36.78.41.240", "_token": "tGb6nO1JpmLrwySFFM2TgHJgBxsAk2kvQQM9jsxq", "captcha": "30619", "password": "adminaja", "username": "admin"}', '2023-10-19 12:35:41', '2023-10-19 12:35:41');
INSERT INTO logs.tb_logs VALUES (1759, 2, 1, 'Hapus Pengguna', '{"ip": "36.78.41.240", "old": {"id": 22, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "created_at": "2023-10-19T03:58:44.000000Z", "deleted_at": null, "updated_at": "2023-10-19T03:58:44.000000Z", "email_verified_at": null}, "request": {"id": "eyJpdiI6IlY0RUJvV3Q1cjVwRFIvWWpEckVRdXc9PSIsInZhbHVlIjoiQ04ySXUrSDlyeEVqcXQzTXluNFk1dz09IiwibWFjIjoiYmI5ZGEyZGViMjQ2NGMwMDRjOTcxYmFhYWNiZmEyYjUzMWQzODc2YjI5MmZkZTE5NWQ1OGEwZDI3Y2IxNGQxOSIsInRhZyI6IiJ9"}}', '2023-10-19 12:36:04', '2023-10-19 12:36:04');
INSERT INTO logs.tb_logs VALUES (1760, 2, 1, 'Tambah Pengguna', '{"ip": "36.78.41.240", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "L8S03jJ58OIxq63QGWAWDeq1NOvo0wQkCUsb7yZ5", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "password_confirmation": "jokomardoyo"}', '2023-10-19 12:37:17', '2023-10-19 12:37:17');
INSERT INTO logs.tb_logs VALUES (1761, 2, 1, 'Tambah Pengguna', '{"ip": "36.78.41.240", "name": "James Cook", "akses": "8", "email": "jamescook@mail.com", "_token": "L8S03jJ58OIxq63QGWAWDeq1NOvo0wQkCUsb7yZ5", "is_opd": "0", "password": "jamescook", "username": "coba", "password_confirmation": "jamescook"}', '2023-10-19 12:48:09', '2023-10-19 12:48:09');
INSERT INTO logs.tb_logs VALUES (1762, 25, 1, 'Upload File', '{"ip": "182.4.102.33", "uuid": "04458b52-ceea-4208-a2a5-f535c200b021", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 14:37:03', '2023-10-19 14:37:03');
INSERT INTO logs.tb_logs VALUES (1763, 25, 1, 'Upload File', '{"ip": "182.4.100.0", "uuid": "b6abe053-d3de-41c4-9530-5c119d10f489", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 14:37:43', '2023-10-19 14:37:43');
INSERT INTO logs.tb_logs VALUES (1764, 25, 1, 'Upload File', '{"ip": "182.4.100.0", "uuid": "b52014ed-50fb-43bc-bba3-bbd5b0da495d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 14:37:58', '2023-10-19 14:37:58');
INSERT INTO logs.tb_logs VALUES (1765, 24, 1, 'Upload File', '{"ip": "182.4.100.0", "uuid": "a00f9fb3-70f0-4282-aec9-7704002e6936", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-19 15:01:30', '2023-10-19 15:01:30');
INSERT INTO logs.tb_logs VALUES (1766, 24, 1, 'Upload File', '{"ip": "182.4.102.147", "uuid": "66a7ea09-7e29-4077-bab2-e0439ea25b8f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-20 07:03:25', '2023-10-20 07:03:25');
INSERT INTO logs.tb_logs VALUES (1767, 24, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "e01637de-7d0a-422a-bbf4-5cf90c5909b5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-20 08:01:27', '2023-10-20 08:01:27');
INSERT INTO logs.tb_logs VALUES (1768, 2, 1, 'Login Sukses', '{"ip": "125.163.235.69", "_token": "u3izfcYtCZaLCOiiC5uedAD2Ifdbi2DCWZPzIJ23", "captcha": "94731", "password": "adminaja", "username": "admin"}', '2023-10-20 17:33:19', '2023-10-20 17:33:19');
INSERT INTO logs.tb_logs VALUES (1769, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "permission-khusus", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "0", "is_menu": "1", "keterangan": "Permission Khusus"}', '2023-10-20 17:33:59', '2023-10-20 17:33:59');
INSERT INTO logs.tb_logs VALUES (1770, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "is_admin", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "96", "is_menu": "0", "keterangan": "is_admin"}', '2023-10-20 17:34:06', '2023-10-20 17:34:06');
INSERT INTO logs.tb_logs VALUES (1771, 2, 1, 'Ubah Permission Master', '{"id": "97", "ip": "125.163.235.69", "urai": "is_admin", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "96", "is_menu": "0", "keterangan": "Administrator"}', '2023-10-20 17:34:13', '2023-10-20 17:34:13');
INSERT INTO logs.tb_logs VALUES (1772, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "is_user", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "96", "is_menu": "0", "keterangan": "User"}', '2023-10-20 17:34:20', '2023-10-20 17:34:20');
INSERT INTO logs.tb_logs VALUES (1773, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "setting-koordinat-delete", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "12", "is_menu": "0", "keterangan": "hapus koordinat"}', '2023-10-20 17:34:38', '2023-10-20 17:34:38');
INSERT INTO logs.tb_logs VALUES (1774, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "setting-koordinat-edit", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "12", "is_menu": "0", "keterangan": "edit koordinat"}', '2023-10-20 17:34:45', '2023-10-20 17:34:45');
INSERT INTO logs.tb_logs VALUES (1775, 2, 1, 'Tambah Master Permission', '{"ip": "125.163.235.69", "urai": "setting-koordinat-tambah", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "parent": "12", "is_menu": "0", "keterangan": "tambah koordinat"}', '2023-10-20 17:34:52', '2023-10-20 17:34:52');
INSERT INTO logs.tb_logs VALUES (1776, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6InRUSk5HVHdLL0Joc2pXaGVTMm05Unc9PSIsInZhbHVlIjoiTXVXOVdrR0xoSDdUQWhlOTJBamREZz09IiwibWFjIjoiMTZlM2Y0ZWYxMDhlNjY3MmRlNDBhYWRiZTUzOGIxMjY3MDAzYmFiNTkyMzFkMmE5MzM3MmRlYTgwNzI3OTRhOCIsInRhZyI6IiJ9", "ip": "125.163.235.69", "id_role": "eyJpdiI6IjB2ZnVNNS9relIrV2tsK3NjZkNTVGc9PSIsInZhbHVlIjoiVG1FVEZvQ3pxRmhqWkM3NzlhQStkdz09IiwibWFjIjoiNWZjYTRiYjlhMzliMWU0Mzg2NmMzNTczZDM1NGVjMzZiNGFmZDU1OTdlNTc1M2E1NjMzMDgxMGQwN2EyMzUyYyIsInRhZyI6IiJ9"}', '2023-10-20 17:34:59', '2023-10-20 17:34:59');
INSERT INTO logs.tb_logs VALUES (1777, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6InJpZkFSSlpWQlNkUGVpbjVBMzlwZnc9PSIsInZhbHVlIjoiU2VwelFxUnFEUTdMK01iZHZCQXd4UT09IiwibWFjIjoiOWNiNWNmMjQxMmE5YmNjNDMxMGY4NGQwZDBiMTg3YjcxMjZiNWE0ZDQ1NzIyNjdjNDM1OWRhMWE5Y2FmMTExNSIsInRhZyI6IiJ9", "ip": "125.163.235.69", "id_role": "eyJpdiI6IjB2ZnVNNS9relIrV2tsK3NjZkNTVGc9PSIsInZhbHVlIjoiVG1FVEZvQ3pxRmhqWkM3NzlhQStkdz09IiwibWFjIjoiNWZjYTRiYjlhMzliMWU0Mzg2NmMzNTczZDM1NGVjMzZiNGFmZDU1OTdlNTc1M2E1NjMzMDgxMGQwN2EyMzUyYyIsInRhZyI6IiJ9"}', '2023-10-20 17:35:01', '2023-10-20 17:35:01');
INSERT INTO logs.tb_logs VALUES (1778, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6IkIxcXNVeHJVajYyM1dkTGZEZ1Nxa0E9PSIsInZhbHVlIjoiL1NqQnU5VXBhS1g0SU5hRG4xMTJXdz09IiwibWFjIjoiNGMwODg4N2RiYmYyMGU5ZTE4YzQxYjk0NWJlZTk5MjExODUyZDk2YzE3YjQwODE3OTFkNmQ3MTE0YmY5YTkyNSIsInRhZyI6IiJ9", "ip": "125.163.235.69", "id_role": "eyJpdiI6IjB2ZnVNNS9relIrV2tsK3NjZkNTVGc9PSIsInZhbHVlIjoiVG1FVEZvQ3pxRmhqWkM3NzlhQStkdz09IiwibWFjIjoiNWZjYTRiYjlhMzliMWU0Mzg2NmMzNTczZDM1NGVjMzZiNGFmZDU1OTdlNTc1M2E1NjMzMDgxMGQwN2EyMzUyYyIsInRhZyI6IiJ9"}', '2023-10-20 17:35:02', '2023-10-20 17:35:02');
INSERT INTO logs.tb_logs VALUES (1779, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6ImNGTUtHckVQeHg4cUROR21DRjNmN3c9PSIsInZhbHVlIjoidjZha0hXSXpGUWVYUklSNWF5a1BpQT09IiwibWFjIjoiYmU2YTc0ZDlmNGY3OTlkYWZmNDdjYzFmZTVhNTc2NjVkMjJlYjU0OWIxMmRjYzM3M2RmMjM1ZTk4NGMzYTFiNCIsInRhZyI6IiJ9", "ip": "125.163.235.69", "id_role": "eyJpdiI6IjB2ZnVNNS9relIrV2tsK3NjZkNTVGc9PSIsInZhbHVlIjoiVG1FVEZvQ3pxRmhqWkM3NzlhQStkdz09IiwibWFjIjoiNWZjYTRiYjlhMzliMWU0Mzg2NmMzNTczZDM1NGVjMzZiNGFmZDU1OTdlNTc1M2E1NjMzMDgxMGQwN2EyMzUyYyIsInRhZyI6IiJ9"}', '2023-10-20 17:35:03', '2023-10-20 17:35:03');
INSERT INTO logs.tb_logs VALUES (1780, 2, 1, 'Tambah Koordinat', '{"ip": "125.163.235.69", "urai": "Global Intermedia 1", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "koordinat": "-7.813108504188568, 110.37668919355862"}', '2023-10-20 17:35:24', '2023-10-20 17:35:24');
INSERT INTO logs.tb_logs VALUES (1781, 2, 1, 'Tambah Koordinat', '{"ip": "125.163.235.69", "urai": "Global Intermedia Bootcamp", "_token": "2DwnUTjOrsA8wLFxexoJliLl6rfMCGhPKgEq2pR2", "koordinat": "-7.807583919255681, 110.37814080219567"}', '2023-10-20 17:35:53', '2023-10-20 17:35:53');
INSERT INTO logs.tb_logs VALUES (1782, 14, 1, 'Upload File', '{"ip": "103.111.141.210", "uuid": "f3d5e532-a605-4cca-a3d0-f8b3c0c88710", "request": {"image": {}}, "nama_file": "JajtusehE6aZsjlRyj3h.jpg"}', '2023-10-21 09:11:22', '2023-10-21 09:11:22');
INSERT INTO logs.tb_logs VALUES (1783, 14, 1, 'Upload File', '{"ip": "103.111.141.210", "uuid": "a43a9a70-0d12-4772-b285-a79cf839046e", "request": {"image": {}}, "nama_file": "6iI8rLn5pvsXVvtTLUoh.jpg"}', '2023-10-21 09:14:36', '2023-10-21 09:14:36');
INSERT INTO logs.tb_logs VALUES (1784, 14, 1, 'Login Sukses', '{"ip": "36.73.127.218", "_token": "e2G2FshQuFWspNhiW5FVymHsN1xLvU0GFqpIwA9q", "captcha": "30648", "password": "qwerty123", "username": "123456"}', '2023-10-22 13:17:33', '2023-10-22 13:17:33');
INSERT INTO logs.tb_logs VALUES (1785, 14, 1, 'Logout', '{"ip": "36.73.127.218", "_token": "fuwuuasOleqqX1ZDh3YRn8jjhO4P55nVv0KyGTuH"}', '2023-10-22 13:18:29', '2023-10-22 13:18:29');
INSERT INTO logs.tb_logs VALUES (1786, 2, 1, 'Login Sukses', '{"ip": "36.73.127.218", "_token": "8SOb8C0kiWsH6HXbkmdKCYvPzFMolBtKJb2nsJD6", "captcha": "59721", "password": "adminaja", "username": "admin"}', '2023-10-22 13:18:40', '2023-10-22 13:18:40');
INSERT INTO logs.tb_logs VALUES (1787, 2, 1, 'Tambah Pengguna', '{"ip": "36.73.127.218", "name": "tes1", "akses": "8", "email": "testes@gmail.com", "_token": "u6vrhwAS06QjVp6nwodlXEJaincI3yuluYzHC7lJ", "is_opd": "0", "password": "11111111", "username": "testes", "koordinat": ["1"], "waktu_masuk": "13:00", "waktu_keluar": "17:30", "password_confirmation": "11111111"}', '2023-10-22 13:20:17', '2023-10-22 13:20:17');
INSERT INTO logs.tb_logs VALUES (1788, 14, 1, 'Upload File', '{"ip": "36.73.127.218", "uuid": "9d167194-98ae-4882-85bd-617286903326", "request": {"user": "multipart", "image": {}}, "nama_file": "Riwayat.png"}', '2023-10-22 13:32:49', '2023-10-22 13:32:49');
INSERT INTO logs.tb_logs VALUES (1789, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "66ef23c1-31f3-4223-8068-6fbba03499da", "request": {"image": {}}, "nama_file": "41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg"}', '2023-10-22 20:03:48', '2023-10-22 20:03:48');
INSERT INTO logs.tb_logs VALUES (1790, 14, 1, 'Upload File', '{"ip": "202.56.166.160", "uuid": "04a3a841-bac0-4035-9798-f5ac6d5282f3", "request": {"image": {}}, "nama_file": "41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg"}', '2023-10-22 20:04:01', '2023-10-22 20:04:01');
INSERT INTO logs.tb_logs VALUES (1791, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "208c172e-5d7d-4732-a27c-529fe773b66c", "request": {"image": {}}, "nama_file": "41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg"}', '2023-10-22 20:06:10', '2023-10-22 20:06:10');
INSERT INTO logs.tb_logs VALUES (1792, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "5a4be2f7-2a00-4a1a-8f3b-6620fd012d32", "request": {"image": {}}, "nama_file": "41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg"}', '2023-10-22 20:06:12', '2023-10-22 20:06:12');
INSERT INTO logs.tb_logs VALUES (1793, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "0fb8c96e-cde0-4ee2-bfd9-da75e1f80c94", "request": {"image": {}}, "nama_file": "2k-blue-audi-r8-85fsyuechvr6mjxw.jpg"}', '2023-10-22 22:03:24', '2023-10-22 22:03:24');
INSERT INTO logs.tb_logs VALUES (1794, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "340a4fe0-195e-4255-9c65-2c3e433cb156", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:23:21', '2023-10-22 22:23:21');
INSERT INTO logs.tb_logs VALUES (1795, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "2a82d71c-9958-499e-bc6b-a22012da937f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:30:50', '2023-10-22 22:30:50');
INSERT INTO logs.tb_logs VALUES (1796, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "1ee8fede-95d1-4166-9190-c0449e25f851", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:31:40', '2023-10-22 22:31:40');
INSERT INTO logs.tb_logs VALUES (1797, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "ef217809-538b-4ce7-a71e-fd97a1502dd3", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:33:07', '2023-10-22 22:33:07');
INSERT INTO logs.tb_logs VALUES (1798, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "e5b4070b-3330-444c-95fa-088d9ee812fb", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:33:20', '2023-10-22 22:33:20');
INSERT INTO logs.tb_logs VALUES (1799, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "6b25e931-ac7d-4402-95a0-f7868cdbcb17", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 22:35:37', '2023-10-22 22:35:37');
INSERT INTO logs.tb_logs VALUES (1800, 14, 1, 'Upload File', '{"ip": "202.56.166.161", "uuid": "7ecd3acf-dae1-40c5-8f76-e7a05dc620b5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 23:15:54', '2023-10-22 23:15:54');
INSERT INTO logs.tb_logs VALUES (1801, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "8b87bb47-75e6-4c34-93d3-65349b4d2bf9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 23:21:12', '2023-10-22 23:21:12');
INSERT INTO logs.tb_logs VALUES (1802, 14, 1, 'Upload File', '{"ip": "202.56.166.163", "uuid": "e9a690c0-b5e5-4080-8cee-8e34d0bab0f5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 23:21:29', '2023-10-22 23:21:29');
INSERT INTO logs.tb_logs VALUES (1803, 14, 1, 'Upload File', '{"ip": "202.56.166.162", "uuid": "471dfd47-221b-4a3a-9183-41e0df075f39", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-22 23:21:43', '2023-10-22 23:21:43');
INSERT INTO logs.tb_logs VALUES (1804, 24, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "dca586c5-836c-4c70-9c59-dcc3f1730b74", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-23 10:13:46', '2023-10-23 10:13:46');
INSERT INTO logs.tb_logs VALUES (1805, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "ZxNZZMFCVlfLOK9iqtZZCs6vnOY8z4h6m7JQ6mpn", "captcha": "56204", "password": "adminaja", "username": "admin"}', '2023-10-23 10:14:33', '2023-10-23 10:14:33');
INSERT INTO logs.tb_logs VALUES (1806, 25, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "790774a2-8852-41c9-ab41-9efbda38f3a9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-23 10:15:19', '2023-10-23 10:15:19');
INSERT INTO logs.tb_logs VALUES (1807, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 25, "foto": null, "name": "James Cook", "email": "jamescook@mail.com", "kodeskpd": null, "username": "coba", "kodeakses": 8, "koordinat": "[\"1\", \"2\"]", "created_at": "2023-10-19T05:48:09.000000Z", "deleted_at": null, "updated_at": "2023-10-19T05:48:09.000000Z", "waktu_masuk": "08:00:00", "waktu_keluar": "17:00:00", "email_verified_at": null}, "request": {"id": "eyJpdiI6IkNDU3M0Z0Q5dzFrVUR0M1pKWHVMWmc9PSIsInZhbHVlIjoibFladTl3VnRKTWpHeVlDYVJHZCtLZz09IiwibWFjIjoiYjg1NTIzZTgzNDRhMjI0NDdjZGQ0M2M0YjRhMTkyNTg5YzcwZmE0ZTdlYTA3ZGZlOTBmNjQwNDA4YjI3ZmEyNCIsInRhZyI6IiJ9"}}', '2023-10-23 10:35:05', '2023-10-23 10:35:05');
INSERT INTO logs.tb_logs VALUES (1808, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 24, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "koordinat": "[\"1\", \"2\"]", "created_at": "2023-10-19T05:37:17.000000Z", "deleted_at": null, "updated_at": "2023-10-19T05:37:17.000000Z", "waktu_masuk": "08:00:00", "waktu_keluar": "17:00:00", "email_verified_at": null}, "request": {"id": "eyJpdiI6IkNpNnUyQ0pTZ2lJQ0o4WmJkOUM4S1E9PSIsInZhbHVlIjoicEdFSlNLT0JLZ1U3ZGxJejdTUkZ6Zz09IiwibWFjIjoiM2MzYWJkMmNjMDI0OWNjMGEzYTdjNTE0NjE5NDU4YmY4NzFkODU4ZjY3ZGMxZDRiMzAzZjFmNDlkY2Q1MWViOCIsInRhZyI6IiJ9"}}', '2023-10-23 10:35:12', '2023-10-23 10:35:12');
INSERT INTO logs.tb_logs VALUES (1809, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "LHhQGbRvWDLn5RnT8DqpDn7topFyzrN2eQoL9f0d", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "jokomardoyo"}', '2023-10-23 10:37:19', '2023-10-23 10:37:19');
INSERT INTO logs.tb_logs VALUES (1810, 2, 1, 'Ubah Pengguna', '{"id": "27", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "LHhQGbRvWDLn5RnT8DqpDn7topFyzrN2eQoL9f0d", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "jokomardoyo"}', '2023-10-23 10:54:23', '2023-10-23 10:54:23');
INSERT INTO logs.tb_logs VALUES (1811, 2, 1, 'Ubah Pengguna', '{"id": "27", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "LHhQGbRvWDLn5RnT8DqpDn7topFyzrN2eQoL9f0d", "is_opd": "0", "password": "12345678", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "12345678"}', '2023-10-23 11:21:43', '2023-10-23 11:21:43');
INSERT INTO logs.tb_logs VALUES (1812, 2, 1, 'Ubah Pengguna', '{"id": "27", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "LHhQGbRvWDLn5RnT8DqpDn7topFyzrN2eQoL9f0d", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "jokomardoyo"}', '2023-10-23 11:22:19', '2023-10-23 11:22:19');
INSERT INTO logs.tb_logs VALUES (1813, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "8d674818-184a-4e31-860a-4d370933b64f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-23 11:56:59', '2023-10-23 11:56:59');
INSERT INTO logs.tb_logs VALUES (1814, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "3W6jeCHfYHEKOPKPykuW9iCkWJASvaG4Sl5wfTOy", "captcha": "97084", "password": "adminaja", "username": "admin"}', '2023-10-23 16:30:57', '2023-10-23 16:30:57');
INSERT INTO logs.tb_logs VALUES (1815, 14, 1, 'Login Sukses', '{"ip": "114.10.10.123", "_token": "eMbqTgDvoYIN5PbYwmCrsAAhbgoOP1DEv95Ed7Uj", "captcha": "86420", "password": "qwerty123", "username": "123456"}', '2023-10-24 08:37:07', '2023-10-24 08:37:07');
INSERT INTO logs.tb_logs VALUES (1816, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "rbcw9v2jvTh63Acf0wmiUMVvo1nKLsqYJFp0XGfJ", "captcha": "81546", "password": "adminaja", "username": "admin"}', '2023-10-24 08:39:14', '2023-10-24 08:39:14');
INSERT INTO logs.tb_logs VALUES (1817, 2, 1, 'Ubah Pengguna', '{"id": "27", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "zVyOw2togY9x3YVCl9PsX7xUTZs5usKYU7QVGcNP", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "jokomardoyo"}', '2023-10-24 08:39:44', '2023-10-24 08:39:44');
INSERT INTO logs.tb_logs VALUES (1818, 14, 1, 'Logout', '{"ip": "114.10.10.123", "_token": "cP6J3egl0xLYgC1JfBahsPHPJBacxmYQRrAfbpBW"}', '2023-10-24 08:44:55', '2023-10-24 08:44:55');
INSERT INTO logs.tb_logs VALUES (1819, 14, 1, 'Upload File', '{"ip": "114.10.10.123", "uuid": "2418aca9-5fcd-449b-962c-8234d6b44412", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 08:55:15', '2023-10-24 08:55:15');
INSERT INTO logs.tb_logs VALUES (1820, 14, 1, 'Upload File', '{"ip": "114.10.10.123", "uuid": "ecf996c6-544a-4ab4-af8a-fa97a0c9521d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 09:02:07', '2023-10-24 09:02:07');
INSERT INTO logs.tb_logs VALUES (1821, 23, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "f8e0809c-6181-4be8-bcab-9b06b25b33d8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 10:24:43', '2023-10-24 10:24:43');
INSERT INTO logs.tb_logs VALUES (1822, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "8067033c-71d8-478f-8eaf-b0ba552e8568", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 11:20:55', '2023-10-24 11:20:55');
INSERT INTO logs.tb_logs VALUES (1823, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "N0vdGf9a5qwfJRrSTtL40Da2dXnISwybNLq0Z8az", "captcha": "30541", "password": "adminaja", "username": "admin"}', '2023-10-24 11:25:44', '2023-10-24 11:25:44');
INSERT INTO logs.tb_logs VALUES (1824, 2, 1, 'Ubah Pengguna', '{"id": "27", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "08uuNoNcuq8KFog11om2OThftpVc4EWUZLNetm0D", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "09:30", "waktu_keluar": "10:00", "password_confirmation": "jokomardoyo"}', '2023-10-24 11:26:11', '2023-10-24 11:26:11');
INSERT INTO logs.tb_logs VALUES (1825, 27, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "0bb40ad2-965c-4077-83eb-623c7eda8bf7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 12:23:18', '2023-10-24 12:23:18');
INSERT INTO logs.tb_logs VALUES (1826, 27, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "22a8893e-b1bf-42f0-b2f3-ea41ef794a2c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 12:23:42', '2023-10-24 12:23:42');
INSERT INTO logs.tb_logs VALUES (1827, 27, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "25bbdff2-9354-4f34-8351-10dcb901497d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 14:58:39', '2023-10-24 14:58:39');
INSERT INTO logs.tb_logs VALUES (1828, 27, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "7795c7e6-f9c7-4344-b80b-8452a60a5db0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 14:58:55', '2023-10-24 14:58:55');
INSERT INTO logs.tb_logs VALUES (1829, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "10ST3TDTgzzgEVhzHqr63adZcv6ZEVUIvx8c6zXl", "captcha": "73894", "password": "adminaja", "username": "admin"}', '2023-10-24 14:59:47', '2023-10-24 14:59:47');
INSERT INTO logs.tb_logs VALUES (1830, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 27, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "koordinat": "[\"1\", \"2\"]", "created_at": "2023-10-23T03:37:19.000000Z", "deleted_at": null, "updated_at": "2023-10-24T04:26:11.000000Z", "waktu_masuk": "09:30:00", "waktu_keluar": "10:00:00", "email_verified_at": null}, "request": {"id": "eyJpdiI6IlNwcVp0WTRlTFZjOWljSFFmWXhrckE9PSIsInZhbHVlIjoiUkZvRnFEQk96ZmZnZjA4QU5KRis0Zz09IiwibWFjIjoiOGUxMWE0MTMyZDllMDZlYjYzYWEwZTNkOTBhYTllNWEzZWI2ZGVlYmE4OGI5NTkwNjIxNDVmMDA3OTk5MTc1ZCIsInRhZyI6IiJ9"}}', '2023-10-24 14:59:58', '2023-10-24 14:59:58');
INSERT INTO logs.tb_logs VALUES (1831, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "jokomardoyo46@gmail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "jokomardoyo"}', '2023-10-24 15:00:39', '2023-10-24 15:00:39');
INSERT INTO logs.tb_logs VALUES (1832, 28, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "c140c620-ca6f-4723-a3b7-c8f42f3453c0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:01:06', '2023-10-24 15:01:06');
INSERT INTO logs.tb_logs VALUES (1833, 28, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "00ce2d2d-7c90-47f4-bddd-de1abe590b74", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:02:07', '2023-10-24 15:02:07');
INSERT INTO logs.tb_logs VALUES (1834, 28, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "964bed60-d123-4694-af59-f3a93e370265", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:02:28', '2023-10-24 15:02:28');
INSERT INTO logs.tb_logs VALUES (1835, 14, 1, 'Upload File', '{"ip": "114.79.32.65", "uuid": "411b71db-d6e1-4b0a-b651-f914b74b710e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:03:16', '2023-10-24 15:03:16');
INSERT INTO logs.tb_logs VALUES (1836, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Jack Harlow", "akses": "8", "email": "alexanderfraya33@gmail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": "jackharlow", "username": "coba", "koordinat": ["1", "2"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "jackharlow"}', '2023-10-24 15:06:06', '2023-10-24 15:06:06');
INSERT INTO logs.tb_logs VALUES (1837, 29, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "5b4ea489-e599-48e1-920a-7caec8e61a3b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:06:49', '2023-10-24 15:06:49');
INSERT INTO logs.tb_logs VALUES (1838, 29, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "a48d6942-999e-4d65-8e4f-1822e68c5e8b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:07:06', '2023-10-24 15:07:06');
INSERT INTO logs.tb_logs VALUES (1839, 29, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "338d9e1a-2fa3-4bbd-8026-64f426456755", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:08:07', '2023-10-24 15:08:07');
INSERT INTO logs.tb_logs VALUES (1840, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 29, "foto": null, "name": "Jack Harlow", "email": "alexanderfraya33@gmail.com", "kodeskpd": null, "username": "coba", "kodeakses": 8, "koordinat": "[\"1\", \"2\"]", "created_at": "2023-10-24T08:06:06.000000Z", "deleted_at": null, "updated_at": "2023-10-24T08:06:06.000000Z", "waktu_masuk": "08:00:00", "waktu_keluar": "17:00:00", "email_verified_at": null}, "request": {"id": "eyJpdiI6IjYwVDBzY3hhTTBkYWE5UHdCbVNXNUE9PSIsInZhbHVlIjoieFpJUERWUFRxMEF0dFVpZVl5S2Q5dz09IiwibWFjIjoiMzBlZWI0OTdkNDQzMmQ4ZTNiOWYyNjdiZGJkNGE3YWVlYTViMDM1ZWI2OTRjNDQ3YTljNDA5NmJhZmNhNTNkZCIsInRhZyI6IiJ9"}}', '2023-10-24 15:08:24', '2023-10-24 15:08:24');
INSERT INTO logs.tb_logs VALUES (1841, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Jack Harlow", "akses": "8", "email": "alexanderfraya33@gmail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": "jackharlow", "username": "coba", "koordinat": ["1", "2"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "jackharlow"}', '2023-10-24 15:09:14', '2023-10-24 15:09:14');
INSERT INTO logs.tb_logs VALUES (1842, 30, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "e4dc12e4-9710-45ef-8367-09b926403f4c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:09:58', '2023-10-24 15:09:58');
INSERT INTO logs.tb_logs VALUES (1843, 30, 1, 'Upload File', '{"ip": "182.4.101.247", "uuid": "26a9c449-2668-4d9c-b2d2-70068f060463", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 15:10:17', '2023-10-24 15:10:17');
INSERT INTO logs.tb_logs VALUES (1844, 28, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "a393df3b-930b-4e8a-a270-4d091bc67f52", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:33:24', '2023-10-24 16:33:24');
INSERT INTO logs.tb_logs VALUES (1845, 2, 1, 'Hapus Pengguna', '{"ip": "103.162.60.2", "old": {"id": 28, "foto": null, "name": "Joko Mardoyo", "email": "jokomardoyo46@gmail.com", "kodeskpd": null, "username": "tes", "kodeakses": 8, "koordinat": "[\"1\", \"2\"]", "created_at": "2023-10-24T08:00:39.000000Z", "deleted_at": null, "updated_at": "2023-10-24T08:00:39.000000Z", "waktu_masuk": "08:00:00", "waktu_keluar": "17:00:00", "email_verified_at": null}, "request": {"id": "eyJpdiI6IkNJTWplSHduZkxvTlpvKzJ5YU9ZS0E9PSIsInZhbHVlIjoiK1BFaHhOTGMvNk5qUmFlOUZFUjlwdz09IiwibWFjIjoiZmRiZDZjMDhiNTcyYzQzODk0Yjk0MmYwOWRlOTkwMDIyMjg3YTkwOWM4NmMyYjBiOGIxMmMwZmNhMzIzZDFlMiIsInRhZyI6IiJ9"}}', '2023-10-24 16:33:45', '2023-10-24 16:33:45');
INSERT INTO logs.tb_logs VALUES (1846, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "tes@mail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": "jokomardoyo", "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "jokomardoyo"}', '2023-10-24 16:34:39', '2023-10-24 16:34:39');
INSERT INTO logs.tb_logs VALUES (1847, 31, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "f0c59ff9-0338-47cd-a663-36018ba105ec", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:35:14', '2023-10-24 16:35:14');
INSERT INTO logs.tb_logs VALUES (1848, 31, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "48d9cce1-2d83-4ba4-9ffe-7a63af956dd0", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:35:42', '2023-10-24 16:35:42');
INSERT INTO logs.tb_logs VALUES (1849, 31, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b3507785-5e2d-40fc-b385-4b19c2af2453", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:36:00', '2023-10-24 16:36:00');
INSERT INTO logs.tb_logs VALUES (1850, 2, 1, 'Ubah Pengguna', '{"id": "31", "ip": "103.162.60.2", "name": "Joko Mardoyo", "akses": "8", "email": "tes@mail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": null, "username": "tes", "koordinat": ["1", "2"], "waktu_masuk": "16:00", "waktu_keluar": "17:00", "password_confirmation": null}', '2023-10-24 16:53:44', '2023-10-24 16:53:44');
INSERT INTO logs.tb_logs VALUES (1851, 31, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "a14fb6b7-136f-4672-971e-c81a141d764e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:54:26', '2023-10-24 16:54:26');
INSERT INTO logs.tb_logs VALUES (1852, 2, 1, 'Ubah Pengguna', '{"id": "30", "ip": "103.162.60.2", "name": "Jack Harlow", "akses": "8", "email": "alexanderfraya33@gmail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": null, "username": "coba", "koordinat": ["1", "2"], "waktu_masuk": "16:00", "waktu_keluar": "17:00", "password_confirmation": null}', '2023-10-24 16:56:05', '2023-10-24 16:56:05');
INSERT INTO logs.tb_logs VALUES (1853, 2, 1, 'Ubah Pengguna', '{"id": "30", "ip": "103.162.60.2", "name": "Jack Harlow", "akses": "8", "email": "alexanderfraya33@gmail.com", "_token": "EGZnw7FmRwn5x04fMX7y8Ek8TQbKErwIZjyVak23", "is_opd": "0", "password": null, "username": "coba", "koordinat": ["1", "2"], "waktu_masuk": "16:30", "waktu_keluar": "17:00", "password_confirmation": null}', '2023-10-24 16:56:58', '2023-10-24 16:56:58');
INSERT INTO logs.tb_logs VALUES (1854, 30, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "2be57bb0-183a-416f-8454-82633d1cd4a4", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 16:57:21', '2023-10-24 16:57:21');
INSERT INTO logs.tb_logs VALUES (1855, 14, 1, 'Upload File', '{"ip": "114.79.51.173", "uuid": "19da208c-3a96-4be1-acd6-4dd0387d4e7d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 17:17:27', '2023-10-24 17:17:27');
INSERT INTO logs.tb_logs VALUES (1856, 14, 1, 'Upload File', '{"ip": "114.79.51.173", "uuid": "08a4239c-cece-4bfe-b788-9371dd0b994a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 17:17:32', '2023-10-24 17:17:32');
INSERT INTO logs.tb_logs VALUES (1857, 14, 1, 'Upload File', '{"ip": "114.79.51.173", "uuid": "592fb488-f2b6-44d2-9373-31d898fdc243", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-24 17:35:58', '2023-10-24 17:35:58');
INSERT INTO logs.tb_logs VALUES (1858, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "3f0TKm1oe8BZpRYJxqIV2X1YOhG2Wsm4nbFTDQTf", "captcha": "80195", "password": "adminaja", "username": "admin"}', '2023-10-25 15:35:58', '2023-10-25 15:35:58');
INSERT INTO logs.tb_logs VALUES (1859, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "lY2gQ6p3EGyMBoaHzYxXvU2CAQTaaG58CqCSxYYX"}', '2023-10-25 15:36:26', '2023-10-25 15:36:26');
INSERT INTO logs.tb_logs VALUES (1860, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "zakhZSdEsKZpgKMBVstN0ULfR7R4IUGIWUTrZlFt", "captcha": "18340", "password": "adminaja", "username": "admin"}', '2023-10-25 15:37:11', '2023-10-25 15:37:11');
INSERT INTO logs.tb_logs VALUES (1861, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "TYrE71EeyInS78uOxqAreYeD5gPXLNtyxWUpiFBA", "captcha": "28517", "password": "adminaja", "username": "admin"}', '2023-10-26 08:23:54', '2023-10-26 08:23:54');
INSERT INTO logs.tb_logs VALUES (1862, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "RG8yJLsgZxBRjE4FF6HJdBaZU1o9ciagTZ4gtmyD"}', '2023-10-26 09:26:01', '2023-10-26 09:26:01');
INSERT INTO logs.tb_logs VALUES (1863, 31, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "XISYaAASM95vVKyD0zASztcGtuZ3s0dYsKuRymOq", "captcha": "86427", "password": "jokomardoyo", "username": "tes"}', '2023-10-26 09:43:48', '2023-10-26 09:43:48');
INSERT INTO logs.tb_logs VALUES (1864, 31, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "tlh1gUMuKhQhrfaiwS5RZkpjp5VujBtDnpJWcMDQ"}', '2023-10-26 09:44:02', '2023-10-26 09:44:02');
INSERT INTO logs.tb_logs VALUES (1865, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "cH2FzTag1iaOUkpwmuPLmRTRxK4cHZpKr7wC34Hf", "captcha": "35926", "password": "adminaja", "username": "admin"}', '2023-10-26 10:16:41', '2023-10-26 10:16:41');
INSERT INTO logs.tb_logs VALUES (1866, 14, 1, 'Upload File', '{"ip": "114.10.122.42", "uuid": "6fd51c27-82ad-474b-a70c-e64e78261004", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-26 13:39:54', '2023-10-26 13:39:54');
INSERT INTO logs.tb_logs VALUES (1867, 14, 1, 'Upload File', '{"ip": "114.10.122.42", "uuid": "bdb70c3a-a795-44a5-9fcb-be9a0438fc35", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-26 13:44:56', '2023-10-26 13:44:56');
INSERT INTO logs.tb_logs VALUES (1868, 14, 1, 'Upload File', '{"ip": "114.10.122.42", "uuid": "0ba8f569-e0a7-4641-9077-32f4ecee22ad", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-26 13:45:56', '2023-10-26 13:45:56');
INSERT INTO logs.tb_logs VALUES (1869, 31, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "ae3d585d-5f84-473f-88bf-e04f69ffd607", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-10-26 13:56:52', '2023-10-26 13:56:52');
INSERT INTO logs.tb_logs VALUES (1870, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "AJ7Fvkj61PvkOCnUJdtANYC4FUSeONoHIABOGrkC", "captcha": "29150", "password": "adminaja", "username": "admin"}', '2023-10-26 16:00:04', '2023-10-26 16:00:04');
INSERT INTO logs.tb_logs VALUES (1871, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "yhdXjZ3iMh0fcscr9AjB0IXwaqPJBLtj3Z5woB9K", "captcha": "17906", "password": "adminaja", "username": "admin"}', '2023-10-31 08:43:20', '2023-10-31 08:43:20');
INSERT INTO logs.tb_logs VALUES (1872, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "Rve3vUbFmCU6GfAWBp8BIM79ZEouyRJUAbsC8V2C", "captcha": "35846", "password": "adminaja", "username": "admin"}', '2023-10-31 11:56:29', '2023-10-31 11:56:29');
INSERT INTO logs.tb_logs VALUES (1873, 2, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "04bb824b-c4e5-4beb-9330-54c4079effc4", "request": {"image": {}}, "nama_file": "unnamed.png"}', '2023-10-31 13:33:44', '2023-10-31 13:33:44');
INSERT INTO logs.tb_logs VALUES (1874, 2, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "3e800993-c81a-4850-9e96-8d4cd5e28779", "request": {"image": {}}, "nama_file": "unnamed.png"}', '2023-10-31 13:34:35', '2023-10-31 13:34:35');
INSERT INTO logs.tb_logs VALUES (1875, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": "3e800993-c81a-4850-9e96-8d4cd5e28779", "warna": "#ffffff", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "waktu_lokal": "+7", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 13:34:44', '2023-10-31 13:34:44');
INSERT INTO logs.tb_logs VALUES (1876, 2, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "7bbe87cf-4273-4d71-8bb7-5288e33bc6b2", "request": {"image": {}}, "nama_file": "unnamed.png"}', '2023-10-31 13:39:21', '2023-10-31 13:39:21');
INSERT INTO logs.tb_logs VALUES (1877, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": "7bbe87cf-4273-4d71-8bb7-5288e33bc6b2", "warna": "#ffffff", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "waktu_lokal": "+7", "nama_aplikasi": "Aplikasi Presensi", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 13:39:24', '2023-10-31 13:39:24');
INSERT INTO logs.tb_logs VALUES (1878, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#ffffff", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 13:39:59', '2023-10-31 13:39:59');
INSERT INTO logs.tb_logs VALUES (1879, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "5XJMdogUuK5QoYxSr81UMHCT5idBNjOyKL38i7VH"}', '2023-10-31 13:41:12', '2023-10-31 13:41:12');
INSERT INTO logs.tb_logs VALUES (1880, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "HUgNfG5V2a8SNXsuI5TTHBKzWi6munGBRFqJKTCO", "captcha": "36508", "password": "qwerty123", "username": "123456"}', '2023-10-31 13:41:22', '2023-10-31 13:41:22');
INSERT INTO logs.tb_logs VALUES (1882, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "G4EAaHg0A6QmdHDq7ZOQnSL2WPjnPSYlUv7vkjwt", "captcha": "75040", "password": "adminaja", "username": "admin"}', '2023-10-31 13:41:53', '2023-10-31 13:41:53');
INSERT INTO logs.tb_logs VALUES (1883, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "6giV1LQqB8bDiWARdAUs3z1Q3jvS8aWwThfNpwWe", "captcha": "13056", "password": "adminaja", "username": "admin"}', '2023-10-31 13:49:52', '2023-10-31 13:49:52');
INSERT INTO logs.tb_logs VALUES (1884, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#00A9FF", "daerah": "Global Intermedia", "deskripsi": "Aplikasi untuk presensi", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 13:52:47', '2023-10-31 13:52:47');
INSERT INTO logs.tb_logs VALUES (1885, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#00A9FF", "daerah": "Kota Yogyakarta", "deskripsi": "Aplikasi untuk presensi", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 14:06:15', '2023-10-31 14:06:15');
INSERT INTO logs.tb_logs VALUES (1886, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#00A9FF", "daerah": "Kota Yogyakarta", "deskripsi": "Aplikasi untuk presensi di Kota Yogyakarta", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 14:09:04', '2023-10-31 14:09:04');
INSERT INTO logs.tb_logs VALUES (1887, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#BEADFA", "daerah": "Kota Yogyakarta", "deskripsi": "Aplikasi untuk presensi di Kota Yogyakarta", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 14:10:59', '2023-10-31 14:10:59');
INSERT INTO logs.tb_logs VALUES (1888, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#186F65", "daerah": "Kota Yogyakarta", "deskripsi": "Aplikasi untuk presensi di Kota Yogyakarta", "waktu_lokal": "+7", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 14:11:56', '2023-10-31 14:11:56');
INSERT INTO logs.tb_logs VALUES (1889, 2, 1, 'Update Setting Aplikasi', '{"ip": "103.162.60.2", "logo": null, "warna": "#186F65", "daerah": "Kota Yogyakarta", "deskripsi": "Aplikasi untuk presensi di Kota Yogyakarta", "waktu_lokal": "+8", "nama_aplikasi": "Presensi App", "nama_singkat_aplikasi": "Presensi"}', '2023-10-31 14:14:03', '2023-10-31 14:14:03');
INSERT INTO logs.tb_logs VALUES (1890, 2, 1, 'Tambah Koordinat', '{"ip": "103.162.60.2", "urai": "Global Intermedia Nusantara 3", "_token": "0VOc5WUfReMRIbzOWGDpQhpyg7cKDg2XESko1eWz", "koordinat": "-7.807646032917421, 110.36532056912013"}', '2023-10-31 14:17:08', '2023-10-31 14:17:08');
INSERT INTO logs.tb_logs VALUES (1891, 2, 1, 'Login Sukses', '{"ip": "114.10.23.170", "_token": "ZGnBVk1mCEs5Nm9KD2TNT4I0HfqeLw2V7IN7eHSI", "captcha": "40573", "password": "adminaja", "username": "admin"}', '2023-10-31 20:42:19', '2023-10-31 20:42:19');
INSERT INTO logs.tb_logs VALUES (1892, 31, 1, 'Upload File', '{"ip": "182.4.101.112", "uuid": "051df262-19b1-4a30-a7d3-a0f29c040ea8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-01 16:23:25', '2023-11-01 16:23:25');
INSERT INTO logs.tb_logs VALUES (1893, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "3d2785f1-ffa0-4729-b87b-d5a96c492cfd", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-02 09:48:02', '2023-11-02 09:48:02');
INSERT INTO logs.tb_logs VALUES (1894, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "PL1FTcb8eG1Ovfdn72TBa3cAXgwipmlE1SBD973K", "captcha": "37164", "password": "adminaja", "username": "admin"}', '2023-11-02 10:43:48', '2023-11-02 10:43:48');
INSERT INTO logs.tb_logs VALUES (1895, 2, 1, 'Tambah Koordinat', '{"ip": "103.162.60.2", "urai": "GIN", "_token": "bIFxNrgSvic8ikUbFn81qAHdLNVq0xjC6mE58bvu", "koordinat": "37.4223671142938, -122.08459057376557"}', '2023-11-02 10:44:36', '2023-11-02 10:44:36');
INSERT INTO logs.tb_logs VALUES (1896, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "0f20f2c3-ea53-4656-9562-539577d60d5e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-02 10:45:24', '2023-11-02 10:45:24');
INSERT INTO logs.tb_logs VALUES (1897, 20, 1, 'Upload File', '{"ip": "36.80.232.204", "uuid": "6b979d8e-4d51-4120-943d-e8f90d3d4d8d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-02 11:21:27', '2023-11-02 11:21:27');
INSERT INTO logs.tb_logs VALUES (1898, 2, 1, 'Login Sukses', '{"ip": "36.81.67.195", "_token": "Ic8pWdCBfYTvoRoLczvJt8bv7yqpea7YxxbqIsCX", "captcha": "75640", "password": "adminaja", "username": "admin"}', '2023-11-02 20:20:53', '2023-11-02 20:20:53');
INSERT INTO logs.tb_logs VALUES (1899, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b8e69bf1-ea95-42ec-8f78-7a16910b5944", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 12:56:57', '2023-11-06 12:56:57');
INSERT INTO logs.tb_logs VALUES (1900, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "5f2cca5d-14ad-4f10-87c5-0a1999ac4f86", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 12:57:41', '2023-11-06 12:57:41');
INSERT INTO logs.tb_logs VALUES (1901, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "e7bf2858-137f-497b-b7fd-08aaa0c4f197", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 12:58:53', '2023-11-06 12:58:53');
INSERT INTO logs.tb_logs VALUES (1902, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "5ce6e72d-b37d-4548-946d-c2da3be3c14d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 13:01:15', '2023-11-06 13:01:15');
INSERT INTO logs.tb_logs VALUES (1903, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "96aee439-2fd2-4bf6-bee3-0757e783ddd8", "request": {"image": {}}, "nama_file": "logo.png"}', '2023-11-06 13:24:41', '2023-11-06 13:24:41');
INSERT INTO logs.tb_logs VALUES (1904, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "2GBQKWNAeQnR41sCwV4l3yEWkccQUTbh3ZsT1dZd", "captcha": "10974", "password": "adminaja", "username": "admin"}', '2023-11-06 13:27:16', '2023-11-06 13:27:16');
INSERT INTO logs.tb_logs VALUES (1905, 2, 1, 'Ubah Pengguna', '{"id": "20", "ip": "103.162.60.2", "name": "p", "akses": "8", "email": "p@gmail.com", "_token": "SxhjX6hanLqod5s4Q644usIou3Wd5N2fefm6FUsD", "is_opd": "0", "password": null, "username": "ppp", "koordinat": ["1", "2", "3", "4"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": null}', '2023-11-06 13:27:37', '2023-11-06 13:27:37');
INSERT INTO logs.tb_logs VALUES (1906, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "7e2bf93e-53ae-4afa-b9fc-bd8b4225475c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:20:03', '2023-11-06 14:20:03');
INSERT INTO logs.tb_logs VALUES (1907, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "8f5613f0-80e3-4202-b185-1d14fc922699", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:21:41', '2023-11-06 14:21:41');
INSERT INTO logs.tb_logs VALUES (1908, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "15b3c2dc-60ce-4a3d-a08a-6eeb493329f3", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:31:13', '2023-11-06 14:31:13');
INSERT INTO logs.tb_logs VALUES (1909, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "0e8f5729-2d4c-4d6f-8d64-165300c0dea8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:31:37', '2023-11-06 14:31:37');
INSERT INTO logs.tb_logs VALUES (1910, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "4bfbbf76-5f82-472f-b122-75c8b3255a71", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:31:50', '2023-11-06 14:31:50');
INSERT INTO logs.tb_logs VALUES (1911, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "f72ee6b3-5fb0-4b27-8d5b-6ae4a836817b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:33:50', '2023-11-06 14:33:50');
INSERT INTO logs.tb_logs VALUES (1912, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "29386082-1ffe-46f7-bdcf-896e702787e2", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:36:00', '2023-11-06 14:36:00');
INSERT INTO logs.tb_logs VALUES (1913, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "b3d670aa-6481-4cdb-b655-4e73ed407c55", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:38:03', '2023-11-06 14:38:03');
INSERT INTO logs.tb_logs VALUES (1914, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d1ded3b6-4665-4a53-8050-775853478e65", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 14:43:52', '2023-11-06 14:43:52');
INSERT INTO logs.tb_logs VALUES (1915, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "354189ff-62e0-4f8a-9819-d59859de4fd1", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:16:14', '2023-11-06 15:16:14');
INSERT INTO logs.tb_logs VALUES (1916, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "a7502875-7662-40b8-b57a-e8df15271f8d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:16:37', '2023-11-06 15:16:37');
INSERT INTO logs.tb_logs VALUES (1917, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "6c37bcca-19c3-470d-bd29-c47e57e89b0d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:17:29', '2023-11-06 15:17:29');
INSERT INTO logs.tb_logs VALUES (1918, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "327f2e0e-b471-41aa-9b41-96c8877590ba", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:18:22', '2023-11-06 15:18:22');
INSERT INTO logs.tb_logs VALUES (1919, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "65c2eb2b-6d64-4593-ada3-bf40af317b0d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:21:41', '2023-11-06 15:21:41');
INSERT INTO logs.tb_logs VALUES (1920, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "c4050a72-76d8-42ae-af56-e80ef80637bc", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:22:07', '2023-11-06 15:22:07');
INSERT INTO logs.tb_logs VALUES (1921, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d98828b9-7c65-4759-8c65-edf79d177001", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:22:25', '2023-11-06 15:22:25');
INSERT INTO logs.tb_logs VALUES (1922, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "8d8e5396-6198-4616-a8b8-6902090848ef", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:23:53', '2023-11-06 15:23:53');
INSERT INTO logs.tb_logs VALUES (1923, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d4399b2c-ab5a-402d-ac1f-a47e40734850", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:24:15', '2023-11-06 15:24:15');
INSERT INTO logs.tb_logs VALUES (1924, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "c930d2ab-a646-4823-9266-ec267bb718a2", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:24:31', '2023-11-06 15:24:31');
INSERT INTO logs.tb_logs VALUES (1925, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "WFDyHhapTcBrWfqvyTSgYYtJ7izFeBMEv3EgFXn6", "captcha": "27019", "password": "adminaja", "username": "admin"}', '2023-11-06 15:34:04', '2023-11-06 15:34:04');
INSERT INTO logs.tb_logs VALUES (1926, 2, 1, 'Tambah Pengguna', '{"ip": "103.162.60.2", "name": "cekcek", "akses": "8", "email": "cek@gmail.com", "_token": "HJIqeyo1kxhIswTszBCqKbggupFGaza8YE4GMdvs", "is_opd": "0", "password": "12345678", "username": "cek", "koordinat": ["1", "2", "3", "4"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "12345678"}', '2023-11-06 15:35:15', '2023-11-06 15:35:15');
INSERT INTO logs.tb_logs VALUES (1927, 32, 1, 'Upload File', '{"ip": "103.162.60.1", "uuid": "0756faae-1532-4ba3-96dd-387be1beb5c4", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-06 15:39:07', '2023-11-06 15:39:07');
INSERT INTO logs.tb_logs VALUES (1928, 32, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "4da58e73-982e-4752-99d8-7bda91188749", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 09:19:42', '2023-11-07 09:19:42');
INSERT INTO logs.tb_logs VALUES (1929, 32, 1, 'Upload File', '{"ip": "103.162.60.1", "uuid": "410cdc80-2be7-4752-a76c-a49a324e22d6", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 10:23:50', '2023-11-07 10:23:50');
INSERT INTO logs.tb_logs VALUES (1930, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "311fef0a-925d-4c0e-8a43-24f3be318c66", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 11:13:40', '2023-11-07 11:13:40');
INSERT INTO logs.tb_logs VALUES (1931, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "d26aff01-945f-44b8-b4cf-bc56858d35e8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:52:13', '2023-11-07 12:52:13');
INSERT INTO logs.tb_logs VALUES (1932, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "735a54f5-c075-4a2d-9a4c-ef368ade9068", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:52:25', '2023-11-07 12:52:25');
INSERT INTO logs.tb_logs VALUES (1933, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "469b0d99-cabd-4b5a-b1ad-a2e5ba4b3782", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:53:18', '2023-11-07 12:53:18');
INSERT INTO logs.tb_logs VALUES (1934, 20, 1, 'Upload File', '{"ip": "103.162.60.0", "uuid": "710a419b-06e8-4249-a036-1000fbb54427", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:53:59', '2023-11-07 12:53:59');
INSERT INTO logs.tb_logs VALUES (1935, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "68a2231c-2f61-499a-8c7c-2ed9cb436e5c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:54:10', '2023-11-07 12:54:10');
INSERT INTO logs.tb_logs VALUES (1936, 20, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "af44fd47-b613-4303-a564-54ac7e7e26e7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:55:26', '2023-11-07 12:55:26');
INSERT INTO logs.tb_logs VALUES (1937, 19, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "1f115e5d-f57e-438d-897c-e987d498b3c1", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-07 12:56:58', '2023-11-07 12:56:58');
INSERT INTO logs.tb_logs VALUES (1938, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "4MY5iJ3LwM2YeQA2h3e6AQwLbGfVM98vfQB7715N", "captcha": "70091", "password": "adminaja", "username": "admin"}', '2023-11-07 13:15:01', '2023-11-07 13:15:01');
INSERT INTO logs.tb_logs VALUES (1939, 2, 1, 'Ubah Koordinat', '{"id": "3", "ip": "103.162.60.2", "urai": "GIN 3", "_token": "EqPRRdhieBQRR9uaBBv9b23E6Ynl3JWm8Alhr4hX", "koordinat": "-7.807646032917421, 110.36532056912013"}', '2023-11-07 13:15:33', '2023-11-07 13:15:33');
INSERT INTO logs.tb_logs VALUES (1940, 2, 1, 'Ubah Koordinat', '{"id": "2", "ip": "103.162.60.2", "urai": "GIB", "_token": "EqPRRdhieBQRR9uaBBv9b23E6Ynl3JWm8Alhr4hX", "koordinat": "-7.807583919255681, 110.37814080219567"}', '2023-11-07 13:15:51', '2023-11-07 13:15:51');
INSERT INTO logs.tb_logs VALUES (1941, 2, 1, 'Ubah Koordinat', '{"id": "1", "ip": "103.162.60.2", "urai": "GI1", "_token": "EqPRRdhieBQRR9uaBBv9b23E6Ynl3JWm8Alhr4hX", "koordinat": "-7.813108504188568, 110.37668919355862"}', '2023-11-07 13:16:03', '2023-11-07 13:16:03');
INSERT INTO logs.tb_logs VALUES (1942, 19, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "91234377-ab0e-447f-9cd0-e083da4bf268", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-08 13:10:04', '2023-11-08 13:10:04');
INSERT INTO logs.tb_logs VALUES (1943, 19, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "1e402edd-ba21-45fc-a85c-d657bf7ce8e7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 09:18:39', '2023-11-09 09:18:39');
INSERT INTO logs.tb_logs VALUES (1944, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "528ec2ca-6e1d-497b-b5e5-f22c9f6be08e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:02:56', '2023-11-09 10:02:56');
INSERT INTO logs.tb_logs VALUES (1945, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "eb8fea1e-ddcc-4c46-b5d5-562b00850d74", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:06:13', '2023-11-09 10:06:13');
INSERT INTO logs.tb_logs VALUES (1946, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "e2816fa1-5153-4aa4-94ad-f2ed5729ab44", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:06:28', '2023-11-09 10:06:28');
INSERT INTO logs.tb_logs VALUES (1947, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "95e3f758-256a-47a4-979d-776bf2f0349e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:06:53', '2023-11-09 10:06:53');
INSERT INTO logs.tb_logs VALUES (1948, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "d605c13a-de17-4250-b514-51d69aad1cc5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:07:24', '2023-11-09 10:07:24');
INSERT INTO logs.tb_logs VALUES (1949, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "fcca2476-14da-4030-9e29-ce800041173b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:08:08', '2023-11-09 10:08:08');
INSERT INTO logs.tb_logs VALUES (1950, 14, 1, 'Upload File', '{"ip": "114.10.23.129", "uuid": "1baa779b-2fa5-46eb-a1dc-d244b072413f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-09 10:48:32', '2023-11-09 10:48:32');
INSERT INTO logs.tb_logs VALUES (1951, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "b0495f1b-54f4-42c4-8712-039c49a20530", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:04:08', '2023-11-10 10:04:08');
INSERT INTO logs.tb_logs VALUES (1952, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "38d758ba-c6f3-42d3-9a00-5c3ce43c554a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:23:36', '2023-11-10 10:23:36');
INSERT INTO logs.tb_logs VALUES (1953, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "448744a3-086f-4501-9a43-aa7da0d73320", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:23:49', '2023-11-10 10:23:49');
INSERT INTO logs.tb_logs VALUES (1954, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "a4596899-76f5-49ee-bfdb-ec2ab46ee29f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:24:28', '2023-11-10 10:24:28');
INSERT INTO logs.tb_logs VALUES (1955, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "d072cc23-7c1f-4f5e-ae3c-b502ed58c4b3", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:31:24', '2023-11-10 10:31:24');
INSERT INTO logs.tb_logs VALUES (1956, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "948e2c12-c0bb-476e-a14a-70f57502c5fb", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:31:56', '2023-11-10 10:31:56');
INSERT INTO logs.tb_logs VALUES (1957, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "274f0936-bc55-4caf-beb9-2c7ac410615c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:33:49', '2023-11-10 10:33:49');
INSERT INTO logs.tb_logs VALUES (1958, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "6bf46413-0aeb-43a1-8b9e-a3147679e0d2", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:34:23', '2023-11-10 10:34:23');
INSERT INTO logs.tb_logs VALUES (1959, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "413c218a-a927-4f8c-9343-4919cf0c1691", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:39:06', '2023-11-10 10:39:06');
INSERT INTO logs.tb_logs VALUES (1960, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "2da7679d-c208-4a37-b967-53eecac38da5", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:41:23', '2023-11-10 10:41:23');
INSERT INTO logs.tb_logs VALUES (1961, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "a0033f0e-7fd1-46fe-8686-1cdaf4415bdf", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 10:42:06', '2023-11-10 10:42:06');
INSERT INTO logs.tb_logs VALUES (1962, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "406bc284-1bf7-4a0d-857d-de0b3750d869", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 12:51:42', '2023-11-10 12:51:42');
INSERT INTO logs.tb_logs VALUES (1963, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "2b13adf7-a050-4ac9-b7df-07afce119dac", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 12:53:34', '2023-11-10 12:53:34');
INSERT INTO logs.tb_logs VALUES (1964, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "7c49a807-c090-4b67-9f71-04ec5bf77f84", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 12:57:50', '2023-11-10 12:57:50');
INSERT INTO logs.tb_logs VALUES (1965, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "f21e1417-2f75-4661-bf99-dbe07c9ee989", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:01:10', '2023-11-10 13:01:10');
INSERT INTO logs.tb_logs VALUES (1966, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "3fa9907a-2f2d-45ef-b135-59d379d9dd59", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:01:47', '2023-11-10 13:01:47');
INSERT INTO logs.tb_logs VALUES (1967, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "0fe30177-70b5-4cd9-852a-06948bb97101", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:02:17', '2023-11-10 13:02:17');
INSERT INTO logs.tb_logs VALUES (1968, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "1c3f135e-28a6-4b5b-b4d1-34ba519cea8f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:05:37', '2023-11-10 13:05:37');
INSERT INTO logs.tb_logs VALUES (1969, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "6287ba65-fcf4-49aa-8395-0865432ae7ae", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:07:46', '2023-11-10 13:07:46');
INSERT INTO logs.tb_logs VALUES (1970, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "4fd7fdf9-61c4-4ed6-b4d2-bf57367d72d6", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:09:32', '2023-11-10 13:09:32');
INSERT INTO logs.tb_logs VALUES (1971, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "15f42b71-cd42-4761-ba36-8fdab074f692", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:09:59', '2023-11-10 13:09:59');
INSERT INTO logs.tb_logs VALUES (1972, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "a59b65b6-389f-42a6-a0fb-3044dd5926fd", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:10:32', '2023-11-10 13:10:32');
INSERT INTO logs.tb_logs VALUES (1973, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "fd2c9a70-7943-43af-817d-8690983226e9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:10:48', '2023-11-10 13:10:48');
INSERT INTO logs.tb_logs VALUES (1974, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "389f38ff-35d8-42d2-93fc-ec836ac46b9a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:11:26', '2023-11-10 13:11:26');
INSERT INTO logs.tb_logs VALUES (1975, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "95a8dd7b-9260-47c2-bb38-1a5eba8c0144", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:11:45', '2023-11-10 13:11:45');
INSERT INTO logs.tb_logs VALUES (1976, 14, 1, 'Upload File', '{"ip": "140.213.44.151", "uuid": "ae67495a-3bf6-4cc0-86e1-56b005e05e4e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 13:12:59', '2023-11-10 13:12:59');
INSERT INTO logs.tb_logs VALUES (1977, 14, 1, 'Upload File', '{"ip": "140.213.161.185", "uuid": "a1b62aaf-fb40-474d-a0ac-735ce96e8419", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 17:13:45', '2023-11-10 17:13:45');
INSERT INTO logs.tb_logs VALUES (1978, 14, 1, 'Upload File', '{"ip": "140.213.161.185", "uuid": "a3abb38c-7855-49ba-8d39-6d6eaec38b7e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-10 17:19:00', '2023-11-10 17:19:00');
INSERT INTO logs.tb_logs VALUES (1979, 14, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "4608f987-6ff8-40fc-9997-f829819bcbe1", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-13 20:44:22', '2023-11-13 20:44:22');
INSERT INTO logs.tb_logs VALUES (1980, 14, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "a2f27162-420f-4584-835a-e3db16c9d698", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-13 21:41:19', '2023-11-13 21:41:19');
INSERT INTO logs.tb_logs VALUES (1981, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "750876f5-0eeb-44d1-af11-651653296a50", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 09:29:25', '2023-11-14 09:29:25');
INSERT INTO logs.tb_logs VALUES (1982, 14, 1, 'Upload File', '{"ip": "114.10.7.203", "uuid": "21a64736-d3c4-4ae6-b514-0a13dc538a63", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 09:47:04', '2023-11-14 09:47:04');
INSERT INTO logs.tb_logs VALUES (1983, 14, 1, 'Upload File', '{"ip": "114.10.7.203", "uuid": "3908d44a-4de9-43f0-af0c-551e7aee397f", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 11:16:18', '2023-11-14 11:16:18');
INSERT INTO logs.tb_logs VALUES (1984, 14, 1, 'Upload File', '{"ip": "114.10.7.203", "uuid": "18cf93ce-20e3-44d9-bfbf-183e42d7b63d", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 11:22:32', '2023-11-14 11:22:32');
INSERT INTO logs.tb_logs VALUES (1985, 14, 1, 'Upload File', '{"ip": "114.10.7.203", "uuid": "741fb780-486b-4acd-bfe8-2741b97930f1", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 11:24:12', '2023-11-14 11:24:12');
INSERT INTO logs.tb_logs VALUES (1986, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "af26cbb9-85ee-45b4-b9ee-30315104c269", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:04:54', '2023-11-14 14:04:54');
INSERT INTO logs.tb_logs VALUES (1987, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "097c8c75-8fc2-40a6-bd02-4de49a843600", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:08:59', '2023-11-14 14:08:59');
INSERT INTO logs.tb_logs VALUES (1988, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "594013f7-9d90-4b9c-8605-8709dd7be36a", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:10:30', '2023-11-14 14:10:30');
INSERT INTO logs.tb_logs VALUES (1989, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "5d7a08b7-2730-4974-a5e7-93142bd01411", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:10:43', '2023-11-14 14:10:43');
INSERT INTO logs.tb_logs VALUES (1990, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "38950abf-4192-4ed5-bad8-13038c053fed", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:11:00', '2023-11-14 14:11:00');
INSERT INTO logs.tb_logs VALUES (1991, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "aad29e32-d40a-4bdd-8637-347960f50b11", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:11:12', '2023-11-14 14:11:12');
INSERT INTO logs.tb_logs VALUES (1992, 2, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "okzc5Y7UHoome8aVrBp6oS1MJmXMMCNU7zhaWPsB", "captcha": "10678", "password": "adminaja", "username": "admin"}', '2023-11-14 14:11:13', '2023-11-14 14:11:13');
INSERT INTO logs.tb_logs VALUES (1993, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "651e85a5-219b-4a02-8dcf-abd3fb3104b8", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:11:26', '2023-11-14 14:11:26');
INSERT INTO logs.tb_logs VALUES (1994, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "17cb86ef-dfbe-48c3-88a2-c630044bf143", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:11:38', '2023-11-14 14:11:38');
INSERT INTO logs.tb_logs VALUES (1995, 2, 1, 'Logout', '{"ip": "180.254.115.120", "_token": "enXRzMlWbkWivDdzeIGMSkuoC8aemArEfZZi0lRF"}', '2023-11-14 14:11:38', '2023-11-14 14:11:38');
INSERT INTO logs.tb_logs VALUES (1996, 23, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "LUwxezzh4lveL11sdgwVMXpJVuW3RQlB0iFvl07F", "captcha": "39017", "password": "qwerty123", "username": "fajar"}', '2023-11-14 14:11:52', '2023-11-14 14:11:52');
INSERT INTO logs.tb_logs VALUES (1997, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "3b9b8b90-9fad-4052-83e5-adb6cd514e89", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:13:14', '2023-11-14 14:13:14');
INSERT INTO logs.tb_logs VALUES (1998, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "f7f8a1d2-2a46-4426-8de3-c6f145e1331b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-14 14:13:38', '2023-11-14 14:13:38');
INSERT INTO logs.tb_logs VALUES (1999, 14, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "1bc6cdaf-0a8f-4141-8466-a1ea70ee69e4", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 08:27:30', '2023-11-15 08:27:30');
INSERT INTO logs.tb_logs VALUES (2000, 14, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "babf98d8-f62e-4f18-a10f-e2bf8cf2a639", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 09:27:14', '2023-11-15 09:27:14');
INSERT INTO logs.tb_logs VALUES (2001, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "c429c9b0-a00f-4ae3-a669-4b5852f103fe", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 09:32:07', '2023-11-15 09:32:07');
INSERT INTO logs.tb_logs VALUES (2002, 2, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "z99NNQdmG9ihmdYyfu1jSk4FCIhkoQ3FslL9gXgP", "captcha": "37864", "password": "adminaja", "username": "admin"}', '2023-11-15 09:48:06', '2023-11-15 09:48:06');
INSERT INTO logs.tb_logs VALUES (2003, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6Imk2YnRXYitnT1lJQVJMQnVPWk5uOFE9PSIsInZhbHVlIjoiaW9OVjIveUVMMi9nYjVyck55NDNmdz09IiwibWFjIjoiM2Q0MGQzMzcxOWNmMWVhYmRmN2MyYWEyMTdlYjJjNTFkMzYwOWY2MjVlNWNiOWQ2ZWE0OTEyM2IzNmMyYWI4OSIsInRhZyI6IiJ9", "ip": "180.254.115.120", "id_role": "eyJpdiI6IklFUlpqSUlMS2NVWGtEZnpyOEtQYUE9PSIsInZhbHVlIjoiNDhVa2JRa0ZDOHJpTFlWcUw1bkczQT09IiwibWFjIjoiNzdkMTg5YjQ5YTY4YWE4M2JmNWVlYWM1NTMzMTJkZDg4YzgxNjgzY2UwYWYxYjI1MWNiY2JjODBjMDI2ZWE0NyIsInRhZyI6IiJ9"}', '2023-11-15 09:48:17', '2023-11-15 09:48:17');
INSERT INTO logs.tb_logs VALUES (2004, 2, 1, 'Tambah Master Permission', '{"ip": "180.254.115.120", "urai": "kehadiran-harian-show", "_token": "tnQYvoFuWqoKj9q8AXYfKTXXe5sAWSvuVbZBtuKm", "parent": "0", "is_menu": "1", "keterangan": "Menu Kehadiran Harian"}', '2023-11-15 09:48:40', '2023-11-15 09:48:40');
INSERT INTO logs.tb_logs VALUES (2005, 2, 1, 'Tambah Master Permission', '{"ip": "180.254.115.120", "urai": "kehadiran-bulanan-show", "_token": "tnQYvoFuWqoKj9q8AXYfKTXXe5sAWSvuVbZBtuKm", "parent": "0", "is_menu": "1", "keterangan": "Menu Kehadiran Bulanan"}', '2023-11-15 09:48:53', '2023-11-15 09:48:53');
INSERT INTO logs.tb_logs VALUES (2006, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6IjJqQ1Z1UXN3NDk3aFFWWEphaU1STUE9PSIsInZhbHVlIjoiano4ZkxyVUhQTGN6OVNMZDRZYkRhdz09IiwibWFjIjoiNTlkN2IzYjYxMDE3MzA5NTQ0OWM0ODc0MDJiODIxNWJlNTUwMzU1NmVkYmM0NTM3ODk3YmUxYzY0YTRkNTdiOCIsInRhZyI6IiJ9", "ip": "180.254.115.120", "id_role": "eyJpdiI6IlFFaG1OVG9BbEhOZ1ZLNlFtY1g3RUE9PSIsInZhbHVlIjoiWlVjNFdlWGxhVWUxWUdTQ05oOGRidz09IiwibWFjIjoiYzczMjY3YjczNTk3MjFiNjMzN2ExYTljZmMzNmI3YzhhM2MyYTIwMjA5N2NkZDhmMzBmYjk1ODk4Y2I4YzEwNCIsInRhZyI6IiJ9"}', '2023-11-15 09:49:00', '2023-11-15 09:49:00');
INSERT INTO logs.tb_logs VALUES (2007, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6IkJVVFNoNnVmTEtlY3hBUXJmSUZidmc9PSIsInZhbHVlIjoiMkJFU3A2a3gyRk5POFV2UUNCVHJsZz09IiwibWFjIjoiOTRlYzU4OTdmMGE0NWE1OWY1NzIyYzhmMzVjZDkwNjMyYzVkMzIwNDZlYjFkNmQ3MzQxNWRjMzUxNWFmNjBlNyIsInRhZyI6IiJ9", "ip": "180.254.115.120", "id_role": "eyJpdiI6IlFFaG1OVG9BbEhOZ1ZLNlFtY1g3RUE9PSIsInZhbHVlIjoiWlVjNFdlWGxhVWUxWUdTQ05oOGRidz09IiwibWFjIjoiYzczMjY3YjczNTk3MjFiNjMzN2ExYTljZmMzNmI3YzhhM2MyYTIwMjA5N2NkZDhmMzBmYjk1ODk4Y2I4YzEwNCIsInRhZyI6IiJ9"}', '2023-11-15 09:49:01', '2023-11-15 09:49:01');
INSERT INTO logs.tb_logs VALUES (2008, 2, 1, 'Allow Permission', '{"id": "eyJpdiI6InVYUnNOZkluWFR5a2xraGhVQXNoYWc9PSIsInZhbHVlIjoiMVA1UXpZWjJPRG5OdkZmSnJnNmVidz09IiwibWFjIjoiZDZhNWY5YmEzMDQ5MmIxOWIzY2UxOWNlOTM5YzRhMGM3OWE1NWEwYWU4ZjhiN2E0N2U4Yjk2ZTFlNzM5ZTIyMCIsInRhZyI6IiJ9", "ip": "180.254.115.120", "id_role": "eyJpdiI6InhMM0VxOWFYWU9XTjl6TW1Da3lHOFE9PSIsInZhbHVlIjoiOG00VDZqT29vNjZERkRDUjdVbU9aUT09IiwibWFjIjoiNDIzOThjYjQzNWFjNmZmMTgwODVhMDRiMzNiZDkwNmYzOTE2NzE3MjY2NWFkZDNkNDIyYzllOTZkOWY5OGVhZCIsInRhZyI6IiJ9"}', '2023-11-15 09:49:07', '2023-11-15 09:49:07');
INSERT INTO logs.tb_logs VALUES (2009, 2, 1, 'Logout', '{"ip": "180.254.115.120", "_token": "tnQYvoFuWqoKj9q8AXYfKTXXe5sAWSvuVbZBtuKm"}', '2023-11-15 09:49:50', '2023-11-15 09:49:50');
INSERT INTO logs.tb_logs VALUES (2010, 23, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "SQ183BDlr7pAveVnNigTFpup34d1hDRy2E1CQ9SR", "captcha": "81254", "password": "qwerty123", "username": "fajar"}', '2023-11-15 09:49:57', '2023-11-15 09:49:57');
INSERT INTO logs.tb_logs VALUES (2011, 23, 1, 'Logout', '{"ip": "180.254.115.120", "_token": "wKfqw5CFbqcVJNUlHPEWfQksbSjc7i1GPcGX15FX"}', '2023-11-15 09:54:33', '2023-11-15 09:54:33');
INSERT INTO logs.tb_logs VALUES (2012, 2, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "UFP13gWIw0BLFRC08aiYrELQHd2d3yO27QwmCm2D", "captcha": "28473", "password": "adminaja", "username": "admin"}', '2023-11-15 09:54:39', '2023-11-15 09:54:39');
INSERT INTO logs.tb_logs VALUES (2013, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "71350e32-d39c-4855-bb9d-7f04b1ec8330", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 10:18:25', '2023-11-15 10:18:25');
INSERT INTO logs.tb_logs VALUES (2014, 2, 1, 'Login Sukses', '{"ip": "180.245.197.248", "_token": "nwpFgLmD3tAUSiKVeOwMMCjngkgqspmdbSABUejB", "captcha": "78512", "password": "adminaja", "username": "admin"}', '2023-11-15 10:33:13', '2023-11-15 10:33:13');
INSERT INTO logs.tb_logs VALUES (2015, 2, 1, 'Ubah Pengguna', '{"id": "32", "ip": "180.245.197.248", "name": "cekcek", "akses": "8", "email": "cek@gmail.com", "_token": "kbArIThVTXNxptd3JjChBbYCcYJTG4n3yBoUaHIx", "is_opd": "0", "password": "cek123456", "username": "cek", "koordinat": ["1", "2", "3", "4"], "waktu_masuk": "08:00", "waktu_keluar": "17:00", "password_confirmation": "cek123456"}', '2023-11-15 10:34:56', '2023-11-15 10:34:56');
INSERT INTO logs.tb_logs VALUES (2016, 32, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "7aa0d966-ae24-4b6a-aacc-dd8f07de8473", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 10:35:51', '2023-11-15 10:35:51');
INSERT INTO logs.tb_logs VALUES (2017, 32, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "942928a1-7052-4553-aea9-b9312bb9aaba", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 10:37:21', '2023-11-15 10:37:21');
INSERT INTO logs.tb_logs VALUES (2018, 2, 1, 'Tambah Pengguna', '{"ip": "180.245.197.248", "name": "udin123", "akses": "8", "email": "udin@mail.com", "_token": "kbArIThVTXNxptd3JjChBbYCcYJTG4n3yBoUaHIx", "is_opd": "0", "password": "udin123456", "username": "udin", "koordinat": ["4"], "waktu_masuk": "08:26", "waktu_keluar": "17:15", "password_confirmation": "udin123456"}', '2023-11-15 12:28:12', '2023-11-15 12:28:12');
INSERT INTO logs.tb_logs VALUES (2019, 2, 1, 'Tambah Pengguna', '{"ip": "180.245.197.248", "name": "ayoooo", "akses": "8", "email": "ayo@mail.com", "_token": "kbArIThVTXNxptd3JjChBbYCcYJTG4n3yBoUaHIx", "is_opd": "0", "password": "ayo123456", "username": "ayo", "koordinat": ["4"], "waktu_masuk": "08:55", "waktu_keluar": "17:55", "password_confirmation": "ayo123456"}', '2023-11-15 12:56:02', '2023-11-15 12:56:02');
INSERT INTO logs.tb_logs VALUES (2020, 34, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "9e668eee-9a2d-4edb-9bb9-5d4ca92ff38c", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 12:56:31', '2023-11-15 12:56:31');
INSERT INTO logs.tb_logs VALUES (2021, 34, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "22617006-a973-4fc6-8d5c-edf53fc0a6e9", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 13:10:51', '2023-11-15 13:10:51');
INSERT INTO logs.tb_logs VALUES (2022, 34, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "f21291fa-0652-427e-be43-7f0d2f54fc67", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 13:11:29', '2023-11-15 13:11:29');
INSERT INTO logs.tb_logs VALUES (2023, 34, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "66010428-960a-4ed3-9c88-f37dd08cf4cc", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 13:17:08', '2023-11-15 13:17:08');
INSERT INTO logs.tb_logs VALUES (2024, 2, 1, 'Tambah Pengguna', '{"ip": "180.245.197.248", "name": "oyynice", "akses": "8", "email": "yy@gmail.com", "_token": "kbArIThVTXNxptd3JjChBbYCcYJTG4n3yBoUaHIx", "is_opd": "0", "password": "12345678", "username": "nice", "koordinat": ["4"], "waktu_masuk": "08:17", "waktu_keluar": "18:17", "password_confirmation": "12345678"}', '2023-11-15 13:18:12', '2023-11-15 13:18:12');
INSERT INTO logs.tb_logs VALUES (2025, 35, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "6341c5a5-7a1a-44ec-b112-4f2455a1c60b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 13:19:14', '2023-11-15 13:19:14');
INSERT INTO logs.tb_logs VALUES (2026, 23, 1, 'Login Sukses', '{"ip": "103.162.60.86", "_token": "SbpGVl6HH9v2cSEGghSaHrJDF8SGK0GrszWyjq8A", "captcha": "67089", "password": "qwerty123", "username": "fajar"}', '2023-11-15 13:29:30', '2023-11-15 13:29:30');
INSERT INTO logs.tb_logs VALUES (2027, 23, 1, 'Logout', '{"ip": "103.162.60.86", "_token": "a00cGmEjlxYzYPdxp290tYeIt44ijLr7TXL9LwrS"}', '2023-11-15 13:35:29', '2023-11-15 13:35:29');
INSERT INTO logs.tb_logs VALUES (2028, 2, 1, 'Login Sukses', '{"ip": "103.162.60.86", "_token": "xJs97Adtrcq1qK4uYemj70yGghhzyIM5GuUEPy5S", "captcha": "67800", "password": "adminaja", "username": "admin"}', '2023-11-15 13:35:50', '2023-11-15 13:35:50');
INSERT INTO logs.tb_logs VALUES (2029, 35, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "1f9541df-dcfd-458c-859a-87a25b4e3f81", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-15 17:49:11', '2023-11-15 17:49:11');
INSERT INTO logs.tb_logs VALUES (2030, 14, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "e73f63e2-0480-48ec-96c5-6c6aa796f101", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 12:46:57', '2023-11-16 12:46:57');
INSERT INTO logs.tb_logs VALUES (2031, 14, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "5c3ab511-8bd9-4bdb-9559-c58f7f7d510b", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 12:53:56', '2023-11-16 12:53:56');
INSERT INTO logs.tb_logs VALUES (2032, 14, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "9ca1a062-ef18-4c8a-9d1d-70f85a9cbc96", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 12:55:02', '2023-11-16 12:55:02');
INSERT INTO logs.tb_logs VALUES (2033, 33, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "4408f37a-34dd-4df5-8d03-58791e21a780", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 13:12:28', '2023-11-16 13:12:28');
INSERT INTO logs.tb_logs VALUES (2034, 33, 1, 'Upload File', '{"ip": "112.78.156.235", "uuid": "02c5b850-9201-4be6-b6a3-e4326863d62e", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 13:13:24', '2023-11-16 13:13:24');
INSERT INTO logs.tb_logs VALUES (2035, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "b15bf3dd-df90-40e4-a3d5-f698426364b7", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 13:36:22', '2023-11-16 13:36:22');
INSERT INTO logs.tb_logs VALUES (2036, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "356b72a0-e7e6-4f2b-83a5-b6f939807a96", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 19:26:07', '2023-11-16 19:26:07');
INSERT INTO logs.tb_logs VALUES (2037, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "c2903317-9b0d-4735-8463-feb02874eb68", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-16 19:28:36', '2023-11-16 19:28:36');
INSERT INTO logs.tb_logs VALUES (2038, 2, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "YuixuDaKtNifEbKOMvN7vQAgBeRB2BOs0r6oRlkT", "captcha": "69100", "password": "adminaja", "username": "admin"}', '2023-11-16 19:47:04', '2023-11-16 19:47:04');
INSERT INTO logs.tb_logs VALUES (2039, 2, 1, 'Logout', '{"ip": "180.254.115.120", "_token": "s1toXrRw8xEKW902AP8nhSkBUEBkE215jfpqUJLH"}', '2023-11-16 19:47:35', '2023-11-16 19:47:35');
INSERT INTO logs.tb_logs VALUES (2040, 23, 1, 'Login Sukses', '{"ip": "180.254.115.120", "_token": "ZHNmfzqQN3DTj2OZBsH19WvJMaUx5jOH5uZeMRtC", "captcha": "65200", "password": "qwerty123", "username": "fajar"}', '2023-11-16 19:47:42', '2023-11-16 19:47:42');
INSERT INTO logs.tb_logs VALUES (2041, 20, 1, 'Upload File', '{"ip": "180.245.197.248", "uuid": "4fe07ccf-1372-4f72-87ca-612d27f64850", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-17 11:10:28', '2023-11-17 11:10:28');
INSERT INTO logs.tb_logs VALUES (2042, 14, 1, 'Upload File', '{"ip": "103.162.60.2", "uuid": "dfe55905-f0a5-4556-a4c6-8836fb3eafa4", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-22 10:57:47', '2023-11-22 10:57:47');
INSERT INTO logs.tb_logs VALUES (2043, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "sGRBf3FZaNA0YhJRWNkU7d9fpx2yAj2Tc1mFuG7M", "captcha": "96150", "password": "adminaja", "username": "admin"}', '2023-11-24 13:54:16', '2023-11-24 13:54:16');
INSERT INTO logs.tb_logs VALUES (2044, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "IaBmDC3BJ1wWLHlZOhPAOQPSGoOeWGH7EhgJPD6i"}', '2023-11-24 14:11:26', '2023-11-24 14:11:26');
INSERT INTO logs.tb_logs VALUES (2045, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "TcFrjoke5ZcV8QqrWTWcPibk6hfOwvtYeUb5IP9b", "captcha": "81026", "password": "qwerty123", "username": "123456"}', '2023-11-24 14:11:50', '2023-11-24 14:11:50');
INSERT INTO logs.tb_logs VALUES (2046, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "LjJAdSadetXyItdBPYmYwUlGtxACDbx9zzZllNxj", "captcha": "69501", "password": "adminaja", "username": "admin"}', '2023-11-24 14:13:15', '2023-11-24 14:13:15');
INSERT INTO logs.tb_logs VALUES (2047, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "LEVWYIUUn7jFZsL7QlCw2v9VzYfGNkbuAF9NS2eh"}', '2023-11-24 14:13:49', '2023-11-24 14:13:49');
INSERT INTO logs.tb_logs VALUES (2048, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "vtvq0X9ztwtobos5Mtaeb9A3kiJQNpkj8HTgRrlU", "captcha": "13942", "password": "adminaja", "username": "admin"}', '2023-11-24 14:15:19', '2023-11-24 14:15:19');
INSERT INTO logs.tb_logs VALUES (2049, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "eMO0yVAEscEsL4EDqh7wsjRxWKVoG0EbKfZeYlfw"}', '2023-11-24 14:15:24', '2023-11-24 14:15:24');
INSERT INTO logs.tb_logs VALUES (2050, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "SYR1cvbTr2llrTxe1ngE74tDR0Zdi35c5unPrlf7", "captcha": "48016", "password": "qwerty123", "username": "123456"}', '2023-11-24 14:15:34', '2023-11-24 14:15:34');
INSERT INTO logs.tb_logs VALUES (2051, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "cQMhh5VaSjnEXyBEAHSGqg3lXq9nhpsb6YEIgjkd", "captcha": "16083", "password": "adminaja", "username": "admin"}', '2023-11-24 14:16:45', '2023-11-24 14:16:45');
INSERT INTO logs.tb_logs VALUES (2052, 2, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "mmQ1W5FYf9iNuQovSx3jDvcy7RYh4rucKj6hiPiW"}', '2023-11-24 15:53:05', '2023-11-24 15:53:05');
INSERT INTO logs.tb_logs VALUES (2053, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "5HA8qOl6iKm6uIhJdVa2Rzr8js31yMb9NkyDifQc", "captcha": "40956", "password": "qwerty123", "username": "123456"}', '2023-11-24 15:54:11', '2023-11-24 15:54:11');
INSERT INTO logs.tb_logs VALUES (2054, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "PjEHayRY5Aaj70lt8KbB0LBnlbyNQscNLa91Lnrg", "captcha": "78061", "password": "adminaja", "username": "admin"}', '2023-11-24 16:30:19', '2023-11-24 16:30:19');
INSERT INTO logs.tb_logs VALUES (2055, 2, 1, 'Login Sukses', '{"ip": "118.96.180.175", "_token": "8AtHoxMZGNTiqzmVzmkPz7qKr6j0H8Uui7liQu2K", "captcha": "49630", "password": "adminaja", "username": "admin"}', '2023-11-24 18:30:46', '2023-11-24 18:30:46');
INSERT INTO logs.tb_logs VALUES (2056, 14, 1, 'Login Sukses', '{"ip": "180.245.206.37", "_token": "y1Vy6bVR4pwA93HHjqtHTu8Chl7mDY7CtoGje7AF", "captcha": "69381", "password": "qwerty123", "username": "123456"}', '2023-11-24 23:19:22', '2023-11-24 23:19:22');
INSERT INTO logs.tb_logs VALUES (2057, 14, 1, 'Login Sukses', '{"ip": "180.245.206.37", "_token": "X8GWGfDVhS4r55Uv2qSibqnYT0b9eYteDyVPPy40", "captcha": "98012", "password": "qwerty123", "username": "123456"}', '2023-11-26 20:36:50', '2023-11-26 20:36:50');
INSERT INTO logs.tb_logs VALUES (2058, 14, 1, 'Logout', '{"ip": "180.245.206.37", "_token": "D7ArQRjYcKq1i1LPxW6rW4IAx44UTpPamaoNxO7J"}', '2023-11-26 21:33:26', '2023-11-26 21:33:26');
INSERT INTO logs.tb_logs VALUES (2059, 2, 1, 'Login Sukses', '{"ip": "180.245.206.37", "_token": "nfWoxR0cnRDZgA8f6wDioYE2YynpvygrR2563fEF", "captcha": "90253", "password": "adminaja", "username": "admin"}', '2023-11-26 21:33:45', '2023-11-26 21:33:45');
INSERT INTO logs.tb_logs VALUES (2060, 2, 1, 'Logout', '{"ip": "180.245.206.37", "_token": "MNePAsVSFSCaA7w4mt1HDUW1MkLFMbAur3GiaL0f"}', '2023-11-26 23:00:42', '2023-11-26 23:00:42');
INSERT INTO logs.tb_logs VALUES (2061, 14, 1, 'Login Sukses', '{"ip": "180.245.206.37", "_token": "cdwo7qdY7Lgj55ykw4aMcsCb6tgcfHdWDC4pgRrX", "captcha": "75024", "password": "qwerty123", "username": "123456"}', '2023-11-26 23:01:00', '2023-11-26 23:01:00');
INSERT INTO logs.tb_logs VALUES (2062, 14, 1, 'Login Sukses', '{"ip": "182.4.101.191", "_token": "8RdqZwTlJz46zaC72aaghJ90hle3jbyrIVVafALI", "captcha": "73492", "password": "qwerty123", "username": "123456"}', '2023-11-27 09:20:16', '2023-11-27 09:20:16');
INSERT INTO logs.tb_logs VALUES (2063, 14, 1, 'Upload File', '{"ip": "103.19.180.1", "uuid": "e7773fd1-e568-4da1-92d4-af049fc43adc", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-11-27 18:49:20', '2023-11-27 18:49:20');
INSERT INTO logs.tb_logs VALUES (2064, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "d0NRWg71eYblxTPbUb7fjWd9KGYtgchJNfF99uHk", "captcha": "51982", "password": "qwerty123", "username": "123456"}', '2023-11-28 10:36:31', '2023-11-28 10:36:31');
INSERT INTO logs.tb_logs VALUES (2065, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "zyafbbgijNDKytCJ45u3OcWElfbr2MjBRs6bDk88", "captcha": "16042", "password": "qwerty123", "username": "123456"}', '2023-11-28 14:01:12', '2023-11-28 14:01:12');
INSERT INTO logs.tb_logs VALUES (2066, 14, 1, 'Logout', '{"ip": "103.162.60.2", "_token": "d0CM0euPwCF4AsSvd4b5eu029Z9gR6HdL1iNsB9x"}', '2023-11-28 16:02:26', '2023-11-28 16:02:26');
INSERT INTO logs.tb_logs VALUES (2067, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "MOkvacZxYgTWj1UQb78O4CNUicUu872omZXuPE1s", "captcha": "20156", "password": "adminaja", "username": "admin"}', '2023-11-28 16:02:34', '2023-11-28 16:02:34');
INSERT INTO logs.tb_logs VALUES (2068, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "VTANhE53GdIYca7CipAcbwj6s863vnxEkMfcUsgD", "captcha": "34210", "password": "adminaja", "username": "admin"}', '2023-11-29 13:18:52', '2023-11-29 13:18:52');
INSERT INTO logs.tb_logs VALUES (2069, 14, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "xN61mooJEnhpWz1Lc43oVsPqYhNED62QcvalTlYH", "captcha": "46270", "password": "qwerty123", "username": "123456"}', '2023-11-30 14:54:13', '2023-11-30 14:54:13');
INSERT INTO logs.tb_logs VALUES (2070, 2, 1, 'Login Sukses', '{"ip": "182.4.103.100", "_token": "xIcc5LCPkx6SSarjGN2XxhpuumNGFQEQpzNvmhRn", "captcha": "42871", "password": "adminaja", "username": "admin"}', '2023-12-01 15:32:58', '2023-12-01 15:32:58');
INSERT INTO logs.tb_logs VALUES (2071, 14, 1, 'Login Sukses', '{"ip": "180.242.102.186", "_token": "WyaaCNv981G6ZoP6MbjpfS0UYt5a1LK6zy7CxC7O", "captcha": "73080", "password": "qwerty123", "username": "123456"}', '2023-12-01 20:46:44', '2023-12-01 20:46:44');
INSERT INTO logs.tb_logs VALUES (2072, 14, 1, 'Logout', '{"ip": "180.242.102.186", "_token": "uinTlNukNxc1tDnlc6d72hw5mw37l1Bfc22Keake"}', '2023-12-01 22:31:22', '2023-12-01 22:31:22');
INSERT INTO logs.tb_logs VALUES (2073, 2, 1, 'Login Sukses', '{"ip": "180.242.102.186", "_token": "DTZcOX54WLlKCUeHoMP5FmTz9usxwz8gsi55hYwq", "captcha": "61324", "password": "adminaja", "username": "admin"}', '2023-12-01 22:31:47', '2023-12-01 22:31:47');
INSERT INTO logs.tb_logs VALUES (2074, 2, 1, 'Login Sukses', '{"ip": "103.162.60.2", "_token": "YNQofFaEx5oi8OcaBsGyGaxLWPFKaNp7FKcWRKt7", "captcha": "60087", "password": "adminaja", "username": "admin"}', '2023-12-06 09:51:00', '2023-12-06 09:51:00');
INSERT INTO logs.tb_logs VALUES (2075, 2, 1, 'Login Sukses', '{"ip": "180.242.102.186", "_token": "5hW1iXs6fyxtYNehGTsDXbm9MBmCY3hZOhaZ4VGJ", "captcha": "20571", "password": "adminaja", "username": "admin"}', '2023-12-06 19:15:57', '2023-12-06 19:15:57');
INSERT INTO logs.tb_logs VALUES (2076, 14, 1, 'Upload File', '{"ip": "125.163.242.189", "uuid": "66092186-8a36-46a7-83c6-847345b6fabb", "request": {"image": {}}, "nama_file": "WhatsApp Image 2023-12-06 at 13.19.57.jpeg"}', '2023-12-15 21:10:25', '2023-12-15 21:10:25');
INSERT INTO logs.tb_logs VALUES (2077, 14, 1, 'Upload File', '{"ip": "118.96.162.56", "uuid": "289f1eaa-1cde-4d87-98f4-7668a8692073", "request": {"image": {}}, "nama_file": "userProfile.jpg"}', '2023-12-29 15:55:05', '2023-12-29 15:55:05');


--
-- TOC entry 3076 (class 0 OID 16788)
-- Dependencies: 230
-- Data for Name: ms_koordinat; Type: TABLE DATA; Schema: master; Owner: postgres
--

INSERT INTO master.ms_koordinat VALUES (4, 'GIN', '37.4223671142938, -122.08459057376557', '2023-11-02 10:44:36', '2023-11-02 10:44:36', 2, NULL);
INSERT INTO master.ms_koordinat VALUES (3, 'GIN 3', '-7.807646032917421, 110.36532056912013', '2023-10-31 14:17:08', '2023-11-07 13:15:33', 2, 2);
INSERT INTO master.ms_koordinat VALUES (2, 'GIB', '-7.807583919255681, 110.37814080219567', '2023-10-20 17:35:53', '2023-11-07 13:15:51', 2, 2);
INSERT INTO master.ms_koordinat VALUES (1, 'GI1', '-7.813108504188568, 110.37668919355862', '2023-10-20 17:35:24', '2023-11-07 13:16:03', 2, 2);


--
-- TOC entry 3054 (class 0 OID 16397)
-- Dependencies: 208
-- Data for Name: ms_setting; Type: TABLE DATA; Schema: master; Owner: postgres
--

INSERT INTO master.ms_setting VALUES (1, 'Presensi App', 'Presensi', '7bbe87cf-4273-4d71-8bb7-5288e33bc6b2.png', 'Kota Yogyakarta', 'Aplikasi untuk presensi di Kota Yogyakarta', '#186F65', '-7.813111492789422, 110.37669583357997', '+8');


--
-- TOC entry 3056 (class 0 OID 16405)
-- Dependencies: 210
-- Data for Name: ps_master_permission; Type: TABLE DATA; Schema: permissions; Owner: postgres
--

INSERT INTO permissions.ps_master_permission VALUES (2, 'permission-master-show', 'Menu Master Permission', NULL, '2022-04-08 06:55:31', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (6, 'dashboard-show', 'Menu Dashboard', '2022-04-08 06:58:07', '2022-04-08 06:58:07', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (1, 'pengguna-show', 'Pengaturan Pengguna', NULL, '2022-04-08 08:37:02', 2, 2, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (12, 'setting-show', 'Menu Pengaturan Aplikasi', '2022-04-08 08:51:12', '2022-04-08 08:51:12', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (71, 'lokasi-detail-label', 'Save Pengaturan Label', '2022-09-14 07:16:43', '2022-09-14 07:16:43', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (57, 'logs-show', 'Menu Log Aplikasi', '2022-05-09 09:36:39', '2022-05-09 09:36:39', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (59, 'profile-show', 'Menu Profile', '2022-05-09 09:37:25', '2022-05-09 09:37:25', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (64, 'permission-master-tambah-sub', 'Tambah Sub Master Permission', '2022-05-11 14:39:02.565', NULL, 2, NULL, 0, 2);
INSERT INTO permissions.ps_master_permission VALUES (23, 'input-data-boleh-pilih-desa', 'Boleh pilih desa saat input data', '2022-04-11 07:03:26', '2022-04-11 07:03:26', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (72, 'lokasi-geometry-dokumen-visibilitas', 'Ganti visibilitas per geometry', '2022-09-14 07:17:01', '2022-09-14 07:17:01', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (73, 'lokasi-geometry-dokumen-download', 'Download dokumen per geometry', '2022-09-14 07:17:21', '2022-09-14 07:17:21', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (74, 'lokasi-geometry-simbol-legenda', 'Ubah pengaturan simbol legenda', '2022-09-14 17:19:08', '2022-09-14 17:19:08', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (75, 'lokasi-geometry-attribute', 'Ubah pengaturan attribute geometry', '2022-09-15 07:49:27', '2022-09-15 07:49:27', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (65, 'lokasi-geometry-visibilitas', 'Ganti Visibilitas per Geometry', '2022-09-08 10:01:21', '2022-09-08 10:01:21', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (66, 'lokasi-geometry-edit', 'Edit Attribute per Geometry', '2022-09-08 10:01:59', '2022-09-08 10:01:59', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (67, 'lokasi-geometry-dokumen-show', 'List Dokumen/Foto per Geometry', '2022-09-08 10:02:47', '2022-09-08 10:02:47', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (30, 'kategori-delete', 'Hapus Master Kategori', '2022-04-12 03:16:25', '2022-04-12 03:18:22', 2, 2, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (34, 'kategori-delete-status', 'Hapus Master Kategori Status', '2022-04-12 03:18:12', '2022-04-12 03:18:12', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (28, 'kategori-edit', 'Edit Master Kategori', '2022-04-12 03:15:19', '2022-04-12 03:15:19', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (33, 'kategori-edit-status', 'Edit Master Kategori Status', '2022-04-12 03:17:46', '2022-04-12 03:17:46', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (31, 'kategori-show-status', 'Master Kategori Status', '2022-04-12 03:17:13', '2022-04-12 03:17:13', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (29, 'kategori-tambah', 'Tambah Master Kategori', '2022-04-12 03:15:55', '2022-04-12 03:15:55', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (32, 'kategori-tambah-status', 'Tambah Master Kategori Status', '2022-04-12 03:17:33', '2022-04-12 03:17:33', 2, NULL, 0, 27);
INSERT INTO permissions.ps_master_permission VALUES (58, 'logs-show-all-user', 'Log Aplikasi Semua Aktifitas User (Admin)', '2022-05-09 09:37:12', '2022-05-09 09:37:12', 2, NULL, 0, 57);
INSERT INTO permissions.ps_master_permission VALUES (15, 'lokasi-delete', 'Hapus Input Data (admin)', '2022-04-11 06:48:33', '2022-04-11 06:48:33', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (18, 'lokasi-delete-file', 'Hapus File di Menu Edit Input Data (admin)', '2022-04-11 06:49:46', '2022-04-11 06:49:46', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (19, 'lokasi-detail', 'Detail Input Data (admin)', '2022-04-11 06:50:11', '2022-04-11 06:50:11', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (17, 'lokasi-edit', 'Edit Input Data (admin)', '2022-04-11 06:49:18', '2022-04-11 06:49:18', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (20, 'lokasi-ganti-status', 'Ganti Status Input Data (admin)', '2022-04-11 06:50:30', '2022-04-11 06:50:30', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (21, 'lokasi-list-icon', 'List Icon Input Data (admin)', '2022-04-11 06:50:53', '2022-04-11 06:51:36', 2, 2, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (16, 'lokasi-tambah', 'Tambah Input Data (admin)', '2022-04-11 06:49:03', '2022-04-11 06:49:03', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (22, 'lokasi-visibilitas', 'Ganti Visibilitas Input Data (admin)', '2022-04-11 06:51:19', '2022-04-11 06:51:19', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (42, 'master-dokumen-delete', 'Hapus Master Form Dokumen', '2022-04-12 03:39:50', '2022-04-12 03:39:50', 2, NULL, 0, 39);
INSERT INTO permissions.ps_master_permission VALUES (41, 'master-dokumen-edit', 'Edit Master Form Dokumen', '2022-04-12 03:39:34', '2022-04-12 03:39:34', 2, NULL, 0, 39);
INSERT INTO permissions.ps_master_permission VALUES (40, 'master-dokumen-tambah', 'Tambah Master Form Dokumen', '2022-04-12 03:39:10', '2022-04-12 03:39:10', 2, NULL, 0, 39);
INSERT INTO permissions.ps_master_permission VALUES (38, 'master-jenis-delete', 'Hapus Master Form Inputan', '2022-04-12 03:38:35', '2022-04-12 03:38:35', 2, NULL, 0, 35);
INSERT INTO permissions.ps_master_permission VALUES (37, 'master-jenis-edit', 'Edit Master Form Inputan', '2022-04-12 03:38:19', '2022-04-12 03:38:19', 2, NULL, 0, 35);
INSERT INTO permissions.ps_master_permission VALUES (36, 'master-jenis-tambah', 'Tambah Master Form Inputan', '2022-04-12 03:38:03', '2022-04-12 03:38:03', 2, NULL, 0, 35);
INSERT INTO permissions.ps_master_permission VALUES (24, 'pengguna-delete', 'Hapus Pengguna', '2022-04-11 07:14:49', '2022-04-11 07:15:12', 2, 2, 0, 1);
INSERT INTO permissions.ps_master_permission VALUES (26, 'pengguna-edit', 'Edit Pengguna', '2022-04-11 07:15:29', '2022-04-11 07:15:29', 2, NULL, 0, 1);
INSERT INTO permissions.ps_master_permission VALUES (25, 'pengguna-tambah', 'Tambah Pengguna', '2022-04-11 07:15:02', '2022-04-11 07:15:19', 2, 2, 0, 1);
INSERT INTO permissions.ps_master_permission VALUES (5, 'permission-master-delete', 'Hapus Master Permission', NULL, '2022-04-08 06:56:46', 2, NULL, 0, 2);
INSERT INTO permissions.ps_master_permission VALUES (4, 'permission-master-edit', 'Edit Master Permission', NULL, '2022-04-08 06:56:58', 2, NULL, 0, 2);
INSERT INTO permissions.ps_master_permission VALUES (3, 'permission-master-tambah', 'Tambah Master Permission', NULL, '2022-04-08 06:57:13', 2, NULL, 0, 2);
INSERT INTO permissions.ps_master_permission VALUES (60, 'profile-update', 'Update Profile', '2022-05-09 09:37:37', '2022-05-09 09:37:37', 2, NULL, 0, 59);
INSERT INTO permissions.ps_master_permission VALUES (13, 'setting-update', 'Update Pengaturan Aplikasi', '2022-04-08 08:51:56', '2022-04-08 08:53:00', 2, 2, 0, 12);
INSERT INTO permissions.ps_master_permission VALUES (68, 'lokasi-geometry-dokumen-tambah', 'Tambah Dokumen/Foto per Geometry', '2022-09-08 10:03:36', '2022-09-08 10:03:36', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (69, 'lokasi-geometry-dokumen-edit', 'Edit Dokumen/Foto per Geometry', '2022-09-08 10:04:40', '2022-09-08 10:04:40', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (70, 'lokasi-geometry-dokumen-delete', 'Hapus Dokumen/Foto per Geometry', '2022-09-08 10:05:22', '2022-09-08 10:05:22', 2, NULL, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (76, 'lokasi-geometry-tambah', 'Tambah geometry', '2022-10-06 09:10:26', '2022-10-06 09:11:03', 2, 2, 0, 14);
INSERT INTO permissions.ps_master_permission VALUES (8, 'permission-role-tambah', 'Tambah Role', '2022-04-08 07:06:03', '2022-04-08 07:06:03', 2, NULL, 0, 7);
INSERT INTO permissions.ps_master_permission VALUES (10, 'permission-role-delete', 'Hapus Role', '2022-04-08 07:06:24', '2022-04-08 07:06:24', 2, NULL, 0, 7);
INSERT INTO permissions.ps_master_permission VALUES (9, 'permission-role-edit', 'Edit Role', '2022-04-08 07:06:12', '2022-04-08 07:06:12', 2, NULL, 0, 7);
INSERT INTO permissions.ps_master_permission VALUES (7, 'permission-role-show', 'Menu Pengaturan Role', '2022-04-08 07:05:31', '2022-04-08 07:05:31', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (11, 'permission-role-toggle-permission', 'Allow / Deny permission role', '2022-04-08 08:29:34', '2022-04-08 08:29:34', 2, NULL, 0, 7);
INSERT INTO permissions.ps_master_permission VALUES (78, 'master-opd-tambah', 'Tambah Master OPD', '2022-11-11 11:24:39', '2022-11-11 11:24:39', 2, NULL, 0, 77);
INSERT INTO permissions.ps_master_permission VALUES (79, 'master-opd-edit', 'Edit Master OPD', '2022-11-11 11:24:51', '2022-11-11 11:24:51', 2, NULL, 0, 77);
INSERT INTO permissions.ps_master_permission VALUES (80, 'master-opd-delete', 'Hapus Master OPD', '2022-11-11 11:25:03', '2022-11-11 11:25:03', 2, NULL, 0, 77);
INSERT INTO permissions.ps_master_permission VALUES (83, 'regulasi-tambah', 'Tambah Regulasi', '2022-12-26 00:20:43', '2022-12-26 00:20:43', 2, NULL, 0, 82);
INSERT INTO permissions.ps_master_permission VALUES (84, 'regulasi-edit', 'Edit Regulasi', '2022-12-26 00:20:58', '2022-12-26 00:20:58', 2, NULL, 0, 82);
INSERT INTO permissions.ps_master_permission VALUES (85, 'regulasi-delete', 'Hapus Regulasi', '2022-12-26 00:21:17', '2022-12-26 00:21:17', 2, NULL, 0, 82);
INSERT INTO permissions.ps_master_permission VALUES (86, 'berita-tambah', 'Tambah Berita', '2022-12-26 00:21:42', '2022-12-26 00:21:42', 2, NULL, 0, 81);
INSERT INTO permissions.ps_master_permission VALUES (87, 'berita-edit', 'Edit Berita', '2022-12-26 00:21:53', '2022-12-26 00:21:53', 2, NULL, 0, 81);
INSERT INTO permissions.ps_master_permission VALUES (88, 'berita-delete', 'Delete Berita', '2022-12-26 00:22:03', '2022-12-26 00:22:03', 2, NULL, 0, 81);
INSERT INTO permissions.ps_master_permission VALUES (90, 'judul-tambah-show', 'tambah  aplikasi', '2023-08-01 07:43:52', '2023-08-01 07:43:52', 2, NULL, 0, 89);
INSERT INTO permissions.ps_master_permission VALUES (91, 'judul-ubah-show', 'ubah aplikasi', '2023-08-01 07:44:08', '2023-08-01 07:44:08', 2, NULL, 0, 89);
INSERT INTO permissions.ps_master_permission VALUES (92, 'judul-delete-show', 'delete aplikasi', '2023-08-01 07:44:27', '2023-08-01 07:44:27', 2, NULL, 0, 89);
INSERT INTO permissions.ps_master_permission VALUES (95, 'pengaduan-komentar', 'tambah komentar', '2023-08-01 07:47:09', '2023-08-01 07:47:09', 2, NULL, 0, 93);
INSERT INTO permissions.ps_master_permission VALUES (96, 'permission-khusus', 'Permission Khusus', '2023-10-20 17:33:59', '2023-10-20 17:33:59', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (97, 'is_admin', 'Administrator', '2023-10-20 17:34:06', '2023-10-20 17:34:13', 2, 2, 0, 96);
INSERT INTO permissions.ps_master_permission VALUES (98, 'is_user', 'User', '2023-10-20 17:34:20', '2023-10-20 17:34:20', 2, NULL, 0, 96);
INSERT INTO permissions.ps_master_permission VALUES (99, 'setting-koordinat-delete', 'hapus koordinat', '2023-10-20 17:34:38', '2023-10-20 17:34:38', 2, NULL, 0, 12);
INSERT INTO permissions.ps_master_permission VALUES (100, 'setting-koordinat-edit', 'edit koordinat', '2023-10-20 17:34:45', '2023-10-20 17:34:45', 2, NULL, 0, 12);
INSERT INTO permissions.ps_master_permission VALUES (101, 'setting-koordinat-tambah', 'tambah koordinat', '2023-10-20 17:34:52', '2023-10-20 17:34:52', 2, NULL, 0, 12);
INSERT INTO permissions.ps_master_permission VALUES (102, 'kehadiran-harian-show', 'Menu Kehadiran Harian', '2023-11-15 09:48:40', '2023-11-15 09:48:40', 2, NULL, 1, 0);
INSERT INTO permissions.ps_master_permission VALUES (103, 'kehadiran-bulanan-show', 'Menu Kehadiran Bulanan', '2023-11-15 09:48:53', '2023-11-15 09:48:53', 2, NULL, 1, 0);


--
-- TOC entry 3058 (class 0 OID 16415)
-- Dependencies: 212
-- Data for Name: ps_permission; Type: TABLE DATA; Schema: permissions; Owner: postgres
--

INSERT INTO permissions.ps_permission VALUES (3, 1, 4, '2022-04-08 14:10:46.346', NULL, 2, NULL);
INSERT INTO permissions.ps_permission VALUES (8, 1, 11, '2022-04-08 15:31:19.498', NULL, 2, NULL);
INSERT INTO permissions.ps_permission VALUES (12, 1, 8, '2022-04-08 08:32:02', '2022-04-08 08:32:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (13, 1, 1, '2022-04-08 08:37:14', '2022-04-08 08:37:14', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (14, 1, 12, '2022-04-08 08:51:28', '2022-04-08 08:51:28', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (15, 1, 13, '2022-04-08 08:52:14', '2022-04-08 08:52:14', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (17, 1, 5, '2022-04-08 09:00:50', '2022-04-08 09:00:50', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (18, 1, 14, '2022-04-11 06:51:52', '2022-04-11 06:51:52', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (19, 1, 16, '2022-04-11 06:52:10', '2022-04-11 06:52:10', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (20, 1, 22, '2022-04-11 06:52:13', '2022-04-11 06:52:13', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (21, 1, 21, '2022-04-11 06:52:16', '2022-04-11 06:52:16', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (22, 1, 20, '2022-04-11 06:52:18', '2022-04-11 06:52:18', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (23, 1, 17, '2022-04-11 06:52:21', '2022-04-11 06:52:21', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (24, 1, 19, '2022-04-11 06:52:24', '2022-04-11 06:52:24', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (25, 1, 18, '2022-04-11 06:52:28', '2022-04-11 06:52:28', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (26, 1, 15, '2022-04-11 06:52:30', '2022-04-11 06:52:30', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (27, 1, 25, '2022-04-11 07:15:59', '2022-04-11 07:15:59', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (28, 1, 26, '2022-04-11 07:16:02', '2022-04-11 07:16:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (29, 1, 24, '2022-04-11 07:16:05', '2022-04-11 07:16:05', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (31, 1, 30, '2022-04-12 03:18:59', '2022-04-12 03:18:59', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (32, 1, 34, '2022-04-12 03:19:02', '2022-04-12 03:19:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (33, 1, 28, '2022-04-12 03:19:06', '2022-04-12 03:19:06', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (34, 1, 33, '2022-04-12 03:19:09', '2022-04-12 03:19:09', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (35, 1, 27, '2022-04-12 03:19:13', '2022-04-12 03:19:13', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (36, 1, 31, '2022-04-12 03:19:16', '2022-04-12 03:19:16', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (37, 1, 29, '2022-04-12 03:19:19', '2022-04-12 03:19:19', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (38, 1, 32, '2022-04-12 03:19:22', '2022-04-12 03:19:22', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (39, 1, 35, '2022-04-12 03:41:01', '2022-04-12 03:41:01', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (40, 1, 39, '2022-04-12 03:41:05', '2022-04-12 03:41:05', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (41, 1, 36, '2022-04-12 03:41:08', '2022-04-12 03:41:08', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (42, 1, 37, '2022-04-12 03:41:15', '2022-04-12 03:41:15', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (43, 1, 38, '2022-04-12 03:41:18', '2022-04-12 03:41:18', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (44, 1, 40, '2022-04-12 03:41:23', '2022-04-12 03:41:23', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (45, 1, 41, '2022-04-12 03:41:26', '2022-04-12 03:41:26', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (46, 1, 42, '2022-04-12 03:41:29', '2022-04-12 03:41:29', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (47, 1, 43, '2022-04-12 04:05:24', '2022-04-12 04:05:24', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (48, 1, 45, '2022-04-12 04:05:29', '2022-04-12 04:05:29', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (49, 1, 44, '2022-04-12 04:05:32', '2022-04-12 04:05:32', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (50, 1, 46, '2022-04-12 04:05:35', '2022-04-12 04:05:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (51, 1, 23, '2022-04-12 04:19:50', '2022-04-12 04:19:50', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (52, 1, 48, '2022-04-12 06:48:59', '2022-04-12 06:48:59', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (53, 1, 47, '2022-04-12 06:49:02', '2022-04-12 06:49:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (54, 1, 49, '2022-04-12 07:51:36', '2022-04-12 07:51:36', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (55, 1, 50, '2022-04-12 07:51:39', '2022-04-12 07:51:39', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (4, 1, 6, '2022-04-12 08:51:19', '2022-04-12 08:51:19', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (59, 1, 51, '2022-04-18 03:42:00', '2022-04-18 03:42:00', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (60, 1, 52, '2022-04-18 03:42:03', '2022-04-18 03:42:03', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (61, 1, 53, '2022-04-18 03:42:06', '2022-04-18 03:42:06', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (62, 1, 54, '2022-04-18 03:42:09', '2022-04-18 03:42:09', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (63, 1, 55, '2022-04-18 03:42:16', '2022-04-18 03:42:16', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (68, 1, 7, '2022-04-18 06:18:56', '2022-04-18 06:18:56', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (70, 1, 57, '2022-05-09 09:38:35', '2022-05-09 09:38:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (71, 1, 58, '2022-05-09 09:38:51', '2022-05-09 09:38:51', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (72, 1, 59, '2022-05-09 09:39:00', '2022-05-09 09:39:00', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (73, 1, 60, '2022-05-09 09:39:02', '2022-05-09 09:39:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (84, 1, 70, '2022-09-09 09:48:33', '2022-09-09 09:48:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (85, 1, 69, '2022-09-09 09:48:35', '2022-09-09 09:48:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (86, 1, 67, '2022-09-09 09:48:39', '2022-09-09 09:48:39', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (87, 1, 68, '2022-09-09 09:48:43', '2022-09-09 09:48:43', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (88, 1, 66, '2022-09-09 09:48:46', '2022-09-09 09:48:46', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (89, 1, 65, '2022-09-09 09:48:49', '2022-09-09 09:48:49', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (90, 1, 10, '2022-09-12 08:36:10', '2022-09-12 08:36:10', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (91, 1, 71, '2022-09-14 10:10:07', '2022-09-14 10:10:07', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (92, 1, 73, '2022-09-14 10:10:10', '2022-09-14 10:10:10', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (93, 1, 72, '2022-09-14 10:10:13', '2022-09-14 10:10:13', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (94, 1, 74, '2022-09-14 17:20:47', '2022-09-14 17:20:47', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (95, 1, 75, '2022-09-15 16:23:33', '2022-09-15 16:23:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (96, 1, 76, '2022-10-06 10:11:33', '2022-10-06 10:11:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (97, 1, 9, '2022-10-18 03:20:30', '2022-10-18 03:20:30', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (99, 1, 2, '2022-11-11 11:23:06', '2022-11-11 11:23:06', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (100, 1, 3, '2022-11-11 11:23:09', '2022-11-11 11:23:09', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (101, 1, 64, '2022-11-11 11:23:11', '2022-11-11 11:23:11', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (102, 1, 78, '2022-11-11 11:25:34', '2022-11-11 11:25:34', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (103, 1, 79, '2022-11-11 11:25:37', '2022-11-11 11:25:37', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (104, 1, 80, '2022-11-11 11:25:40', '2022-11-11 11:25:40', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (105, 1, 77, '2022-11-11 11:25:42', '2022-11-11 11:25:42', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (106, 6, 6, '2022-11-11 11:26:18', '2022-11-11 11:26:18', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (107, 6, 57, '2022-11-11 11:26:23', '2022-11-11 11:26:23', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (108, 6, 60, '2022-11-11 11:26:40', '2022-11-11 11:26:40', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (109, 6, 59, '2022-11-11 11:26:42', '2022-11-11 11:26:42', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (110, 6, 16, '2022-11-11 11:27:33', '2022-11-11 11:27:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (111, 6, 21, '2022-11-11 11:27:38', '2022-11-11 11:27:38', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (112, 6, 65, '2022-11-11 11:27:47', '2022-11-11 11:27:47', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (113, 6, 76, '2022-11-11 11:27:49', '2022-11-11 11:27:49', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (114, 6, 74, '2022-11-11 11:27:53', '2022-11-11 11:27:53', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (115, 6, 66, '2022-11-11 11:27:56', '2022-11-11 11:27:56', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (116, 6, 72, '2022-11-11 11:28:00', '2022-11-11 11:28:00', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (117, 6, 67, '2022-11-11 11:28:03', '2022-11-11 11:28:03', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (118, 6, 69, '2022-11-11 11:28:06', '2022-11-11 11:28:06', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (119, 6, 68, '2022-11-11 11:28:08', '2022-11-11 11:28:08', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (120, 6, 73, '2022-11-11 11:28:11', '2022-11-11 11:28:11', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (121, 6, 70, '2022-11-11 11:28:15', '2022-11-11 11:28:15', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (122, 6, 75, '2022-11-11 11:28:17', '2022-11-11 11:28:17', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (123, 6, 17, '2022-11-11 11:28:24', '2022-11-11 11:28:24', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (124, 6, 71, '2022-11-11 11:28:28', '2022-11-11 11:28:28', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (125, 6, 19, '2022-11-11 11:28:31', '2022-11-11 11:28:31', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (126, 6, 18, '2022-11-11 11:28:33', '2022-11-11 11:28:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (127, 6, 15, '2022-11-11 11:28:35', '2022-11-11 11:28:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (128, 6, 23, '2022-11-11 11:28:37', '2022-11-11 11:28:37', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (129, 6, 14, '2022-11-11 11:28:39', '2022-11-11 11:28:39', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (130, 1, 81, '2022-12-26 00:22:19', '2022-12-26 00:22:19', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (131, 1, 88, '2022-12-26 00:22:22', '2022-12-26 00:22:22', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (132, 1, 87, '2022-12-26 00:22:25', '2022-12-26 00:22:25', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (133, 1, 86, '2022-12-26 00:22:27', '2022-12-26 00:22:27', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (134, 1, 82, '2022-12-26 00:22:33', '2022-12-26 00:22:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (135, 1, 85, '2022-12-26 00:22:35', '2022-12-26 00:22:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (136, 1, 84, '2022-12-26 00:22:37', '2022-12-26 00:22:37', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (137, 1, 83, '2022-12-26 00:22:39', '2022-12-26 00:22:39', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (138, 7, 81, '2022-12-26 06:49:33', '2022-12-26 06:49:33', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (139, 7, 88, '2022-12-26 06:49:37', '2022-12-26 06:49:37', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (140, 7, 87, '2022-12-26 06:49:40', '2022-12-26 06:49:40', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (141, 7, 86, '2022-12-26 06:49:44', '2022-12-26 06:49:44', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (142, 7, 6, '2022-12-26 06:49:48', '2022-12-26 06:49:48', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (143, 7, 59, '2022-12-26 06:52:31', '2022-12-26 06:52:31', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (144, 7, 60, '2022-12-26 06:52:35', '2022-12-26 06:52:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (145, 1, 89, '2023-08-01 07:44:39', '2023-08-01 07:44:39', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (146, 1, 92, '2023-08-01 07:44:46', '2023-08-01 07:44:46', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (147, 1, 90, '2023-08-01 07:44:52', '2023-08-01 07:44:52', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (148, 1, 91, '2023-08-01 07:44:56', '2023-08-01 07:44:56', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (150, 1, 93, '2023-08-01 07:46:35', '2023-08-01 07:46:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (151, 1, 95, '2023-08-01 07:47:25', '2023-08-01 07:47:25', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (152, 8, 60, '2023-10-03 06:26:29', '2023-10-03 06:26:29', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (153, 8, 59, '2023-10-03 06:26:32', '2023-10-03 06:26:32', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (154, 8, 6, '2023-10-03 06:26:35', '2023-10-03 06:26:35', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (155, 8, 57, '2023-10-03 06:26:37', '2023-10-03 06:26:37', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (156, 1, 97, '2023-10-20 17:34:59', '2023-10-20 17:34:59', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (157, 1, 99, '2023-10-20 17:35:01', '2023-10-20 17:35:01', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (158, 1, 100, '2023-10-20 17:35:02', '2023-10-20 17:35:02', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (159, 1, 101, '2023-10-20 17:35:03', '2023-10-20 17:35:03', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (160, 8, 98, '2023-11-15 09:48:17', '2023-11-15 09:48:17', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (161, 1, 102, '2023-11-15 09:49:00', '2023-11-15 09:49:00', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (162, 1, 103, '2023-11-15 09:49:01', '2023-11-15 09:49:01', 2, NULL);
INSERT INTO permissions.ps_permission VALUES (163, 8, 103, '2023-11-15 09:49:07', '2023-11-15 09:49:07', 2, NULL);


--
-- TOC entry 3060 (class 0 OID 16420)
-- Dependencies: 214
-- Data for Name: ps_role; Type: TABLE DATA; Schema: permissions; Owner: postgres
--

INSERT INTO permissions.ps_role VALUES (1, 'Administrator', '2022-04-07 14:58:24.623', '2022-04-07 14:58:24.623', 2, NULL, 0);
INSERT INTO permissions.ps_role VALUES (8, 'User', '2023-10-03 06:26:14', '2023-10-03 06:26:17', 2, 2, 0);


--
-- TOC entry 3062 (class 0 OID 16429)
-- Dependencies: 216
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3064 (class 0 OID 16438)
-- Dependencies: 218
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (13, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (14, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (15, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (16, '2019_12_14_000001_create_personal_access_tokens_table', 1);


--
-- TOC entry 3066 (class 0 OID 16443)
-- Dependencies: 220
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3067 (class 0 OID 16446)
-- Dependencies: 221
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personal_access_tokens VALUES (5, 'App\Models\User', 1, 'realme 5i', '5d9ba3a9146beab07a29803235f1074bb0d0cd51f89f740f306d96ce49d4b982', '["*"]', '2021-12-20 06:58:30', '2021-12-20 06:58:09', '2021-12-20 06:58:30');
INSERT INTO public.personal_access_tokens VALUES (33, 'App\Models\User', 3, 'rendra', '5a7db3b5044b34f7dab4e7128e7203c097d3e6425af3cfe6c850ced4cbdf37d0', '["*"]', '2022-01-11 09:29:23', '2022-01-11 09:29:14', '2022-01-11 09:29:23');
INSERT INTO public.personal_access_tokens VALUES (39, 'App\Models\User', 2, 'admin', '5e63c6f4c67a88cd5baabed814f897d2a1234486141ade8e3648fe47532f2222', '["*"]', '2022-02-02 21:52:06', '2022-02-02 21:40:31', '2022-02-02 21:52:06');
INSERT INTO public.personal_access_tokens VALUES (42, 'App\Models\User', 2, 'admin', 'c58b1fb623883db0defb24fcd46de0e0b0b3864042532932ba44d37e9b16ef00', '["*"]', '2022-02-02 21:58:00', '2022-02-02 21:57:23', '2022-02-02 21:58:00');
INSERT INTO public.personal_access_tokens VALUES (29, 'App\Models\User', 2, 'admin', '0a11352e1d3b1fdab47b8c4a67acd6c19630c3e374dbdc05688910eb65920bfc', '["*"]', '2021-12-28 03:39:27', '2021-12-28 03:04:40', '2021-12-28 03:39:27');
INSERT INTO public.personal_access_tokens VALUES (28, 'App\Models\User', 2, 'admin', '5c32398603b331aa5abbefcddb637db0a294f95545c20cb6fe7a670634ef95ed', '["*"]', '2021-12-28 02:59:53', '2021-12-27 15:54:08', '2021-12-28 02:59:53');
INSERT INTO public.personal_access_tokens VALUES (30, 'App\Models\User', 2, 'admin', '4342847acf9ca1fd94e13e3851478c9809edf19903b5f4498810f7ad6540a01e', '["*"]', NULL, '2021-12-28 03:39:36', '2021-12-28 03:39:36');
INSERT INTO public.personal_access_tokens VALUES (34, 'App\Models\User', 2, 'admin', 'dece9a722009ea8ec2ad2052bd8bc0775054b7afd6b09e58ead55664b6762e93', '["*"]', '2022-01-12 10:11:40', '2022-01-12 08:15:37', '2022-01-12 10:11:40');
INSERT INTO public.personal_access_tokens VALUES (8, 'App\Models\User', 2, 'admin', 'ade1d6fda52a15319b79813db4664b6738ecec03ccd00083a9e014ab6792d4a5', '["*"]', NULL, '2021-12-27 08:28:10', '2021-12-27 08:28:10');
INSERT INTO public.personal_access_tokens VALUES (9, 'App\Models\User', 2, 'admin', '440d53df8ce56a51331a27bc5053db9f8d5a8e62c97f5b9e32811b89abee7e2e', '["*"]', NULL, '2021-12-27 08:42:24', '2021-12-27 08:42:24');
INSERT INTO public.personal_access_tokens VALUES (10, 'App\Models\User', 2, 'admin', 'a0d8f7d3ec46c9ba1685b33e9034715d9ee5fd06e52b9ec5229c938c653bdd92', '["*"]', NULL, '2021-12-27 08:52:29', '2021-12-27 08:52:29');
INSERT INTO public.personal_access_tokens VALUES (11, 'App\Models\User', 2, 'admin', '2393ce7803d02b60c02418107316fa37e7d2eb11a21279a59b1b481f34056879', '["*"]', NULL, '2021-12-27 15:28:51', '2021-12-27 15:28:51');
INSERT INTO public.personal_access_tokens VALUES (12, 'App\Models\User', 2, 'admin', '1808ee34ae316d958c62097d3bb3ccd9b5ebddb5679a5215a07b112e1b918d39', '["*"]', NULL, '2021-12-27 15:30:40', '2021-12-27 15:30:40');
INSERT INTO public.personal_access_tokens VALUES (13, 'App\Models\User', 2, 'admin', '57015fd417670bc9b4fa762275e5c082d8a04cb6e21b644a10648bd9684e0bae', '["*"]', NULL, '2021-12-27 15:30:51', '2021-12-27 15:30:51');
INSERT INTO public.personal_access_tokens VALUES (14, 'App\Models\User', 2, 'admin', '28aa397b970139ea17931d201b9274764e41537e3f47e4364d4d5c07cb37ba11', '["*"]', NULL, '2021-12-27 15:32:20', '2021-12-27 15:32:20');
INSERT INTO public.personal_access_tokens VALUES (15, 'App\Models\User', 2, 'admin', '3cd6a6a7ec4f408aeb6dfee451084c5e9060cf065db0978c84f0b5dc4f842776', '["*"]', NULL, '2021-12-27 15:37:13', '2021-12-27 15:37:13');
INSERT INTO public.personal_access_tokens VALUES (16, 'App\Models\User', 2, 'admin', 'ef3966e9e12bfe2fda013e4e3a4dca3610abd457ab59fb75c93be9e2993ca408', '["*"]', NULL, '2021-12-27 15:42:10', '2021-12-27 15:42:10');
INSERT INTO public.personal_access_tokens VALUES (17, 'App\Models\User', 2, 'admin', '8e5db15696b56d66c41f9f3ea516470805b70ae28b207d55e0981a153db0af3e', '["*"]', NULL, '2021-12-27 15:43:11', '2021-12-27 15:43:11');
INSERT INTO public.personal_access_tokens VALUES (18, 'App\Models\User', 2, 'karepmu', '72fedf048cdd38e695598b45fbb1e5a50979e6a5bf39c22c63f5ea6f0ce74545', '["*"]', NULL, '2021-12-27 15:43:22', '2021-12-27 15:43:22');
INSERT INTO public.personal_access_tokens VALUES (19, 'App\Models\User', 2, 'admin', '41594d3151765d6cc4b7d6165d4f84dfb6ae93b048d453cb1dc92ab4ea9f835d', '["*"]', NULL, '2021-12-27 15:52:50', '2021-12-27 15:52:50');
INSERT INTO public.personal_access_tokens VALUES (20, 'App\Models\User', 2, 'admin', '5ba6de6bc6e570cad1a7b4ce1ef973fc01302db2ee434b19ed3982afdf0df9ed', '["*"]', NULL, '2021-12-27 15:52:51', '2021-12-27 15:52:51');
INSERT INTO public.personal_access_tokens VALUES (21, 'App\Models\User', 2, 'admin', 'fb550573db58e3c5598214ed056a8206cdf684a9f6d6805473e1b0cb856bcdbc', '["*"]', NULL, '2021-12-27 15:52:51', '2021-12-27 15:52:51');
INSERT INTO public.personal_access_tokens VALUES (22, 'App\Models\User', 2, 'admin', '12523833888aa7fa812c8f7725b912c2263709e372e31c95c0f02e2362446928', '["*"]', NULL, '2021-12-27 15:52:51', '2021-12-27 15:52:51');
INSERT INTO public.personal_access_tokens VALUES (23, 'App\Models\User', 2, 'admin', 'bcb709f31f1bbce3f775eefaf588237832283ca3ebcf5050f6fb21da50b65cd6', '["*"]', NULL, '2021-12-27 15:52:52', '2021-12-27 15:52:52');
INSERT INTO public.personal_access_tokens VALUES (24, 'App\Models\User', 2, 'admin', '40eb055482df629074df43f9558e9239eb6797ef7ea2e64e4c4e260774425372', '["*"]', NULL, '2021-12-27 15:52:52', '2021-12-27 15:52:52');
INSERT INTO public.personal_access_tokens VALUES (25, 'App\Models\User', 2, 'admin', 'b9156681ae0f04e79fc6569899a64a60bd6ad047c7fa846662ff410da01a3d0e', '["*"]', NULL, '2021-12-27 15:52:52', '2021-12-27 15:52:52');
INSERT INTO public.personal_access_tokens VALUES (26, 'App\Models\User', 2, 'admin', '6ab550778331338bbb5484abffd6ff3585e95d15f153ece517badbc7c17a8c13', '["*"]', NULL, '2021-12-27 15:52:52', '2021-12-27 15:52:52');
INSERT INTO public.personal_access_tokens VALUES (27, 'App\Models\User', 2, 'admin', '69b94b52a8f27dce9c303b9ab0987c690ef8347be4603ca47e937c4891e1f1e1', '["*"]', NULL, '2021-12-27 15:52:52', '2021-12-27 15:52:52');
INSERT INTO public.personal_access_tokens VALUES (35, 'App\Models\User', 3, 'rendra', 'cf6b1afb3dbc825c024e6516a522bccda89a83299a2725ef750ab45a5aa78efb', '["*"]', '2022-02-02 15:02:08', '2022-01-12 08:31:39', '2022-02-02 15:02:08');
INSERT INTO public.personal_access_tokens VALUES (31, 'App\Models\User', 2, 'admin', '8bf7a056d456219eb8697035e6c745f4fcdbaf498b347a799c15bb5c8b8c4475', '["*"]', '2021-12-29 17:18:14', '2021-12-28 03:47:02', '2021-12-29 17:18:14');
INSERT INTO public.personal_access_tokens VALUES (32, 'App\Models\User', 2, 'admin', 'e1e68cc56d123308d84292d96e533df5d3c52caac48b01e7d8e5bc3c61be51ff', '["*"]', '2021-12-29 17:25:06', '2021-12-29 17:18:26', '2021-12-29 17:25:06');
INSERT INTO public.personal_access_tokens VALUES (7, 'App\Models\User', 2, 'karepmu', 'e5f0443f92fee7e1d46a85edb82d367ff5783a71986d44f779b184546805fdd8', '["*"]', '2022-01-03 11:46:31', '2021-12-21 09:26:57', '2022-01-03 11:46:31');
INSERT INTO public.personal_access_tokens VALUES (6, 'App\Models\User', 2, 'Windows 11', '2d2cc7cfd8f04837c5a0adb0068808b9db3337554fafc33e019f5264e2a6eafc', '["*"]', '2021-12-28 04:16:01', '2021-12-21 09:23:38', '2021-12-28 04:16:01');
INSERT INTO public.personal_access_tokens VALUES (36, 'App\Models\User', 2, 'admin', '7f6c598be604edf3680e5ac33f4602f5c13097c2b9b7c1df1d9ef73c79e660dc', '["*"]', '2022-01-17 12:32:25', '2022-01-12 08:42:36', '2022-01-17 12:32:25');
INSERT INTO public.personal_access_tokens VALUES (37, 'App\Models\User', 2, 'admin', '41f2d6fac8f9930a9f34cd77e4fd1fbeb32f1cb6fd92979d9e03b6cd98d531bb', '["*"]', '2022-01-12 11:30:39', '2022-01-12 10:13:11', '2022-01-12 11:30:39');
INSERT INTO public.personal_access_tokens VALUES (41, 'App\Models\User', 2, 'admin', '64bc01e056d48bbfb47072d068bda7955309abd7e0452e62e93debf46070ce9d', '["*"]', '2022-02-02 21:54:20', '2022-02-02 21:52:33', '2022-02-02 21:54:20');
INSERT INTO public.personal_access_tokens VALUES (38, 'App\Models\User', 4, 'adminperkim', 'fe59658256021dd2828183bfbff3ac85fb8137bfdbe95d72bc32a8f7252ecdab', '["*"]', '2022-03-09 02:28:42', '2022-01-12 10:42:02', '2022-03-09 02:28:42');
INSERT INTO public.personal_access_tokens VALUES (51, 'App\Models\User', 2, 'admin', 'f405c1b11b5f289ecf42733f09c89096eae0f3cd4a99ecfdcc6304c67bc8c393', '["*"]', '2022-03-09 02:59:29', '2022-02-09 16:17:49', '2022-03-09 02:59:29');
INSERT INTO public.personal_access_tokens VALUES (49, 'App\Models\User', 2, 'admin', '181e56e8796e24ad8b688b7f2a5db221d63345fe09f1d0605e1a784676acd32d', '["*"]', '2022-02-03 14:51:43', '2022-02-03 13:36:27', '2022-02-03 14:51:43');
INSERT INTO public.personal_access_tokens VALUES (40, 'App\Models\User', 2, 'admin', '34650c62bc8f6d20e7675980a54e0537cdf59c0294312b57a6039c885a79ede8', '["*"]', NULL, '2022-02-02 21:51:12', '2022-02-02 21:51:12');
INSERT INTO public.personal_access_tokens VALUES (44, 'App\Models\User', 2, 'admin', 'fe90e7fc850095cf4f32fdd3471a6b6409830543c92fa58a5809f2f22f1035df', '["*"]', '2022-02-03 06:51:46', '2022-02-03 06:51:04', '2022-02-03 06:51:46');
INSERT INTO public.personal_access_tokens VALUES (45, 'App\Models\User', 2, 'admin', 'cd08b6d30accfa3343ddea5cf7270a3f7127da54c9582f170e7fcca7fa2c3041', '["*"]', '2022-02-03 11:16:19', '2022-02-03 11:08:18', '2022-02-03 11:16:19');
INSERT INTO public.personal_access_tokens VALUES (47, 'App\Models\User', 2, 'admin', '531c6336fc20fc524202f6795d4f6236677138939ddf6c110ddf62aeaaf749cf', '["*"]', '2022-02-03 13:20:18', '2022-02-03 12:23:04', '2022-02-03 13:20:18');
INSERT INTO public.personal_access_tokens VALUES (46, 'App\Models\User', 2, 'admin', '7543e6c8f6e2b99d6d7e092b8c308fdea9035b976bdcc441b8093651143fea0a', '["*"]', '2022-02-03 13:50:46', '2022-02-03 11:09:49', '2022-02-03 13:50:46');
INSERT INTO public.personal_access_tokens VALUES (50, 'App\Models\User', 2, 'admin', '33d3b8ab4eb6a8b3e92480af9825ad0b6f900d260f44bc9037d7ed53a5313993', '["*"]', '2022-02-17 23:02:43', '2022-02-03 13:42:56', '2022-02-17 23:02:43');
INSERT INTO public.personal_access_tokens VALUES (48, 'App\Models\User', 2, 'admin', '46d346a343ad17b110559a8726dc6146548ddb9e41797519b4939c823a8bcb6b', '["*"]', '2022-03-09 03:23:05', '2022-02-03 13:36:25', '2022-03-09 03:23:05');
INSERT INTO public.personal_access_tokens VALUES (43, 'App\Models\User', 2, 'admin', 'fb225de00c836f1f7c77e0c79cccc189413d576e84e23e118ac2c8273d9ca3d6', '["*"]', '2022-02-11 14:15:40', '2022-02-03 05:43:01', '2022-02-11 14:15:40');
INSERT INTO public.personal_access_tokens VALUES (52, 'App\Models\User', 5, 'test-desa', '87626b793415bc5c7c53150ca044923de4d90aedc52fcc58070a12897399a1e4', '["*"]', '2022-03-09 03:18:18', '2022-03-09 03:16:23', '2022-03-09 03:18:18');
INSERT INTO public.personal_access_tokens VALUES (53, 'App\Models\User', 2, 'admin', '82fb6632bab90e2b34970cb6fc0a923efa79558b9d651ffac65105c4bb694fd4', '["*"]', '2022-03-09 03:28:08', '2022-03-09 03:20:02', '2022-03-09 03:28:08');
INSERT INTO public.personal_access_tokens VALUES (54, 'App\Models\User', 2, 'admin', '75ecf06ab4bcb238ec77cffce7748d812ef9915f82082f00d2b6a63cefcfefba', '["*"]', NULL, '2023-10-03 06:40:46', '2023-10-03 06:40:46');
INSERT INTO public.personal_access_tokens VALUES (55, 'App\Models\User', 14, '123456', '8cc3c410b9cc0e23c78e58a426b7e3bd9558b5906e81e46de5636820f43f017d', '["*"]', NULL, '2023-10-03 06:41:15', '2023-10-03 06:41:15');
INSERT INTO public.personal_access_tokens VALUES (56, 'App\Models\User', 14, '123456', '9715a6d0a8f81d5edea40bd1515b74f73c2746e5796bf16862d7a9081f8082a3', '["*"]', NULL, '2023-10-03 06:42:26', '2023-10-03 06:42:26');
INSERT INTO public.personal_access_tokens VALUES (57, 'App\Models\User', 14, '123456', '145459bd824d345b8839650f26e7479173d10f127f1993cfb13608abad115162', '["*"]', NULL, '2023-10-03 06:43:03', '2023-10-03 06:43:03');
INSERT INTO public.personal_access_tokens VALUES (58, 'App\Models\User', 14, '123456', 'dd96ff03a928751434f46332c24078d171c20ce2be6eb3c378dbe5c179455475', '["*"]', NULL, '2023-10-03 06:43:39', '2023-10-03 06:43:39');
INSERT INTO public.personal_access_tokens VALUES (59, 'App\Models\User', 14, '123456', '3335e5033dff5028b4eecc585054ad53cb2ecba2db07f6f398d0960af1471bf8', '["*"]', NULL, '2023-10-03 06:43:54', '2023-10-03 06:43:54');
INSERT INTO public.personal_access_tokens VALUES (60, 'App\Models\User', 14, '123456', '8997736a4536766586066b19f90d7be2b954640327bb2bd35ed14ff12346883d', '["*"]', NULL, '2023-10-03 06:44:54', '2023-10-03 06:44:54');
INSERT INTO public.personal_access_tokens VALUES (61, 'App\Models\User', 14, '123456', '6770072d9a3ae1589761ffb13d8318ba35736ad2cc1ccdb47f187c110f163aad', '["*"]', NULL, '2023-10-03 06:46:27', '2023-10-03 06:46:27');
INSERT INTO public.personal_access_tokens VALUES (62, 'App\Models\User', 14, '123456', '06228e8d9429a1f34a0619c379e6153da5b016862481eb336c5d8d50ecb45267', '["*"]', NULL, '2023-10-03 06:47:33', '2023-10-03 06:47:33');
INSERT INTO public.personal_access_tokens VALUES (63, 'App\Models\User', 14, '123456', '1011f75aa313d3a23c55c4c804b08f15e1a111c04f418a9fe814a905e02fcf18', '["*"]', NULL, '2023-10-03 06:47:44', '2023-10-03 06:47:44');
INSERT INTO public.personal_access_tokens VALUES (64, 'App\Models\User', 14, '123456', 'b751783ec53c72f45f833b5acd802e00dd831302107ea4070daf8c16b6ed04d5', '["*"]', NULL, '2023-10-03 06:50:44', '2023-10-03 06:50:44');
INSERT INTO public.personal_access_tokens VALUES (66, 'App\Models\User', 14, '123456', 'b773d113366dece4ce7202d9259e5a50fa7f1e6a79d41da1596bab4039532859', '["*"]', NULL, '2023-10-03 06:59:33', '2023-10-03 06:59:33');
INSERT INTO public.personal_access_tokens VALUES (65, 'App\Models\User', 14, '123456', '56ddcedd1200116243b30176a5fcc8f6022ce4b110f0c0f6be958141ae90fbb4', '["*"]', '2023-10-03 07:11:41', '2023-10-03 06:50:54', '2023-10-03 07:11:41');
INSERT INTO public.personal_access_tokens VALUES (67, 'App\Models\User', 14, '123456', 'c5b25d431ab6ff9fa62a186bc48339f0029985f5b6a12316d441d15c866b404c', '["*"]', '2023-10-03 07:28:16', '2023-10-03 07:11:18', '2023-10-03 07:28:16');
INSERT INTO public.personal_access_tokens VALUES (68, 'App\Models\User', 14, '123456', '88a41ad0c85008abe2280a6b8ceb752b209f8eb47aff145d7e2b5b753c956f62', '["*"]', '2023-12-15 22:54:22', '2023-10-03 07:59:45', '2023-12-15 22:54:22');
INSERT INTO public.personal_access_tokens VALUES (85, 'App\Models\User', 14, '123456', '86973ed20210ea3e6e8ae6a51f29ddae77ccca37f1f21dd26ea3a2fdae07d1b8', '["*"]', NULL, '2023-10-04 06:28:31', '2023-10-04 06:28:31');
INSERT INTO public.personal_access_tokens VALUES (86, 'App\Models\User', 14, '123456', 'a63e006ab2dbaa05528f2cf2579797aacf474bd3da99209ff59a444eaeac6ce9', '["*"]', NULL, '2023-10-04 07:34:34', '2023-10-04 07:34:34');
INSERT INTO public.personal_access_tokens VALUES (87, 'App\Models\User', 14, '123456', '00624728b4981530d0487358493851c2dc6c74c86e5562d58a9708f75b9e7269', '["*"]', NULL, '2023-10-04 07:34:37', '2023-10-04 07:34:37');
INSERT INTO public.personal_access_tokens VALUES (88, 'App\Models\User', 14, '123456', '16b09a92641768d44c119b44a9b76c89179266603f97c203cb191b575f140cba', '["*"]', NULL, '2023-10-04 08:35:47', '2023-10-04 08:35:47');
INSERT INTO public.personal_access_tokens VALUES (89, 'App\Models\User', 14, '123456', 'c8440b0187ac1c679c797bca5c038ff2e61e25cfba7da027976e29c5bccb01f2', '["*"]', NULL, '2023-10-04 08:36:19', '2023-10-04 08:36:19');
INSERT INTO public.personal_access_tokens VALUES (69, 'App\Models\User', 14, '123456', '374fe30c44af86dcfae640eb2bb7f16d5c7b74f367c68413f30d3f0fb412f3de', '["*"]', NULL, '2023-10-03 08:08:58', '2023-10-03 08:08:58');
INSERT INTO public.personal_access_tokens VALUES (90, 'App\Models\User', 14, '123456', '4e72a77ad889826d78f445fb2efba631184a726f9df196f0b94d9c9963b80f0f', '["*"]', NULL, '2023-10-04 09:24:27', '2023-10-04 09:24:27');
INSERT INTO public.personal_access_tokens VALUES (91, 'App\Models\User', 14, '123456', '89d9a9351df72c0faaf5fdb1a27158146b17f94bc5cc96df832d2f25848438a0', '["*"]', NULL, '2023-10-04 09:24:58', '2023-10-04 09:24:58');
INSERT INTO public.personal_access_tokens VALUES (70, 'App\Models\User', 14, '123456', '3684cbb0fec301ad1b3efc59f769bf8e4e4e8ac2ef17de27443bbc60ff544de6', '["*"]', NULL, '2023-10-03 09:01:34', '2023-10-03 09:01:34');
INSERT INTO public.personal_access_tokens VALUES (92, 'App\Models\User', 14, '123456', '172010e4b373775d011b5e7b650451b9e67255aeebd6ecf5e10a66fa050186f6', '["*"]', NULL, '2023-10-04 10:05:56', '2023-10-04 10:05:56');
INSERT INTO public.personal_access_tokens VALUES (71, 'App\Models\User', 14, '123456', 'a4b99f535522a19aae49e5e392fd051006b3efa0f3568e9564925d654ee9885f', '["*"]', NULL, '2023-10-03 09:34:40', '2023-10-03 09:34:40');
INSERT INTO public.personal_access_tokens VALUES (93, 'App\Models\User', 14, '123456', 'd062b104c4a08e35dd7b5c8dfa756832876552d28bd45a0a525b43f843bea954', '["*"]', NULL, '2023-10-04 10:30:24', '2023-10-04 10:30:24');
INSERT INTO public.personal_access_tokens VALUES (94, 'App\Models\User', 14, '123456', '3b1d82e8af2569dda35e8ad519f2f189f72adc17e90b63951288574b1b515853', '["*"]', NULL, '2023-10-04 12:31:13', '2023-10-04 12:31:13');
INSERT INTO public.personal_access_tokens VALUES (72, 'App\Models\User', 14, '123456', 'd74956ddef9fd0784e0db8637cc69d6a0b2d91c96f37bc1b32f9cdaed2601d90', '["*"]', NULL, '2023-10-04 01:35:04', '2023-10-04 01:35:04');
INSERT INTO public.personal_access_tokens VALUES (73, 'App\Models\User', 14, '123456', '14335c405bfd517a0717ae944d6eadc9d710ebca97c241489b9d836cc4041fc7', '["*"]', NULL, '2023-10-04 03:01:46', '2023-10-04 03:01:46');
INSERT INTO public.personal_access_tokens VALUES (74, 'App\Models\User', 14, '123456', '65dd44f672ba9e704c37926394e99503ffe64d4bdb80f38f5cf6c1ba94eecf35', '["*"]', NULL, '2023-10-04 04:24:09', '2023-10-04 04:24:09');
INSERT INTO public.personal_access_tokens VALUES (75, 'App\Models\User', 14, '123456', '2ee82a450d22792b5309aba3fb7e212a9c9bd3337f8d4859d39eae54a22ea77a', '["*"]', NULL, '2023-10-04 05:47:07', '2023-10-04 05:47:07');
INSERT INTO public.personal_access_tokens VALUES (76, 'App\Models\User', 14, '123456', '2ea44b3d719adc6d608834b5be419d69065720b429f82f81d9f4c24880f0c0ce', '["*"]', NULL, '2023-10-04 05:50:27', '2023-10-04 05:50:27');
INSERT INTO public.personal_access_tokens VALUES (77, 'App\Models\User', 14, '123456', 'd17e9961d83424f395daf6f6c09b6907c5aed2a5f76ef2eedc93ada660731f99', '["*"]', NULL, '2023-10-04 06:22:43', '2023-10-04 06:22:43');
INSERT INTO public.personal_access_tokens VALUES (78, 'App\Models\User', 14, '123456', '80058a4474a2f698d0e7d09931b1f6ccd643f0f6f668d466f6507e755dcc6c2e', '["*"]', NULL, '2023-10-04 06:23:45', '2023-10-04 06:23:45');
INSERT INTO public.personal_access_tokens VALUES (79, 'App\Models\User', 14, '123456', 'a14ecdc74b268dcaed8f7ff5edb09c2c52fb322c0a23af23e22319e522c4d992', '["*"]', NULL, '2023-10-04 06:24:16', '2023-10-04 06:24:16');
INSERT INTO public.personal_access_tokens VALUES (80, 'App\Models\User', 14, '123456', '447759850cb57cbb4b4144db11b25bce4ea572caa0163bd9a0029ee61c351993', '["*"]', NULL, '2023-10-04 06:24:19', '2023-10-04 06:24:19');
INSERT INTO public.personal_access_tokens VALUES (81, 'App\Models\User', 14, '123456', 'a0dbd21c23d14b6a60f6a53ab1abd62794e5900ca69025fd2c77b0188cebd50c', '["*"]', NULL, '2023-10-04 06:24:23', '2023-10-04 06:24:23');
INSERT INTO public.personal_access_tokens VALUES (82, 'App\Models\User', 14, '123456', '0fb6c6926b0f2d97dfffb2d94190d1b6537dd2d0279b7b2b622253900e0e54c9', '["*"]', NULL, '2023-10-04 06:24:24', '2023-10-04 06:24:24');
INSERT INTO public.personal_access_tokens VALUES (83, 'App\Models\User', 14, '123456', '2bdac99f12500316a4df956f83492978073b30d58c7c0ea4793a15d5a32449a3', '["*"]', NULL, '2023-10-04 06:24:38', '2023-10-04 06:24:38');
INSERT INTO public.personal_access_tokens VALUES (84, 'App\Models\User', 14, '123456', '5bfc94ad3bd7646a4cd3e57c793e6924c91ff51f5f499d2e6e86a00ab5fffb22', '["*"]', NULL, '2023-10-04 06:24:40', '2023-10-04 06:24:40');
INSERT INTO public.personal_access_tokens VALUES (95, 'App\Models\User', 14, '123456', '01e9a72113a195cd85e69c62b3e2cc46852e5fa982dfcb8bbfb35650e8740c1e', '["*"]', NULL, '2023-10-04 12:31:15', '2023-10-04 12:31:15');
INSERT INTO public.personal_access_tokens VALUES (96, 'App\Models\User', 14, '123456', '28770dcf05f05bc4620612b9219a4bec505569d2a3081117ab7c88867cb1fefd', '["*"]', NULL, '2023-10-04 12:31:16', '2023-10-04 12:31:16');
INSERT INTO public.personal_access_tokens VALUES (97, 'App\Models\User', 14, '123456', '4273f935ac3f933bfff7d8fa7d8be1f0bed5b080fa87a44fba06f5d63170a90a', '["*"]', NULL, '2023-10-04 12:31:17', '2023-10-04 12:31:17');
INSERT INTO public.personal_access_tokens VALUES (98, 'App\Models\User', 14, '123456', 'c6adff63948fb2d4efb0f29efa68bfacb24dde3ee444b0b3d3216f88f39021fb', '["*"]', NULL, '2023-10-04 12:31:17', '2023-10-04 12:31:17');
INSERT INTO public.personal_access_tokens VALUES (99, 'App\Models\User', 14, '123456', 'a0e7069b41384e25494f782824819965866d64295d0a30f03d9712f72222285a', '["*"]', NULL, '2023-10-04 12:31:17', '2023-10-04 12:31:17');
INSERT INTO public.personal_access_tokens VALUES (100, 'App\Models\User', 14, '123456', '244187a4fa64167b8db68493fd736428f60e38ae9a9840c6fd5399231906f950', '["*"]', NULL, '2023-10-04 12:31:17', '2023-10-04 12:31:17');
INSERT INTO public.personal_access_tokens VALUES (101, 'App\Models\User', 14, '123456', '22d126d94a8d7e2e09283f769589f0f71607c23d81c3daddbf5e9f38a6205318', '["*"]', NULL, '2023-10-04 12:31:17', '2023-10-04 12:31:17');
INSERT INTO public.personal_access_tokens VALUES (102, 'App\Models\User', 14, '123456', 'cfaef69da3bc75f7c8fabc58ae57dafe1ce33a08777ccd92073397ad9d3d0718', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (103, 'App\Models\User', 14, '123456', '6c1f50d903b9fef7c5d17ddfad5cf5e9e0bd93340a1f13282610fd09f6fc9c6b', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (104, 'App\Models\User', 14, '123456', 'e4c892e6c8ad8798c4ae60fae2fd13eeee72c621872eb1638c8397508d71ae88', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (105, 'App\Models\User', 14, '123456', '17a8e8f4be30d3e69c0a7a964d0791891e7c5dd575c4de7e1e73cda56eb6b3e2', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (106, 'App\Models\User', 14, '123456', '9a742f42a65ec6012b8e6c6fe2ea960bfd3bb2bfc5783981ebaaa176c12c856a', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (107, 'App\Models\User', 14, '123456', '6f8e70a56b44b3809e7e360f638b9b9c4d636bd84e019796dc227e7388bd809a', '["*"]', NULL, '2023-10-04 12:31:18', '2023-10-04 12:31:18');
INSERT INTO public.personal_access_tokens VALUES (108, 'App\Models\User', 14, '123456', '9f8b443325ad58e186526af7c789e484781da662eadefc477309b78387eceb36', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (109, 'App\Models\User', 14, '123456', '6406848b41814ea7777e16b39d757bb32ee51f2f731e6b2600db5c9973e8b37e', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (110, 'App\Models\User', 14, '123456', 'd85baa3a91894899017f4aa9c10f02e923b5735d80915586c53163b8e43f98b3', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (111, 'App\Models\User', 14, '123456', 'fc8b6da7aff35fdb80e294b616a6ee796fff701139df189ebdc79849643bb015', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (112, 'App\Models\User', 14, '123456', '0017f964a53dd132e69363dfa825fd1db156836c22b8d1235ac62217bc926feb', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (113, 'App\Models\User', 14, '123456', '3f3fef41855680f4388a66360664f95a30182467ab80d23a511a497d8da444c6', '["*"]', NULL, '2023-10-04 12:31:19', '2023-10-04 12:31:19');
INSERT INTO public.personal_access_tokens VALUES (114, 'App\Models\User', 14, '123456', 'a85618bdc51c7035f1c011e798a95a1c18946bb94c347db952fea766ca7fc45b', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (115, 'App\Models\User', 14, '123456', '46ab7c47a4e4ce3a2e893008125eafd1a8b0fbc23a99a00fa5008d265c3f41b3', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (116, 'App\Models\User', 14, '123456', '30d1fc50323b482299adbb5d08f2afc5d1b89d13028b0c42a001f3348804b16f', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (117, 'App\Models\User', 14, '123456', '19b09cf862f42469a185a6484b6865db7b5b5f3cbeba294b9283054c78c8a412', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (118, 'App\Models\User', 14, '123456', '8eb4524f471cb9a0d81c9ce486cda2aad94297ba861e5763216c2259cdf92706', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (119, 'App\Models\User', 14, '123456', '4130748bfad89ca8449d8b39f52363e526bb243d01f8b294c9cc8fe92a63a6da', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (120, 'App\Models\User', 14, '123456', '8f86b6d9ee35ff7ad07e26e0dcce95fbeb77cf30154ce9a64078d2757bdb4462', '["*"]', NULL, '2023-10-04 12:31:20', '2023-10-04 12:31:20');
INSERT INTO public.personal_access_tokens VALUES (121, 'App\Models\User', 14, '123456', '528e33a7be565ba754480c7cd2858bfd28c7d546aefa5d150869ab3aaf5cebfa', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (122, 'App\Models\User', 14, '123456', '58835854b9fd4442d6f12d84f3b1cdc6d57c0f3a7dc6e2b2f4b6e528a7bc5786', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (123, 'App\Models\User', 14, '123456', 'fe98cb0fb32adb61da28cc2a37dd528bfe2ffa26ced48563de145a9c2d9467fd', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (124, 'App\Models\User', 14, '123456', '6ceaa6ed4d17e213817530cf3e800399c382796cf16fc8590ba9cb41dc4aacfa', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (125, 'App\Models\User', 14, '123456', 'e7b61fb746180ef180360b176274bebe53c4df7903dab69e38d8209797c17dc1', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (126, 'App\Models\User', 14, '123456', '4240355fd3174588714a425320b80a70387f6d218bf507602bdedb522950650e', '["*"]', NULL, '2023-10-04 12:31:21', '2023-10-04 12:31:21');
INSERT INTO public.personal_access_tokens VALUES (127, 'App\Models\User', 14, '123456', 'ba4d971aa5aa5aa5c5732c8c0744d125ac4b5155de6349614e6dcdc0e8a1efd4', '["*"]', NULL, '2023-10-04 12:31:22', '2023-10-04 12:31:22');
INSERT INTO public.personal_access_tokens VALUES (128, 'App\Models\User', 14, '123456', '9c96b7b550eaa8dfa59406d8c03988c21dd55bc06035f5b6a83c263a5b9bdcb3', '["*"]', NULL, '2023-10-04 12:31:26', '2023-10-04 12:31:26');
INSERT INTO public.personal_access_tokens VALUES (129, 'App\Models\User', 14, '123456', '5230ac81a8e2b7dd7fe8c57b42f0490890d1e3b6328dab00a74b48c49b254259', '["*"]', NULL, '2023-10-04 12:31:27', '2023-10-04 12:31:27');
INSERT INTO public.personal_access_tokens VALUES (130, 'App\Models\User', 14, '123456', 'bc347a9085186a47858ac293463afd22c2246573be01cb7be1c7835b99784130', '["*"]', NULL, '2023-10-04 12:32:26', '2023-10-04 12:32:26');
INSERT INTO public.personal_access_tokens VALUES (131, 'App\Models\User', 14, '123456', '5061a4bb7dbfee33a496799dfb131c5113bed624801f0a216df38449c1c15608', '["*"]', NULL, '2023-10-04 12:35:43', '2023-10-04 12:35:43');
INSERT INTO public.personal_access_tokens VALUES (132, 'App\Models\User', 14, '123456', 'b3c1ba7e4e37f924e1752ce35cc2eec4ca81078d7c31fec20a0ea8b44e6af32a', '["*"]', NULL, '2023-10-04 12:38:08', '2023-10-04 12:38:08');
INSERT INTO public.personal_access_tokens VALUES (133, 'App\Models\User', 14, '123456', '56a252f071eafeb452fa2c14e4fa64ad5e341eca02bafe04781c0284623d828c', '["*"]', NULL, '2023-10-04 13:14:55', '2023-10-04 13:14:55');
INSERT INTO public.personal_access_tokens VALUES (134, 'App\Models\User', 14, '123456', '9e06cd790bfadd8cfc56b8ec6cb3cda9855ec17cb0b2b887dfebedcb538243c6', '["*"]', NULL, '2023-10-04 13:35:04', '2023-10-04 13:35:04');
INSERT INTO public.personal_access_tokens VALUES (135, 'App\Models\User', 14, '123456', '3fe6282ec6977d4509a05b8fe67e8aa96a3bf07cf2c43e92122fd3f176777c40', '["*"]', NULL, '2023-10-04 13:35:51', '2023-10-04 13:35:51');
INSERT INTO public.personal_access_tokens VALUES (136, 'App\Models\User', 14, '123456', '28d012d9bbc7812e6d391f569e51a313e19d009821034a3f1467f1fc29861f89', '["*"]', NULL, '2023-10-04 13:35:57', '2023-10-04 13:35:57');
INSERT INTO public.personal_access_tokens VALUES (137, 'App\Models\User', 14, '123456', '9808512251165e7080ce27e24e7f8f8e28dd421d36215a536ca0573b44002732', '["*"]', NULL, '2023-10-04 13:48:01', '2023-10-04 13:48:01');
INSERT INTO public.personal_access_tokens VALUES (138, 'App\Models\User', 14, '123456', '2e9820f52d20fb8b3b8914fef310d101f9cbea4a80e3d4750c51772a90dab5ca', '["*"]', NULL, '2023-10-04 14:54:23', '2023-10-04 14:54:23');
INSERT INTO public.personal_access_tokens VALUES (139, 'App\Models\User', 14, '123456', '39507a18dc985ebcd70c17d29790b532815931499841a9ec72694ff4683e01ba', '["*"]', NULL, '2023-10-04 14:54:30', '2023-10-04 14:54:30');
INSERT INTO public.personal_access_tokens VALUES (140, 'App\Models\User', 14, '123456', '089b0da4920b41d982e6ace08e341b8546248063262eef3e420b41f2db0ee113', '["*"]', NULL, '2023-10-04 14:56:20', '2023-10-04 14:56:20');
INSERT INTO public.personal_access_tokens VALUES (141, 'App\Models\User', 14, '123456', '19043bee816b3390367da88a1c54e6880707030c95e695839bb37f2eb61c97a8', '["*"]', NULL, '2023-10-04 14:56:30', '2023-10-04 14:56:30');
INSERT INTO public.personal_access_tokens VALUES (142, 'App\Models\User', 14, '123456', 'fa8ac73fb5be36ba5cca79f00c1d22d9b29d40a1547b604e01f05f9f2aa54941', '["*"]', NULL, '2023-10-04 15:05:15', '2023-10-04 15:05:15');
INSERT INTO public.personal_access_tokens VALUES (143, 'App\Models\User', 14, '123456', 'd513de9953444fc7402967684717751bdf019eb6a2f3a1f0d5ae9bd8a5ca897a', '["*"]', NULL, '2023-10-04 15:20:32', '2023-10-04 15:20:32');
INSERT INTO public.personal_access_tokens VALUES (144, 'App\Models\User', 14, '123456', '83bb0f3156d23862909d2ab3d0a0a62356ecb3e8fbcbf6c171c5dc4128bf9f91', '["*"]', NULL, '2023-10-04 15:22:30', '2023-10-04 15:22:30');
INSERT INTO public.personal_access_tokens VALUES (145, 'App\Models\User', 14, '123456', '1314263e75b695bf5d1ca4746e85dd315c5d116d94e4eee1972386f8d391e301', '["*"]', NULL, '2023-10-04 15:28:59', '2023-10-04 15:28:59');
INSERT INTO public.personal_access_tokens VALUES (146, 'App\Models\User', 14, '123456', 'e6f09ad04e6a1304f224217bc9fda9b6f250fb337b6e75c2f0dc4c9beca0a3a9', '["*"]', NULL, '2023-10-04 15:29:44', '2023-10-04 15:29:44');
INSERT INTO public.personal_access_tokens VALUES (147, 'App\Models\User', 14, '123456', 'aee35f5af4e9f5c131395357c32831bfc96687506bca2328032e1b030b80a1a1', '["*"]', NULL, '2023-10-04 15:29:47', '2023-10-04 15:29:47');
INSERT INTO public.personal_access_tokens VALUES (148, 'App\Models\User', 14, '123456', '6c52f996c2411c568dd620ce67ba864cef5bd6408c93cd2bdbc9ec6ca3878b50', '["*"]', NULL, '2023-10-04 15:30:07', '2023-10-04 15:30:07');
INSERT INTO public.personal_access_tokens VALUES (149, 'App\Models\User', 14, '123456', 'f2c48e7b47253a1d6409db4db63968f7e2d7e83244d31629ff80fd2de9512016', '["*"]', NULL, '2023-10-04 15:30:09', '2023-10-04 15:30:09');
INSERT INTO public.personal_access_tokens VALUES (150, 'App\Models\User', 14, '123456', '4e8cfc1f7cc76cf6fd25fc0de0f9b205d6f1d75161e903d8bcd0dfb3efb9df55', '["*"]', NULL, '2023-10-04 15:34:23', '2023-10-04 15:34:23');
INSERT INTO public.personal_access_tokens VALUES (151, 'App\Models\User', 14, '123456', '4dfc66d53f91b6b1164ff48bca8c104e1664f2d1dbff71e1caf275cdc28d084d', '["*"]', NULL, '2023-10-04 15:34:32', '2023-10-04 15:34:32');
INSERT INTO public.personal_access_tokens VALUES (152, 'App\Models\User', 14, '123456', 'bbefbd544813232b84b3ae9b638a1f5d8e678f5bd3bf8a6284878296b15772a1', '["*"]', NULL, '2023-10-04 15:35:20', '2023-10-04 15:35:20');
INSERT INTO public.personal_access_tokens VALUES (153, 'App\Models\User', 14, '123456', 'bed7c1c9d3a2c491149473863a6a19a6d16cc5a5220d27cbd0d0f991208d161a', '["*"]', NULL, '2023-10-04 15:36:45', '2023-10-04 15:36:45');
INSERT INTO public.personal_access_tokens VALUES (154, 'App\Models\User', 14, '123456', '5803d957dffc9c546d53a6a6de9a83dd468a33d23130fd26590a39f591b7e292', '["*"]', NULL, '2023-10-04 16:12:33', '2023-10-04 16:12:33');
INSERT INTO public.personal_access_tokens VALUES (155, 'App\Models\User', 14, '123456', 'c21675575c2ee752b18f92a89d4b853d3ce8a8b7944e59c07241d21730b597d7', '["*"]', NULL, '2023-10-04 16:24:18', '2023-10-04 16:24:18');
INSERT INTO public.personal_access_tokens VALUES (156, 'App\Models\User', 14, '123456', 'fdb5ca2dc2cfd9eff7774ad8f40760a843734f9036c1b753f806ff56fc6f940e', '["*"]', NULL, '2023-10-04 16:24:22', '2023-10-04 16:24:22');
INSERT INTO public.personal_access_tokens VALUES (157, 'App\Models\User', 14, '123456', '86daa6adcf992a8bc7d5fe7c9e12d3d429774dcdbc3696adf94d9b09a6e8646e', '["*"]', NULL, '2023-10-04 16:24:24', '2023-10-04 16:24:24');
INSERT INTO public.personal_access_tokens VALUES (158, 'App\Models\User', 14, '123456', '0311a79d662d8c5b79cc52de7183cbcb972ce38f9b902cd9192e318530502608', '["*"]', NULL, '2023-10-04 16:24:26', '2023-10-04 16:24:26');
INSERT INTO public.personal_access_tokens VALUES (159, 'App\Models\User', 14, '123456', 'c481843d9134510e103cfbad4f970fa4bf4e48f832c6644d7cb208c6ee6d11e4', '["*"]', NULL, '2023-10-04 16:24:27', '2023-10-04 16:24:27');
INSERT INTO public.personal_access_tokens VALUES (160, 'App\Models\User', 14, '123456', 'fa11841c62fea401115886c8916167ec7b7486b753e709b2d0a2e6628058fd70', '["*"]', NULL, '2023-10-04 16:24:28', '2023-10-04 16:24:28');
INSERT INTO public.personal_access_tokens VALUES (161, 'App\Models\User', 14, '123456', '1a43a5142e7c0f6b36f5e8022a5cdb1dcc08b6690e864dbab6cbbed831fd2695', '["*"]', NULL, '2023-10-04 16:24:29', '2023-10-04 16:24:29');
INSERT INTO public.personal_access_tokens VALUES (162, 'App\Models\User', 14, '123456', 'a8a22867c981a1d99861e0c1d6d026860d0830986dafe391b194fcd1d8427546', '["*"]', NULL, '2023-10-04 16:26:54', '2023-10-04 16:26:54');
INSERT INTO public.personal_access_tokens VALUES (163, 'App\Models\User', 14, '123456', 'dd6832bf2000c0e54a1b86b7798b895a38f5948aad3874395dd031a7a0e4e4d1', '["*"]', NULL, '2023-10-04 16:26:56', '2023-10-04 16:26:56');
INSERT INTO public.personal_access_tokens VALUES (164, 'App\Models\User', 14, '123456', '83690a85eb4ae33129d958db5e6643e8548744f71ce653b563f2cd9d489222d8', '["*"]', NULL, '2023-10-04 16:27:04', '2023-10-04 16:27:04');
INSERT INTO public.personal_access_tokens VALUES (165, 'App\Models\User', 14, '123456', 'acee768e05f114489240e3bc569ce1b3da44561d3db8b3348cea9fa6d267dfab', '["*"]', NULL, '2023-10-04 16:27:06', '2023-10-04 16:27:06');
INSERT INTO public.personal_access_tokens VALUES (166, 'App\Models\User', 14, '123456', '47f193a94a5868b8aca0cb9fcd52fd2b8dd86f6aebb8c5d9f597c8428e7c492a', '["*"]', NULL, '2023-10-04 16:27:16', '2023-10-04 16:27:16');
INSERT INTO public.personal_access_tokens VALUES (167, 'App\Models\User', 14, '123456', '9f3cf2d33bc8c277ea3b450e1103d72c9e739bf5546fcc73ca91915af7c93049', '["*"]', NULL, '2023-10-04 16:31:01', '2023-10-04 16:31:01');
INSERT INTO public.personal_access_tokens VALUES (168, 'App\Models\User', 14, '123456', 'ea2c477635a517ba30dd2d24bc5bf805cb0f315b4bee53940d3d30caf86d9287', '["*"]', NULL, '2023-10-04 16:31:03', '2023-10-04 16:31:03');
INSERT INTO public.personal_access_tokens VALUES (169, 'App\Models\User', 14, '123456', '316c72bf3a6b373e4075137d4e2e817ae947426b9e523fbd96f71255f1c89ceb', '["*"]', NULL, '2023-10-04 16:31:05', '2023-10-04 16:31:05');
INSERT INTO public.personal_access_tokens VALUES (170, 'App\Models\User', 14, '123456', 'faa9e5d015d35f6deea14ce9e6ded7ba9d6343d0bf5ce3e762401ea8bc0eaf1b', '["*"]', NULL, '2023-10-04 16:31:05', '2023-10-04 16:31:05');
INSERT INTO public.personal_access_tokens VALUES (171, 'App\Models\User', 14, '123456', '16a36d6a5ea84fc71797e7b5d5a146aa3755b97b92cfa6703c480da090d629f3', '["*"]', NULL, '2023-10-04 16:31:06', '2023-10-04 16:31:06');
INSERT INTO public.personal_access_tokens VALUES (172, 'App\Models\User', 14, '123456', '2f188f47f937ab8e91c3711c43feab860de2c7b1a236f905744c12e79a1dd50d', '["*"]', NULL, '2023-10-04 16:31:06', '2023-10-04 16:31:06');
INSERT INTO public.personal_access_tokens VALUES (173, 'App\Models\User', 14, '123456', 'c99e0ad7d94c9a97bc23a24994f28de9833c046e924245a09fdd784a8b28733d', '["*"]', NULL, '2023-10-04 16:31:07', '2023-10-04 16:31:07');
INSERT INTO public.personal_access_tokens VALUES (174, 'App\Models\User', 14, '123456', '98aeddaeed24ca934bff70d1468f96cf76803141bf4e0ee86a662aa3dbd4475c', '["*"]', NULL, '2023-10-04 16:31:08', '2023-10-04 16:31:08');
INSERT INTO public.personal_access_tokens VALUES (175, 'App\Models\User', 14, '123456', '782b615d4bd09ed377ba2182ff1960df8bc6dd01f0628387600ee7c4fcd6f7f9', '["*"]', NULL, '2023-10-04 16:31:09', '2023-10-04 16:31:09');
INSERT INTO public.personal_access_tokens VALUES (176, 'App\Models\User', 14, '123456', '1915f15e99732d4d16123229365193d1bccd19f04c95ce100d360dfdbd54ba84', '["*"]', NULL, '2023-10-04 16:31:10', '2023-10-04 16:31:10');
INSERT INTO public.personal_access_tokens VALUES (177, 'App\Models\User', 14, '123456', 'a23d07ac494873eaecd4ee51d44ba2d6acddf1111111ded0837732a8bded8558', '["*"]', NULL, '2023-10-04 16:31:11', '2023-10-04 16:31:11');
INSERT INTO public.personal_access_tokens VALUES (178, 'App\Models\User', 14, '123456', 'ca47f947c174f38747db147dd250c0f98d0b9c0adc5631951e6687d4b0dee536', '["*"]', NULL, '2023-10-04 16:31:11', '2023-10-04 16:31:11');
INSERT INTO public.personal_access_tokens VALUES (179, 'App\Models\User', 14, '123456', '79c041a59faeaa7c2fc060b8bd2b93db2a7cbfe7691dd6fa3e133589513f0942', '["*"]', NULL, '2023-10-04 16:31:12', '2023-10-04 16:31:12');
INSERT INTO public.personal_access_tokens VALUES (180, 'App\Models\User', 14, '123456', 'dc97aca0e0967390480a7cb0d137b7d9c72d731f54df6078820e9db5d00ddbda', '["*"]', NULL, '2023-10-04 16:31:12', '2023-10-04 16:31:12');
INSERT INTO public.personal_access_tokens VALUES (181, 'App\Models\User', 14, '123456', '5b233e3923d6f1b3373c0f076deee8c4971afb34c45d5647e3f5e5240ee0c59f', '["*"]', NULL, '2023-10-04 16:31:12', '2023-10-04 16:31:12');
INSERT INTO public.personal_access_tokens VALUES (182, 'App\Models\User', 14, '123456', '9822f0fa0418fe026c1e3653e332e0030001c1dd08081fc5111bbd62868f5f74', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (183, 'App\Models\User', 14, '123456', '4d5b5ca8b6bb87692ba6a58bbb42f6d0accdbf6b3763006b204901bf025c1a3a', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (184, 'App\Models\User', 14, '123456', 'fdc2300456256c2939d09ba78a82e0d86357613d9e1051607b87364192682d04', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (185, 'App\Models\User', 14, '123456', '182fb0ff46bf725e364aed81c9aaa8ebc34db8ec49ecb6092cedb30f5474ce59', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (186, 'App\Models\User', 14, '123456', 'd85073dcf47a83d878ab2f3395823f988995d821c28930b6ae910714b69e631a', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (187, 'App\Models\User', 14, '123456', 'a598c8720d4fe210668bfc5375023877109c3cbb87053d54512ef9455e73b7d6', '["*"]', NULL, '2023-10-04 16:31:13', '2023-10-04 16:31:13');
INSERT INTO public.personal_access_tokens VALUES (188, 'App\Models\User', 14, '123456', 'ab57e7778701af957561bbcd61adae1af95b283e3e4dcea380e410fc1e0555c9', '["*"]', NULL, '2023-10-04 16:31:14', '2023-10-04 16:31:14');
INSERT INTO public.personal_access_tokens VALUES (189, 'App\Models\User', 14, '123456', '803d90ed74f76a286883a9b46b5b2e26d606771f70b80b5741c904e1d399f242', '["*"]', NULL, '2023-10-04 16:31:14', '2023-10-04 16:31:14');
INSERT INTO public.personal_access_tokens VALUES (190, 'App\Models\User', 14, '123456', '825cdf3a9cababb6933fbf1cb4bca817ae179a7e1e42c007da40b20f695c3485', '["*"]', NULL, '2023-10-04 16:31:14', '2023-10-04 16:31:14');
INSERT INTO public.personal_access_tokens VALUES (191, 'App\Models\User', 14, '123456', '82d64aa1412f28da980a6e25128cd9094d779c10f6e71d410687c9044f8cf868', '["*"]', NULL, '2023-10-04 16:31:14', '2023-10-04 16:31:14');
INSERT INTO public.personal_access_tokens VALUES (192, 'App\Models\User', 14, '123456', '73ae2a9a9bfbb93f74f5cda9cf49794d2e711967f7ccc6f994a92a1d7e8d6281', '["*"]', NULL, '2023-10-04 16:31:14', '2023-10-04 16:31:14');
INSERT INTO public.personal_access_tokens VALUES (193, 'App\Models\User', 14, '123456', '5631f106cdeff9c341879dc5fc8100aacfed726e883508e6bcd49c2b0b494d3b', '["*"]', NULL, '2023-10-04 16:31:15', '2023-10-04 16:31:15');
INSERT INTO public.personal_access_tokens VALUES (194, 'App\Models\User', 14, '123456', '741a7db4f6db0a407bf1e6cf849a261fd5ce9bf0059f97d2d25f40f8558d320d', '["*"]', NULL, '2023-10-04 16:31:15', '2023-10-04 16:31:15');
INSERT INTO public.personal_access_tokens VALUES (195, 'App\Models\User', 14, '123456', '54f853ff778a63eb48e47360745359acc1b222ad984c932f5e4f558ec00c9c62', '["*"]', NULL, '2023-10-04 16:31:15', '2023-10-04 16:31:15');
INSERT INTO public.personal_access_tokens VALUES (196, 'App\Models\User', 14, '123456', '3da3408baa5a84705dd7215ea5ca003ed44bb845ce3b051548c25af21256a1b6', '["*"]', NULL, '2023-10-04 16:31:15', '2023-10-04 16:31:15');
INSERT INTO public.personal_access_tokens VALUES (197, 'App\Models\User', 14, '123456', '363f2d6398beac1c3a4186ffa8e895eb69904e8f33a398046e5d35c3bae28d9e', '["*"]', NULL, '2023-10-04 16:31:15', '2023-10-04 16:31:15');
INSERT INTO public.personal_access_tokens VALUES (198, 'App\Models\User', 14, '123456', '871ceac7ef1f912b2c686577ab8f04f59ca2de0f70471c1964beacebdc144a77', '["*"]', NULL, '2023-10-04 16:31:16', '2023-10-04 16:31:16');
INSERT INTO public.personal_access_tokens VALUES (199, 'App\Models\User', 14, '123456', '75e44ce6361c060241ccef031a3851c3e2bcfdf87f0746dd1205049034f93273', '["*"]', NULL, '2023-10-04 16:31:16', '2023-10-04 16:31:16');
INSERT INTO public.personal_access_tokens VALUES (200, 'App\Models\User', 14, '123456', '87eba23b8fd113e4bdc0f3cba14b75d322f66929ea14ae006d39e6922db63cff', '["*"]', NULL, '2023-10-04 16:31:16', '2023-10-04 16:31:16');
INSERT INTO public.personal_access_tokens VALUES (201, 'App\Models\User', 14, '123456', '26eb3a3b39c5f41dcef617a7bd917829e64262c344eaf35f92705a1a58a3d456', '["*"]', NULL, '2023-10-04 16:31:17', '2023-10-04 16:31:17');
INSERT INTO public.personal_access_tokens VALUES (202, 'App\Models\User', 14, '123456', '04d6d2d7ebcb94d958b2e03e441cfe94735b4395e20977091ad66e7345282016', '["*"]', NULL, '2023-10-04 16:31:17', '2023-10-04 16:31:17');
INSERT INTO public.personal_access_tokens VALUES (203, 'App\Models\User', 14, '123456', 'b7b1fa1156cfb32fb3a9cc242c6a1ee132910a6d2cf33bffe15cee813490cef2', '["*"]', NULL, '2023-10-04 17:06:31', '2023-10-04 17:06:31');
INSERT INTO public.personal_access_tokens VALUES (204, 'App\Models\User', 14, '123456', '9187a7a3545b6ab0a0e11af5df54fb7f0582d750b2f4566f437189fc0db429f0', '["*"]', NULL, '2023-10-04 17:06:32', '2023-10-04 17:06:32');
INSERT INTO public.personal_access_tokens VALUES (205, 'App\Models\User', 14, '123456', 'a936e2df17c5d546e4f224092a524161f675f502602afda8aa50de7310f6f22f', '["*"]', NULL, '2023-10-04 17:06:33', '2023-10-04 17:06:33');
INSERT INTO public.personal_access_tokens VALUES (206, 'App\Models\User', 14, '123456', 'a48a54f985cfdbc06cb9598794a214c8af4dc190dbc3d9ddedcfb969a31cf854', '["*"]', NULL, '2023-10-04 17:06:35', '2023-10-04 17:06:35');
INSERT INTO public.personal_access_tokens VALUES (207, 'App\Models\User', 14, '123456', '73ce802d3b57a7383aea3faf757bd6e30a020a253a1d5f7d0b1829bacccb29df', '["*"]', NULL, '2023-10-04 17:06:35', '2023-10-04 17:06:35');
INSERT INTO public.personal_access_tokens VALUES (208, 'App\Models\User', 14, '123456', '6450772a2d2855fdb376a0b7877b6a4bc663a643a288d75a71f0381012cb7bda', '["*"]', NULL, '2023-10-04 17:06:36', '2023-10-04 17:06:36');
INSERT INTO public.personal_access_tokens VALUES (209, 'App\Models\User', 14, '123456', 'a31bc2d28cb1afba5494851639f7f0cb73f1d56f2f2142a0e9eed8ec4a734e69', '["*"]', NULL, '2023-10-04 17:06:36', '2023-10-04 17:06:36');
INSERT INTO public.personal_access_tokens VALUES (210, 'App\Models\User', 14, '123456', '410ba3e10dda152a0eafa07c38494d81239145f4fb77cd87e8fc65119464ac11', '["*"]', NULL, '2023-10-04 17:06:36', '2023-10-04 17:06:36');
INSERT INTO public.personal_access_tokens VALUES (211, 'App\Models\User', 14, '123456', 'd3e4675ac90ac482ddf222fa1c27e9f9b81e80f2be35df42ba093d2aefaea237', '["*"]', NULL, '2023-10-04 17:06:36', '2023-10-04 17:06:36');
INSERT INTO public.personal_access_tokens VALUES (212, 'App\Models\User', 14, '123456', '81ecb38d828b9b823b49f5bf82530b17f8deaa4b66eaf820db5e380a6730dd99', '["*"]', NULL, '2023-10-04 23:13:06', '2023-10-04 23:13:06');
INSERT INTO public.personal_access_tokens VALUES (213, 'App\Models\User', 14, '123456', '5e800bbe85d3995485d9c6e93d95670242f3967b5670cb5b6a8be7ac96d76e7b', '["*"]', NULL, '2023-10-04 23:14:22', '2023-10-04 23:14:22');
INSERT INTO public.personal_access_tokens VALUES (214, 'App\Models\User', 14, '123456', 'bc2986aea9c5228f7bf3e412202657ac2cb96ffd4c5fcdc496222d32f3c074b0', '["*"]', NULL, '2023-10-04 23:14:55', '2023-10-04 23:14:55');
INSERT INTO public.personal_access_tokens VALUES (215, 'App\Models\User', 14, '123456', '92a203a08ec4cef3754db5c8c2290dbf10c12f69d3d606fc5101d24011240dae', '["*"]', NULL, '2023-10-04 23:23:27', '2023-10-04 23:23:27');
INSERT INTO public.personal_access_tokens VALUES (216, 'App\Models\User', 14, '123456', 'd53f602b611b4475936835c449d5bd1c8c9a7c17b3f412361d2ca3fccb33378e', '["*"]', NULL, '2023-10-04 23:24:40', '2023-10-04 23:24:40');
INSERT INTO public.personal_access_tokens VALUES (217, 'App\Models\User', 14, '123456', 'd5c5a8dcde9871508f1e05e9f18e20c772963e2483d42f5a47500e5a4a8f6727', '["*"]', NULL, '2023-10-05 01:40:08', '2023-10-05 01:40:08');
INSERT INTO public.personal_access_tokens VALUES (218, 'App\Models\User', 14, '123456', '53fdbe9d03b96b7b371c6e8706cbab024afc6c4cdd8963ee084a4476bbc7848d', '["*"]', NULL, '2023-10-05 02:01:58', '2023-10-05 02:01:58');
INSERT INTO public.personal_access_tokens VALUES (219, 'App\Models\User', 14, '123456', '903551e158ae89f219d1231ba0e98e2067ebaa782e02a7de9fddafffe5654c56', '["*"]', NULL, '2023-10-05 02:02:31', '2023-10-05 02:02:31');
INSERT INTO public.personal_access_tokens VALUES (220, 'App\Models\User', 14, '123456', '25c68611acfb937ba2c4e0b9458c2771b3e21214f6cc5e03e5de166b51049151', '["*"]', NULL, '2023-10-05 02:04:24', '2023-10-05 02:04:24');
INSERT INTO public.personal_access_tokens VALUES (221, 'App\Models\User', 14, '123456', '465b1645260a34f4dcbcac8907e6628d40914e24fab733aad286e28057674775', '["*"]', NULL, '2023-10-05 02:19:30', '2023-10-05 02:19:30');
INSERT INTO public.personal_access_tokens VALUES (222, 'App\Models\User', 14, '123456', '31ad7641e8d9b9fea9c88e7788eaa9cdc17ebf741a42ff80cf5fd5e23e76d05d', '["*"]', NULL, '2023-10-05 02:20:46', '2023-10-05 02:20:46');
INSERT INTO public.personal_access_tokens VALUES (223, 'App\Models\User', 14, '123456', '0cb3d7b61f01ccfeec28ecc84ea256f8de006622e475a72da0dab0618f96f118', '["*"]', NULL, '2023-10-05 02:29:44', '2023-10-05 02:29:44');
INSERT INTO public.personal_access_tokens VALUES (224, 'App\Models\User', 14, '123456', 'a1d13eafc8f67a5af3760bef8fa32c233d497a2a8c6c111518e45666342be7cd', '["*"]', NULL, '2023-10-05 02:29:48', '2023-10-05 02:29:48');
INSERT INTO public.personal_access_tokens VALUES (225, 'App\Models\User', 14, '123456', '059e6e78f6e9778bf10b7219903d0a009ee5cffd9c5edbc2a89108c167429984', '["*"]', NULL, '2023-10-05 02:30:46', '2023-10-05 02:30:46');
INSERT INTO public.personal_access_tokens VALUES (226, 'App\Models\User', 14, '123456', 'fb1da4082391e4c2a0b41081a35b20da7b17d66ea03ffa8ab446889614c63944', '["*"]', NULL, '2023-10-05 02:30:59', '2023-10-05 02:30:59');
INSERT INTO public.personal_access_tokens VALUES (227, 'App\Models\User', 14, '123456', '90a1cebc0730022a48a79f4e94ff41ff79c0a86fc603caf054de74b37dfe4f10', '["*"]', NULL, '2023-10-05 02:37:49', '2023-10-05 02:37:49');
INSERT INTO public.personal_access_tokens VALUES (228, 'App\Models\User', 14, '123456', '30032632718da0639d76c2b660b067bec7b5faf7fe4e01639cd2afe870493f99', '["*"]', NULL, '2023-10-05 03:22:28', '2023-10-05 03:22:28');
INSERT INTO public.personal_access_tokens VALUES (229, 'App\Models\User', 14, '123456', '813a351d56767e1933c820470374494f84a330db9780ea741aa2d574a6484e9c', '["*"]', NULL, '2023-10-05 03:22:32', '2023-10-05 03:22:32');
INSERT INTO public.personal_access_tokens VALUES (230, 'App\Models\User', 14, '123456', '8c37ca02a30bb36b75500050d0648754d33dbb8c5780bdcaa20b0d3441355f0b', '["*"]', NULL, '2023-10-05 03:50:50', '2023-10-05 03:50:50');
INSERT INTO public.personal_access_tokens VALUES (231, 'App\Models\User', 14, '123456', '415d084d9a47e199baaaad61ad42ad39c3e43a2da7f6fc0b19075d4cd16e052d', '["*"]', NULL, '2023-10-05 04:04:28', '2023-10-05 04:04:28');
INSERT INTO public.personal_access_tokens VALUES (232, 'App\Models\User', 14, '123456', 'c0aaf7c7c81d8ff350fac8f0152a63629f178cba718ff28994768b48a1d8af72', '["*"]', NULL, '2023-10-05 05:47:42', '2023-10-05 05:47:42');
INSERT INTO public.personal_access_tokens VALUES (233, 'App\Models\User', 14, '123456', 'ee2d8dc134e16b9555810bac5c0838bc73f9bf5d34a20f16aeea03a89ff828d0', '["*"]', NULL, '2023-10-05 05:57:11', '2023-10-05 05:57:11');
INSERT INTO public.personal_access_tokens VALUES (234, 'App\Models\User', 14, '123456', 'e15c98617cd0d48268d7b2d30dc76e7a0d73be637a13aa3d54a4e28199a57181', '["*"]', NULL, '2023-10-05 06:28:12', '2023-10-05 06:28:12');
INSERT INTO public.personal_access_tokens VALUES (235, 'App\Models\User', 14, '123456', 'd5309990e249ee0f43a341f20f1767c961591ce98d591ab526044c0fb82a60d3', '["*"]', NULL, '2023-10-05 06:30:06', '2023-10-05 06:30:06');
INSERT INTO public.personal_access_tokens VALUES (236, 'App\Models\User', 14, '123456', 'bc0af0d318d37f147163f1ec3eb3664f5c26163fe628da1c5c34ed748f247218', '["*"]', NULL, '2023-10-05 06:46:21', '2023-10-05 06:46:21');
INSERT INTO public.personal_access_tokens VALUES (237, 'App\Models\User', 14, '123456', '6b6dceec3b698b28e75dbec66c1cfda771a44357394d6e88023a820cb63b6c48', '["*"]', NULL, '2023-10-05 06:56:30', '2023-10-05 06:56:30');
INSERT INTO public.personal_access_tokens VALUES (238, 'App\Models\User', 14, '123456', '1fa2c2c994e3f73982458771cd64aac734852b6c18236c576a8f38455fabb105', '["*"]', NULL, '2023-10-05 06:57:48', '2023-10-05 06:57:48');
INSERT INTO public.personal_access_tokens VALUES (239, 'App\Models\User', 14, '123456', '3f08b1b736519570e13e9bb83d3e1ea32130693d22951031a3c8a0fc8a101864', '["*"]', NULL, '2023-10-05 06:58:09', '2023-10-05 06:58:09');
INSERT INTO public.personal_access_tokens VALUES (240, 'App\Models\User', 14, '123456', 'e962a3d3e00bb60ce795fc917bae77f45ef171ed9816c2b85f9593953a387858', '["*"]', NULL, '2023-10-05 07:34:09', '2023-10-05 07:34:09');
INSERT INTO public.personal_access_tokens VALUES (241, 'App\Models\User', 14, '123456', 'b2d941da0f3895a331141af33859bf1b1478a60c95e3184caea16898d0a67758', '["*"]', NULL, '2023-10-05 07:38:04', '2023-10-05 07:38:04');
INSERT INTO public.personal_access_tokens VALUES (242, 'App\Models\User', 14, '123456', '7f8b3de3b33cb2b00dac85e80049fcbd6cb66eed886a2ed283b21b3f6fca6dcc', '["*"]', NULL, '2023-10-05 07:42:52', '2023-10-05 07:42:52');
INSERT INTO public.personal_access_tokens VALUES (243, 'App\Models\User', 14, '123456', '7840a0bb116f27b73246100456aa8c3e692be204e21662732c8cfc7ff40748f5', '["*"]', NULL, '2023-10-05 07:44:28', '2023-10-05 07:44:28');
INSERT INTO public.personal_access_tokens VALUES (244, 'App\Models\User', 14, '123456', 'ca526f4d19c1c2a28a0f36c3cb99aa24359625b569aa11f249811cf06a6613d9', '["*"]', NULL, '2023-10-05 07:45:28', '2023-10-05 07:45:28');
INSERT INTO public.personal_access_tokens VALUES (245, 'App\Models\User', 14, '123456', 'be1eddbe0b5de7497f1da944124bae8adac00d4859f18360e0d289f112c8e127', '["*"]', NULL, '2023-10-05 07:55:29', '2023-10-05 07:55:29');
INSERT INTO public.personal_access_tokens VALUES (246, 'App\Models\User', 14, '123456', 'f3ca3bebb467dc8dbcde5063592c27298fc055e19b69746a157ca1b2886b4a08', '["*"]', NULL, '2023-10-05 07:56:52', '2023-10-05 07:56:52');
INSERT INTO public.personal_access_tokens VALUES (247, 'App\Models\User', 14, '123456', '306c97e2ca6688ee40c4866209ecedebad0a0ec53e5edcb0e27cf19fed02b627', '["*"]', NULL, '2023-10-05 08:05:40', '2023-10-05 08:05:40');
INSERT INTO public.personal_access_tokens VALUES (248, 'App\Models\User', 14, '123456', '67348f4c43bce73e77f369b2ed679a607190ec1480bb8a9ec3bb43653380b357', '["*"]', NULL, '2023-10-05 08:27:09', '2023-10-05 08:27:09');
INSERT INTO public.personal_access_tokens VALUES (249, 'App\Models\User', 14, '123456', '3de36842ded59b8934b59e247d292ed94bc3e53c6e89af5bd68236622ec6e62e', '["*"]', NULL, '2023-10-05 08:48:24', '2023-10-05 08:48:24');
INSERT INTO public.personal_access_tokens VALUES (250, 'App\Models\User', 14, '123456', '044152f448adccbd91460ac76d1450f3f4e78ca34d703a31d5fd08d3765815c8', '["*"]', NULL, '2023-10-06 02:45:33', '2023-10-06 02:45:33');
INSERT INTO public.personal_access_tokens VALUES (251, 'App\Models\User', 14, '123456', '244a975a24b74b4e1a8c304c7bad44ebb1a0c1826605558209e58b1f45b10d2a', '["*"]', NULL, '2023-10-06 04:04:30', '2023-10-06 04:04:30');
INSERT INTO public.personal_access_tokens VALUES (252, 'App\Models\User', 14, '123456', '5ad2bf5e01e4ac64ae4af2c6fbcee43170d52a92c2040d7040b20ee381f8b594', '["*"]', NULL, '2023-10-06 07:25:08', '2023-10-06 07:25:08');
INSERT INTO public.personal_access_tokens VALUES (253, 'App\Models\User', 14, '123456', '1aac233e6bbfbc7242a6a8e9fc9fd3b4655a49f2b785f48f822470d26b238019', '["*"]', NULL, '2023-10-06 07:51:23', '2023-10-06 07:51:23');
INSERT INTO public.personal_access_tokens VALUES (254, 'App\Models\User', 14, '123456', '72b71d7cb5ab2383b2b96a0a21f9c4ab2e89095cb246b8fd8c5013db214dc482', '["*"]', NULL, '2023-10-06 07:53:34', '2023-10-06 07:53:34');
INSERT INTO public.personal_access_tokens VALUES (265, 'App\Models\User', 14, '123456', '5e275cafb29af19a02848715d617693bad010e1f3ba0d4bc7bc4136cefbb067e', '["*"]', '2023-10-08 05:53:54', '2023-10-08 05:53:37', '2023-10-08 05:53:54');
INSERT INTO public.personal_access_tokens VALUES (286, 'App\Models\User', 14, '123456', '81da634faea7137c14a4951041d75921b602e5203ca2a7e2aafdf09138c34a49', '["*"]', '2023-10-11 06:38:12', '2023-10-11 06:38:10', '2023-10-11 06:38:12');
INSERT INTO public.personal_access_tokens VALUES (278, 'App\Models\User', 14, '123456', 'd73b25431bfe2268a9a0332df47e1d0cd4915ce7f94f00ac1fb518029da5364a', '["*"]', '2023-10-10 06:37:10', '2023-10-10 06:35:34', '2023-10-10 06:37:10');
INSERT INTO public.personal_access_tokens VALUES (266, 'App\Models\User', 14, '123456', 'fc7f942ec778e7ba097ece93280b69e0adb378de59a6c3b6c8f2892a35f6f830', '["*"]', '2023-10-08 05:56:29', '2023-10-08 05:55:55', '2023-10-08 05:56:29');
INSERT INTO public.personal_access_tokens VALUES (267, 'App\Models\User', 14, '123456', '152b9665f6a01bc66484b6424e39478c066902e852aedc69f431d74786ac2852', '["*"]', NULL, '2023-10-08 09:39:37', '2023-10-08 09:39:37');
INSERT INTO public.personal_access_tokens VALUES (268, 'App\Models\User', 14, '123456', 'ccb5c98d17c63a6c4860db7f0378fbd0101ffa742c5cf1d31e1970c5b8f17cfc', '["*"]', NULL, '2023-10-09 00:30:33', '2023-10-09 00:30:33');
INSERT INTO public.personal_access_tokens VALUES (279, 'App\Models\User', 14, '123456', 'bb8452c29df94d31d6bd121312c0dcb23e5ee51a3f9936702bd8e65be3392ad1', '["*"]', '2023-10-10 07:39:13', '2023-10-10 07:38:23', '2023-10-10 07:39:13');
INSERT INTO public.personal_access_tokens VALUES (280, 'App\Models\User', 14, '123456', 'fef1b2d136f99f78c627d674a72170776624ed2808fea7a475e3c7d7fe2cc6ba', '["*"]', NULL, '2023-10-10 16:06:26', '2023-10-10 16:06:26');
INSERT INTO public.personal_access_tokens VALUES (269, 'App\Models\User', 14, '123456', 'b903bd50a2f07ccd8193af545f243b2f96203280e6b364fc9faad4dad4f77598', '["*"]', '2023-10-09 02:19:41', '2023-10-09 02:18:46', '2023-10-09 02:19:41');
INSERT INTO public.personal_access_tokens VALUES (270, 'App\Models\User', 14, '123456', 'c3d0467b313799024b4cf10f476dfdb63e1b8c6c3caef6f44aba411ea87b5bee', '["*"]', NULL, '2023-10-09 02:49:37', '2023-10-09 02:49:37');
INSERT INTO public.personal_access_tokens VALUES (255, 'App\Models\User', 14, '123456', '76594a194f4934e2fa2481701f310ae3d915b446b5033fa4be2d483296119dbb', '["*"]', '2023-10-07 06:45:02', '2023-10-07 06:04:56', '2023-10-07 06:45:02');
INSERT INTO public.personal_access_tokens VALUES (256, 'App\Models\User', 14, '123456', 'af49804b8fdebd93025f4201daf618eb4ef42cd54c359bab253e047313fc1295', '["*"]', NULL, '2023-10-07 06:49:41', '2023-10-07 06:49:41');
INSERT INTO public.personal_access_tokens VALUES (287, 'App\Models\User', 14, '123456', '8a205d40dd8a36d80cfcb3c4fdab332a402737be98506c19d399ce65a34fce3d', '["*"]', '2023-10-11 06:48:47', '2023-10-11 06:48:44', '2023-10-11 06:48:47');
INSERT INTO public.personal_access_tokens VALUES (257, 'App\Models\User', 14, '123456', 'b381c0b05c805cfe504235385042d49989b2c780f93f37e8eb2c6cfefe03efb0', '["*"]', '2023-10-07 06:51:56', '2023-10-07 06:51:40', '2023-10-07 06:51:56');
INSERT INTO public.personal_access_tokens VALUES (281, 'App\Models\User', 14, '123456', '4a6cef8c1bc553eb2cb420305813cf472bbf55a0a0ecf2f7233a9854ec33e72c', '["*"]', '2023-10-10 16:12:04', '2023-10-10 16:11:26', '2023-10-10 16:12:04');
INSERT INTO public.personal_access_tokens VALUES (258, 'App\Models\User', 14, '123456', '3821e7d21afe019be0765bc4800e6ceb9c3e1f9c717700dd3e1acdde164de644', '["*"]', '2023-10-07 06:53:38', '2023-10-07 06:53:22', '2023-10-07 06:53:38');
INSERT INTO public.personal_access_tokens VALUES (259, 'App\Models\User', 14, '123456', 'b070b17e48bd585335746b7b4ce9b410e8d4488408ab6f3cb6ac9549d998ce02', '["*"]', NULL, '2023-10-07 12:13:17', '2023-10-07 12:13:17');
INSERT INTO public.personal_access_tokens VALUES (271, 'App\Models\User', 14, '123456', '8a80f2d770a3528db659299030eb1a757f9a321c0fecd109e0f7e0e03a5d9841', '["*"]', '2023-10-09 02:59:14', '2023-10-09 02:55:17', '2023-10-09 02:59:14');
INSERT INTO public.personal_access_tokens VALUES (272, 'App\Models\User', 14, '123456', '6e3e7b138e23ce876220184b3d23ddfe7db6ccbb48cf68025730229866e0df38', '["*"]', NULL, '2023-10-09 03:00:41', '2023-10-09 03:00:41');
INSERT INTO public.personal_access_tokens VALUES (273, 'App\Models\User', 14, '123456', 'd4b50aca2182c83f77c0acf244f2932b12d62ce3b341109f594a04a99e1caeaa', '["*"]', NULL, '2023-10-09 03:03:21', '2023-10-09 03:03:21');
INSERT INTO public.personal_access_tokens VALUES (260, 'App\Models\User', 14, '123456', '70dd7661e4ae9e9055ff265a89cb0f8786e646549a8f80db52b8b0bda0b6bc42', '["*"]', '2023-10-08 01:22:27', '2023-10-08 01:16:50', '2023-10-08 01:22:27');
INSERT INTO public.personal_access_tokens VALUES (261, 'App\Models\User', 14, '123456', '511e05070896f142cab414b6c5d91b7cfe131eaa1833237f0046740c1d4cd853', '["*"]', '2023-10-08 02:06:23', '2023-10-08 02:06:03', '2023-10-08 02:06:23');
INSERT INTO public.personal_access_tokens VALUES (262, 'App\Models\User', 14, '123456', 'be32f3ff5b1c070d72cb7c6337db574610b93127b35516cc125daff7e4bfc855', '["*"]', NULL, '2023-10-08 05:45:19', '2023-10-08 05:45:19');
INSERT INTO public.personal_access_tokens VALUES (263, 'App\Models\User', 14, '123456', '47516b2c9f90e8bf529c42eb04b935f74fb32f0cc88a9b175d497072c0a57a78', '["*"]', NULL, '2023-10-08 05:49:29', '2023-10-08 05:49:29');
INSERT INTO public.personal_access_tokens VALUES (264, 'App\Models\User', 14, '123456', '32411bec64cb76dccc06608240f97b74b402c5af3b9888215d056817cd8162c8', '["*"]', NULL, '2023-10-08 05:52:42', '2023-10-08 05:52:42');
INSERT INTO public.personal_access_tokens VALUES (274, 'App\Models\User', 14, '123456', 'c155b5d359571731421496b23575eb05cc4d3fea22997546d4afca781176a42b', '["*"]', '2023-10-09 06:39:14', '2023-10-09 06:23:30', '2023-10-09 06:39:14');
INSERT INTO public.personal_access_tokens VALUES (275, 'App\Models\User', 14, '123456', '35002f6b6d1f5559ee32d6de5568eb80dedc1bd5aff02cdfb78116e1d444eeaa', '["*"]', NULL, '2023-10-09 07:56:36', '2023-10-09 07:56:36');
INSERT INTO public.personal_access_tokens VALUES (276, 'App\Models\User', 14, '123456', '41a62001e197a3539144a21c01030e86118658c85cbb6c2a9b49146a90df1b40', '["*"]', NULL, '2023-10-10 02:33:58', '2023-10-10 02:33:58');
INSERT INTO public.personal_access_tokens VALUES (277, 'App\Models\User', 14, '123456', 'c7165d760a7e75e7729799b688661e02656646ee950eb346f97d7f8225092553', '["*"]', NULL, '2023-10-10 06:18:06', '2023-10-10 06:18:06');
INSERT INTO public.personal_access_tokens VALUES (282, 'App\Models\User', 14, '123456', 'f88b69b9a524a584d97cf7456bee673923eded9740046d81782290450b732150', '["*"]', NULL, '2023-10-11 04:23:54', '2023-10-11 04:23:54');
INSERT INTO public.personal_access_tokens VALUES (283, 'App\Models\User', 14, '123456', '635baa8996dbeb181a6c5d73b774ece207787b8af98359a0ccb6253c53a83cac', '["*"]', NULL, '2023-10-11 04:23:56', '2023-10-11 04:23:56');
INSERT INTO public.personal_access_tokens VALUES (284, 'App\Models\User', 14, '123456', '77045c796addc650f4e4aa0bdeee354543c7ef96f64fa3455662ed9974f8f08e', '["*"]', NULL, '2023-10-11 06:32:37', '2023-10-11 06:32:37');
INSERT INTO public.personal_access_tokens VALUES (285, 'App\Models\User', 14, '123456', '6d9eacd48b0def8510ca0fbb94268e5141ea3190469167da90c7c7de0646bbc3', '["*"]', NULL, '2023-10-11 06:34:31', '2023-10-11 06:34:31');
INSERT INTO public.personal_access_tokens VALUES (288, 'App\Models\User', 14, '123456', '26dbcfd88e76250b7c5b393bd49c88bb35878f9f0d06e1d04269541ec848d383', '["*"]', '2023-10-11 06:51:49', '2023-10-11 06:51:47', '2023-10-11 06:51:49');
INSERT INTO public.personal_access_tokens VALUES (289, 'App\Models\User', 14, '123456', '79b8e9dd6640f878d35239324c4862ed392ea4c4e17c95bc7f8dcb0856a40cdf', '["*"]', '2023-10-11 06:57:01', '2023-10-11 06:55:39', '2023-10-11 06:57:01');
INSERT INTO public.personal_access_tokens VALUES (290, 'App\Models\User', 14, '123456', '4749ff2efd4b6452da9cb11007d6b04509b03078c2a35c654d3d9e9d467063e1', '["*"]', '2023-10-11 07:10:53', '2023-10-11 07:10:13', '2023-10-11 07:10:53');
INSERT INTO public.personal_access_tokens VALUES (291, 'App\Models\User', 14, '123456', '7148b81edd9f900cc2e6a9602ac0ba2149120f0a29b92d320b6c229733235241', '["*"]', '2023-10-11 07:15:16', '2023-10-11 07:11:59', '2023-10-11 07:15:16');
INSERT INTO public.personal_access_tokens VALUES (292, 'App\Models\User', 14, '123456', 'a90d9be5beeb078656277e08606567611c8c714aae50306dfa480f3fa1eac772', '["*"]', '2023-10-11 07:17:59', '2023-10-11 07:17:57', '2023-10-11 07:17:59');
INSERT INTO public.personal_access_tokens VALUES (293, 'App\Models\User', 14, '123456', '25f55a445eb52bf037cf00d154f1a902661d716799a697dbb9982d08092312ef', '["*"]', '2023-10-11 07:26:58', '2023-10-11 07:26:54', '2023-10-11 07:26:58');
INSERT INTO public.personal_access_tokens VALUES (294, 'App\Models\User', 14, '123456', '77a76795c90265da267553a5167127519c35445d06c9459cf75ffb18defad8ef', '["*"]', '2023-10-11 07:33:50', '2023-10-11 07:30:43', '2023-10-11 07:33:50');
INSERT INTO public.personal_access_tokens VALUES (295, 'App\Models\User', 14, '123456', '23a021f90f374081d09acb1fedfd95d4be3a95d37daa08caba37807b32750bb8', '["*"]', NULL, '2023-10-11 07:37:15', '2023-10-11 07:37:15');
INSERT INTO public.personal_access_tokens VALUES (317, 'App\Models\User', 14, '123456', '84c4fdebb1a4e51569732ca4bcd60bfd61da3cbbe30b4e00768b749b05c42b42', '["*"]', '2023-10-13 08:48:41', '2023-10-13 08:48:23', '2023-10-13 08:48:41');
INSERT INTO public.personal_access_tokens VALUES (303, 'App\Models\User', 14, '123456', '89ba98129c937f48db503a4965659aa3aa2201f0f17b90eb716cdd9fee3f43b6', '["*"]', '2023-10-12 04:08:59', '2023-10-12 03:55:23', '2023-10-12 04:08:59');
INSERT INTO public.personal_access_tokens VALUES (296, 'App\Models\User', 14, '123456', 'd39609485bc82caeaf7d7675fe7a539f69ae55e44daae6e4ecfb9734fbe054af', '["*"]', '2023-10-11 07:37:53', '2023-10-11 07:37:23', '2023-10-11 07:37:53');
INSERT INTO public.personal_access_tokens VALUES (297, 'App\Models\User', 14, '123456', 'f3ec17c439726a98dc1d66e1f96a6908384b37db262ccdfc501d765c0f060738', '["*"]', '2023-10-11 07:43:46', '2023-10-11 07:43:42', '2023-10-11 07:43:46');
INSERT INTO public.personal_access_tokens VALUES (318, 'App\Models\User', 14, '123456', '7c8fbf2c2fbbaaf19c5fb1adb5e62a194d2df77bbcc47ec154e4c43ab4c36a13', '["*"]', NULL, '2023-10-15 06:03:00', '2023-10-15 06:03:00');
INSERT INTO public.personal_access_tokens VALUES (311, 'App\Models\User', 14, '123456', '2b7bfa6f8b16be74e814820cea37e7d1d38eb721157e2ca01e5ecbcfe7c5ecf4', '["*"]', '2023-10-13 07:34:48', '2023-10-13 06:47:34', '2023-10-13 07:34:48');
INSERT INTO public.personal_access_tokens VALUES (298, 'App\Models\User', 14, '123456', 'ce0daa3cee71c1b99bac08e454412dbe3aa60c669297d0d0c2fbe700c5e2c0ad', '["*"]', '2023-10-11 07:48:08', '2023-10-11 07:47:23', '2023-10-11 07:48:08');
INSERT INTO public.personal_access_tokens VALUES (319, 'App\Models\User', 14, '123456', '6b9b07a2fcbda32a786ef4eaa8a56b725b6889af52ce35a23502d0bbb67ce4ef', '["*"]', NULL, '2023-10-15 06:04:00', '2023-10-15 06:04:00');
INSERT INTO public.personal_access_tokens VALUES (320, 'App\Models\User', 14, '123456', 'ee6e57866d076ef48be7eeaa040c2f6e8143fbd647c0bd31a6adaa3a6d233c72', '["*"]', NULL, '2023-10-15 06:10:39', '2023-10-15 06:10:39');
INSERT INTO public.personal_access_tokens VALUES (321, 'App\Models\User', 14, '123456', '037260543617f929eb2c28c3fe12d33fca6d6d7c6ee1e250df76fe7033fa3916', '["*"]', NULL, '2023-10-15 06:14:27', '2023-10-15 06:14:27');
INSERT INTO public.personal_access_tokens VALUES (304, 'App\Models\User', 14, '123456', '55539ab2cc8f56f4bd99c36d8b3ad02046e61d4608076d4afbf64b425435cf64', '["*"]', '2023-10-13 02:05:26', '2023-10-13 02:04:47', '2023-10-13 02:05:26');
INSERT INTO public.personal_access_tokens VALUES (305, 'App\Models\User', 14, '123456', '2f49c0aed390fa798dff1ae1acf562265899895193142e5a38ac2a3cf661fb18', '["*"]', NULL, '2023-10-13 02:20:14', '2023-10-13 02:20:14');
INSERT INTO public.personal_access_tokens VALUES (337, 'App\Models\User', 16, 'tes', '998d9ee41ab5f148211fa7155ab8590490bfab39b5f7395df7958650952cbeb1', '["*"]', '2023-10-16 09:02:34', '2023-10-16 08:20:23', '2023-10-16 09:02:34');
INSERT INTO public.personal_access_tokens VALUES (306, 'App\Models\User', 14, '123456', '9607feee04b626b6926299ecfb23231bcf9decfc2206a7858aaa90303740681d', '["*"]', '2023-10-13 02:39:40', '2023-10-13 02:38:31', '2023-10-13 02:39:40');
INSERT INTO public.personal_access_tokens VALUES (307, 'App\Models\User', 14, '123456', '0398d45751781c82dde61c35efd77abff0ec144ba943ce8eb612eed262bae434', '["*"]', NULL, '2023-10-13 02:50:45', '2023-10-13 02:50:45');
INSERT INTO public.personal_access_tokens VALUES (299, 'App\Models\User', 14, '123456', '5fb49f50e23d48b7f95b2b3792945ec7515d1de4dd5fbfdfce598cb71a33f16f', '["*"]', '2023-10-12 01:37:37', '2023-10-12 01:36:41', '2023-10-12 01:37:37');
INSERT INTO public.personal_access_tokens VALUES (300, 'App\Models\User', 14, '123456', 'e7dccf5fb8ab00fc6b455f6b0175437cc071de34b6f31691e9c5d026cd04207a', '["*"]', '2023-10-12 02:42:20', '2023-10-12 02:42:16', '2023-10-12 02:42:20');
INSERT INTO public.personal_access_tokens VALUES (322, 'App\Models\User', 14, '123456', 'd7439c5618e61e2fc84b2d37710d285248772a40aa434e98ae6e6e0d40430f31', '["*"]', '2023-10-16 01:47:25', '2023-10-15 06:19:37', '2023-10-16 01:47:25');
INSERT INTO public.personal_access_tokens VALUES (308, 'App\Models\User', 14, '123456', 'e2391698fdbaaf71f36fab8be3ba56d985fd5a3218dcaac625e6cea4869c24d3', '["*"]', '2023-10-13 03:25:45', '2023-10-13 03:20:37', '2023-10-13 03:25:45');
INSERT INTO public.personal_access_tokens VALUES (301, 'App\Models\User', 14, '123456', '2e47cc08742b9a60234e4288bf5dce734eb0aa06e1115a52143738566ba2ff40', '["*"]', '2023-10-12 03:02:11', '2023-10-12 03:01:59', '2023-10-12 03:02:11');
INSERT INTO public.personal_access_tokens VALUES (302, 'App\Models\User', 14, '123456', '6047e654c4fa6dbf641e820981e4b16928e0307ff455c6c172928d281b856147', '["*"]', NULL, '2023-10-12 03:54:33', '2023-10-12 03:54:33');
INSERT INTO public.personal_access_tokens VALUES (323, 'App\Models\User', 14, '123456', 'd3c4467337d0290f931aa5dda59b6adb0299241ec8a01cd76c7247bde8816728', '["*"]', NULL, '2023-10-16 03:03:18', '2023-10-16 03:03:18');
INSERT INTO public.personal_access_tokens VALUES (324, 'App\Models\User', 14, '123456', 'c6018ff545f235779ac865950022d33d973b8adda8ff70ff01f940a01e30099e', '["*"]', NULL, '2023-10-16 03:06:57', '2023-10-16 03:06:57');
INSERT INTO public.personal_access_tokens VALUES (325, 'App\Models\User', 14, '123456', '3179f3e0997dcda498b1a14ae1941845725c8bba34f64743fd9fec7eb604af6e', '["*"]', NULL, '2023-10-16 03:11:00', '2023-10-16 03:11:00');
INSERT INTO public.personal_access_tokens VALUES (309, 'App\Models\User', 14, '123456', 'f4f9fe81de1f85d15f2cc4cc3e50ecbc456c6c48ed6d80ac9e4d0dde9831400c', '["*"]', '2023-10-13 06:41:19', '2023-10-13 06:41:05', '2023-10-13 06:41:19');
INSERT INTO public.personal_access_tokens VALUES (310, 'App\Models\User', 14, '123456', '0b11cf630a3d18cb61252163486ebe83d9c7d9ef16fd0fa56919fe9f31ecb478', '["*"]', NULL, '2023-10-13 06:44:29', '2023-10-13 06:44:29');
INSERT INTO public.personal_access_tokens VALUES (326, 'App\Models\User', 14, '123456', '5f07b490f6917bfd5708d962aefb42f2def6e9d3f0f4480fa27b19eb4b4ec98e', '["*"]', NULL, '2023-10-16 04:32:25', '2023-10-16 04:32:25');
INSERT INTO public.personal_access_tokens VALUES (327, 'App\Models\User', 14, '123456', '36abffb702347c85f7f4d8bf96e55e11c8fec8d2771a1b8f6d299ed8e18945bb', '["*"]', NULL, '2023-10-16 04:33:46', '2023-10-16 04:33:46');
INSERT INTO public.personal_access_tokens VALUES (328, 'App\Models\User', 14, '123456', 'ead50cb847af2bb82aa2ff70ef751860617dc91761d7b89cfdcf28ed5f418bc6', '["*"]', NULL, '2023-10-16 04:40:33', '2023-10-16 04:40:33');
INSERT INTO public.personal_access_tokens VALUES (329, 'App\Models\User', 14, '123456', '067531c33b4265248188f377e7ee13db2fc9936b6d659c80c889bfe19430798e', '["*"]', NULL, '2023-10-16 04:41:47', '2023-10-16 04:41:47');
INSERT INTO public.personal_access_tokens VALUES (312, 'App\Models\User', 14, '123456', 'dee28f4f93cd0075e6782e067a997c87946716dd9b46277267971676acbcfecb', '["*"]', '2023-10-13 07:41:13', '2023-10-13 07:28:42', '2023-10-13 07:41:13');
INSERT INTO public.personal_access_tokens VALUES (336, 'App\Models\User', 16, 'tes', '61059dba976a271ce22564a29abd6282fb4effbf9ac6daafa63eaa3f57b1a84e', '["*"]', '2023-10-16 08:19:54', '2023-10-16 08:17:39', '2023-10-16 08:19:54');
INSERT INTO public.personal_access_tokens VALUES (333, 'App\Models\User', 15, 'tes', '1ee07d5e122c0ac6146277cc433baf190fc8c47a8866a63e1fdf6c6fa6eb25cf', '["*"]', '2023-10-16 08:08:00', '2023-10-16 08:02:06', '2023-10-16 08:08:00');
INSERT INTO public.personal_access_tokens VALUES (331, 'App\Models\User', 15, 'tes', '6b96c5eae1b0a5e0ba02f2b9e73484d959eb6bddac7b1c061df8c7bcb0e6a5ad', '["*"]', '2023-10-16 07:45:28', '2023-10-16 07:43:53', '2023-10-16 07:45:28');
INSERT INTO public.personal_access_tokens VALUES (332, 'App\Models\User', 15, 'tes', '05f2f8ac386355abdb12a12eb1b049dde217815f06dc45df1422227efc7a04fc', '["*"]', NULL, '2023-10-16 07:48:38', '2023-10-16 07:48:38');
INSERT INTO public.personal_access_tokens VALUES (313, 'App\Models\User', 14, '123456', 'cb47f8d81f2f563585b1ad9b085b8b7e2dddf31b0b0e6d80e0221fa6e4a0162b', '["*"]', '2023-10-13 08:36:25', '2023-10-13 08:31:16', '2023-10-13 08:36:25');
INSERT INTO public.personal_access_tokens VALUES (314, 'App\Models\User', 14, '123456', '59f977b8f7b4c7637dd2a363ae2a3f2b8edacf509ff88d168a9ec96ed6b5e300', '["*"]', NULL, '2023-10-13 08:36:54', '2023-10-13 08:36:54');
INSERT INTO public.personal_access_tokens VALUES (315, 'App\Models\User', 14, '123456', '80c5aad71cc05e5f8e7803ec332e49cdbb04686b3c46f4abf37af9ad047b5b93', '["*"]', NULL, '2023-10-13 08:46:20', '2023-10-13 08:46:20');
INSERT INTO public.personal_access_tokens VALUES (316, 'App\Models\User', 14, '123456', '06d1490df310a642f700b129390e9fc9f337df3849c3069eba459b3fc6d6b968', '["*"]', NULL, '2023-10-13 08:47:59', '2023-10-13 08:47:59');
INSERT INTO public.personal_access_tokens VALUES (334, 'App\Models\User', 16, 'tes', '93f142c2de3ff44dbe7ab1093c24331f97dad475d9d2bff78f5bd17c7fc64a21', '["*"]', '2023-10-16 08:12:36', '2023-10-16 08:12:33', '2023-10-16 08:12:36');
INSERT INTO public.personal_access_tokens VALUES (335, 'App\Models\User', 16, 'tes', '4a25d742179135954d9d10e094d7c5e19a1a23197194bcb345f083f8478d1ef3', '["*"]', NULL, '2023-10-16 08:13:29', '2023-10-16 08:13:29');
INSERT INTO public.personal_access_tokens VALUES (330, 'App\Models\User', 14, '123456', '825810236edc6cccdf3d938333ce5a304300416c093782ebec05ab0767539f76', '["*"]', '2023-10-16 07:49:40', '2023-10-16 04:42:54', '2023-10-16 07:49:40');
INSERT INTO public.personal_access_tokens VALUES (339, 'App\Models\User', 16, 'tes', 'a08019700c69ff1d612a72432d88a27b3d17462e86fea6a56d145bfdf35565f1', '["*"]', NULL, '2023-10-17 02:12:29', '2023-10-17 02:12:29');
INSERT INTO public.personal_access_tokens VALUES (338, 'App\Models\User', 14, '123456', '5739782308b52a60ea5856a55c2086c9cc0b79545fe9a045491d4e7f26292972', '["*"]', '2023-10-16 13:23:42', '2023-10-16 13:22:13', '2023-10-16 13:23:42');
INSERT INTO public.personal_access_tokens VALUES (340, 'App\Models\User', 17, 'tes', 'ba7ee13d252473833300fd8edd8b2082d63ccd5757cd23827a497c62840c8e59', '["*"]', '2023-10-17 03:11:28', '2023-10-17 03:07:38', '2023-10-17 03:11:28');
INSERT INTO public.personal_access_tokens VALUES (341, 'App\Models\User', 18, 'tes', '42d5c115fcabef947bc1c96b469b5c8d722f6fc7e316786b8aa0f49dfd1fb843', '["*"]', '2023-10-17 03:30:12', '2023-10-17 03:25:34', '2023-10-17 03:30:12');
INSERT INTO public.personal_access_tokens VALUES (342, 'App\Models\User', 14, '123456', '95b98ff3c3e978343c2e22bd80e0ef85e7cfb17b11c6e42d24aa5c6fd5fdd682', '["*"]', '2023-10-17 04:30:46', '2023-10-17 04:08:55', '2023-10-17 04:30:46');
INSERT INTO public.personal_access_tokens VALUES (343, 'App\Models\User', 19, 'masuk', '00b1b8f3ff5f83393485ffd866d501fbf76093245569c5bda7bf756b433ee4c3', '["*"]', '2023-10-17 05:49:16', '2023-10-17 05:47:49', '2023-10-17 05:49:16');
INSERT INTO public.personal_access_tokens VALUES (344, 'App\Models\User', 14, '123456', '1e77f2f8726aa20ae2e15b1159b74f3b9735dab51477a4756614fc3c53cbcfed', '["*"]', NULL, '2023-10-17 06:27:07', '2023-10-17 06:27:07');
INSERT INTO public.personal_access_tokens VALUES (345, 'App\Models\User', 14, '123456', 'b0395a3126661d5697a50e76c69886f52b869fb15c8095867c901d32bbe9cee1', '["*"]', NULL, '2023-10-17 06:44:36', '2023-10-17 06:44:36');
INSERT INTO public.personal_access_tokens VALUES (346, 'App\Models\User', 20, 'ppp', 'c1997aa12773fb1d7670cf0175c9c56193849c2d835eb656f0bca0c7c3f57e23', '["*"]', NULL, '2023-10-17 06:51:31', '2023-10-17 06:51:31');
INSERT INTO public.personal_access_tokens VALUES (347, 'App\Models\User', 20, 'ppp', '329e84a78b73951210b8a52afc9c759772c5809f833a71a7e1fc44784ae24da6', '["*"]', NULL, '2023-10-17 06:53:26', '2023-10-17 06:53:26');
INSERT INTO public.personal_access_tokens VALUES (348, 'App\Models\User', 14, '123456', '61808094397723a4b56874728e0e1f7fc15ae2c0f1b864c3078f3b7aa8946d62', '["*"]', NULL, '2023-10-17 07:24:11', '2023-10-17 07:24:11');
INSERT INTO public.personal_access_tokens VALUES (349, 'App\Models\User', 14, '123456', '3c2e8569fd63522c53dce53f43aa9a9e4850a9d88367c97ccac7e99fa3662599', '["*"]', NULL, '2023-10-17 07:27:28', '2023-10-17 07:27:28');
INSERT INTO public.personal_access_tokens VALUES (350, 'App\Models\User', 14, '123456', '3ebf1ed96be0feee5a758fc6ed15f435a6973c521e4117d9e8dff5c80e286d6f', '["*"]', NULL, '2023-10-17 07:37:15', '2023-10-17 07:37:15');
INSERT INTO public.personal_access_tokens VALUES (351, 'App\Models\User', 14, '123456', '0468309bdd9232ebde80dbe7cca68f75223d2e514661d5bac6becad701847987', '["*"]', NULL, '2023-10-17 07:41:16', '2023-10-17 07:41:16');
INSERT INTO public.personal_access_tokens VALUES (352, 'App\Models\User', 14, '123456', '287c1e089338f1a72ad2402ed1d0e9e35aec0c695c269b37029b1103ac1c142a', '["*"]', NULL, '2023-10-17 07:44:11', '2023-10-17 07:44:11');
INSERT INTO public.personal_access_tokens VALUES (353, 'App\Models\User', 14, '123456', '731bdc041cb5c0eb0c20e685ddfb74b62569dc213a134eb79484a7347771583b', '["*"]', NULL, '2023-10-17 07:44:59', '2023-10-17 07:44:59');
INSERT INTO public.personal_access_tokens VALUES (354, 'App\Models\User', 14, '123456', 'b4ec794401fccde953dd34bcb837fc441f74806e6bfe287ccffd06563efbe43f', '["*"]', NULL, '2023-10-17 07:53:00', '2023-10-17 07:53:00');
INSERT INTO public.personal_access_tokens VALUES (355, 'App\Models\User', 14, '123456', '746a1c2cd5d4459451231e84991c2c0c0a5134da642f205243f5ca4cf848598a', '["*"]', NULL, '2023-10-17 07:57:58', '2023-10-17 07:57:58');
INSERT INTO public.personal_access_tokens VALUES (356, 'App\Models\User', 14, '123456', 'dd0aaea724319e8824323b875fa1389ecff5f9a06b25383eff4b5730a8e87d3c', '["*"]', NULL, '2023-10-17 08:05:33', '2023-10-17 08:05:33');
INSERT INTO public.personal_access_tokens VALUES (357, 'App\Models\User', 14, '123456', '1f1bd7b0105c3a1439c0ac0544a866ad664b832ff6f3b07c4453b01a133dd3fb', '["*"]', NULL, '2023-10-17 08:20:19', '2023-10-17 08:20:19');
INSERT INTO public.personal_access_tokens VALUES (358, 'App\Models\User', 14, '123456', 'a24ed5c125f5fa6ccd2fe9f799e3318489349e31038f12d66ac2d419d9bd950b', '["*"]', NULL, '2023-10-17 08:20:49', '2023-10-17 08:20:49');
INSERT INTO public.personal_access_tokens VALUES (359, 'App\Models\User', 14, '123456', '2273389bf783e8f6ff77f047051e80d68531af51bba755d72975ae8e104c7118', '["*"]', NULL, '2023-10-17 08:25:17', '2023-10-17 08:25:17');
INSERT INTO public.personal_access_tokens VALUES (360, 'App\Models\User', 14, '123456', '15b52f1c64be69ab7ac04af5ca244f1921632103a0ade93113b28d0ce62e0d29', '["*"]', NULL, '2023-10-17 08:26:04', '2023-10-17 08:26:04');
INSERT INTO public.personal_access_tokens VALUES (361, 'App\Models\User', 14, '123456', '6102fcc14f39904bbc1573dfe972db49a9451c7d30f37207d34ba589521cec32', '["*"]', NULL, '2023-10-17 08:28:05', '2023-10-17 08:28:05');
INSERT INTO public.personal_access_tokens VALUES (362, 'App\Models\User', 14, '123456', 'aa7e54930c134d1f3a765d3e0413a570da5c19f0d948d95ffb4e6c3c6d5c7a93', '["*"]', NULL, '2023-10-17 08:38:24', '2023-10-17 08:38:24');
INSERT INTO public.personal_access_tokens VALUES (363, 'App\Models\User', 14, '123456', '956d37ee026d6aeda66f7c86467c2a854b43e81988eb9a763730fe1138ba505b', '["*"]', NULL, '2023-10-17 08:39:43', '2023-10-17 08:39:43');
INSERT INTO public.personal_access_tokens VALUES (364, 'App\Models\User', 14, '123456', '3feddf953f6ec9e320cbb99a56e24385a03aeebb7cd8c41cab29af9d410de5a5', '["*"]', NULL, '2023-10-17 08:41:58', '2023-10-17 08:41:58');
INSERT INTO public.personal_access_tokens VALUES (365, 'App\Models\User', 14, '123456', 'b40b13221024a0f707e0d5ea7853c1702ed1b0f9525e1f859bc39800d6e0ef94', '["*"]', NULL, '2023-10-17 09:01:39', '2023-10-17 09:01:39');
INSERT INTO public.personal_access_tokens VALUES (366, 'App\Models\User', 14, '123456', 'd3167ae64041e425deff77354745324bfe63e0923160209f8fb11befe4616910', '["*"]', NULL, '2023-10-17 09:11:56', '2023-10-17 09:11:56');
INSERT INTO public.personal_access_tokens VALUES (367, 'App\Models\User', 14, '123456', '559b43f17d4717552d6a049bdb91cbd3c480b0a997b2fe3afeac678534989932', '["*"]', NULL, '2023-10-17 09:16:09', '2023-10-17 09:16:09');
INSERT INTO public.personal_access_tokens VALUES (369, 'App\Models\User', 14, '123456', 'f23ba117f7fe7e1262e7032dd608b60347c75506e0cd8fe4c7546049407d54a5', '["*"]', NULL, '2023-10-17 09:22:54', '2023-10-17 09:22:54');
INSERT INTO public.personal_access_tokens VALUES (370, 'App\Models\User', 14, '123456', '2a5d7388e2f2792a1720dd68930bb787215713983b48f32795e8488db2de35e3', '["*"]', '2023-10-17 09:30:57', '2023-10-17 09:23:59', '2023-10-17 09:30:57');
INSERT INTO public.personal_access_tokens VALUES (371, 'App\Models\User', 14, '123456', '45d1566c544efb550fbc82a642666529e956f9b2b1f5d7247ec42dd33011833a', '["*"]', '2023-10-17 09:36:12', '2023-10-17 09:32:42', '2023-10-17 09:36:12');
INSERT INTO public.personal_access_tokens VALUES (381, 'App\Models\User', 14, '123456', '3877a0a8d9815344df7114e95281e3cc974e3bd8b8f7fc0d2760e2fc673e4274', '["*"]', '2023-10-18 14:15:08', '2023-10-18 14:05:26', '2023-10-18 14:15:08');
INSERT INTO public.personal_access_tokens VALUES (375, 'App\Models\User', 14, '123456', 'd64ce67016f3f25d1b2a0a027d3b5c70b5f51f99b43a0770f635dbf95ce78614', '["*"]', '2023-10-17 16:26:37', '2023-10-17 14:12:34', '2023-10-17 16:26:37');
INSERT INTO public.personal_access_tokens VALUES (378, 'App\Models\User', 14, '123456', '36f4b68b8c5a63254c89eae58d29637ed5c19b91f88a6769e76bba28fd95d6dc', '["*"]', '2023-10-18 08:21:22', '2023-10-18 07:00:57', '2023-10-18 08:21:22');
INSERT INTO public.personal_access_tokens VALUES (379, 'App\Models\User', 14, '123456', 'e3b3fe7991b55ef7d54e77c67de1179ed9a81bcc2881ec3a73718540bc2d27d2', '["*"]', '2023-10-18 13:56:49', '2023-10-18 08:23:45', '2023-10-18 13:56:49');
INSERT INTO public.personal_access_tokens VALUES (380, 'App\Models\User', 14, '123456', 'd75e4243ce4dfe795e46b6e1f3fb2a7e98db2802c4c00f05659286e92a64294b', '["*"]', '2023-10-18 14:05:13', '2023-10-18 14:02:23', '2023-10-18 14:05:13');
INSERT INTO public.personal_access_tokens VALUES (372, 'App\Models\User', 14, '123456', '2dac7624debfb5ce56877a176a5fe05ebbf7aaa4a33bbf68d159d5625ec81d28', '["*"]', '2023-10-18 06:38:06', '2023-10-17 09:42:59', '2023-10-18 06:38:06');
INSERT INTO public.personal_access_tokens VALUES (373, 'App\Models\User', 14, '123456', 'ed2e98e1fc79409d198bbc473e8a8f8c3d636c6e811cf65fa03f3209b71d0551', '["*"]', '2023-10-17 13:54:57', '2023-10-17 13:51:30', '2023-10-17 13:54:57');
INSERT INTO public.personal_access_tokens VALUES (374, 'App\Models\User', 14, '123456', 'fa7255d803e74708112c786dbae33c9f69a3470fa63bdd0507ce8df5cf5cc6fc', '["*"]', '2023-10-18 04:08:19', '2023-10-17 14:07:18', '2023-10-18 04:08:19');
INSERT INTO public.personal_access_tokens VALUES (376, 'App\Models\User', 14, '123456', '7383fb8bfe006cd9cfb11025439b55d8f30883bccf40c02ec33dbc4b23cbb4fe', '["*"]', NULL, '2023-10-18 01:39:23', '2023-10-18 01:39:23');
INSERT INTO public.personal_access_tokens VALUES (377, 'App\Models\User', 14, '123456', 'de4d9c755c1fdb5f4f76b0763301216bbbe917e3c994ff1122a7f31b416392fe', '["*"]', NULL, '2023-10-18 01:47:48', '2023-10-18 01:47:48');
INSERT INTO public.personal_access_tokens VALUES (382, 'App\Models\User', 14, '123456', 'ff92ed1a3101b9d2cc05377beda4fba6e27e2cf2c50a4454212d2ad78a2cfd0a', '["*"]', '2023-10-18 14:17:17', '2023-10-18 14:16:15', '2023-10-18 14:17:17');
INSERT INTO public.personal_access_tokens VALUES (384, 'App\Models\User', 14, '123456', '48aa4f6ecf635338dda830894d499419f8091258daf669d672123efe98333e06', '["*"]', '2023-10-18 14:46:21', '2023-10-18 14:44:25', '2023-10-18 14:46:21');
INSERT INTO public.personal_access_tokens VALUES (383, 'App\Models\User', 14, '123456', 'ca69d5ee9469bac77724b50eee49b947a855b7c1fb4c12f62d305730760d4ec7', '["*"]', '2023-10-18 14:32:04', '2023-10-18 14:25:28', '2023-10-18 14:32:04');
INSERT INTO public.personal_access_tokens VALUES (386, 'App\Models\User', 18, 'tes', 'b48f3425a4a588f6f80f886153a28b822a0cdcec2dd3b70805a353b8067f2fd1', '["*"]', '2023-10-18 15:16:41', '2023-10-18 15:15:01', '2023-10-18 15:16:41');
INSERT INTO public.personal_access_tokens VALUES (388, 'App\Models\User', 21, 'tes', '182f7e7d789acbb5c42b5e0ff1612e2ccf1d6372b2961994040374012dc9201c', '["*"]', '2023-10-18 15:58:58', '2023-10-18 15:49:29', '2023-10-18 15:58:58');
INSERT INTO public.personal_access_tokens VALUES (387, 'App\Models\User', 21, 'tes', 'e2a6366d85113cf3785095c553f269c32846ab3cb5e85e9d41ce5b39eab68e37', '["*"]', NULL, '2023-10-18 15:48:25', '2023-10-18 15:48:25');
INSERT INTO public.personal_access_tokens VALUES (385, 'App\Models\User', 14, '123456', '27eae4e6860af253d82b44cbeda71f711c135e3ae4cdb17df02a1a260c2a7b66', '["*"]', '2023-10-22 22:23:21', '2023-10-18 14:46:31', '2023-10-22 22:23:21');
INSERT INTO public.personal_access_tokens VALUES (368, 'App\Models\User', 14, '123456', 'f64fc532969228eb4a1978b7270a59a69dc46cf698601715dfa0c1a411ca7433', '["*"]', '2023-10-23 13:15:58', '2023-10-17 09:18:48', '2023-10-23 13:15:58');
INSERT INTO public.personal_access_tokens VALUES (391, 'App\Models\User', 14, '123456', 'ed11abdbe9b075b4c6b640dea6c413a48fca551240ac30b71dbfc62ef21d65c3', '["*"]', '2023-10-19 02:37:53', '2023-10-19 01:30:45', '2023-10-19 02:37:53');
INSERT INTO public.personal_access_tokens VALUES (389, 'App\Models\User', 21, 'tes', 'eef8d852948e1cb083aa788905773e254e80a404b5d9caa00120fd650c19899f', '["*"]', '2023-10-19 03:49:02', '2023-10-18 16:05:02', '2023-10-19 03:49:02');
INSERT INTO public.personal_access_tokens VALUES (392, 'App\Models\User', 14, '123456', 'db609bbbf5fb3f2762ccc760bff1239df044acc3cfb2c3c64a3ef7ca9a97ef08', '["*"]', '2023-10-19 06:15:30', '2023-10-19 03:30:26', '2023-10-19 06:15:30');
INSERT INTO public.personal_access_tokens VALUES (390, 'App\Models\User', 14, '123456', 'a04503e848ea1d5c815f5054acfc4412fa4c14de165311a646dfd2876603dc26', '["*"]', '2023-10-22 19:53:06', '2023-10-18 22:27:04', '2023-10-22 19:53:06');
INSERT INTO public.personal_access_tokens VALUES (393, 'App\Models\User', 21, 'tes', '4e8a20a42080f0dda67de4acd6ad7928de7b233daf1a1fd1396d8b5a386786f8', '["*"]', NULL, '2023-10-19 03:49:34', '2023-10-19 03:49:34');
INSERT INTO public.personal_access_tokens VALUES (413, 'App\Models\User', 14, '123456', 'd1531d185cce411a42836d5a21979aafcdf040098f7b45faddbc84e0f531d02f', '["*"]', NULL, '2023-10-20 20:51:10', '2023-10-20 20:51:10');
INSERT INTO public.personal_access_tokens VALUES (406, 'App\Models\User', 24, 'tes', '055495cf555a9e8c88b878acde252daf8b958e645a74dcc64ec4b0df89677675', '["*"]', '2023-10-19 12:50:03', '2023-10-19 12:39:44', '2023-10-19 12:50:03');
INSERT INTO public.personal_access_tokens VALUES (414, 'App\Models\User', 14, '123456', '08750fba3dc4cb4bcafaef62aff736599ca9182bd50122670b2c8e7fa006cee7', '["*"]', NULL, '2023-10-20 20:51:13', '2023-10-20 20:51:13');
INSERT INTO public.personal_access_tokens VALUES (398, 'App\Models\User', 14, '123456', 'b264acec19a4d26854318e89e2667a5c8841e78d47b4c22212e07d8191a9eab2', '["*"]', '2023-10-19 06:51:50', '2023-10-19 04:40:22', '2023-10-19 06:51:50');
INSERT INTO public.personal_access_tokens VALUES (415, 'App\Models\User', 14, '123456', 'a6cc4711b961fde44da634bc490d538e168a15209af4f388530acd06f45455a8', '["*"]', NULL, '2023-10-20 20:52:08', '2023-10-20 20:52:08');
INSERT INTO public.personal_access_tokens VALUES (407, 'App\Models\User', 25, 'coba', 'b1ce1a9625b01c26bd12563962d51a1cfda6e4a27f5467990136ce13078f46a6', '["*"]', '2023-10-19 14:23:22', '2023-10-19 12:48:27', '2023-10-19 14:23:22');
INSERT INTO public.personal_access_tokens VALUES (394, 'App\Models\User', 21, 'tes', 'fac07b5c25473ac58c3465e5175467f4a404630d9f0ab7c8cda6c3b4cb16a4b3', '["*"]', '2023-10-19 03:56:59', '2023-10-19 03:53:13', '2023-10-19 03:56:59');
INSERT INTO public.personal_access_tokens VALUES (400, 'App\Models\User', 14, '123456', 'd76edb0c26547def59ef2b5aa4559ed1a71a93e5a1d2eeff541cc8ec6d88817b', '["*"]', '2023-10-22 13:40:46', '2023-10-19 06:16:05', '2023-10-22 13:40:46');
INSERT INTO public.personal_access_tokens VALUES (395, 'App\Models\User', 22, 'tes', '6e193c63b022dd13bee494f6bbe676689895c6ff69d49af47b62fb1163050ca1', '["*"]', '2023-10-19 03:59:42', '2023-10-19 03:59:03', '2023-10-19 03:59:42');
INSERT INTO public.personal_access_tokens VALUES (416, 'App\Models\User', 14, '123456', '6a60fee0c05db1bb8cbb6e0ce9b03106b9e8dc317c4597e61b62cb349cbbf575', '["*"]', NULL, '2023-10-20 20:52:23', '2023-10-20 20:52:23');
INSERT INTO public.personal_access_tokens VALUES (404, 'App\Models\User', 14, '123456', 'c7d6e73f0c10ad594630e52a37068c643bade2fe2eac95049bb7a6612a1c0435', '["*"]', '2023-10-20 20:52:39', '2023-10-19 08:30:42', '2023-10-20 20:52:39');
INSERT INTO public.personal_access_tokens VALUES (411, 'App\Models\User', 14, '123456', 'ce983f102019d58860816d9737e42fd94834b0f3408aa04a6f7892f526e2cf4d', '["*"]', '2023-10-24 08:42:54', '2023-10-20 02:42:19', '2023-10-24 08:42:54');
INSERT INTO public.personal_access_tokens VALUES (408, 'App\Models\User', 25, 'coba', 'cbc88606fc672578500e6c41ba1d480185358462ba457d8e31939e1a9bb0e281', '["*"]', '2023-10-19 14:42:27', '2023-10-19 14:36:38', '2023-10-19 14:42:27');
INSERT INTO public.personal_access_tokens VALUES (403, 'App\Models\User', 23, 'fajar', '1b8dfa3685518f7903f95996cbe436d4f59577fffea76560c5f6bf90d53f40b0', '["*"]', '2023-10-19 07:00:02', '2023-10-19 06:55:31', '2023-10-19 07:00:02');
INSERT INTO public.personal_access_tokens VALUES (409, 'App\Models\User', 25, 'coba', 'd6b010c740f2c074df43de17c22d13bd8f367a49c4c309970c957fe6673ae9d7', '["*"]', '2023-10-19 15:00:31', '2023-10-19 14:55:42', '2023-10-19 15:00:31');
INSERT INTO public.personal_access_tokens VALUES (396, 'App\Models\User', 14, '123456', '7d9c9167440847f26e9ea741a63fa5b90deffd6d699319ab88cd0d6040b6eace', '["*"]', '2023-10-22 23:16:45', '2023-10-19 04:25:09', '2023-10-22 23:16:45');
INSERT INTO public.personal_access_tokens VALUES (425, 'App\Models\User', 14, '123456', '1603210e65c9ce7f128066751e0e277491b62d48886a6459017176f60785c47f', '["*"]', '2023-10-24 13:47:28', '2023-10-22 11:53:49', '2023-10-24 13:47:28');
INSERT INTO public.personal_access_tokens VALUES (397, 'App\Models\User', 14, '123456', 'df3a7a29860cd83fe06ffe62ae4a0df1f0aeffd257fa77d78254771a0594c578', '["*"]', '2023-10-19 04:45:49', '2023-10-19 04:36:14', '2023-10-19 04:45:49');
INSERT INTO public.personal_access_tokens VALUES (399, 'App\Models\User', 14, '123456', '44de08e0abd20b7785ee6b357687d13718d4fdb8b7b96041cffa5d9b2f4b93aa', '["*"]', '2023-10-19 04:58:31', '2023-10-19 04:58:13', '2023-10-19 04:58:31');
INSERT INTO public.personal_access_tokens VALUES (417, 'App\Models\User', 14, '123456', 'eb8f777c1974e412e5a8866ff7790c540ec55e7ea1421b29c485ee05e3d4423e', '["*"]', NULL, '2023-10-20 20:54:03', '2023-10-20 20:54:03');
INSERT INTO public.personal_access_tokens VALUES (402, 'App\Models\User', 14, '123456', '9a74503b746b9fc7284377605ce6c8f5f72c95f43ccc1c63b350ada4c470f6ac', '["*"]', '2023-10-19 07:25:20', '2023-10-19 06:40:20', '2023-10-19 07:25:20');
INSERT INTO public.personal_access_tokens VALUES (418, 'App\Models\User', 14, '123456', '5448d54b52037f4759cc7b9a70d592fec4a89f59b628f21c2fe8585e3582732d', '["*"]', NULL, '2023-10-20 20:54:07', '2023-10-20 20:54:07');
INSERT INTO public.personal_access_tokens VALUES (405, 'App\Models\User', 22, 'tes', 'a09d3828f98c249894642297cfd1eb250474c435201e7f24565a34f5ba138f8b', '["*"]', '2023-10-19 12:34:04', '2023-10-19 12:32:18', '2023-10-19 12:34:04');
INSERT INTO public.personal_access_tokens VALUES (419, 'App\Models\User', 14, '123456', 'd77f53eb410b34000ca3bfc2f091688b8114d0e55ad4e2ef3ba8ae999f2b1b91', '["*"]', NULL, '2023-10-20 23:08:31', '2023-10-20 23:08:31');
INSERT INTO public.personal_access_tokens VALUES (420, 'App\Models\User', 14, '123456', '82494a14cb5e88af16c2345e6759eebf36e06201f36dd10bb1f5d53e815a3570', '["*"]', NULL, '2023-10-21 09:06:24', '2023-10-21 09:06:24');
INSERT INTO public.personal_access_tokens VALUES (424, 'App\Models\User', 14, '123456', '543052b6c32d0978d20285d522671492439d637d96f92f6de8c64c04013c7dad', '["*"]', '2023-10-22 12:23:34', '2023-10-22 11:31:22', '2023-10-22 12:23:34');
INSERT INTO public.personal_access_tokens VALUES (426, 'App\Models\User', 14, '123456', '4ed4cad87e9460d52f1ff8b7343206e46384bb3ed07763244713c5cca922ad5b', '["*"]', NULL, '2023-10-22 12:23:38', '2023-10-22 12:23:38');
INSERT INTO public.personal_access_tokens VALUES (427, 'App\Models\User', 14, '123456', '0f486717605180391cea8c282e3dc4196f002671aaaa8f91fbcb5a5c4260ff8f', '["*"]', NULL, '2023-10-22 12:24:04', '2023-10-22 12:24:04');
INSERT INTO public.personal_access_tokens VALUES (421, 'App\Models\User', 14, '123456', '80a6f7626d130ff35b5ed5a3bdb38cc9cc027c9ac950815653632ed254580ee5', '["*"]', '2023-10-21 09:14:54', '2023-10-21 09:07:30', '2023-10-21 09:14:54');
INSERT INTO public.personal_access_tokens VALUES (422, 'App\Models\User', 14, '123456', '257bba08ca9549f5767f598bb9afcfa0feff50bbcab96640b7cafc991bb10c08', '["*"]', NULL, '2023-10-21 11:01:09', '2023-10-21 11:01:09');
INSERT INTO public.personal_access_tokens VALUES (428, 'App\Models\User', 14, '123456', 'fd426589f08bf731b26badca0d11c35fbce8651be2a7bd3c1f6ac59335164acb', '["*"]', NULL, '2023-10-22 12:24:05', '2023-10-22 12:24:05');
INSERT INTO public.personal_access_tokens VALUES (401, 'App\Models\User', 14, '123456', '1f7f7e0393e7e0a546908bff887ca7fee427b81009547a2adb5955f70e681cf4', '["*"]', '2023-10-22 09:51:19', '2023-10-19 06:24:43', '2023-10-22 09:51:19');
INSERT INTO public.personal_access_tokens VALUES (410, 'App\Models\User', 24, 'tes', 'c756610c1fb5b9dcfde12ec1acac56f39792f14287459eacce2d2314a9d926fb', '["*"]', '2023-10-20 08:01:40', '2023-10-19 15:00:57', '2023-10-20 08:01:40');
INSERT INTO public.personal_access_tokens VALUES (423, 'App\Models\User', 14, '123456', '93802a974b791d5a0c5e6f74372c96018ae2e0f218110662a915ad6eebebca38', '["*"]', NULL, '2023-10-22 09:51:27', '2023-10-22 09:51:27');
INSERT INTO public.personal_access_tokens VALUES (429, 'App\Models\User', 14, '123456', 'f57ec4fb7376bc3ca750510ff130e8f866fb204f22bb3cbf7a68ec3b8c77b847', '["*"]', NULL, '2023-10-22 12:24:07', '2023-10-22 12:24:07');
INSERT INTO public.personal_access_tokens VALUES (430, 'App\Models\User', 14, '123456', '59162b6f3115175275f0b180d3ea3bddbfd1bf9cb5dec132c198e4671453257a', '["*"]', NULL, '2023-10-22 12:24:07', '2023-10-22 12:24:07');
INSERT INTO public.personal_access_tokens VALUES (431, 'App\Models\User', 14, '123456', '352edbcb326f85d535548d13fd3838db763cabd417bfd35baed25b2fed02ac61', '["*"]', NULL, '2023-10-22 12:24:08', '2023-10-22 12:24:08');
INSERT INTO public.personal_access_tokens VALUES (432, 'App\Models\User', 14, '123456', '495450bb08bb368382754a5f0e9e54b986370c93d86d1ae9aaf0bccc05b1d9ea', '["*"]', NULL, '2023-10-22 12:24:09', '2023-10-22 12:24:09');
INSERT INTO public.personal_access_tokens VALUES (412, 'App\Models\User', 14, '123456', 'f870ad16d5224c17f332456afbdcb64c8edb5f61be29563926479db9720a2319', '["*"]', '2023-10-20 09:07:35', '2023-10-20 07:21:22', '2023-10-20 09:07:35');
INSERT INTO public.personal_access_tokens VALUES (433, 'App\Models\User', 14, '123456', '5b2fc8d65c8ed6c09a7b50ab768a4e8ad40f95fcee80a4461cef0eadaa4517d5', '["*"]', NULL, '2023-10-22 12:24:23', '2023-10-22 12:24:23');
INSERT INTO public.personal_access_tokens VALUES (434, 'App\Models\User', 14, '123456', 'bffd6074a79ee86c7751697c10d9f3bfa0f0ef7d2561dd4b060af14b1ae864a0', '["*"]', NULL, '2023-10-22 13:10:45', '2023-10-22 13:10:45');
INSERT INTO public.personal_access_tokens VALUES (435, 'App\Models\User', 14, '123456', '1c45818c7768a1efbda5b00f4971b279bcdd7cadaede25bfc717e48bf387de5a', '["*"]', NULL, '2023-10-22 13:10:52', '2023-10-22 13:10:52');
INSERT INTO public.personal_access_tokens VALUES (436, 'App\Models\User', 14, '123456', '1bf19a92d836cc52cddebd5063512b2134f9a5cd95888a29c84079072efb656c', '["*"]', NULL, '2023-10-22 13:10:54', '2023-10-22 13:10:54');
INSERT INTO public.personal_access_tokens VALUES (437, 'App\Models\User', 14, '123456', '4c04c5a68f2798a3ebe43f48f9bafc158f49a301e11f4edc3c28f91dc9fe0ea0', '["*"]', NULL, '2023-10-22 13:10:56', '2023-10-22 13:10:56');
INSERT INTO public.personal_access_tokens VALUES (438, 'App\Models\User', 14, '123456', '818ebbd8e511d395b2be0dedc26db718c2402b45585ac995493ee8e767df7d98', '["*"]', NULL, '2023-10-22 13:10:58', '2023-10-22 13:10:58');
INSERT INTO public.personal_access_tokens VALUES (439, 'App\Models\User', 20, 'ppp', '861a41adeb5e9f8b1253051d8e2ba64682d8641025367aede08d3d44edea45e6', '["*"]', NULL, '2023-10-22 13:11:34', '2023-10-22 13:11:34');
INSERT INTO public.personal_access_tokens VALUES (440, 'App\Models\User', 14, '123456', '022a00f5628fd1f4289869391fe02d7eb2b2c4e0e292eaea70bc27bc635e1296', '["*"]', NULL, '2023-10-22 13:11:48', '2023-10-22 13:11:48');
INSERT INTO public.personal_access_tokens VALUES (441, 'App\Models\User', 14, '123456', '029faca2b4e6ab02d5f29c0cab2d9292ac6a598f13c462e07895035822b1cf1b', '["*"]', NULL, '2023-10-22 13:16:47', '2023-10-22 13:16:47');
INSERT INTO public.personal_access_tokens VALUES (442, 'App\Models\User', 14, '123456', '240cd685f9ae9cc791156866dd8c88a1e8459d05fc69e59747cb508c857c8b38', '["*"]', NULL, '2023-10-22 13:17:54', '2023-10-22 13:17:54');
INSERT INTO public.personal_access_tokens VALUES (443, 'App\Models\User', 26, 'testes', 'cfedb767e8bbcc7e4774ac12c154bce873414b21f142eeb6dd981cbbf6a7f68b', '["*"]', NULL, '2023-10-22 13:20:36', '2023-10-22 13:20:36');
INSERT INTO public.personal_access_tokens VALUES (444, 'App\Models\User', 26, 'testes', 'eb2889a5b07a435101cc9ffb8e9808b62f5a1d0becf138e9ecaff5f615423a47', '["*"]', NULL, '2023-10-22 13:20:40', '2023-10-22 13:20:40');
INSERT INTO public.personal_access_tokens VALUES (445, 'App\Models\User', 26, 'testes', 'b7c1bfd49272799fe548a3cd7d7263787e9b23c2db9d2b7dd48d11ddc3e5be61', '["*"]', NULL, '2023-10-22 13:21:12', '2023-10-22 13:21:12');
INSERT INTO public.personal_access_tokens VALUES (446, 'App\Models\User', 26, 'testes', '767b0a1dc4532afcb7acfddeeac05cea4109eb38f650bf6e38a26bc8b3ea356a', '["*"]', NULL, '2023-10-22 13:21:20', '2023-10-22 13:21:20');
INSERT INTO public.personal_access_tokens VALUES (447, 'App\Models\User', 26, 'testes', '3527c6d51640e2a137942e2680683f71896d9a553ee7d439f04b43c28f9f5c69', '["*"]', NULL, '2023-10-22 13:21:24', '2023-10-22 13:21:24');
INSERT INTO public.personal_access_tokens VALUES (448, 'App\Models\User', 26, 'testes', '68cc9ffb10e2cf4cba51e72fb0bab38189c85fd5322b6378624344adfb339b63', '["*"]', NULL, '2023-10-22 13:21:27', '2023-10-22 13:21:27');
INSERT INTO public.personal_access_tokens VALUES (449, 'App\Models\User', 26, 'testes', '36d7d8d4b530cd284db65ae5820881ce6b8488b47289ed3285b28776f94ece32', '["*"]', NULL, '2023-10-22 13:22:10', '2023-10-22 13:22:10');
INSERT INTO public.personal_access_tokens VALUES (450, 'App\Models\User', 14, '123456', '79e869491f55bb2b2d8fc67bf7e92444434e55f954b76848564191ae95898bd0', '["*"]', NULL, '2023-10-22 13:50:29', '2023-10-22 13:50:29');
INSERT INTO public.personal_access_tokens VALUES (473, 'App\Models\User', 14, '123456', '8c006ad6077bcbd2a3a8902856959d9ad1fb379ba2c1987125388f402c995e20', '["*"]', '2023-10-23 11:58:59', '2023-10-23 11:27:36', '2023-10-23 11:58:59');
INSERT INTO public.personal_access_tokens VALUES (461, 'App\Models\User', 25, 'coba', '3f6916287dfb71b3a52033d4435479df5c386dc06cd1a3edbdad8960b161d60f', '["*"]', '2023-10-23 10:15:30', '2023-10-23 10:15:04', '2023-10-23 10:15:30');
INSERT INTO public.personal_access_tokens VALUES (462, 'App\Models\User', 24, 'tes', 'ccd94dad5e315183418cc7da5b329678188c0abc4dece79dcb32aee5d3eb321d', '["*"]', NULL, '2023-10-23 10:15:40', '2023-10-23 10:15:40');
INSERT INTO public.personal_access_tokens VALUES (455, 'App\Models\User', 14, '123456', '271785abaf533b58a529ee9de0e22801658766e1fc415bf044c9dc8fdfecc40f', '["*"]', '2023-10-22 22:50:36', '2023-10-22 22:46:59', '2023-10-22 22:50:36');
INSERT INTO public.personal_access_tokens VALUES (463, 'App\Models\User', 24, 'tes', '9334264c3f72a1cf2b01d9f9cba31dc116f2c1ace136ddc47d66a23e74103d8b', '["*"]', NULL, '2023-10-23 10:15:52', '2023-10-23 10:15:52');
INSERT INTO public.personal_access_tokens VALUES (464, 'App\Models\User', 25, 'coba', 'e68836f5dab3086617b8e456701537e505961cc358c24c0e597981b68b9622aa', '["*"]', NULL, '2023-10-23 10:16:04', '2023-10-23 10:16:04');
INSERT INTO public.personal_access_tokens VALUES (465, 'App\Models\User', 27, 'tes', '48267620e4eddebaac5e6ac9862dd1879c27dea88dfd57901d44ddcb64130455', '["*"]', NULL, '2023-10-23 10:53:25', '2023-10-23 10:53:25');
INSERT INTO public.personal_access_tokens VALUES (466, 'App\Models\User', 27, 'tes', 'cd37278529b2eaec5cc1e18940ffae42d38694349c0b01d73c85cd95544e01f4', '["*"]', NULL, '2023-10-23 10:54:42', '2023-10-23 10:54:42');
INSERT INTO public.personal_access_tokens VALUES (467, 'App\Models\User', 27, 'tes', '703e079126416b729b8404d2010519c34cae5fd62ce1910bc87c6dee62dd8273', '["*"]', NULL, '2023-10-23 10:54:50', '2023-10-23 10:54:50');
INSERT INTO public.personal_access_tokens VALUES (468, 'App\Models\User', 27, 'tes', '9ba5111b1dcc41c0555e4bfbafce8df84ec4bf84f63504a816dd47385f4a695c', '["*"]', NULL, '2023-10-23 10:57:12', '2023-10-23 10:57:12');
INSERT INTO public.personal_access_tokens VALUES (469, 'App\Models\User', 27, 'tes', 'cb3894c092ff973ed6bae867703b9097b9d5ddc4f9dcad2abd22b9eb0cd70af8', '["*"]', NULL, '2023-10-23 11:22:02', '2023-10-23 11:22:02');
INSERT INTO public.personal_access_tokens VALUES (470, 'App\Models\User', 27, 'tes', '2b15987fe3075ac0574409f54099f014ad574ae49d379f489091b6596a427e9f', '["*"]', NULL, '2023-10-23 11:22:32', '2023-10-23 11:22:32');
INSERT INTO public.personal_access_tokens VALUES (471, 'App\Models\User', 27, 'tes', 'a2f2c252bfdbba906d6d6c16674c9db423dcc6cb589f52f8d002e4f1090ad2ae', '["*"]', NULL, '2023-10-23 11:22:42', '2023-10-23 11:22:42');
INSERT INTO public.personal_access_tokens VALUES (472, 'App\Models\User', 27, 'tes', '55b9805b08ee7fcb522efc2f9f3792628ee42902eaaf268767c37e16bfc2817e', '["*"]', NULL, '2023-10-23 11:22:45', '2023-10-23 11:22:45');
INSERT INTO public.personal_access_tokens VALUES (456, 'App\Models\User', 14, '123456', 'bb22f3929da0dfa12609589066297da96a522e0f1851f1cd153c7778a123cff1', '["*"]', '2023-10-22 23:45:22', '2023-10-22 23:00:12', '2023-10-22 23:45:22');
INSERT INTO public.personal_access_tokens VALUES (478, 'App\Models\User', 14, '123456', '867a0e8ab9f9adccfba679904358025671e190fa88173d28cec1cdbf60141f36', '["*"]', NULL, '2023-10-23 11:59:03', '2023-10-23 11:59:03');
INSERT INTO public.personal_access_tokens VALUES (458, 'App\Models\User', 14, '123456', '27d368936653e9adca82b16b497f52a009f1ca5d363d80c3e5bc58273b4a6713', '["*"]', '2023-10-23 08:58:03', '2023-10-23 08:57:12', '2023-10-23 08:58:03');
INSERT INTO public.personal_access_tokens VALUES (451, 'App\Models\User', 14, '123456', '894333cf8d0d52e04b992c34524771441165e0b385a448c9b45ba60fd1e80d30', '["*"]', '2023-10-23 11:28:24', '2023-10-22 20:01:03', '2023-10-23 11:28:24');
INSERT INTO public.personal_access_tokens VALUES (457, 'App\Models\User', 24, 'tes', '3c6ca59665cc7a3544976601ae11b9f60423e856036cff7e3751e24b87d73ce9', '["*"]', '2023-10-23 10:06:13', '2023-10-23 08:42:16', '2023-10-23 10:06:13');
INSERT INTO public.personal_access_tokens VALUES (452, 'App\Models\User', 14, '123456', 'b6f411c2547105a754099ebf4f979c0788c5fd9c23e5411df6ce2e20ec2b0716', '["*"]', '2023-10-22 22:34:09', '2023-10-22 22:30:16', '2023-10-22 22:34:09');
INSERT INTO public.personal_access_tokens VALUES (479, 'App\Models\User', 14, '123456', '292cc3cf41052197d3c1a9e7d442f55932be6f9298ea548d9cafa593ae0c1bd4', '["*"]', NULL, '2023-10-23 12:00:34', '2023-10-23 12:00:34');
INSERT INTO public.personal_access_tokens VALUES (459, 'App\Models\User', 24, 'tes', '48fa54963a7573b1f3dfb1a73b0f53b2ccd459abf27a17231578ec7c48f5f517', '["*"]', '2023-10-23 10:13:53', '2023-10-23 10:11:26', '2023-10-23 10:13:53');
INSERT INTO public.personal_access_tokens VALUES (453, 'App\Models\User', 14, '123456', 'd2859488a46def8b6483676fc3de48d6d6829eba4dca23e1cdec14e6dcf0b468', '["*"]', '2023-10-22 22:36:42', '2023-10-22 22:35:25', '2023-10-22 22:36:42');
INSERT INTO public.personal_access_tokens VALUES (454, 'App\Models\User', 14, '123456', '6e729d84de242d898d4530c2f6a04f4fa7a159e8f9a25617a4abe92d0710672f', '["*"]', NULL, '2023-10-22 22:42:52', '2023-10-22 22:42:52');
INSERT INTO public.personal_access_tokens VALUES (460, 'App\Models\User', 24, 'tes', 'd5da1da47b9f138c918882c6394e7d5bdb7a8d5639cf1fca37a1a83f6fd320f9', '["*"]', NULL, '2023-10-23 10:14:08', '2023-10-23 10:14:08');
INSERT INTO public.personal_access_tokens VALUES (480, 'App\Models\User', 14, '123456', 'adc4225ea8648457f53a98ba51adfe2641a5d2e37ca50efde99fcd52d1669dda', '["*"]', NULL, '2023-10-23 12:00:41', '2023-10-23 12:00:41');
INSERT INTO public.personal_access_tokens VALUES (481, 'App\Models\User', 14, '123456', '79d18605629b16eb8e743365debf58887d6f2738aa636f1918efa4b5028b947b', '["*"]', NULL, '2023-10-23 12:01:21', '2023-10-23 12:01:21');
INSERT INTO public.personal_access_tokens VALUES (474, 'App\Models\User', 14, '123456', 'bce88bfd28bd29c9efbd56b718ae35885cebd82ba892c550418426766d10a3eb', '["*"]', NULL, '2023-10-23 11:57:12', '2023-10-23 11:57:12');
INSERT INTO public.personal_access_tokens VALUES (475, 'App\Models\User', 14, '123456', 'e86df3702fb4bca1db38344d2d2ff06baa0fc80345e194f4861b66e8f71573c2', '["*"]', NULL, '2023-10-23 11:58:37', '2023-10-23 11:58:37');
INSERT INTO public.personal_access_tokens VALUES (476, 'App\Models\User', 14, '123456', '2d7373579ccbffb309ad93e54f54b2e400f0f33210fec6b627b6f1031d9b00d4', '["*"]', NULL, '2023-10-23 11:58:49', '2023-10-23 11:58:49');
INSERT INTO public.personal_access_tokens VALUES (477, 'App\Models\User', 14, '123456', '66fc9a5eac9fea9e2cc666caa4654b7b11a70afe990dd30a31fa6e62b9a644e2', '["*"]', NULL, '2023-10-23 11:58:54', '2023-10-23 11:58:54');
INSERT INTO public.personal_access_tokens VALUES (482, 'App\Models\User', 27, 'tes', '77b274f42917d03548bbe6fb70b6aac12c285fbde5e65449c4109dc92b36eaeb', '["*"]', NULL, '2023-10-23 12:06:16', '2023-10-23 12:06:16');
INSERT INTO public.personal_access_tokens VALUES (483, 'App\Models\User', 14, '123456', '8bd539e5eac8d53db680034a5e2a34bd30ab0d3003ba3867925737a9f7dba7a2', '["*"]', NULL, '2023-10-23 12:06:41', '2023-10-23 12:06:41');
INSERT INTO public.personal_access_tokens VALUES (484, 'App\Models\User', 14, '123456', 'b77e457af681d430f66000a6be96881dfd037375f82a909f8b8e256e1a446165', '["*"]', NULL, '2023-10-23 12:14:31', '2023-10-23 12:14:31');
INSERT INTO public.personal_access_tokens VALUES (485, 'App\Models\User', 14, '123456', 'c11abe951b09aa0dc841dab94538ac11a60128c7da80a209742a40e8bb6fd1fc', '["*"]', NULL, '2023-10-23 12:15:43', '2023-10-23 12:15:43');
INSERT INTO public.personal_access_tokens VALUES (486, 'App\Models\User', 14, '123456', '01140bedd10381d82da23d35e8fa8f1b3ae8a49802a4d73c372efe611b3b22c7', '["*"]', NULL, '2023-10-23 13:11:27', '2023-10-23 13:11:27');
INSERT INTO public.personal_access_tokens VALUES (487, 'App\Models\User', 14, '123456', 'a39709011a6b1b355b83b353f47d8fd12f416e56f852f328debdcd4385941a3a', '["*"]', NULL, '2023-10-23 13:11:49', '2023-10-23 13:11:49');
INSERT INTO public.personal_access_tokens VALUES (488, 'App\Models\User', 14, '123456', 'a3464e448e5cf9d21b9ede0f2b76ed9299309a90bfe18ed2c82816854debad9e', '["*"]', NULL, '2023-10-23 13:15:44', '2023-10-23 13:15:44');
INSERT INTO public.personal_access_tokens VALUES (489, 'App\Models\User', 14, '123456', '82d23dbdbb5a1a5179c985602a63a5b1eb8637f7c1f7ef66c62f33164456ee9b', '["*"]', NULL, '2023-10-23 13:16:33', '2023-10-23 13:16:33');
INSERT INTO public.personal_access_tokens VALUES (490, 'App\Models\User', 14, '123456', '8f45741bd6704eb0616684c0f51679a713c25149986354501e135398cc5cd4dc', '["*"]', NULL, '2023-10-23 13:16:36', '2023-10-23 13:16:36');
INSERT INTO public.personal_access_tokens VALUES (491, 'App\Models\User', 26, 'testes', '4b35b34f45f21a31031e911d0fbebea3cc8304dee218814bceda80a6984356bb', '["*"]', NULL, '2023-10-23 13:17:12', '2023-10-23 13:17:12');
INSERT INTO public.personal_access_tokens VALUES (492, 'App\Models\User', 14, '123456', '7e6d276950b5104ca4283cd4856918949345a31f4fce4120a66ddfe1e2b3974c', '["*"]', NULL, '2023-10-23 13:17:32', '2023-10-23 13:17:32');
INSERT INTO public.personal_access_tokens VALUES (493, 'App\Models\User', 14, '123456', '8b2cd4239add6e3886141d19e71663a3847bbb971c46a74c6e35dcc38c495f8a', '["*"]', NULL, '2023-10-23 13:19:05', '2023-10-23 13:19:05');
INSERT INTO public.personal_access_tokens VALUES (494, 'App\Models\User', 14, '123456', '01eab6ab50a2d7a85d639a26f6cb97a252e38660372413af00497808d8541eb4', '["*"]', NULL, '2023-10-23 13:19:48', '2023-10-23 13:19:48');
INSERT INTO public.personal_access_tokens VALUES (495, 'App\Models\User', 14, '123456', 'c7140ea628d4f4d9e37323a01e7912a457adcfb4149d1d2621b8f7e82357bb93', '["*"]', NULL, '2023-10-23 13:37:47', '2023-10-23 13:37:47');
INSERT INTO public.personal_access_tokens VALUES (496, 'App\Models\User', 14, '123456', '93ad262a30387ed30377dd1cd2b7fe6e86134138522856b99ad829396d07a2ee', '["*"]', NULL, '2023-10-23 14:26:08', '2023-10-23 14:26:08');
INSERT INTO public.personal_access_tokens VALUES (497, 'App\Models\User', 14, '123456', 'ec6dff1a501e5a59c1c3f625f5cc268252a8f769f7dd76eb36664ac43ca49353', '["*"]', NULL, '2023-10-23 14:26:09', '2023-10-23 14:26:09');
INSERT INTO public.personal_access_tokens VALUES (498, 'App\Models\User', 14, '123456', 'd6b4c243ac600d1723e819b3896da13dad76fe4f2fc9f8853466efc704cc90aa', '["*"]', NULL, '2023-10-23 14:26:17', '2023-10-23 14:26:17');
INSERT INTO public.personal_access_tokens VALUES (499, 'App\Models\User', 14, '123456', 'b25ff57f5eb62f439ae1844b4e6decc1246953d968c89320a4957d026a8d50da', '["*"]', NULL, '2023-10-23 15:54:33', '2023-10-23 15:54:33');
INSERT INTO public.personal_access_tokens VALUES (500, 'App\Models\User', 27, 'tes', '8bccf610ed398cb714e1fe680b6f8a4c5205baf0cac3ae4a23ecaa91f7de9535', '["*"]', NULL, '2023-10-23 15:59:51', '2023-10-23 15:59:51');
INSERT INTO public.personal_access_tokens VALUES (501, 'App\Models\User', 14, '123456', '88141a76798f30f4514802e2716a8f6dd95ee961f16749e7130190c4473135c7', '["*"]', NULL, '2023-10-23 16:46:24', '2023-10-23 16:46:24');
INSERT INTO public.personal_access_tokens VALUES (502, 'App\Models\User', 14, '123456', '51dca7cd1883c26687fd68a2cf0bd5d90c2b374e26dee380c5fae7c08638c794', '["*"]', NULL, '2023-10-23 16:46:27', '2023-10-23 16:46:27');
INSERT INTO public.personal_access_tokens VALUES (530, 'App\Models\User', 14, '123456', 'f059ad914cf76e027e5e1d6df5919654852b7d5c7f02a4f77aa8ab3b468777f4', '["*"]', NULL, '2023-10-24 09:12:53', '2023-10-24 09:12:53');
INSERT INTO public.personal_access_tokens VALUES (504, 'App\Models\User', 27, 'tes', '1ade97e3cac0ccc698cda6bb7860bd624987fcbb0ef3ddd21460b083864efee5', '["*"]', NULL, '2023-10-24 08:34:20', '2023-10-24 08:34:20');
INSERT INTO public.personal_access_tokens VALUES (505, 'App\Models\User', 14, '123456', '1ef2f96ea7bdc19261326772f63d52a866e0afb63e719b2e9742b9c1ce200c06', '["*"]', NULL, '2023-10-24 08:34:26', '2023-10-24 08:34:26');
INSERT INTO public.personal_access_tokens VALUES (506, 'App\Models\User', 14, '123456', '80824541c63d5377517884814bd070dcae2444e37027a6c88cbd01f6b0454cb9', '["*"]', NULL, '2023-10-24 08:34:34', '2023-10-24 08:34:34');
INSERT INTO public.personal_access_tokens VALUES (507, 'App\Models\User', 14, '123456', '9fbc0e062df12bbb18fc79308f1c12d14e57625d557b259f3d7056e3725ff3d3', '["*"]', NULL, '2023-10-24 08:36:38', '2023-10-24 08:36:38');
INSERT INTO public.personal_access_tokens VALUES (508, 'App\Models\User', 14, '123456', 'a4ed2d07f9780adefeb510db605d53950bf362a12e743c0a6a377eabda1b5b25', '["*"]', NULL, '2023-10-24 08:36:40', '2023-10-24 08:36:40');
INSERT INTO public.personal_access_tokens VALUES (509, 'App\Models\User', 14, '123456', 'c477d3ae6dbfb8231f624f71c924904eed10c6be85aae93742596f788cc2cb60', '["*"]', NULL, '2023-10-24 08:36:43', '2023-10-24 08:36:43');
INSERT INTO public.personal_access_tokens VALUES (510, 'App\Models\User', 14, '123456', 'c229e00d6285d4c8e1ab93561fcf230827a75d3f68130ce3a1ac7f0ed589db6b', '["*"]', NULL, '2023-10-24 08:37:03', '2023-10-24 08:37:03');
INSERT INTO public.personal_access_tokens VALUES (511, 'App\Models\User', 27, 'tes', '15b52822579f1bc51e9ffb38567a7c9c5fd7e88762dfb35f8d71e5b3759c0c96', '["*"]', NULL, '2023-10-24 08:37:35', '2023-10-24 08:37:35');
INSERT INTO public.personal_access_tokens VALUES (512, 'App\Models\User', 27, 'tes', 'c0f1b250a20c5291fe81c39a16e60012a07bb9c7d31d7fdc29e0ed67c4320a0a', '["*"]', NULL, '2023-10-24 08:40:01', '2023-10-24 08:40:01');
INSERT INTO public.personal_access_tokens VALUES (513, 'App\Models\User', 14, '123456', 'a022adfd4fcb50c06e866e3bc2f0f385218c54a796f48054aee23ddfe024528e', '["*"]', NULL, '2023-10-24 08:40:06', '2023-10-24 08:40:06');
INSERT INTO public.personal_access_tokens VALUES (514, 'App\Models\User', 14, '123456', '4963821ba6847e26ba6258016c68cb5bc6629441e25c0b17676ce1116ca8630a', '["*"]', NULL, '2023-10-24 08:40:08', '2023-10-24 08:40:08');
INSERT INTO public.personal_access_tokens VALUES (515, 'App\Models\User', 14, '123456', '1b60827511b12539cf97f59c083077d41644f79952aca754409d71606315a5a9', '["*"]', NULL, '2023-10-24 08:40:10', '2023-10-24 08:40:10');
INSERT INTO public.personal_access_tokens VALUES (516, 'App\Models\User', 14, '123456', '1a75aac5edf85c4a25f00d03a5bf752ee86721b0fcc3fc8d450577a5d627d252', '["*"]', NULL, '2023-10-24 08:40:16', '2023-10-24 08:40:16');
INSERT INTO public.personal_access_tokens VALUES (517, 'App\Models\User', 14, '123456', 'af4887907d2c77ec931d2751e19ec7d58a40b2753ec9c7c248212398ca194db4', '["*"]', NULL, '2023-10-24 08:40:33', '2023-10-24 08:40:33');
INSERT INTO public.personal_access_tokens VALUES (518, 'App\Models\User', 14, '123456', '9f58987a54db762a3e6995cdcdf05ffd5fb46dcbf82bd182d76d3433bd27823f', '["*"]', NULL, '2023-10-24 08:42:49', '2023-10-24 08:42:49');
INSERT INTO public.personal_access_tokens VALUES (519, 'App\Models\User', 14, '123456', 'd6f6ff7b8e6fe13a91908dff6c5abbbb8a1f799ed9967a9fadb3342c1b16b006', '["*"]', NULL, '2023-10-24 08:43:20', '2023-10-24 08:43:20');
INSERT INTO public.personal_access_tokens VALUES (520, 'App\Models\User', 14, '123456', 'fa43e8ecfdcd7f0e8a72cdcc087c86656c8e95c7e4430d1fe890c6a5531c50c0', '["*"]', NULL, '2023-10-24 08:43:30', '2023-10-24 08:43:30');
INSERT INTO public.personal_access_tokens VALUES (521, 'App\Models\User', 14, '123456', 'f87b30d363423a41409dff4cfc2ad0d857b45db50bdec5815dc9cf41b98e607b', '["*"]', NULL, '2023-10-24 08:43:42', '2023-10-24 08:43:42');
INSERT INTO public.personal_access_tokens VALUES (522, 'App\Models\User', 26, 'testes', 'da6c53cf63cd5bfcb612860b734129456b84ad2a83c3ed8ba1c33e708ec1e26c', '["*"]', NULL, '2023-10-24 08:43:55', '2023-10-24 08:43:55');
INSERT INTO public.personal_access_tokens VALUES (523, 'App\Models\User', 14, '123456', '1f9fee7066aac5a978ed5ed5d188d2da5f49557a89d69da052c314025ad5bdba', '["*"]', NULL, '2023-10-24 08:44:08', '2023-10-24 08:44:08');
INSERT INTO public.personal_access_tokens VALUES (524, 'App\Models\User', 14, '123456', 'c3eb0d518a322e9511eaae49b51dc02e8d92c43cf40689150fa0bc96aa73c9ed', '["*"]', NULL, '2023-10-24 08:44:17', '2023-10-24 08:44:17');
INSERT INTO public.personal_access_tokens VALUES (525, 'App\Models\User', 14, '123456', '6be92bfe0f6192964babc7a815f8279dc5632aca7ca39e64d59463d349a141fd', '["*"]', NULL, '2023-10-24 08:44:42', '2023-10-24 08:44:42');
INSERT INTO public.personal_access_tokens VALUES (526, 'App\Models\User', 14, '123456', 'b1c319d3f8cfd2e624fb1bafcdf3eb92f71187e433204ce8bb30f35739744b96', '["*"]', NULL, '2023-10-24 08:45:28', '2023-10-24 08:45:28');
INSERT INTO public.personal_access_tokens VALUES (531, 'App\Models\User', 14, '123456', '0146743def9dca949ad5433df3d9abacf10aa32be4a7bfdc769606e1fd1ae06c', '["*"]', NULL, '2023-10-24 09:12:56', '2023-10-24 09:12:56');
INSERT INTO public.personal_access_tokens VALUES (529, 'App\Models\User', 14, '123456', '1d06db629c9344aac0440baef5b707d0a724ceb7fc247ae828034e958f22023c', '["*"]', NULL, '2023-10-24 08:58:28', '2023-10-24 08:58:28');
INSERT INTO public.personal_access_tokens VALUES (527, 'App\Models\User', 14, '123456', 'cbfcaf8ab472471caddb6be93cd67016f9b9b8c76c1401cbc7f570e351500980', '["*"]', '2023-10-24 09:02:07', '2023-10-24 08:54:32', '2023-10-24 09:02:07');
INSERT INTO public.personal_access_tokens VALUES (532, 'App\Models\User', 23, 'fajar', 'be1b4616361b70a90d4c9dbd3128f8acc58f2bf086d809cbe3e23f6874c56251', '["*"]', NULL, '2023-10-24 10:22:44', '2023-10-24 10:22:44');
INSERT INTO public.personal_access_tokens VALUES (533, 'App\Models\User', 27, 'tes', 'e36dc03822a44f269f240f371100c16a43cbb4e2ff65997a3d13cec50689f737', '["*"]', NULL, '2023-10-24 10:23:08', '2023-10-24 10:23:08');
INSERT INTO public.personal_access_tokens VALUES (534, 'App\Models\User', 14, '123456', '0b221134d3a1f51c0ca497e03a67f2ce9866b540f00d8c5ccfd027409df5d2dc', '["*"]', NULL, '2023-10-24 10:23:18', '2023-10-24 10:23:18');
INSERT INTO public.personal_access_tokens VALUES (503, 'App\Models\User', 14, '123456', '2a9ed92942fdccd9c6aae09dbe025d2ec8375475cd69c494c1c5e4cda42f5c50', '["*"]', '2023-10-24 14:03:10', '2023-10-23 20:19:50', '2023-10-24 14:03:10');
INSERT INTO public.personal_access_tokens VALUES (528, 'App\Models\User', 14, '123456', '004e86b13d5b6e64eac7e2d3878152fc6445a9930df9ae78764b7152fcddd089', '["*"]', '2023-11-22 14:54:00', '2023-10-24 08:55:02', '2023-11-22 14:54:00');
INSERT INTO public.personal_access_tokens VALUES (572, 'App\Models\User', 14, '123456', '1c2b732dd1307c1bbb7b6c0e227c6a71d3d80d6ae25b6a363c6305c744cf466b', '["*"]', NULL, '2023-10-26 13:35:44', '2023-10-26 13:35:44');
INSERT INTO public.personal_access_tokens VALUES (536, 'App\Models\User', 23, 'fajar', '8212e8313eb499724e1df4c0b82d5c533546b85cdf9573ea4c99fa031b177d0c', '["*"]', NULL, '2023-10-24 10:25:05', '2023-10-24 10:25:05');
INSERT INTO public.personal_access_tokens VALUES (537, 'App\Models\User', 27, 'tes', '9bd306c5a65659d190f2dcb8d75625ae8866f3335f54f745c0df3df9d627a759', '["*"]', NULL, '2023-10-24 10:28:58', '2023-10-24 10:28:58');
INSERT INTO public.personal_access_tokens VALUES (538, 'App\Models\User', 14, '123456', 'd4327af2cebd84743e19a8418cf61e9874221618a64d36643f3ad501d2c41c62', '["*"]', NULL, '2023-10-24 10:29:03', '2023-10-24 10:29:03');
INSERT INTO public.personal_access_tokens VALUES (539, 'App\Models\User', 23, 'fajar', 'bf5dc6be96f8e9f12d1b9abcd275ed9beeb06cb078d51aca9f75bc4a86482e50', '["*"]', NULL, '2023-10-24 10:29:17', '2023-10-24 10:29:17');
INSERT INTO public.personal_access_tokens VALUES (540, 'App\Models\User', 14, '123456', 'ff84b765789d76c7c2aaec600e5888bd08d5ddf5a7be74520e54cdfc1a55f5c2', '["*"]', NULL, '2023-10-24 11:09:08', '2023-10-24 11:09:08');
INSERT INTO public.personal_access_tokens VALUES (541, 'App\Models\User', 23, 'fajar', '04f4799fb76cebb3f002356394958b380506b18b6ca864c0e7a1dc4bd64a0b36', '["*"]', NULL, '2023-10-24 11:11:57', '2023-10-24 11:11:57');
INSERT INTO public.personal_access_tokens VALUES (542, 'App\Models\User', 23, 'fajar', '92cc6457192445d85092410aec47de4bbccfe507aa9a1ab7482bb26b2c49d150', '["*"]', NULL, '2023-10-24 11:11:59', '2023-10-24 11:11:59');
INSERT INTO public.personal_access_tokens VALUES (543, 'App\Models\User', 23, 'fajar', '75f527ed199f9629457b149ecacfb7d8ec1124905df232a8c49b52fb84c29795', '["*"]', NULL, '2023-10-24 11:12:19', '2023-10-24 11:12:19');
INSERT INTO public.personal_access_tokens VALUES (557, 'App\Models\User', 27, 'tes', 'bd3be485bbff0b1198c8594f3e6cc98a0250688a72bb7e9eb378e8780d25355b', '["*"]', '2023-10-24 14:58:55', '2023-10-24 14:57:41', '2023-10-24 14:58:55');
INSERT INTO public.personal_access_tokens VALUES (562, 'App\Models\User', 14, '123456', 'b50ec474398bf476be170435246aa1b5c61f4640fb101038414ea8c2a78e6cca', '["*"]', '2023-10-24 17:35:58', '2023-10-24 16:06:22', '2023-10-24 17:35:58');
INSERT INTO public.personal_access_tokens VALUES (568, 'App\Models\User', 14, '123456', '359ef8d2bb24dd8ba61984fd89ff940db5343ed12ad8161da0bec1b4a5c98a0d', '["*"]', NULL, '2023-10-25 00:44:08', '2023-10-25 00:44:08');
INSERT INTO public.personal_access_tokens VALUES (545, 'App\Models\User', 14, '123456', '270624fb07862637f5d0d7bb2f7223b5584a7c4c7b458273d3ac7b39f85fb066', '["*"]', NULL, '2023-10-24 11:18:34', '2023-10-24 11:18:34');
INSERT INTO public.personal_access_tokens VALUES (546, 'App\Models\User', 14, '123456', 'd2c95dbc7ee75d26bf4d1df50ce8cedb46dad7e772d9c652822a0ccc3fe6c2df', '["*"]', NULL, '2023-10-24 11:18:37', '2023-10-24 11:18:37');
INSERT INTO public.personal_access_tokens VALUES (561, 'App\Models\User', 30, 'coba', '8fc28150fda2cddb057099ac276e17dccaecfbdab8af21d6c978da4d29ac50f4', '["*"]', '2023-10-24 15:10:23', '2023-10-24 15:09:35', '2023-10-24 15:10:23');
INSERT INTO public.personal_access_tokens VALUES (558, 'App\Models\User', 28, 'tes', '45b11c24de77b744bf730a210767f8c7e324282b19efe389fe00ae96ddb4bf08', '["*"]', '2023-10-24 15:02:35', '2023-10-24 15:00:54', '2023-10-24 15:02:35');
INSERT INTO public.personal_access_tokens VALUES (559, 'App\Models\User', 14, '123456', '0aae3dcc6267c06d02d81bf8e03cc595d7df4b1d1960cc9ad0c82d9a61466ae2', '["*"]', '2023-10-24 15:03:17', '2023-10-24 15:02:34', '2023-10-24 15:03:17');
INSERT INTO public.personal_access_tokens VALUES (547, 'App\Models\User', 23, 'fajar', '0cefe4a833997a5e234fec1041ca89c9467123c6e5b0c0f4ae1e091385c9152d', '["*"]', NULL, '2023-10-24 11:19:24', '2023-10-24 11:19:24');
INSERT INTO public.personal_access_tokens VALUES (535, 'App\Models\User', 23, 'fajar', 'c89016a9705f8e44bbe2ecd7d7f369e22444a90670b28ac0f87b2faa26ba91ea', '["*"]', '2023-10-24 11:20:16', '2023-10-24 10:23:38', '2023-10-24 11:20:16');
INSERT INTO public.personal_access_tokens VALUES (548, 'App\Models\User', 27, 'tes', 'a606ad9965020db1dd7cf628be57604848e2d42c492db598e838033c83583e84', '["*"]', NULL, '2023-10-24 11:20:33', '2023-10-24 11:20:33');
INSERT INTO public.personal_access_tokens VALUES (549, 'App\Models\User', 14, '123456', 'eeb96db210a3d347bad6234f1f49c08e5719d24f620eeb1e6eebcb28cde9a1ca', '["*"]', '2023-10-24 11:20:58', '2023-10-24 11:20:41', '2023-10-24 11:20:58');
INSERT INTO public.personal_access_tokens VALUES (550, 'App\Models\User', 27, 'tes', 'ce0755687981380d1b86ae7f87b415c44096ab90b26aa721fd66128186c426ab', '["*"]', NULL, '2023-10-24 11:21:22', '2023-10-24 11:21:22');
INSERT INTO public.personal_access_tokens VALUES (544, 'App\Models\User', 23, 'fajar', 'd9fc46f5406a3badd603f9b360e001f754a58e9b7b76e826b104e6f2572cacde', '["*"]', '2023-10-24 11:22:49', '2023-10-24 11:15:01', '2023-10-24 11:22:49');
INSERT INTO public.personal_access_tokens VALUES (551, 'App\Models\User', 23, 'fajar', '19f36b21f4a034f8fd43b1ce6fdbb758b153eabff9124c4254a9cd87da08ae80', '["*"]', NULL, '2023-10-24 11:22:52', '2023-10-24 11:22:52');
INSERT INTO public.personal_access_tokens VALUES (567, 'App\Models\User', 30, 'coba', 'ebe21e55de690cb30f4a4327fb500b441b112727c04765e2a2de695eb1622e97', '["*"]', '2023-10-25 15:37:19', '2023-10-24 16:57:10', '2023-10-25 15:37:19');
INSERT INTO public.personal_access_tokens VALUES (553, 'App\Models\User', 14, '123456', '9dcd4491a06bd0f87c9f991a2bfb29c56cf412e108f33e42983a7896d60fb5f8', '["*"]', NULL, '2023-10-24 12:18:40', '2023-10-24 12:18:40');
INSERT INTO public.personal_access_tokens VALUES (563, 'App\Models\User', 28, 'tes', 'c733f6e8245dd213ade879d42f94e4bfedb183d9a92591078afd308321364903', '["*"]', '2023-10-24 16:33:28', '2023-10-24 16:32:51', '2023-10-24 16:33:28');
INSERT INTO public.personal_access_tokens VALUES (564, 'App\Models\User', 31, 'tes', 'c09b1d22f8d665d7c37263b5f4e3790b2b1c68b2e301b6ae821b8a92c079f11a', '["*"]', '2023-10-24 16:54:26', '2023-10-24 16:34:50', '2023-10-24 16:54:26');
INSERT INTO public.personal_access_tokens VALUES (565, 'App\Models\User', 30, 'coba', 'e80dda61b015d4cdd729b5fd51c0c72c77161d86e70a39ee9ee4cb637aae2382', '["*"]', NULL, '2023-10-24 16:55:49', '2023-10-24 16:55:49');
INSERT INTO public.personal_access_tokens VALUES (560, 'App\Models\User', 29, 'coba', 'b3a9c5eecd085fc7d2f786b000841d27670e6eb1da047db0627236a94e5022b1', '["*"]', '2023-10-24 15:08:08', '2023-10-24 15:06:34', '2023-10-24 15:08:08');
INSERT INTO public.personal_access_tokens VALUES (552, 'App\Models\User', 27, 'tes', 'fdb954f746e87f83a6033363fc05c59fbe8212bb15f17268e17d8a0cd636a23c', '["*"]', '2023-10-24 12:23:51', '2023-10-24 11:26:21', '2023-10-24 12:23:51');
INSERT INTO public.personal_access_tokens VALUES (554, 'App\Models\User', 14, '123456', '84870c573a71121f113fa7ee3f5d1baf6497ae4b39d9eca6540442ad71124f75', '["*"]', NULL, '2023-10-24 13:43:53', '2023-10-24 13:43:53');
INSERT INTO public.personal_access_tokens VALUES (555, 'App\Models\User', 14, '123456', '1b1af9487cf697a88290b80e8463f09ac150e0561a63de589aaeabf0b335babd', '["*"]', NULL, '2023-10-24 13:44:28', '2023-10-24 13:44:28');
INSERT INTO public.personal_access_tokens VALUES (556, 'App\Models\User', 14, '123456', '23ce0fdb702953d52560f86427edc13cfd83ebf0757679c95afdc75e22b64928', '["*"]', NULL, '2023-10-24 13:47:00', '2023-10-24 13:47:00');
INSERT INTO public.personal_access_tokens VALUES (566, 'App\Models\User', 30, 'coba', '0be81c14778e29c255b4d82e0eb5aa9176a0c2e2e8dc90458301f41ec301f6e3', '["*"]', NULL, '2023-10-24 16:56:27', '2023-10-24 16:56:27');
INSERT INTO public.personal_access_tokens VALUES (569, 'App\Models\User', 2, 'admin', 'f7b290bc4d28379b0fe8a706f159a7fa734cdf3ee5c5fb4c390d4cb043065a21', '["*"]', '2023-10-25 15:37:37', '2023-10-25 15:37:33', '2023-10-25 15:37:37');
INSERT INTO public.personal_access_tokens VALUES (579, 'App\Models\User', 14, '123456', '66924f5c052704ae81925adcf0903797d6b94e9c5e63552775728041c3e24527', '["*"]', NULL, '2023-10-31 13:35:24', '2023-10-31 13:35:24');
INSERT INTO public.personal_access_tokens VALUES (570, 'App\Models\User', 31, 'tes', '533b1581b3fc03256b277820994cca309d98e9c489613bda165f8f881a58512c', '["*"]', '2023-10-26 13:19:10', '2023-10-26 09:27:16', '2023-10-26 13:19:10');
INSERT INTO public.personal_access_tokens VALUES (576, 'App\Models\User', 30, 'coba', 'a8269745c10e4781c6ff31531df077a1f7bd9dcec37afd7ced39d9563c1f8cb6', '["*"]', '2023-10-26 15:06:46', '2023-10-26 15:06:44', '2023-10-26 15:06:46');
INSERT INTO public.personal_access_tokens VALUES (573, 'App\Models\User', 14, '123456', 'ad3f0476b795fe822f4ed0b5ba273753c72c52a2492aef1a527c6c01db6c7bfd', '["*"]', '2023-10-26 13:43:34', '2023-10-26 13:39:41', '2023-10-26 13:43:34');
INSERT INTO public.personal_access_tokens VALUES (575, 'App\Models\User', 31, 'tes', 'baa1183acf37ff23b633004580f5914bc4f0d5952fc27eebf54dda7b7981b388', '["*"]', '2023-10-26 13:57:02', '2023-10-26 13:54:43', '2023-10-26 13:57:02');
INSERT INTO public.personal_access_tokens VALUES (571, 'App\Models\User', 14, '123456', 'da63af5590d0f36c73ebaf3b460d2be2afa07727cd90cb2ab5b7e1659c22e3a0', '["*"]', '2023-10-31 13:26:38', '2023-10-26 12:52:33', '2023-10-31 13:26:38');
INSERT INTO public.personal_access_tokens VALUES (578, 'App\Models\User', 23, 'fajar', 'f5770f9c2c4150056784bb485e5fb58a9e3780e9b7ca4e1ac285b0c59788877d', '["*"]', '2023-10-30 18:15:27', '2023-10-30 18:15:07', '2023-10-30 18:15:27');
INSERT INTO public.personal_access_tokens VALUES (580, 'App\Models\User', 14, '123456', 'e5f0bce6671d23b7e7742c6d2d6ae5e9e7bfa062297e1b72e3b5b675b6fc4714', '["*"]', '2023-10-31 13:45:41', '2023-10-31 13:40:59', '2023-10-31 13:45:41');
INSERT INTO public.personal_access_tokens VALUES (577, 'App\Models\User', 14, '123456', '515ae0c1c89779c98357687c343dc23688a9aed7cd314c144e804666a9da4516', '["*"]', '2023-10-31 13:52:12', '2023-10-26 15:06:57', '2023-10-31 13:52:12');
INSERT INTO public.personal_access_tokens VALUES (581, 'App\Models\User', 31, 'tes', '4b2f316412ef1d55324297251ba9f863fd479f4f1d6e99451d6a9fcbf3db3f1f', '["*"]', '2023-10-31 15:07:39', '2023-10-31 13:52:31', '2023-10-31 15:07:39');
INSERT INTO public.personal_access_tokens VALUES (582, 'App\Models\User', 14, '123456', '880160bb84dc5f8137475f21e838cc97464d00fa367ff7bd276edcc98b235092', '["*"]', '2023-10-31 14:09:18', '2023-10-31 14:05:53', '2023-10-31 14:09:18');
INSERT INTO public.personal_access_tokens VALUES (574, 'App\Models\User', 14, '123456', '46aec2957c3f29fd740b0bcce84623053bcb0d031bd5fe159eb5439abada768c', '["*"]', '2023-11-02 11:20:28', '2023-10-26 13:44:21', '2023-11-02 11:20:28');
INSERT INTO public.personal_access_tokens VALUES (622, 'App\Models\User', 14, '123456', 'a3082e9d0433503d542c2a8403ae2de967ce8ee4a6776b0bbd0ac00527710fc6', '["*"]', '2023-11-16 13:35:39', '2023-11-16 09:22:56', '2023-11-16 13:35:39');
INSERT INTO public.personal_access_tokens VALUES (590, 'App\Models\User', 14, '123456', '8d313eece3e39e82ce5f79215eea1ff37c3892e93b179060cb253cc3d9d1f173', '["*"]', '2023-11-06 13:14:37', '2023-11-06 12:56:41', '2023-11-06 13:14:37');
INSERT INTO public.personal_access_tokens VALUES (584, 'App\Models\User', 14, '123456', 'cb0b8b853ba3338f86d89cf34dfa956e722534854a4ea548d9c2430e1b097569', '["*"]', NULL, '2023-10-31 14:21:32', '2023-10-31 14:21:32');
INSERT INTO public.personal_access_tokens VALUES (591, 'App\Models\User', 14, '123456', 'e53eff7ab1d731853d306ce8d9ee7d2289a1389b613f02c42c838496542f0722', '["*"]', NULL, '2023-11-06 13:16:20', '2023-11-06 13:16:20');
INSERT INTO public.personal_access_tokens VALUES (585, 'App\Models\User', 31, 'tes', 'c47d393bf8c10c719eb2e5d4d26d329f792b21866c095ab472b5244d6e0b5e03', '["*"]', NULL, '2023-10-31 15:10:08', '2023-10-31 15:10:08');
INSERT INTO public.personal_access_tokens VALUES (592, 'App\Models\User', 20, 'ppp', '1931cf45b95d0f75c9c5aee3516210c40008d17e35cda2611f63a0a77520f25a', '["*"]', NULL, '2023-11-06 13:23:30', '2023-11-06 13:23:30');
INSERT INTO public.personal_access_tokens VALUES (593, 'App\Models\User', 20, 'ppp', '798088ba5e238dd8b404acea5e0bddfe85e3a743b8d68820b2ca65ac405c2165', '["*"]', NULL, '2023-11-06 13:24:05', '2023-11-06 13:24:05');
INSERT INTO public.personal_access_tokens VALUES (594, 'App\Models\User', 20, 'ppp', '0cf5ea8147aadfb9d80dda5d1bd65b4a5a3723b195d2f4542c8b0caa0eb552b6', '["*"]', NULL, '2023-11-06 13:25:06', '2023-11-06 13:25:06');
INSERT INTO public.personal_access_tokens VALUES (595, 'App\Models\User', 20, 'ppp', '319ac766897b7def51edd8bda03ac614172e8b35fc59c48d45aed6000ffe2ed9', '["*"]', NULL, '2023-11-06 13:27:54', '2023-11-06 13:27:54');
INSERT INTO public.personal_access_tokens VALUES (611, 'App\Models\User', 14, '123456', '9c5911330e26dccf08a8d204b81876a475a814505c668cf57497035afc2fddb6', '["*"]', '2023-11-15 09:29:57', '2023-11-14 11:22:01', '2023-11-15 09:29:57');
INSERT INTO public.personal_access_tokens VALUES (620, 'App\Models\User', 35, 'nice', 'ff6bdba662f62d45e4a395a395fa0986dd878fca6fd793f9fa867ced5c41a373', '["*"]', '2023-11-15 13:24:17', '2023-11-15 13:18:55', '2023-11-15 13:24:17');
INSERT INTO public.personal_access_tokens VALUES (598, 'App\Models\User', 14, '123456', '568f3672796d678308b460780af139471ae7ca80a6eed587ace654b1b9c15fab', '["*"]', '2023-11-06 15:24:31', '2023-11-06 15:17:44', '2023-11-06 15:24:31');
INSERT INTO public.personal_access_tokens VALUES (604, 'App\Models\User', 14, '123456', '2e7dd8fc48b6396219ea8dab2698467cc9c24eb87b360bb1b22f0ffa5b117d24', '["*"]', '2023-11-07 12:52:25', '2023-11-07 11:05:40', '2023-11-07 12:52:25');
INSERT INTO public.personal_access_tokens VALUES (626, 'App\Models\User', 14, '123456', 'f87f80999105c2aa81f5ec3677d62ce2c389f441b849a99089058c9c86377b66', '["*"]', NULL, '2023-12-15 22:54:48', '2023-12-15 22:54:48');
INSERT INTO public.personal_access_tokens VALUES (623, 'App\Models\User', 33, 'udin', '1b61e844702a66b7433b1669649cdfd6bd6a596958b9a53322b8753cd7637012', '["*"]', '2023-11-16 13:13:27', '2023-11-16 13:11:58', '2023-11-16 13:13:27');
INSERT INTO public.personal_access_tokens VALUES (587, 'App\Models\User', 20, 'ppp', 'f3c35052de2b5389c91825b1d6f7b2da0103b7c389adc068d59fcd71aebd9dd5', '["*"]', '2023-11-02 11:22:07', '2023-11-02 11:21:16', '2023-11-02 11:22:07');
INSERT INTO public.personal_access_tokens VALUES (609, 'App\Models\User', 14, '123456', '6e387f0c9ab7d0acad93444a0eab179911d4cc38b6f1f54fdf928602107463e3', '["*"]', '2023-11-16 12:55:06', '2023-11-10 09:09:41', '2023-11-16 12:55:06');
INSERT INTO public.personal_access_tokens VALUES (599, 'App\Models\User', 32, 'cek', 'c06192cba7aa13b851eb2517a215e67cb88c007d3f93a3d33bb36bda77c779d6', '["*"]', '2023-11-24 10:13:18', '2023-11-06 15:35:30', '2023-11-24 10:13:18');
INSERT INTO public.personal_access_tokens VALUES (605, 'App\Models\User', 20, 'ppp', '2d904898c0441e68d52a39e520f05964268e7fe99da36d79d4da9e74e01b0e73', '["*"]', '2023-11-07 12:55:26', '2023-11-07 12:53:05', '2023-11-07 12:55:26');
INSERT INTO public.personal_access_tokens VALUES (588, 'App\Models\User', 14, '123456', '3f66b5989c06cf891bf4d0843b9d22ad9d11ed2f77c7f04b903cbfad20bd7487', '["*"]', '2023-11-02 13:36:12', '2023-11-02 13:28:52', '2023-11-02 13:36:12');
INSERT INTO public.personal_access_tokens VALUES (600, 'App\Models\User', 32, 'cek', '8a27633eb5b3b5fd93d6801f53973dc1c156c08b847e99561994a3b3df9b8069', '["*"]', '2023-11-06 15:39:13', '2023-11-06 15:38:45', '2023-11-06 15:39:13');
INSERT INTO public.personal_access_tokens VALUES (586, 'App\Models\User', 31, 'tes', '52e21dc30d8c15397ed19430139e094e8911cf8f3be89a46a540004c04410268', '["*"]', '2023-11-03 14:55:57', '2023-11-01 16:23:13', '2023-11-03 14:55:57');
INSERT INTO public.personal_access_tokens VALUES (583, 'App\Models\User', 14, '123456', 'ec98cc2a02009108408dc64b354e6b4a9aea4cd28eab476ec59d6833634b4141', '["*"]', '2023-11-06 12:13:32', '2023-10-31 14:12:21', '2023-11-06 12:13:32');
INSERT INTO public.personal_access_tokens VALUES (589, 'App\Models\User', 14, '123456', '4e4675dc018d0f388d7b1add7e0c3ee08c01b87fcdbf2149390e31587231b0d1', '["*"]', '2023-11-06 12:22:13', '2023-11-06 12:22:05', '2023-11-06 12:22:13');
INSERT INTO public.personal_access_tokens VALUES (607, 'App\Models\User', 14, '123456', '5c1ee1a606490fe22f3a9be835ce973505aed0f274f0d4e066175665574bd5ef', '["*"]', '2023-11-14 11:16:18', '2023-11-09 10:01:30', '2023-11-14 11:16:18');
INSERT INTO public.personal_access_tokens VALUES (606, 'App\Models\User', 19, 'masuk', 'bcce02684b97bb0d6a25775d78f9104ff027f2b91bc3c77f15ea6d20b39ebde7', '["*"]', '2023-11-09 09:18:46', '2023-11-07 12:56:47', '2023-11-09 09:18:46');
INSERT INTO public.personal_access_tokens VALUES (601, 'App\Models\User', 32, 'cek', 'ab33008d41ca5befaf88e1c4b1a167cc28c81d4f51657123136b9ced4e925758', '["*"]', '2023-11-07 08:46:02', '2023-11-06 15:39:41', '2023-11-07 08:46:02');
INSERT INTO public.personal_access_tokens VALUES (597, 'App\Models\User', 20, 'ppp', '8d097bdaf65090c5e32bd823bd2358bbb9415b70b025b8861f53982fb931aca9', '["*"]', '2023-11-06 15:17:29', '2023-11-06 14:19:53', '2023-11-06 15:17:29');
INSERT INTO public.personal_access_tokens VALUES (614, 'App\Models\User', 20, 'ppp', '45ec37a28793df12b137bd1fb791fff8f5b55f527be2d0b9578aa1b731c4bad1', '["*"]', '2023-11-15 10:19:31', '2023-11-15 10:18:09', '2023-11-15 10:19:31');
INSERT INTO public.personal_access_tokens VALUES (615, 'App\Models\User', 20, 'ppp', 'a999af350aa0f28a8946a6bea04e76dc6aa616e12702a3602f8dd59d3045c9ab', '["*"]', NULL, '2023-11-15 10:20:45', '2023-11-15 10:20:45');
INSERT INTO public.personal_access_tokens VALUES (602, 'App\Models\User', 32, 'cek', '9c97b7f80d4bc1fde2eda4101c416aac078aa2df32dd87baa29db6ff4c2b78a6', '["*"]', '2023-11-07 09:19:43', '2023-11-07 08:47:29', '2023-11-07 09:19:43');
INSERT INTO public.personal_access_tokens VALUES (603, 'App\Models\User', 32, 'cek', '83a827d10b4cd44d66651cd725043ffee3e36073e7ceec5f959287fc22a0872d', '["*"]', '2023-11-07 10:52:50', '2023-11-07 09:35:41', '2023-11-07 10:52:50');
INSERT INTO public.personal_access_tokens VALUES (608, 'App\Models\User', 14, '123456', 'c20849867d9222e7e64d6f1e1ab1e2b2ab367d3b837bb9d8e6c99397355370f2', '["*"]', '2023-11-10 08:59:26', '2023-11-10 08:53:12', '2023-11-10 08:59:26');
INSERT INTO public.personal_access_tokens VALUES (610, 'App\Models\User', 14, '123456', '8c77ae0d5734939fba249caa4f1df1a67fb7a992f564af0e7ce9d0fdf6cd108d', '["*"]', '2023-11-10 09:26:14', '2023-11-10 09:24:00', '2023-11-10 09:26:14');
INSERT INTO public.personal_access_tokens VALUES (612, 'App\Models\User', 20, 'ppp', '1a4b72f0ccad9b7d3e3e100837328d3f8a25bd9f67af6fd49ef7c4ed4ebac811', '["*"]', '2023-11-15 09:32:44', '2023-11-15 09:31:49', '2023-11-15 09:32:44');
INSERT INTO public.personal_access_tokens VALUES (621, 'App\Models\User', 35, 'nice', '6bef51b2c05ee5aeb0af098230a3a9c66f23750bf2e2bc7bfb8fc2babdb952dd', '["*"]', '2023-11-16 09:22:14', '2023-11-15 13:26:32', '2023-11-16 09:22:14');
INSERT INTO public.personal_access_tokens VALUES (613, 'App\Models\User', 14, '123456', 'ebbfc8fa84308faa62597030aba4378ba91dac84452ac0b77011ce815104052d', '["*"]', '2023-11-15 10:17:07', '2023-11-15 09:49:07', '2023-11-15 10:17:07');
INSERT INTO public.personal_access_tokens VALUES (616, 'App\Models\User', 32, 'cek', '694dc82a2cbc62e20f665630c689d02cb3b340ce2e177aa9a94907ce857e6af9', '["*"]', '2023-11-15 10:38:49', '2023-11-15 10:35:36', '2023-11-15 10:38:49');
INSERT INTO public.personal_access_tokens VALUES (618, 'App\Models\User', 33, 'udin', 'd4d2db82453ac19cfb0ffa5255d981daa2329f8bcd033ecef60400c626510f1d', '["*"]', '2023-11-15 12:54:53', '2023-11-15 12:29:21', '2023-11-15 12:54:53');
INSERT INTO public.personal_access_tokens VALUES (617, 'App\Models\User', 32, 'cek', '44404e1c40060a10f0c951e0a28b34266e1b54560d24e4e423fed5f8a2b97325', '["*"]', '2023-11-15 11:15:09', '2023-11-15 10:39:55', '2023-11-15 11:15:09');
INSERT INTO public.personal_access_tokens VALUES (619, 'App\Models\User', 34, 'ayo', 'ede875848a6fb4fd585441c8ec897400d64039c292b6ed19c5f5875720d00f9c', '["*"]', '2023-11-15 13:17:08', '2023-11-15 12:56:21', '2023-11-15 13:17:08');
INSERT INTO public.personal_access_tokens VALUES (596, 'App\Models\User', 20, 'ppp', '5be0558a122ff33987d019632067126f956dcc8e1f3c27d048aa40cf86c94e1d', '["*"]', '2023-11-24 10:13:12', '2023-11-06 13:29:59', '2023-11-24 10:13:12');
INSERT INTO public.personal_access_tokens VALUES (625, 'App\Models\User', 14, '123456', 'd9d5f54b626c0ee1199c9b95ab27ba666b816f3fd9dbb4d60849e37996dbffe5', '["*"]', '2023-12-05 21:35:13', '2023-11-22 10:46:54', '2023-12-05 21:35:13');
INSERT INTO public.personal_access_tokens VALUES (624, 'App\Models\User', 20, 'ppp', '43f4dacd3ec6e522c3730b9ce27fbc88a4c4ea66f31203cd45569642ad81aa7a', '["*"]', '2023-11-22 10:46:41', '2023-11-16 13:36:02', '2023-11-22 10:46:41');
INSERT INTO public.personal_access_tokens VALUES (627, 'App\Models\User', 14, '123456', '070dd512037e498dafca0bf8d1f6ccb95866010f5b298a76e9a80efaefe6218c', '["*"]', '2023-12-29 15:56:08', '2023-12-28 00:31:17', '2023-12-29 15:56:08');


--
-- TOC entry 3069 (class 0 OID 16454)
-- Dependencies: 223
-- Data for Name: presensi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.presensi VALUES (2, 1, '58f52963-9d5a-4f34-ae40-b39699c2ec21.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-03 07:25:16', '2023-10-03 07:25:16', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (3, 1, '79266554-bc3e-4625-9333-8f4a683307e5.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-06 01:57:28', '2023-10-06 01:57:28', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (4, 1, NULL, '98.1, 110.64', 'keterangan', '2023-10-07 06:27:15', '2023-10-07 06:27:15', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (5, 1, NULL, '3.616470658178568, 98.61772563818016', 'WFO', '2023-10-08 01:17:31', '2023-10-08 01:17:31', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (6, 1, '79266554-bc3e-4625-9333-8f4a683307e5.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-09 01:51:05', '2023-10-09 01:51:05', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (7, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'ccc', '2023-10-10 06:36:48', '2023-10-10 06:36:48', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (8, 2, NULL, '3.616470658178568, 98.61772563818016', 'okay sih', '2023-10-11 07:12:29', '2023-10-11 07:12:29', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (9, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'WFO', '2023-10-12 04:01:46', '2023-10-12 04:01:46', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (10, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'tes', '2023-10-13 07:29:53', '2023-10-13 07:29:53', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (11, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'Tes presensi masuk', '2023-10-16 07:44:41', '2023-10-16 07:44:41', 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (12, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'Tes presensi masuk', '2023-10-16 08:18:50', '2023-10-16 08:18:50', 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (13, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'masuk', '2023-10-16 13:23:31', '2023-10-16 13:23:31', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (14, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'Tes absen masuk tanggal 17', '2023-10-17 03:10:36', '2023-10-17 03:10:36', 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (15, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'Tes presensi masuk tanggal 17', '2023-10-17 03:28:17', '2023-10-17 03:28:17', 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (16, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'tes', '2023-10-17 04:30:46', '2023-10-17 04:30:46', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (17, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'teess', '2023-10-17 05:48:25', '2023-10-17 05:48:25', 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (18, 1, '996167a9-f95a-427f-8b24-97b45c4a6663.jpg', '-7.8130436, 110.3766927', '-', '2023-10-18 04:29:41', '2023-10-18 04:29:41', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (19, 1, '1dfdac5b-5cd7-46c1-a9ca-8ce64b0f8240.jpg', '-7.8206187, 110.3862904', 'Tes presensi remote', '2023-10-18 15:15:42', '2023-10-18 15:15:42', 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (20, 1, 'a2375135-7dfe-4f68-a56d-40d02a417fca.jpg', '-7.8206195, 110.3862876', 'Tes presensi masuk remote', '2023-10-18 15:53:29', '2023-10-18 15:53:29', 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (21, 1, 'b098d2f6-4bfa-42a9-a1ff-104da48a107a.jpg', '-7.8130651, 110.3768358', '-', '2023-10-19 03:53:49', '2023-10-19 03:53:49', 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (22, 1, '4f742de7-ca07-40d2-8dbc-53f9f51ddb7e.jpg', '-7.8130521, 110.3768425', '-', '2023-10-19 03:59:20', '2023-10-19 03:59:20', 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (23, 2, '3d8c1fa0-ff5f-452d-9a21-20e3967b6844.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-19 04:44:43', '2023-10-19 04:44:43', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (24, 1, 'bdd09d84-65e8-45df-acaf-fc3d5013f6ea.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-19 06:56:45', '2023-10-19 06:56:45', 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (25, 2, 'bdd09d84-65e8-45df-acaf-fc3d5013f6ea.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-19 06:59:59', '2023-10-19 06:59:59', 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (26, 1, '3d8c1fa0-ff5f-452d-9a21-20e3967b6844.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-19 07:09:52', '2023-10-19 07:09:52', 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (27, 2, '3c1e7d5d-4763-4d97-b03f-641d44ccdfb0.jpg', '-7.8206274, 110.3862845', 'Tes', '2023-10-19 12:34:04', '2023-10-19 12:34:04', 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (28, 1, '04458b52-ceea-4208-a2a5-f535c200b021.jpg', '-7.8206245, 110.3862866', 'Coba', '2023-10-19 14:37:03', '2023-10-19 14:37:03', 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (29, 2, 'b52014ed-50fb-43bc-bba3-bbd5b0da495d.jpg', '-7.8206305, 110.3862851', 'Tes', '2023-10-19 14:37:58', '2023-10-19 14:37:58', 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (30, 1, 'a00f9fb3-70f0-4282-aec9-7704002e6936.jpg', '-7.8206217, 110.3862895', 'Tes', '2023-10-19 15:01:31', '2023-10-19 15:01:31', 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (31, 1, '66a7ea09-7e29-4077-bab2-e0439ea25b8f.jpg', '-7.813025, 110.3766719', '-', '2023-10-20 07:03:26', '2023-10-20 07:03:26', 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (32, 2, 'e01637de-7d0a-422a-bbf4-5cf90c5909b5.jpg', '-7.8130617, 110.3768743', 'Tes', '2023-10-20 08:01:27', '2023-10-20 08:01:27', 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.presensi VALUES (33, 1, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'okay', '2023-10-21 09:11:22', '2023-10-21 09:11:22', 14, NULL, '09:11:22', '08:00:00', '17:00:00', '71', NULL);
INSERT INTO public.presensi VALUES (34, 2, NULL, 'Lat: %1$.5f, Long: %2$.5f', 'okay', '2023-10-21 09:14:36', '2023-10-21 09:14:36', 14, NULL, '09:14:36', '08:00:00', '17:00:00', NULL, '466');
INSERT INTO public.presensi VALUES (35, 1, '3d8c1fa0-ff5f-452d-9a21-20e3967b6844.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-22 11:54:20', '2023-10-22 11:54:20', 14, NULL, '11:54:20', '08:00:00', '17:00:00', '234', NULL);
INSERT INTO public.presensi VALUES (36, 2, '02613990-c41e-461c-bc1f-172ba0377b1c.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-22 13:33:13', '2023-10-22 13:33:13', 14, NULL, '13:33:13', '08:00:00', '17:00:00', NULL, '207');
INSERT INTO public.presensi VALUES (37, 1, 'dca586c5-836c-4c70-9c59-dcc3f1730b74.jpg', '-7.8130597, 110.3768789', 'T', '2023-10-23 10:13:46', '2023-10-23 10:13:46', 24, NULL, '10:13:46', '08:00:00', '17:00:00', '133', NULL);
INSERT INTO public.presensi VALUES (38, 1, '790774a2-8852-41c9-ab41-9efbda38f3a9.jpg', '-7.8130514, 110.3768795', '-', '2023-10-23 10:15:19', '2023-10-23 10:15:19', 25, NULL, '10:15:19', '08:00:00', '17:00:00', '135', NULL);
INSERT INTO public.presensi VALUES (39, 1, '8d674818-184a-4e31-860a-4d370933b64f.jpg', '-7.8127072, 110.3768681', '-', '2023-10-23 11:57:00', '2023-10-23 11:57:00', 14, NULL, '11:57:00', '08:00:00', '17:00:00', '237', NULL);
INSERT INTO public.presensi VALUES (40, 2, '02613990-c41e-461c-bc1f-172ba0377b1c.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-24 08:45:46', '2023-10-24 08:45:46', 14, NULL, '08:45:46', '08:00:00', '17:00:00', NULL, '495');
INSERT INTO public.presensi VALUES (41, 1, '2418aca9-5fcd-449b-962c-8234d6b44412.jpg', '37.421998333333335, -122.08400000000002', 'tes', '2023-10-24 08:55:15', '2023-10-24 08:55:15', 14, NULL, '08:55:15', '08:00:00', '17:00:00', '55', NULL);
INSERT INTO public.presensi VALUES (42, 1, 'f8e0809c-6181-4be8-bcab-9b06b25b33d8.jpg', '-7.8130501, 110.376871', '-', '2023-10-24 10:24:43', '2023-10-24 10:24:43', 23, NULL, '10:24:43', '08:00:00', '17:00:00', '144', NULL);
INSERT INTO public.presensi VALUES (43, 1, '0bb40ad2-965c-4077-83eb-623c7eda8bf7.jpg', '-7.8130431, 110.3767804', '-', '2023-10-24 12:23:18', '2023-10-24 12:23:18', 27, NULL, '12:23:18', '09:30:00', '10:00:00', '173', NULL);
INSERT INTO public.presensi VALUES (44, 2, '22a8893e-b1bf-42f0-b2f3-ea41ef794a2c.jpg', '-7.813069, 110.3768526', '-', '2023-10-24 12:23:43', '2023-10-24 12:23:43', 27, NULL, '12:23:43', '09:30:00', '10:00:00', NULL, '0');
INSERT INTO public.presensi VALUES (45, 1, 'c140c620-ca6f-4723-a3b7-c8f42f3453c0.jpg', '-7.8130685, 110.3768574', '-', '2023-10-24 15:01:06', '2023-10-24 15:01:06', 28, NULL, '15:01:06', '08:00:00', '17:00:00', '421', NULL);
INSERT INTO public.presensi VALUES (46, 2, '964bed60-d123-4694-af59-f3a93e370265.jpg', '-7.8130293, 110.3767764', 'Tes', '2023-10-24 15:02:28', '2023-10-24 15:02:28', 28, NULL, '15:02:28', '08:00:00', '17:00:00', NULL, '118');
INSERT INTO public.presensi VALUES (47, 1, '5b4ea489-e599-48e1-920a-7caec8e61a3b.jpg', '-7.8130596, 110.3768476', 'Tes', '2023-10-24 15:06:49', '2023-10-24 15:06:49', 29, NULL, '15:06:49', '08:00:00', '17:00:00', '426', NULL);
INSERT INTO public.presensi VALUES (48, 2, 'a48d6942-999e-4d65-8e4f-1822e68c5e8b.jpg', '-7.8130349, 110.3768288', '-', '2023-10-24 15:07:06', '2023-10-24 15:07:06', 29, NULL, '15:07:06', '08:00:00', '17:00:00', NULL, '113');
INSERT INTO public.presensi VALUES (49, 1, 'e4dc12e4-9710-45ef-8367-09b926403f4c.jpg', '-7.8130187, 110.3766486', 'Tes', '2023-10-24 15:09:58', '2023-10-24 15:09:58', 30, NULL, '15:09:58', '08:00:00', '17:00:00', '429', NULL);
INSERT INTO public.presensi VALUES (50, 2, '26a9c449-2668-4d9c-b2d2-70068f060463.jpg', '-7.8130265, 110.3767691', '-', '2023-10-24 15:10:18', '2023-10-24 15:10:18', 30, NULL, '15:10:18', '08:00:00', '17:00:00', NULL, '110');
INSERT INTO public.presensi VALUES (51, 1, 'f0c59ff9-0338-47cd-a663-36018ba105ec.jpg', '-7.8130404, 110.376793', '-', '2023-10-24 16:35:14', '2023-10-24 16:35:14', 31, NULL, '16:35:14', '08:00:00', '17:00:00', '515', NULL);
INSERT INTO public.presensi VALUES (52, 2, 'b3507785-5e2d-40fc-b385-4b19c2af2453.jpg', '-7.813046, 110.3767946', '-', '2023-10-24 16:36:01', '2023-10-24 16:36:01', 31, NULL, '16:36:01', '08:00:00', '17:00:00', NULL, '24');
INSERT INTO public.presensi VALUES (53, 1, '6fd51c27-82ad-474b-a70c-e64e78261004.jpg', '-7.8130732, 110.3768444', '-', '2023-10-26 13:39:54', '2023-10-26 13:39:54', 14, NULL, '13:39:54', '08:00:00', '17:00:00', '339', NULL);
INSERT INTO public.presensi VALUES (54, 2, '0ba8f569-e0a7-4641-9077-32f4ecee22ad.jpg', '-7.8130714, 110.376833', '-', '2023-10-26 13:45:56', '2023-10-26 13:45:56', 14, NULL, '13:45:56', '08:00:00', '17:00:00', NULL, '195');
INSERT INTO public.presensi VALUES (55, 1, 'ae3d585d-5f84-473f-88bf-e04f69ffd607.jpg', '-7.8130687, 110.3768701', '-', '2023-10-26 13:56:52', '2023-10-26 13:56:52', 31, NULL, '13:56:52', '16:00:00', '17:00:00', '0', NULL);
INSERT INTO public.presensi VALUES (56, 1, NULL, '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-10-30 18:15:23', '2023-10-30 18:15:23', 23, NULL, '18:15:23', '08:00:00', '17:00:00', '615', NULL);
INSERT INTO public.presensi VALUES (57, 1, '051df262-19b1-4a30-a7d3-a0f29c040ea8.jpg', '-7.8130545, 110.3768435', '-', '2023-11-01 16:23:25', '2023-11-01 16:23:25', 31, NULL, '16:23:25', '16:00:00', '17:00:00', '23', NULL);
INSERT INTO public.presensi VALUES (58, 1, '3d2785f1-ffa0-4729-b87b-d5a96c492cfd.jpg', '37.421998333333335, -122.08400000000002', 'gass', '2023-11-02 09:48:02', '2023-11-02 09:48:02', 14, NULL, '09:48:02', '08:00:00', '17:00:00', '108', NULL);
INSERT INTO public.presensi VALUES (59, 2, '0f20f2c3-ea53-4656-9562-539577d60d5e.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-02 10:45:24', '2023-11-02 10:45:24', 14, NULL, '10:45:24', '08:00:00', '17:00:00', NULL, '375');
INSERT INTO public.presensi VALUES (60, 1, '6b979d8e-4d51-4120-943d-e8f90d3d4d8d.jpg', '-7.8130717, 110.3768355', '-', '2023-11-02 11:21:27', '2023-11-02 11:21:27', 20, NULL, '11:21:27', '08:00:00', '17:00:00', '201', NULL);
INSERT INTO public.presensi VALUES (61, 1, 'b8e69bf1-ea95-42ec-8f78-7a16910b5944.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-06 12:56:57', '2023-11-06 12:56:57', 14, NULL, '12:56:57', '08:00:00', '17:00:00', '296', NULL);
INSERT INTO public.presensi VALUES (62, 2, 'e7bf2858-137f-497b-b7fd-08aaa0c4f197.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-06 12:58:53', '2023-11-06 12:58:53', 14, NULL, '12:58:53', '08:00:00', '17:00:00', NULL, '242');
INSERT INTO public.presensi VALUES (63, 1, '96aee439-2fd2-4bf6-bee3-0757e783ddd8.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-11-06 13:30:54', '2023-11-06 13:30:54', 20, NULL, '13:30:54', '08:00:00', '17:00:00', '330', NULL);
INSERT INTO public.presensi VALUES (64, 2, '96aee439-2fd2-4bf6-bee3-0757e783ddd8.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-11-06 14:08:20', '2023-11-06 14:08:20', 20, NULL, '14:08:20', '08:00:00', '17:00:00', NULL, '172');
INSERT INTO public.presensi VALUES (65, 1, '0756faae-1532-4ba3-96dd-387be1beb5c4.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-06 15:39:07', '2023-11-06 15:39:07', 32, NULL, '15:39:07', '08:00:00', '17:00:00', '459', NULL);
INSERT INTO public.presensi VALUES (66, 1, '4da58e73-982e-4752-99d8-7bda91188749.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-07 09:19:43', '2023-11-07 09:19:43', 32, NULL, '09:19:43', '08:00:00', '17:00:00', '79', NULL);
INSERT INTO public.presensi VALUES (67, 2, '96aee439-2fd2-4bf6-bee3-0757e783ddd8.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-11-07 10:29:16', '2023-11-07 10:29:16', 20, NULL, '10:29:16', '08:00:00', '17:00:00', NULL, '391');
INSERT INTO public.presensi VALUES (68, 1, '311fef0a-925d-4c0e-8a43-24f3be318c66.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-07 11:13:41', '2023-11-07 11:13:41', 14, NULL, '11:13:41', '08:00:00', '17:00:00', '193', NULL);
INSERT INTO public.presensi VALUES (69, 1, '469b0d99-cabd-4b5a-b1ad-a2e5ba4b3782.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-07 12:53:18', '2023-11-07 12:53:18', 20, NULL, '12:53:18', '08:00:00', '17:00:00', '293', NULL);
INSERT INTO public.presensi VALUES (70, 1, '1f115e5d-f57e-438d-897c-e987d498b3c1.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-07 12:56:58', '2023-11-07 12:56:58', 19, NULL, '12:56:58', '08:00:00', '17:00:00', '296', NULL);
INSERT INTO public.presensi VALUES (71, 1, '91234377-ab0e-447f-9cd0-e083da4bf268.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-08 13:10:04', '2023-11-08 13:10:04', 19, NULL, '13:10:04', '08:00:00', '17:00:00', '310', NULL);
INSERT INTO public.presensi VALUES (72, 1, '1e402edd-ba21-45fc-a85c-d657bf7ce8e7.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-09 09:18:39', '2023-11-09 09:18:39', 19, NULL, '09:18:39', '08:00:00', '17:00:00', '78', NULL);
INSERT INTO public.presensi VALUES (73, 1, '528ec2ca-6e1d-497b-b5e5-f22c9f6be08e.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-09 10:02:57', '2023-11-09 10:02:57', 14, NULL, '10:02:56', '08:00:00', '17:00:00', '122', NULL);
INSERT INTO public.presensi VALUES (74, 1, 'b0495f1b-54f4-42c4-8712-039c49a20530.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-10 10:04:09', '2023-11-10 10:04:09', 14, NULL, '10:04:09', '08:00:00', '17:00:00', '124', NULL);
INSERT INTO public.presensi VALUES (75, 2, 'ae67495a-3bf6-4cc0-86e1-56b005e05e4e.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-10 13:12:59', '2023-11-10 13:12:59', 14, NULL, '13:12:59', '08:00:00', '17:00:00', NULL, '228');
INSERT INTO public.presensi VALUES (76, 1, '4608f987-6ff8-40fc-9997-f829819bcbe1.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-13 20:44:23', '2023-11-13 20:44:23', 14, NULL, '20:44:23', '08:00:00', '17:00:00', '764', NULL);
INSERT INTO public.presensi VALUES (77, 1, '750876f5-0eeb-44d1-af11-651653296a50.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-14 09:29:25', '2023-11-14 09:29:25', 14, NULL, '09:29:25', '08:00:00', '17:00:00', '89', NULL);
INSERT INTO public.presensi VALUES (78, 2, '741fb780-486b-4acd-bfe8-2741b97930f1.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-14 11:24:12', '2023-11-14 11:24:12', 14, NULL, '11:24:12', '08:00:00', '17:00:00', NULL, '336');
INSERT INTO public.presensi VALUES (79, 1, '1bc6cdaf-0a8f-4141-8466-a1ea70ee69e4.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-15 08:27:31', '2023-11-15 08:27:31', 14, NULL, '08:27:31', '08:00:00', '17:00:00', '27', NULL);
INSERT INTO public.presensi VALUES (80, 2, 'babf98d8-f62e-4f18-a10f-e2bf8cf2a639.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 09:27:14', '2023-11-15 09:27:14', 14, NULL, '09:27:14', '08:00:00', '17:00:00', NULL, '453');
INSERT INTO public.presensi VALUES (81, 1, 'c429c9b0-a00f-4ae3-a669-4b5852f103fe.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 09:32:07', '2023-11-15 09:32:07', 20, NULL, '09:32:07', '08:00:00', '17:00:00', '92', NULL);
INSERT INTO public.presensi VALUES (82, 2, '71350e32-d39c-4855-bb9d-7f04b1ec8330.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 10:18:25', '2023-11-15 10:18:25', 20, NULL, '10:18:25', '08:00:00', '17:00:00', NULL, '402');
INSERT INTO public.presensi VALUES (83, 1, '7aa0d966-ae24-4b6a-aacc-dd8f07de8473.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 10:35:52', '2023-11-15 10:35:52', 32, NULL, '10:35:52', '08:00:00', '17:00:00', '155', NULL);
INSERT INTO public.presensi VALUES (84, 2, '942928a1-7052-4553-aea9-b9312bb9aaba.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 10:37:22', '2023-11-15 10:37:22', 32, NULL, '10:37:22', '08:00:00', '17:00:00', NULL, '383');
INSERT INTO public.presensi VALUES (85, 1, '9e668eee-9a2d-4edb-9bb9-5d4ca92ff38c.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 12:56:32', '2023-11-15 12:56:32', 34, NULL, '12:56:32', '08:55:00', '17:55:00', '241', NULL);
INSERT INTO public.presensi VALUES (86, 1, '6341c5a5-7a1a-44ec-b112-4f2455a1c60b.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 13:19:14', '2023-11-15 13:19:14', 35, NULL, '13:19:14', '08:17:00', '18:17:00', '302', NULL);
INSERT INTO public.presensi VALUES (87, 2, '1f9541df-dcfd-458c-859a-87a25b4e3f81.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-15 17:49:12', '2023-11-15 17:49:12', 35, NULL, '17:49:12', '08:17:00', '18:17:00', NULL, '28');
INSERT INTO public.presensi VALUES (88, 1, 'e73f63e2-0480-48ec-96c5-6c6aa796f101.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-16 12:46:57', '2023-11-16 12:46:57', 14, NULL, '12:46:57', '08:00:00', '17:00:00', '286', NULL);
INSERT INTO public.presensi VALUES (89, 2, '5c3ab511-8bd9-4bdb-9559-c58f7f7d510b.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-16 12:53:56', '2023-11-16 12:53:56', 14, NULL, '12:53:56', '08:00:00', '17:00:00', NULL, '247');
INSERT INTO public.presensi VALUES (90, 1, '4408f37a-34dd-4df5-8d03-58791e21a780.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-16 13:12:30', '2023-11-16 13:12:30', 33, NULL, '13:12:30', '08:26:00', '17:15:00', '286', NULL);
INSERT INTO public.presensi VALUES (91, 2, '02c5b850-9201-4be6-b6a3-e4326863d62e.jpg', '37.421998333333335, -122.08400000000002', 'oke', '2023-11-16 13:13:25', '2023-11-16 13:13:25', 33, NULL, '13:13:25', '08:26:00', '17:15:00', NULL, '242');
INSERT INTO public.presensi VALUES (92, 1, 'b15bf3dd-df90-40e4-a3d5-f698426364b7.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-16 13:36:22', '2023-11-16 13:36:22', 20, NULL, '13:36:22', '08:00:00', '17:00:00', '336', NULL);
INSERT INTO public.presensi VALUES (93, 2, 'c2903317-9b0d-4735-8463-feb02874eb68.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-16 19:28:36', '2023-11-16 19:28:36', 20, NULL, '19:28:36', '08:00:00', '17:00:00', NULL, '0');
INSERT INTO public.presensi VALUES (94, 1, '4fe07ccf-1372-4f72-87ca-612d27f64850.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-17 11:10:28', '2023-11-17 11:10:28', 20, NULL, '11:10:28', '08:00:00', '17:00:00', '190', NULL);
INSERT INTO public.presensi VALUES (95, 1, 'dfe55905-f0a5-4556-a4c6-8836fb3eafa4.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-22 10:57:47', '2023-11-22 10:57:47', 14, NULL, '10:57:47', '08:00:00', '17:00:00', '177', NULL);
INSERT INTO public.presensi VALUES (96, 1, '96aee439-2fd2-4bf6-bee3-0757e783ddd8.png', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-11-24 10:13:12', '2023-11-24 10:13:12', 20, NULL, '10:13:12', '08:00:00', '17:00:00', '133', NULL);
INSERT INTO public.presensi VALUES (97, 1, 'e7773fd1-e568-4da1-92d4-af049fc43adc.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-11-27 18:49:20', '2023-11-27 18:49:20', 14, NULL, '18:49:20', '08:00:00', '17:00:00', '649', NULL);
INSERT INTO public.presensi VALUES (98, 1, '66092186-8a36-46a7-83c6-847345b6fabb.jpg', '-7.863937072618491, 110.35698928267081', 'Ini keterangan', '2023-12-15 21:10:56', '2023-12-15 21:10:56', 14, NULL, '21:10:56', '08:00:00', '17:00:00', '790', NULL);
INSERT INTO public.presensi VALUES (99, 1, '289f1eaa-1cde-4d87-98f4-7668a8692073.jpg', '37.421998333333335, -122.08400000000002', '-', '2023-12-29 15:55:06', '2023-12-29 15:55:06', 14, NULL, '15:55:06', '08:00:00', '17:00:00', '475', NULL);


--
-- TOC entry 3071 (class 0 OID 16462)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (2, 'Administrator', 'admin', 'admin@gmail.com', NULL, '$2y$10$4FJVQopZADITDztFhQCeUuDA4diXf4gVUq439dvpVC7/Umee5U0UO', 'BRD3CQ7Hg0faT8tSZ24cwcA0dzR6vHclA9XqHwA941LFxdRIO1J3Z2kZ4Rac', '2021-12-21 09:15:54', '2023-10-03 07:57:55', NULL, 1, 'e2eae184-0d90-495a-9774-92350fabb3fd.png', NULL, '08:00:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (31, 'Joko Mardoyo', 'tes', 'tes@mail.com', NULL, '$2y$10$k6ircuwSPTlC5GBUYdmcVOTAGbAnrHXxnqNlGV5i1X46LKdzbDJ/q', NULL, '2023-10-24 16:34:39', '2023-10-24 16:53:44', NULL, 8, NULL, NULL, '16:00:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (30, 'Jack Harlow', 'coba', 'alexanderfraya33@gmail.com', NULL, '$2y$10$monZzIBybHuXButG8JYIUuhA1tz9XSeQVnWAmcZZhldp8.7NcLlFC', NULL, '2023-10-24 15:09:14', '2023-10-24 16:56:58', NULL, 8, NULL, NULL, '16:30:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (19, 'Coba', 'masuk', 'masuk@gmail.com', NULL, '$2y$10$qS3Hx9RjShwXUXK75p3T4O9Wp1u6dP.NL7snJ1O3ZwVnK4vEZ1uYu', NULL, '2023-10-17 05:47:26', '2023-10-17 05:47:26', NULL, 8, NULL, NULL, '08:00:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (14, 'Test User', '123456', 'tes@gmail.com', NULL, '$2y$10$vkuDmpkM4lr4uG.he7BJReba2NDyGgTFbzfsINaBn3dwyHywdFkXG', 'wE3kdmpzUAXbIBuADcdYfzx1o8f0fnEba9KpSwCszqixIc7ZTvk4LomT64cq', '2023-10-03 06:32:00', '2023-10-03 06:32:00', NULL, 8, NULL, NULL, '08:00:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (23, 'fajar', 'fajar', 'fajar@gmai.com', NULL, '$2y$10$mt/zRvvd5igPgudGsVvHD.fXygu4vV49TlmacERqnZSS7USRyJAuy', NULL, '2023-10-19 06:55:17', '2023-10-19 06:55:17', NULL, 8, NULL, NULL, '08:00:00', '17:00:00', '["1", "2"]');
INSERT INTO public.users VALUES (26, 'tes1', 'testes', 'testes@gmail.com', NULL, '$2y$10$W1FzMoXvdhEol9zw7.C/X.DLHlnq6/SLLyKpOK0fVZpPBhSzKudki', NULL, '2023-10-22 13:20:17', '2023-10-22 13:20:17', NULL, 8, NULL, NULL, '13:00:00', '17:30:00', '["1"]');
INSERT INTO public.users VALUES (20, 'p', 'ppp', 'p@gmail.com', NULL, '$2y$10$Ph5.Gt6x6uf2YQ589Ooev.z.01qSLTfjnNe3/QyF0X7O8Y7wGOaWq', NULL, '2023-10-17 06:50:21', '2023-11-06 13:27:36', NULL, 8, NULL, NULL, '08:00:00', '17:00:00', '["1", "2", "3", "4"]');
INSERT INTO public.users VALUES (32, 'cekcek', 'cek', 'cek@gmail.com', NULL, '$2y$10$DeGdz77RjE5.F7YN7.pbs.XUbhkcdJLJilQQtDZKSgzYFqgkO2wam', NULL, '2023-11-06 15:35:15', '2023-11-15 10:34:56', NULL, 8, NULL, NULL, '08:00:00', '17:00:00', '["1", "2", "3", "4"]');
INSERT INTO public.users VALUES (33, 'udin123', 'udin', 'udin@mail.com', NULL, '$2y$10$Qpz7uOe1KR9LWRFEqxtMPe/5pLoVIYRHuX.Xhz.qwgTnoDkYSA61G', NULL, '2023-11-15 12:28:12', '2023-11-15 12:28:12', NULL, 8, NULL, NULL, '08:26:00', '17:15:00', '["4"]');
INSERT INTO public.users VALUES (34, 'ayoooo', 'ayo', 'ayo@mail.com', NULL, '$2y$10$ikXlma2.YYWE.fHpHHig4OsfFT54NgKLnaZmQESA/07/vP5iLurG2', NULL, '2023-11-15 12:56:02', '2023-11-15 12:56:02', NULL, 8, NULL, NULL, '08:55:00', '17:55:00', '["4"]');
INSERT INTO public.users VALUES (35, 'oyynice', 'nice', 'yy@gmail.com', NULL, '$2y$10$m7W9lL/GEIIY67msUYm1XOWYtrPqj83lMe7/3FASFgvOwhv4bPyh2', NULL, '2023-11-15 13:18:12', '2023-11-15 13:18:12', NULL, 8, NULL, NULL, '08:17:00', '18:17:00', '["4"]');


--
-- TOC entry 3073 (class 0 OID 16470)
-- Dependencies: 227
-- Data for Name: tmp_upload; Type: TABLE DATA; Schema: temp; Owner: postgres
--

INSERT INTO temp.tmp_upload VALUES (208, 'a686f5b6-2432-4697-b9f4-5ba8fe81d651', 'a686f5b6-2432-4697-b9f4-5ba8fe81d651.png', 'Mapbox Outdoors.png', '', '2', '2022-08-15 08:04:23', '2022-08-15 08:04:23', NULL);
INSERT INTO temp.tmp_upload VALUES (209, 'aaa0df0d-57b3-45ed-b161-8a284ade45e6', 'aaa0df0d-57b3-45ed-b161-8a284ade45e6.png', 'Screenshot_2022-09-28_09_47_37.png', '', '2', '2022-10-03 07:07:56', '2022-10-03 07:07:56', NULL);
INSERT INTO temp.tmp_upload VALUES (210, 'b6140b76-6872-4222-93e5-a0bc8a24a748', 'b6140b76-6872-4222-93e5-a0bc8a24a748.png', 'Screenshot from 2022-10-03 14-08-13.png', '', '2', '2022-10-03 07:13:41', '2022-10-03 07:13:41', NULL);
INSERT INTO temp.tmp_upload VALUES (211, '0757df59-3f77-486b-b836-6d8b36302ec9', '0757df59-3f77-486b-b836-6d8b36302ec9.png', 'sign-ge6de6a210_1280.png', '', '2', '2022-10-10 01:14:34', '2022-10-10 01:14:34', NULL);
INSERT INTO temp.tmp_upload VALUES (212, '40d09ebb-e66b-4ab3-93ce-f57994ae313f', '40d09ebb-e66b-4ab3-93ce-f57994ae313f.pdf', 'Blue and Orange MInimalist Id Name Vertical Business Card (6.5 × 10.2 cm) (8 × 12.4 cm) (1).pdf', '', '2', '2022-10-10 01:14:54', '2022-10-10 01:14:54', NULL);
INSERT INTO temp.tmp_upload VALUES (213, 'f732f6cd-1fd2-4e2f-ba6e-9f5bef187bce', 'f732f6cd-1fd2-4e2f-ba6e-9f5bef187bce.png', '62a76468bd73a4af5c5d4fb7.png', '', '2', '2022-10-10 01:15:03', '2022-10-10 01:15:03', NULL);
INSERT INTO temp.tmp_upload VALUES (214, '6abb00fd-89c2-47d9-a428-e3c183a887ec', '6abb00fd-89c2-47d9-a428-e3c183a887ec.jpg', 'APSI SIGERA-ERD_Data.jpg', '', '2', '2022-10-12 06:55:13', '2022-10-12 06:55:13', NULL);
INSERT INTO temp.tmp_upload VALUES (215, 'a94f0cac-1d8b-4bb2-9c5d-6e057a68d3a2', 'a94f0cac-1d8b-4bb2-9c5d-6e057a68d3a2.jpg', 'APSI SIGERA-use case diagram.jpg', '', '2', '2022-10-12 06:56:34', '2022-10-12 06:56:34', NULL);
INSERT INTO temp.tmp_upload VALUES (216, '60141268-6bac-496d-9b23-6bb1dd38bfff', '60141268-6bac-496d-9b23-6bb1dd38bfff.png', 'map_sigera - tiger.png', '', '2', '2022-10-14 01:53:18', '2022-10-14 01:53:18', NULL);
INSERT INTO temp.tmp_upload VALUES (217, '16c222a7-ca72-4120-9d16-f4247866d8fb', '16c222a7-ca72-4120-9d16-f4247866d8fb.png', 'Screenshot from 2022-10-18 10-48-36.png', '', '2', '2022-10-18 03:48:47', '2022-10-18 03:48:47', NULL);
INSERT INTO temp.tmp_upload VALUES (218, 'd2624a99-222a-4519-a891-1fc021676342', 'd2624a99-222a-4519-a891-1fc021676342.png', 'Screenshot from 2022-10-18 10-48-36.png', '', '2', '2022-10-18 04:07:06', '2022-10-18 04:07:06', NULL);
INSERT INTO temp.tmp_upload VALUES (219, '40267c11-b15a-4e37-8739-2f6d8730f711', '40267c11-b15a-4e37-8739-2f6d8730f711.jpg', 'APSI SIGERA-sequence diagram - superadmin.jpg', '', '2', '2022-10-18 08:40:34', '2022-10-18 08:40:34', NULL);
INSERT INTO temp.tmp_upload VALUES (220, '05795a7b-0b11-4808-afe8-aac1178b6882', '05795a7b-0b11-4808-afe8-aac1178b6882.png', 'map_sigera - tiger.png', '', '2', '2022-10-18 08:41:48', '2022-10-18 08:41:48', NULL);
INSERT INTO temp.tmp_upload VALUES (221, '61858da2-fa8c-4aaf-aa45-22f4da51c71c', '61858da2-fa8c-4aaf-aa45-22f4da51c71c.png', 'APSI SIGERA-ERD_Data.drawio.png', '', '2', '2022-10-18 08:42:49', '2022-10-18 08:42:49', NULL);
INSERT INTO temp.tmp_upload VALUES (222, 'a4d276da-a9a4-44c2-8c45-3f351758eee1', 'a4d276da-a9a4-44c2-8c45-3f351758eee1.png', 'map_sigera - tiger.png', '', '2', '2022-10-18 08:43:16', '2022-10-18 08:43:16', NULL);
INSERT INTO temp.tmp_upload VALUES (223, '18e346e0-bdaa-4d96-a31f-32dfe9a5b5fe', '18e346e0-bdaa-4d96-a31f-32dfe9a5b5fe.png', 'Kabupaten_Sukoharjo.png', '', '2', '2022-10-20 04:39:58', '2022-10-20 04:39:58', NULL);
INSERT INTO temp.tmp_upload VALUES (224, '2908c614-b43b-4789-bf34-ecff07fbd368', '2908c614-b43b-4789-bf34-ecff07fbd368.docx', '20221024_Mockup PISDA - Kabupaten Sukoharjo.docx', '', '2', '2022-10-25 03:46:09', '2022-10-25 03:46:09', NULL);
INSERT INTO temp.tmp_upload VALUES (225, '6c5acc01-f688-4f46-a60f-d45922475778', '6c5acc01-f688-4f46-a60f-d45922475778.jpg', 'IMG_1910.JPG', '', '2', '2022-10-25 03:46:26', '2022-10-25 03:46:26', NULL);
INSERT INTO temp.tmp_upload VALUES (226, '05913ab4-970c-4449-85ff-3a42ad8fd934', '05913ab4-970c-4449-85ff-3a42ad8fd934.png', 'a0fd1ebfaaf199d4d23da691e4c5999d.png', '', '2', '2022-10-27 02:39:36', '2022-10-27 02:39:36', NULL);
INSERT INTO temp.tmp_upload VALUES (227, 'd0ee5936-835d-42e5-a59a-45402d4a486b', 'd0ee5936-835d-42e5-a59a-45402d4a486b.jpg', '1.JPG', '', '2', '2022-11-17 06:21:12', '2022-11-17 06:21:12', NULL);
INSERT INTO temp.tmp_upload VALUES (228, '5cc5d187-c329-4eb4-8832-66f3158549b3', '5cc5d187-c329-4eb4-8832-66f3158549b3.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-17 06:27:45', '2022-11-17 06:27:45', NULL);
INSERT INTO temp.tmp_upload VALUES (229, '5f2dbd9a-d8de-46e1-b30c-f8674712045a', '5f2dbd9a-d8de-46e1-b30c-f8674712045a.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-17 06:51:00', '2022-11-17 06:51:00', NULL);
INSERT INTO temp.tmp_upload VALUES (230, 'cad0fb52-37ac-45f0-a558-faa5411d0cef', 'cad0fb52-37ac-45f0-a558-faa5411d0cef.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-17 07:10:47', '2022-11-17 07:10:47', NULL);
INSERT INTO temp.tmp_upload VALUES (231, 'cebae50d-a82f-4f4e-91f0-0cce58f996b0', 'cebae50d-a82f-4f4e-91f0-0cce58f996b0.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 04:51:09', '2022-11-18 04:51:09', NULL);
INSERT INTO temp.tmp_upload VALUES (232, '47528bef-f5fd-4095-a6a6-126a93b469eb', '47528bef-f5fd-4095-a6a6-126a93b469eb.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 05:00:52', '2022-11-18 05:00:52', NULL);
INSERT INTO temp.tmp_upload VALUES (233, 'af1f3f8d-caa1-4df8-bbef-fefa645dcf32', 'af1f3f8d-caa1-4df8-bbef-fefa645dcf32.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 07:08:05', '2022-11-18 07:08:05', NULL);
INSERT INTO temp.tmp_upload VALUES (234, '56f48eab-e68f-45ba-9c73-9d32e03bd58f', '56f48eab-e68f-45ba-9c73-9d32e03bd58f.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 08:26:31', '2022-11-18 08:26:31', NULL);
INSERT INTO temp.tmp_upload VALUES (235, 'ee6ce963-2e42-43b3-bed9-9ed07cfa7497', 'ee6ce963-2e42-43b3-bed9-9ed07cfa7497.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 08:56:03', '2022-11-18 08:56:03', NULL);
INSERT INTO temp.tmp_upload VALUES (236, 'b51ba0d0-f620-4789-acf1-9d1abb166129', 'b51ba0d0-f620-4789-acf1-9d1abb166129.jpg', '1. Parkir Umum.jpg', '', '2', '2022-11-18 09:28:13', '2022-11-18 09:28:13', NULL);
INSERT INTO temp.tmp_upload VALUES (237, 'cc94bc83-3c90-40fc-8155-3cc135819b20', 'cc94bc83-3c90-40fc-8155-3cc135819b20.jpg', 'hannah-morgan-39891-unsplash.jpg', '', '2', '2022-11-21 01:57:23', '2022-11-21 01:57:23', NULL);
INSERT INTO temp.tmp_upload VALUES (238, '7872568b-2f3d-4bee-b978-f1e5b6dc6f27', '7872568b-2f3d-4bee-b978-f1e5b6dc6f27.png', 'logo.png', '', '2', '2022-12-25 23:37:21', '2022-12-25 23:37:21', NULL);
INSERT INTO temp.tmp_upload VALUES (239, '66a1c3ee-36fb-46ff-b840-1bd5f05bf98b', '66a1c3ee-36fb-46ff-b840-1bd5f05bf98b.png', 'Kabupaten_Sukoharjo.png', NULL, '2', '2023-08-01 08:50:10', '2023-08-01 08:50:10', NULL);
INSERT INTO temp.tmp_upload VALUES (240, 'd0db4c82-af74-440c-a5ae-4e381a5cdf19', 'd0db4c82-af74-440c-a5ae-4e381a5cdf19.png', 'pixel-png-cute-2.png', '', '2', '2023-08-08 07:34:22', '2023-08-08 07:34:22', NULL);
INSERT INTO temp.tmp_upload VALUES (241, '7ccd047f-4e1a-4dd7-b9bc-26213d170380', '7ccd047f-4e1a-4dd7-b9bc-26213d170380.png', 'pixel-png-cute-2.png', '', '2', '2023-10-03 03:56:09', '2023-10-03 03:56:09', NULL);
INSERT INTO temp.tmp_upload VALUES (242, 'fa0df7c8-8992-4315-b928-42d8045a37fa', 'fa0df7c8-8992-4315-b928-42d8045a37fa.png', 'genshin-barbara-embarassed-512x512.png', '', '2', '2023-10-03 04:09:32', '2023-10-03 04:09:32', NULL);
INSERT INTO temp.tmp_upload VALUES (243, '58f52963-9d5a-4f34-ae40-b39699c2ec21', '58f52963-9d5a-4f34-ae40-b39699c2ec21.png', 'download20230803195054.png', '', '14', '2023-10-03 07:23:37', '2023-10-03 07:23:37', NULL);
INSERT INTO temp.tmp_upload VALUES (244, 'e7de10be-f01a-4b96-9921-59376b3b9f63', 'e7de10be-f01a-4b96-9921-59376b3b9f63.png', 'pixel-png-cute-2.png', '', '2', '2023-10-03 07:57:41', '2023-10-03 07:57:41', NULL);
INSERT INTO temp.tmp_upload VALUES (245, 'e2eae184-0d90-495a-9774-92350fabb3fd', 'e2eae184-0d90-495a-9774-92350fabb3fd.png', 'genshin-barbara-embarassed-512x512.png', '', '2', '2023-10-03 07:57:54', '2023-10-03 07:57:54', NULL);
INSERT INTO temp.tmp_upload VALUES (246, '7d08dbd7-9e90-4c36-beb7-4c461443c8bd', '7d08dbd7-9e90-4c36-beb7-4c461443c8bd.png', 'download20230803195054.png', '', '14', '2023-10-03 08:00:02', '2023-10-03 08:00:02', NULL);
INSERT INTO temp.tmp_upload VALUES (247, 'fd000430-c29e-495a-bcad-f407c28e9739', 'fd000430-c29e-495a-bcad-f407c28e9739.png', 'download20230803195054.png', '', '14', '2023-10-03 08:08:32', '2023-10-03 08:08:32', NULL);
INSERT INTO temp.tmp_upload VALUES (248, 'a5efe014-9cc6-48bb-9594-94ddb4e63414', 'a5efe014-9cc6-48bb-9594-94ddb4e63414.png', '10541562_18915856-removebg-preview.png', '', '14', '2023-10-04 15:22:04', '2023-10-04 15:22:04', NULL);
INSERT INTO temp.tmp_upload VALUES (249, 'f4469d29-28f3-46c1-9de0-33d3c35a0e10', 'f4469d29-28f3-46c1-9de0-33d3c35a0e10.png', 'Colorful Illustrative Fall Email Header.png', '', '14', '2023-10-06 01:43:00', '2023-10-06 01:43:00', NULL);
INSERT INTO temp.tmp_upload VALUES (250, '79266554-bc3e-4625-9333-8f4a683307e5', '79266554-bc3e-4625-9333-8f4a683307e5.png', 'Colorful Illustrative Fall Email Header.png', '', '14', '2023-10-06 01:56:27', '2023-10-06 01:56:27', NULL);
INSERT INTO temp.tmp_upload VALUES (251, 'aecd712c-8a8c-4d51-9303-6bd3316e5d23', 'aecd712c-8a8c-4d51-9303-6bd3316e5d23.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:06:41', '2023-10-07 06:06:41', NULL);
INSERT INTO temp.tmp_upload VALUES (252, '28c469f8-de59-49a1-8f6d-137937e1e262', '28c469f8-de59-49a1-8f6d-137937e1e262.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:07:06', '2023-10-07 06:07:06', NULL);
INSERT INTO temp.tmp_upload VALUES (253, 'd88b98fc-99ef-4f3b-8614-b2d891d37718', 'd88b98fc-99ef-4f3b-8614-b2d891d37718.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:08:01', '2023-10-07 06:08:01', NULL);
INSERT INTO temp.tmp_upload VALUES (254, '80ad42d2-84a9-4f50-a559-e4a9d5ee48a2', '80ad42d2-84a9-4f50-a559-e4a9d5ee48a2.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:08:04', '2023-10-07 06:08:04', NULL);
INSERT INTO temp.tmp_upload VALUES (255, '7edfbbd3-a8d3-4a22-b622-c4af9a694fbd', '7edfbbd3-a8d3-4a22-b622-c4af9a694fbd.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:10:38', '2023-10-07 06:10:38', NULL);
INSERT INTO temp.tmp_upload VALUES (256, '7dc77f72-6ac6-4da2-b43d-32cedf03c3d7', '7dc77f72-6ac6-4da2-b43d-32cedf03c3d7.jpg', '14-148853_twiter-linkedin-and-icon-facebook-twitter-instagram-linkedin - Copy.png', '', '14', '2023-10-07 06:17:26', '2023-10-07 06:17:26', NULL);
INSERT INTO temp.tmp_upload VALUES (257, '0f14489b-391e-44d1-a5bb-cf139e44a4be', '0f14489b-391e-44d1-a5bb-cf139e44a4be.jpg', '9sMUG4LqRIhQv20d1d5t.jpg', '', '14', '2023-10-07 06:18:04', '2023-10-07 06:18:04', NULL);
INSERT INTO temp.tmp_upload VALUES (258, 'c8b974b7-040c-4216-b18d-28c66fd417e4', 'c8b974b7-040c-4216-b18d-28c66fd417e4.jpg', '9sMUG4LqRIhQv20d1d5t.jpg', '', '14', '2023-10-07 06:18:42', '2023-10-07 06:18:42', NULL);
INSERT INTO temp.tmp_upload VALUES (259, 'a577ab99-b735-406c-8166-357c672ea95b', 'a577ab99-b735-406c-8166-357c672ea95b.jpg', 'M7BJ0RwYHBix62dxGYvf.jpg', '', '14', '2023-10-07 06:44:35', '2023-10-07 06:44:35', NULL);
INSERT INTO temp.tmp_upload VALUES (260, 'f05c5e73-11ff-40f9-8cf1-badafe82e6cf', 'f05c5e73-11ff-40f9-8cf1-badafe82e6cf.jpg', 'GfsVaGt1KmESowBUKceU.jpg', '', '14', '2023-10-07 06:45:02', '2023-10-07 06:45:02', NULL);
INSERT INTO temp.tmp_upload VALUES (261, '2c6f2d81-6a26-4563-a627-c7abca306121', '2c6f2d81-6a26-4563-a627-c7abca306121.jpg', 'rBzCZ57Gay8z5EEg2rdD.jpg', '', '14', '2023-10-07 06:51:55', '2023-10-07 06:51:55', NULL);
INSERT INTO temp.tmp_upload VALUES (262, '316f80a3-08a7-43fc-9159-c51be417816b', '316f80a3-08a7-43fc-9159-c51be417816b.jpg', 'kNad3GhZRMXKxJLdccPq.jpg', '', '14', '2023-10-07 06:53:37', '2023-10-07 06:53:37', NULL);
INSERT INTO temp.tmp_upload VALUES (263, 'bc61c365-7a86-4a29-b878-8b468a74f629', 'bc61c365-7a86-4a29-b878-8b468a74f629.jpg', '1696727839518.jpg', '', '14', '2023-10-08 01:17:31', '2023-10-08 01:17:31', NULL);
INSERT INTO temp.tmp_upload VALUES (264, '976ed483-e592-4a00-b6b5-7fd1d3ce82ab', '976ed483-e592-4a00-b6b5-7fd1d3ce82ab.jpg', '1696728129156.jpg', '', '14', '2023-10-08 01:22:21', '2023-10-08 01:22:21', NULL);
INSERT INTO temp.tmp_upload VALUES (265, 'a235e661-d613-4671-8e48-8bb872c15a0a', 'a235e661-d613-4671-8e48-8bb872c15a0a.jpg', '1696728129156.jpg', '', '14', '2023-10-08 01:22:24', '2023-10-08 01:22:24', NULL);
INSERT INTO temp.tmp_upload VALUES (266, 'ad7404a4-bbfe-4db7-b3cf-5aac286414b9', 'ad7404a4-bbfe-4db7-b3cf-5aac286414b9.jpg', '1696728129156.jpg', '', '14', '2023-10-08 01:22:27', '2023-10-08 01:22:27', NULL);
INSERT INTO temp.tmp_upload VALUES (267, '66d5efa2-2126-4f86-96b1-39b547d280b8', '66d5efa2-2126-4f86-96b1-39b547d280b8.jpg', '1696730769486.jpg', '', '14', '2023-10-08 02:06:18', '2023-10-08 02:06:18', NULL);
INSERT INTO temp.tmp_upload VALUES (268, '021e4124-2869-426d-b9a8-29e3eeef7f2a', '021e4124-2869-426d-b9a8-29e3eeef7f2a.jpg', '1696730769486.jpg', '', '14', '2023-10-08 02:06:23', '2023-10-08 02:06:23', NULL);
INSERT INTO temp.tmp_upload VALUES (269, '620019cc-24be-44f3-aa7c-73bddee24b78', '620019cc-24be-44f3-aa7c-73bddee24b78.png', 'Colorful Illustrative Fall Email Header.png', '', '14', '2023-10-08 02:09:26', '2023-10-08 02:09:26', NULL);
INSERT INTO temp.tmp_upload VALUES (270, '0b52c4d4-b2d3-41a9-9a11-6fe49108be4a', '0b52c4d4-b2d3-41a9-9a11-6fe49108be4a.jpg', '1696744421439.jpg', '', '14', '2023-10-08 05:53:54', '2023-10-08 05:53:54', NULL);
INSERT INTO temp.tmp_upload VALUES (271, '4ec195da-7775-49a2-a87d-d8566f332649', '4ec195da-7775-49a2-a87d-d8566f332649.jpg', '1696744561740.jpg', '', '14', '2023-10-08 05:56:10', '2023-10-08 05:56:10', NULL);
INSERT INTO temp.tmp_upload VALUES (272, '32116d7b-87bb-4428-bce0-3f750b62c1c9', '32116d7b-87bb-4428-bce0-3f750b62c1c9.jpg', '1696744561740.jpg', '', '14', '2023-10-08 05:56:18', '2023-10-08 05:56:18', NULL);
INSERT INTO temp.tmp_upload VALUES (273, '3d65d815-2505-4ea6-9bd3-b12bd19c5f51', '3d65d815-2505-4ea6-9bd3-b12bd19c5f51.jpg', '1696744561740.jpg', '', '14', '2023-10-08 05:56:29', '2023-10-08 05:56:29', NULL);
INSERT INTO temp.tmp_upload VALUES (274, '59750e10-5f58-4a7b-ba77-934e52c3954e', '59750e10-5f58-4a7b-ba77-934e52c3954e.jpg', '1696817958930.jpg', '', '14', '2023-10-09 02:19:28', '2023-10-09 02:19:28', NULL);
INSERT INTO temp.tmp_upload VALUES (275, '16c62899-6b09-4335-a773-40a73705dda5', '16c62899-6b09-4335-a773-40a73705dda5.jpg', '1696817958930.jpg', '', '14', '2023-10-09 02:19:39', '2023-10-09 02:19:39', NULL);
INSERT INTO temp.tmp_upload VALUES (276, 'f66ac341-a933-438e-a70a-d985ccd603b6', 'f66ac341-a933-438e-a70a-d985ccd603b6.jpg', '1696820144682.jpg', '', '14', '2023-10-09 02:55:53', '2023-10-09 02:55:53', NULL);
INSERT INTO temp.tmp_upload VALUES (277, 'a9099fe5-edb2-4980-b6b5-bdb677d3150f', 'a9099fe5-edb2-4980-b6b5-bdb677d3150f.jpg', '1696820144682.jpg', '', '14', '2023-10-09 02:59:13', '2023-10-09 02:59:13', NULL);
INSERT INTO temp.tmp_upload VALUES (278, 'a2322c13-f414-461e-88a8-6584a1938a95', 'a2322c13-f414-461e-88a8-6584a1938a95.jpg', '1696833545035.jpg', '', '14', '2023-10-09 06:39:14', '2023-10-09 06:39:14', NULL);
INSERT INTO temp.tmp_upload VALUES (279, '50f84798-1004-4d4d-af54-aac6aa782261', '50f84798-1004-4d4d-af54-aac6aa782261.jpg', '1696919794309.jpg', '', '14', '2023-10-10 06:36:47', '2023-10-10 06:36:47', NULL);
INSERT INTO temp.tmp_upload VALUES (280, '2039273f-ace8-49ca-909d-1c295a76e084', '2039273f-ace8-49ca-909d-1c295a76e084.jpg', '1696919820468.jpg', '', '14', '2023-10-10 06:37:10', '2023-10-10 06:37:10', NULL);
INSERT INTO temp.tmp_upload VALUES (281, 'c1040327-f35c-4b0b-bf86-8e5859abaa2f', 'c1040327-f35c-4b0b-bf86-8e5859abaa2f.jpg', 'ARfKv4sCvaUUCPgvizma.jpg', '', '14', '2023-10-10 16:11:50', '2023-10-10 16:11:50', NULL);
INSERT INTO temp.tmp_upload VALUES (282, '27dcced7-4450-471b-8211-d84370d2cb2e', '27dcced7-4450-471b-8211-d84370d2cb2e.jpg', 'WA9lK64aEVIpjIgmMqBz.jpg', '', '14', '2023-10-10 16:12:04', '2023-10-10 16:12:04', NULL);
INSERT INTO temp.tmp_upload VALUES (283, '547e6b84-b173-45d7-96bb-772639eee76d', '547e6b84-b173-45d7-96bb-772639eee76d.jpg', 'OwDjAWYGPJDg5sLGU7g7.jpg', '', '14', '2023-10-11 07:12:29', '2023-10-11 07:12:29', NULL);
INSERT INTO temp.tmp_upload VALUES (284, '54d9676a-0c99-4115-8ee2-6b07851a6a1f', '54d9676a-0c99-4115-8ee2-6b07851a6a1f.jpg', 'PBwhtGFm1hsIupxeY6zV.jpg', '', '14', '2023-10-11 07:13:09', '2023-10-11 07:13:09', NULL);
INSERT INTO temp.tmp_upload VALUES (285, 'aa743977-0967-45eb-a390-609b0ba4cd59', 'aa743977-0967-45eb-a390-609b0ba4cd59.jpg', 'PBwhtGFm1hsIupxeY6zV.jpg', '', '14', '2023-10-11 07:13:13', '2023-10-11 07:13:13', NULL);
INSERT INTO temp.tmp_upload VALUES (286, '315e765e-71d8-4f3b-841d-66dfe903c003', '315e765e-71d8-4f3b-841d-66dfe903c003.jpg', '8PMABFjFOBdw1Smlw8Gf.jpg', '', '14', '2023-10-11 07:13:43', '2023-10-11 07:13:43', NULL);
INSERT INTO temp.tmp_upload VALUES (287, 'd71652f1-0948-4084-a82a-f6bae678d5ad', 'd71652f1-0948-4084-a82a-f6bae678d5ad.jpg', 'sOaUq7myHihmYbmd0EvF.jpg', '', '14', '2023-10-11 07:14:21', '2023-10-11 07:14:21', NULL);
INSERT INTO temp.tmp_upload VALUES (288, 'b9257f55-3e69-47bb-938d-10c7bae5d484', 'b9257f55-3e69-47bb-938d-10c7bae5d484.jpg', '1697083211563.jpg', '', '14', '2023-10-12 04:01:46', '2023-10-12 04:01:46', NULL);
INSERT INTO temp.tmp_upload VALUES (289, 'bc90003b-2613-41ce-bf9f-37f9feaf4c08', 'bc90003b-2613-41ce-bf9f-37f9feaf4c08.jpg', '1697083424349.jpg', '', '14', '2023-10-12 04:04:58', '2023-10-12 04:04:58', NULL);
INSERT INTO temp.tmp_upload VALUES (290, '99c27ba2-be2c-43ed-b701-02e303b5dadb', '99c27ba2-be2c-43ed-b701-02e303b5dadb.jpg', '1697083424349.jpg', '', '14', '2023-10-12 04:05:10', '2023-10-12 04:05:10', NULL);
INSERT INTO temp.tmp_upload VALUES (291, 'd34ca1df-6109-4ce2-828a-fe38880dede4', 'd34ca1df-6109-4ce2-828a-fe38880dede4.jpg', 'hrYniQ7vn3EnIqNGCy5v.jpg', '', '14', '2023-10-13 07:29:15', '2023-10-13 07:29:15', NULL);
INSERT INTO temp.tmp_upload VALUES (292, '4ac71583-b595-44bf-b011-5e6ae3046215', '4ac71583-b595-44bf-b011-5e6ae3046215.jpg', 'KNEfI6Y5Rn5ndvv1hqot.jpg', '', '14', '2023-10-13 07:29:41', '2023-10-13 07:29:41', NULL);
INSERT INTO temp.tmp_upload VALUES (293, '9a8fe986-798a-4e7d-a114-52b3a57b971c', '9a8fe986-798a-4e7d-a114-52b3a57b971c.jpg', 'KNEfI6Y5Rn5ndvv1hqot.jpg', '', '14', '2023-10-13 07:29:52', '2023-10-13 07:29:52', NULL);
INSERT INTO temp.tmp_upload VALUES (294, '4d3bec9e-1da5-47cc-8fd7-694948fb0042', '4d3bec9e-1da5-47cc-8fd7-694948fb0042.jpg', 'h9qZab1IP69RyOyM464Q.jpg', '', '14', '2023-10-13 07:36:44', '2023-10-13 07:36:44', NULL);
INSERT INTO temp.tmp_upload VALUES (295, '6a826125-7c61-44a4-9f12-ca9ca792e158', '6a826125-7c61-44a4-9f12-ca9ca792e158.jpg', 'h9qZab1IP69RyOyM464Q.jpg', '', '14', '2023-10-13 07:36:58', '2023-10-13 07:36:58', NULL);
INSERT INTO temp.tmp_upload VALUES (296, '7ee74331-433d-4a3f-a4c3-412f0a7cc9d4', '7ee74331-433d-4a3f-a4c3-412f0a7cc9d4.jpg', 'h9qZab1IP69RyOyM464Q.jpg', '', '14', '2023-10-13 07:37:05', '2023-10-13 07:37:05', NULL);
INSERT INTO temp.tmp_upload VALUES (297, '08839a17-04ee-4c15-aca4-a26993068481', '08839a17-04ee-4c15-aca4-a26993068481.jpg', 'sl68fZCcsrbf2sRBnxiR.jpg', '', '15', '2023-10-16 07:44:41', '2023-10-16 07:44:41', NULL);
INSERT INTO temp.tmp_upload VALUES (298, '2a0e22e1-ea4d-4916-aa06-c23292b279af', '2a0e22e1-ea4d-4916-aa06-c23292b279af.jpg', 'kmLy2AzZ72n6LeoWNtWG.jpg', '', '15', '2023-10-16 07:45:15', '2023-10-16 07:45:15', NULL);
INSERT INTO temp.tmp_upload VALUES (299, '62bad3e6-4b41-4f6d-8e1c-4fd11adc02f0', '62bad3e6-4b41-4f6d-8e1c-4fd11adc02f0.jpg', 'kmLy2AzZ72n6LeoWNtWG.jpg', '', '15', '2023-10-16 07:45:21', '2023-10-16 07:45:21', NULL);
INSERT INTO temp.tmp_upload VALUES (300, 'ad47ccb5-aa5c-43d0-af66-06064db3d383', 'ad47ccb5-aa5c-43d0-af66-06064db3d383.jpg', 'ngvpumdt8mQNVsKD4Ohk.jpg', '', '15', '2023-10-16 08:05:36', '2023-10-16 08:05:36', NULL);
INSERT INTO temp.tmp_upload VALUES (301, '0f500985-bf2c-48b3-8fd3-9ef5f191ef8f', '0f500985-bf2c-48b3-8fd3-9ef5f191ef8f.jpg', 'i5k8yx3JoOU5L5PQibAl.jpg', '', '15', '2023-10-16 08:07:56', '2023-10-16 08:07:56', NULL);
INSERT INTO temp.tmp_upload VALUES (302, 'd848c312-ef45-4347-bb50-4924347fdbd9', 'd848c312-ef45-4347-bb50-4924347fdbd9.jpg', 'i5k8yx3JoOU5L5PQibAl.jpg', '', '15', '2023-10-16 08:08:00', '2023-10-16 08:08:00', NULL);
INSERT INTO temp.tmp_upload VALUES (303, 'd928712d-9475-405b-bd32-626a0e320992', 'd928712d-9475-405b-bd32-626a0e320992.jpg', 'IJWA0ehcvrbNfl1QxWjI.jpg', '', '16', '2023-10-16 08:18:49', '2023-10-16 08:18:49', NULL);
INSERT INTO temp.tmp_upload VALUES (304, '64d349f3-db62-40d6-80ec-b5fb7b55c8e2', '64d349f3-db62-40d6-80ec-b5fb7b55c8e2.jpg', 'KS7Ie4aryQGjPyentAop.jpg', '', '16', '2023-10-16 08:19:22', '2023-10-16 08:19:22', NULL);
INSERT INTO temp.tmp_upload VALUES (305, 'b5e974ea-9856-4fd2-89cf-0ed731be0df7', 'b5e974ea-9856-4fd2-89cf-0ed731be0df7.jpg', 'xK1OjoxGy0vZe9QODvLr.jpg', '', '16', '2023-10-16 08:19:54', '2023-10-16 08:19:54', NULL);
INSERT INTO temp.tmp_upload VALUES (306, 'd1f64a7c-943f-47f5-8c51-678e108c6de5', 'd1f64a7c-943f-47f5-8c51-678e108c6de5.jpg', 'cPmBeRgJaOt7LVTnIzNU.jpg', '', '16', '2023-10-16 08:21:00', '2023-10-16 08:21:00', NULL);
INSERT INTO temp.tmp_upload VALUES (307, '35a4947a-8ceb-438f-b564-d4fd8ac6e038', '35a4947a-8ceb-438f-b564-d4fd8ac6e038.jpg', 'KTzlWhkORFGfS4nP9JOn.jpg', '', '16', '2023-10-16 09:02:33', '2023-10-16 09:02:33', NULL);
INSERT INTO temp.tmp_upload VALUES (308, 'b248530c-b356-4b9d-89d6-4ea45757396c', 'b248530c-b356-4b9d-89d6-4ea45757396c.jpg', '1697462605307.jpg', '', '14', '2023-10-16 13:23:31', '2023-10-16 13:23:31', NULL);
INSERT INTO temp.tmp_upload VALUES (309, 'b8c30f5b-6db3-4d9b-8f22-a68754dd60ae', 'b8c30f5b-6db3-4d9b-8f22-a68754dd60ae.jpg', 'YOKazW4cAKpHFl0d5k0y.jpg', '', '17', '2023-10-17 03:10:35', '2023-10-17 03:10:35', NULL);
INSERT INTO temp.tmp_upload VALUES (310, '828fb624-3760-4545-8625-bb09cb26ce81', '828fb624-3760-4545-8625-bb09cb26ce81.jpg', 'zGrxu7czUjlb0s2c7Qyr.jpg', '', '17', '2023-10-17 03:11:18', '2023-10-17 03:11:18', NULL);
INSERT INTO temp.tmp_upload VALUES (311, '68404c4b-41b5-4ecf-815a-d8549c51f2a4', '68404c4b-41b5-4ecf-815a-d8549c51f2a4.jpg', 'zGrxu7czUjlb0s2c7Qyr.jpg', '', '17', '2023-10-17 03:11:22', '2023-10-17 03:11:22', NULL);
INSERT INTO temp.tmp_upload VALUES (312, 'bcfc9ba8-bcb0-4a98-95df-28bde9b6a99c', 'bcfc9ba8-bcb0-4a98-95df-28bde9b6a99c.jpg', '3fJXFahQgJhSOpPdTWBO.jpg', '', '18', '2023-10-17 03:28:17', '2023-10-17 03:28:17', NULL);
INSERT INTO temp.tmp_upload VALUES (313, 'bca24dfa-a333-41ac-9a8a-e0abbb3f4e3e', 'bca24dfa-a333-41ac-9a8a-e0abbb3f4e3e.jpg', 'vxJ1riHafGIKDfyHPDAZ.jpg', '', '18', '2023-10-17 03:29:17', '2023-10-17 03:29:17', NULL);
INSERT INTO temp.tmp_upload VALUES (314, '27e96717-3c14-40ed-9b3e-ee800bae26f5', '27e96717-3c14-40ed-9b3e-ee800bae26f5.jpg', 'cyJbySkqI356QKoGCLmu.jpg', '', '18', '2023-10-17 03:30:00', '2023-10-17 03:30:00', NULL);
INSERT INTO temp.tmp_upload VALUES (315, '8f221ae6-6141-4b00-8259-2644dc649bee', '8f221ae6-6141-4b00-8259-2644dc649bee.jpg', '1697517035213.jpg', '', '14', '2023-10-17 04:30:46', '2023-10-17 04:30:46', NULL);
INSERT INTO temp.tmp_upload VALUES (316, '31335833-f9c0-4e77-8ef3-30181550160d', '31335833-f9c0-4e77-8ef3-30181550160d.jpg', '1697521684705.jpg', '', '19', '2023-10-17 05:48:24', '2023-10-17 05:48:24', NULL);
INSERT INTO temp.tmp_upload VALUES (317, '02613990-c41e-461c-bc1f-172ba0377b1c', '02613990-c41e-461c-bc1f-172ba0377b1c.png', 'Riwayat.png', '', '14', '2023-10-17 06:51:48', '2023-10-17 06:51:48', NULL);
INSERT INTO temp.tmp_upload VALUES (318, '2d53a44f-ee8f-4d83-bc96-f65dd40aea86', '2d53a44f-ee8f-4d83-bc96-f65dd40aea86.jpg', 'userProfile.jpg', '', '14', '2023-10-17 09:36:12', '2023-10-17 09:36:12', NULL);
INSERT INTO temp.tmp_upload VALUES (319, 'f1ceed20-80c5-41d0-8c0b-fca777e5951f', 'f1ceed20-80c5-41d0-8c0b-fca777e5951f.jpg', 'userProfile.jpg', '', '14', '2023-10-17 09:43:30', '2023-10-17 09:43:30', NULL);
INSERT INTO temp.tmp_upload VALUES (320, 'da76c81a-d34e-4310-be9d-69be188891dc', 'da76c81a-d34e-4310-be9d-69be188891dc.jpg', 'userProfile.jpg', '', '14', '2023-10-17 09:45:43', '2023-10-17 09:45:43', NULL);
INSERT INTO temp.tmp_upload VALUES (321, '996167a9-f95a-427f-8b24-97b45c4a6663', '996167a9-f95a-427f-8b24-97b45c4a6663.jpg', 'userProfile.jpg', '', '14', '2023-10-18 04:29:41', '2023-10-18 04:29:41', NULL);
INSERT INTO temp.tmp_upload VALUES (322, '9d7e2b87-c020-4604-bc00-6fa34f1f2f07', '9d7e2b87-c020-4604-bc00-6fa34f1f2f07.jpg', 'userProfile.jpg', '', '14', '2023-10-18 04:33:19', '2023-10-18 04:33:19', NULL);
INSERT INTO temp.tmp_upload VALUES (323, '8e40914b-aadd-4d41-8aa9-5a193d8c1858', '8e40914b-aadd-4d41-8aa9-5a193d8c1858.jpg', 'userProfile.jpg', '', '14', '2023-10-18 04:35:29', '2023-10-18 04:35:29', NULL);
INSERT INTO temp.tmp_upload VALUES (324, '90b021a6-7f46-40b6-bf90-d4f46ccf7c71', '90b021a6-7f46-40b6-bf90-d4f46ccf7c71.jpg', 'userProfile.jpg', '', '14', '2023-10-18 04:35:35', '2023-10-18 04:35:35', NULL);
INSERT INTO temp.tmp_upload VALUES (325, 'db4fcb9e-3d34-4c63-88fd-214ed3e93da2', 'db4fcb9e-3d34-4c63-88fd-214ed3e93da2.jpg', 'userProfile.jpg', '', '14', '2023-10-18 04:57:53', '2023-10-18 04:57:53', NULL);
INSERT INTO temp.tmp_upload VALUES (326, '12b9c0e5-cc83-48c0-8998-c551e0f88f26', '12b9c0e5-cc83-48c0-8998-c551e0f88f26.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:02:04', '2023-10-18 05:02:04', NULL);
INSERT INTO temp.tmp_upload VALUES (327, '0af37202-e308-49ea-b58a-5249553a2588', '0af37202-e308-49ea-b58a-5249553a2588.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:02:28', '2023-10-18 05:02:28', NULL);
INSERT INTO temp.tmp_upload VALUES (328, '1ba6b717-c6de-4082-8e22-9e6c24f9ff22', '1ba6b717-c6de-4082-8e22-9e6c24f9ff22.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:03:13', '2023-10-18 05:03:13', NULL);
INSERT INTO temp.tmp_upload VALUES (329, '5c9567af-9264-4ea3-913d-0a6fd1e10b5b', '5c9567af-9264-4ea3-913d-0a6fd1e10b5b.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:03:57', '2023-10-18 05:03:57', NULL);
INSERT INTO temp.tmp_upload VALUES (330, '88ef96f5-f04d-4675-9a5a-6469b2d63b51', '88ef96f5-f04d-4675-9a5a-6469b2d63b51.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:04:34', '2023-10-18 05:04:34', NULL);
INSERT INTO temp.tmp_upload VALUES (331, 'd1f54a56-205e-4406-99cd-1276e2c4a157', 'd1f54a56-205e-4406-99cd-1276e2c4a157.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:04:41', '2023-10-18 05:04:41', NULL);
INSERT INTO temp.tmp_upload VALUES (332, '16672455-7696-49dc-aa00-adf8f7841f7b', '16672455-7696-49dc-aa00-adf8f7841f7b.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:05:20', '2023-10-18 05:05:20', NULL);
INSERT INTO temp.tmp_upload VALUES (333, '042d002c-27db-447a-9a23-fb3b86000dde', '042d002c-27db-447a-9a23-fb3b86000dde.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:05:59', '2023-10-18 05:05:59', NULL);
INSERT INTO temp.tmp_upload VALUES (334, '6cd24e9b-db2c-436f-86a3-2290f7f69932', '6cd24e9b-db2c-436f-86a3-2290f7f69932.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:06:14', '2023-10-18 05:06:14', NULL);
INSERT INTO temp.tmp_upload VALUES (335, 'fb0967f4-a143-49d7-9aa4-879acfbe7c68', 'fb0967f4-a143-49d7-9aa4-879acfbe7c68.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:06:52', '2023-10-18 05:06:52', NULL);
INSERT INTO temp.tmp_upload VALUES (336, 'f9910aa0-5d96-4237-b307-78e48371319e', 'f9910aa0-5d96-4237-b307-78e48371319e.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:08:25', '2023-10-18 05:08:25', NULL);
INSERT INTO temp.tmp_upload VALUES (337, '7af9dd6d-a76f-4068-bc56-82e340535637', '7af9dd6d-a76f-4068-bc56-82e340535637.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:08:43', '2023-10-18 05:08:43', NULL);
INSERT INTO temp.tmp_upload VALUES (338, 'c7d9ad31-732d-44b1-9d2e-670ca8802be3', 'c7d9ad31-732d-44b1-9d2e-670ca8802be3.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:09:31', '2023-10-18 05:09:31', NULL);
INSERT INTO temp.tmp_upload VALUES (339, 'd73f4d51-6036-4a12-8fa9-cd1e6534cf30', 'd73f4d51-6036-4a12-8fa9-cd1e6534cf30.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:12:05', '2023-10-18 05:12:05', NULL);
INSERT INTO temp.tmp_upload VALUES (340, 'c0fd448c-df9a-47f3-9f15-25f1327aa843', 'c0fd448c-df9a-47f3-9f15-25f1327aa843.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:14:29', '2023-10-18 05:14:29', NULL);
INSERT INTO temp.tmp_upload VALUES (341, 'f48f73b3-0748-4388-b4b9-29d6f6a7cbe4', 'f48f73b3-0748-4388-b4b9-29d6f6a7cbe4.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:18:39', '2023-10-18 05:18:39', NULL);
INSERT INTO temp.tmp_upload VALUES (342, '86380619-1d17-4d7a-aac7-330f9aa49d3c', '86380619-1d17-4d7a-aac7-330f9aa49d3c.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:39:38', '2023-10-18 05:39:38', NULL);
INSERT INTO temp.tmp_upload VALUES (343, '75c20014-1d71-4a0b-a323-b3c0227f6a70', '75c20014-1d71-4a0b-a323-b3c0227f6a70.jpg', 'userProfile.jpg', '', '14', '2023-10-18 05:42:47', '2023-10-18 05:42:47', NULL);
INSERT INTO temp.tmp_upload VALUES (344, '62723e6a-d846-486a-8cc9-42fb91a4f9c0', '62723e6a-d846-486a-8cc9-42fb91a4f9c0.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:26:42', '2023-10-18 13:26:42', NULL);
INSERT INTO temp.tmp_upload VALUES (345, '2b110059-4410-4e95-ab01-6b6f5b07de8a', '2b110059-4410-4e95-ab01-6b6f5b07de8a.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:31:54', '2023-10-18 13:31:54', NULL);
INSERT INTO temp.tmp_upload VALUES (346, 'f2d41407-d6ac-4f88-a868-f789c384b129', 'f2d41407-d6ac-4f88-a868-f789c384b129.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:37:41', '2023-10-18 13:37:41', NULL);
INSERT INTO temp.tmp_upload VALUES (347, 'a064569b-a25f-4e57-b9de-07eedcbad974', 'a064569b-a25f-4e57-b9de-07eedcbad974.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:39:54', '2023-10-18 13:39:54', NULL);
INSERT INTO temp.tmp_upload VALUES (348, '7daceecf-3816-45ce-bd78-ef6712b0d6e9', '7daceecf-3816-45ce-bd78-ef6712b0d6e9.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:42:56', '2023-10-18 13:42:56', NULL);
INSERT INTO temp.tmp_upload VALUES (349, '087fc1e8-820e-42e4-b115-b9bba8dbb77c', '087fc1e8-820e-42e4-b115-b9bba8dbb77c.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:44:46', '2023-10-18 13:44:46', NULL);
INSERT INTO temp.tmp_upload VALUES (350, '2cc02c26-3a50-46ed-b7b4-a45c362aeeea', '2cc02c26-3a50-46ed-b7b4-a45c362aeeea.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:45:46', '2023-10-18 13:45:46', NULL);
INSERT INTO temp.tmp_upload VALUES (351, 'c0f1d674-8154-4157-84ee-e13967e76662', 'c0f1d674-8154-4157-84ee-e13967e76662.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:46:24', '2023-10-18 13:46:24', NULL);
INSERT INTO temp.tmp_upload VALUES (352, '5d81d2df-8070-45ce-a84c-056523b0b3f5', '5d81d2df-8070-45ce-a84c-056523b0b3f5.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:49:04', '2023-10-18 13:49:04', NULL);
INSERT INTO temp.tmp_upload VALUES (353, '6990db37-5c10-4d35-923d-8d6bbd5dc459', '6990db37-5c10-4d35-923d-8d6bbd5dc459.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:53:11', '2023-10-18 13:53:11', NULL);
INSERT INTO temp.tmp_upload VALUES (354, 'f2be9c6c-d757-4dee-a372-07a1d901b843', 'f2be9c6c-d757-4dee-a372-07a1d901b843.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:54:26', '2023-10-18 13:54:26', NULL);
INSERT INTO temp.tmp_upload VALUES (355, 'c83e2688-4fd8-4ca5-b0b7-0fb1fe87a34a', 'c83e2688-4fd8-4ca5-b0b7-0fb1fe87a34a.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:55:25', '2023-10-18 13:55:25', NULL);
INSERT INTO temp.tmp_upload VALUES (356, '65affe86-91a1-4ceb-ad7b-f7cf9aa793e1', '65affe86-91a1-4ceb-ad7b-f7cf9aa793e1.jpg', 'userProfile.jpg', '', '14', '2023-10-18 13:55:38', '2023-10-18 13:55:38', NULL);
INSERT INTO temp.tmp_upload VALUES (357, '8fa7e56a-bdd6-4272-8c13-a3672c44ff5b', '8fa7e56a-bdd6-4272-8c13-a3672c44ff5b.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:06:06', '2023-10-18 14:06:06', NULL);
INSERT INTO temp.tmp_upload VALUES (358, 'f9a168eb-bd85-4a7e-a8d3-f5e584ea72b8', 'f9a168eb-bd85-4a7e-a8d3-f5e584ea72b8.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:06:26', '2023-10-18 14:06:26', NULL);
INSERT INTO temp.tmp_upload VALUES (359, 'ee0e015f-f0e5-40e9-b27c-9167d2c935d7', 'ee0e015f-f0e5-40e9-b27c-9167d2c935d7.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:15:08', '2023-10-18 14:15:08', NULL);
INSERT INTO temp.tmp_upload VALUES (360, 'b13002bf-9ba7-4fb5-9924-775fe24c386f', 'b13002bf-9ba7-4fb5-9924-775fe24c386f.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:17:02', '2023-10-18 14:17:02', NULL);
INSERT INTO temp.tmp_upload VALUES (361, 'a94d5e74-3296-4fde-b440-ac21098ddf7e', 'a94d5e74-3296-4fde-b440-ac21098ddf7e.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:25:47', '2023-10-18 14:25:47', NULL);
INSERT INTO temp.tmp_upload VALUES (362, '349848e2-70d3-436a-a5ba-67e980aa1fd9', '349848e2-70d3-436a-a5ba-67e980aa1fd9.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:27:36', '2023-10-18 14:27:36', NULL);
INSERT INTO temp.tmp_upload VALUES (363, 'c52db7a1-4ae9-467d-a881-ab0cc5a008d9', 'c52db7a1-4ae9-467d-a881-ab0cc5a008d9.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:29:25', '2023-10-18 14:29:25', NULL);
INSERT INTO temp.tmp_upload VALUES (364, 'e8812209-678b-4c7e-9d0d-1a5d91a138a7', 'e8812209-678b-4c7e-9d0d-1a5d91a138a7.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:31:16', '2023-10-18 14:31:16', NULL);
INSERT INTO temp.tmp_upload VALUES (365, 'afdabe7f-d505-4d2b-9f3a-5cddf57d35df', 'afdabe7f-d505-4d2b-9f3a-5cddf57d35df.jpg', 'userProfile.jpg', '', '14', '2023-10-18 14:44:54', '2023-10-18 14:44:54', NULL);
INSERT INTO temp.tmp_upload VALUES (366, '1dfdac5b-5cd7-46c1-a9ca-8ce64b0f8240', '1dfdac5b-5cd7-46c1-a9ca-8ce64b0f8240.jpg', 'userProfile.jpg', '', '18', '2023-10-18 15:15:42', '2023-10-18 15:15:42', NULL);
INSERT INTO temp.tmp_upload VALUES (367, '097641f2-2493-4db2-b56c-54371f876964', '097641f2-2493-4db2-b56c-54371f876964.jpg', 'userProfile.jpg', '', '18', '2023-10-18 15:16:34', '2023-10-18 15:16:34', NULL);
INSERT INTO temp.tmp_upload VALUES (368, 'a2375135-7dfe-4f68-a56d-40d02a417fca', 'a2375135-7dfe-4f68-a56d-40d02a417fca.jpg', 'userProfile.jpg', '', '21', '2023-10-18 15:53:28', '2023-10-18 15:53:28', NULL);
INSERT INTO temp.tmp_upload VALUES (369, '3706087a-01ed-4006-a359-9158c142932c', '3706087a-01ed-4006-a359-9158c142932c.jpg', 'userProfile.jpg', '', '21', '2023-10-18 15:53:59', '2023-10-18 15:53:59', NULL);
INSERT INTO temp.tmp_upload VALUES (370, '13505d10-048c-4226-a8db-93f3ae62e040', '13505d10-048c-4226-a8db-93f3ae62e040.jpg', 'userProfile.jpg', '', '21', '2023-10-18 15:54:36', '2023-10-18 15:54:36', NULL);
INSERT INTO temp.tmp_upload VALUES (371, '79b570fd-b58a-4876-ad3a-1f08989d10df', '79b570fd-b58a-4876-ad3a-1f08989d10df.jpg', 'userProfile.jpg', '', '21', '2023-10-18 15:58:04', '2023-10-18 15:58:04', NULL);
INSERT INTO temp.tmp_upload VALUES (372, '12069e5b-6720-44b4-9177-f5fc05659a15', '12069e5b-6720-44b4-9177-f5fc05659a15.jpg', 'userProfile.jpg', '', '21', '2023-10-18 15:58:58', '2023-10-18 15:58:58', NULL);
INSERT INTO temp.tmp_upload VALUES (373, '36014c20-43d8-4c35-b895-b74e8ab11e2f', '36014c20-43d8-4c35-b895-b74e8ab11e2f.jpg', 'userProfile.jpg', '', '14', '2023-10-18 16:30:45', '2023-10-18 16:30:45', NULL);
INSERT INTO temp.tmp_upload VALUES (374, 'b098d2f6-4bfa-42a9-a1ff-104da48a107a', 'b098d2f6-4bfa-42a9-a1ff-104da48a107a.jpg', 'userProfile.jpg', '', '21', '2023-10-19 03:53:49', '2023-10-19 03:53:49', NULL);
INSERT INTO temp.tmp_upload VALUES (375, '4f122116-f701-409b-a345-233134d469e0', '4f122116-f701-409b-a345-233134d469e0.jpg', 'userProfile.jpg', '', '21', '2023-10-19 03:54:14', '2023-10-19 03:54:14', NULL);
INSERT INTO temp.tmp_upload VALUES (376, '0335add3-0d50-451f-abcc-3211cc8a063f', '0335add3-0d50-451f-abcc-3211cc8a063f.jpg', 'userProfile.jpg', '', '21', '2023-10-19 03:56:48', '2023-10-19 03:56:48', NULL);
INSERT INTO temp.tmp_upload VALUES (377, '4f742de7-ca07-40d2-8dbc-53f9f51ddb7e', '4f742de7-ca07-40d2-8dbc-53f9f51ddb7e.jpg', 'userProfile.jpg', '', '22', '2023-10-19 03:59:20', '2023-10-19 03:59:20', NULL);
INSERT INTO temp.tmp_upload VALUES (378, 'd0f46fc7-8935-43b4-bd10-13a4df971fce', 'd0f46fc7-8935-43b4-bd10-13a4df971fce.jpg', 'userProfile.jpg', '', '22', '2023-10-19 03:59:42', '2023-10-19 03:59:42', NULL);
INSERT INTO temp.tmp_upload VALUES (379, '3d8c1fa0-ff5f-452d-9a21-20e3967b6844', '3d8c1fa0-ff5f-452d-9a21-20e3967b6844.jpg', 'main_chart.jpg', '', '14', '2023-10-19 04:44:30', '2023-10-19 04:44:30', NULL);
INSERT INTO temp.tmp_upload VALUES (380, 'a4c09478-c750-4e34-afac-c79eb3af917b', 'a4c09478-c750-4e34-afac-c79eb3af917b.jpg', 'Fw6Foh8WcAAJh-Q.jpeg', '', '14', '2023-10-19 06:56:18', '2023-10-19 06:56:18', NULL);
INSERT INTO temp.tmp_upload VALUES (381, 'bdd09d84-65e8-45df-acaf-fc3d5013f6ea', 'bdd09d84-65e8-45df-acaf-fc3d5013f6ea.jpg', 'Fw6Foh8WcAAJh-Q.jpeg', '', '23', '2023-10-19 06:56:26', '2023-10-19 06:56:26', NULL);
INSERT INTO temp.tmp_upload VALUES (382, 'de06b166-bc60-4f5c-b9f1-7670f5ded9f3', 'de06b166-bc60-4f5c-b9f1-7670f5ded9f3.jpg', 'userProfile.jpg', '', '22', '2023-10-19 12:33:10', '2023-10-19 12:33:10', NULL);
INSERT INTO temp.tmp_upload VALUES (383, '3c1e7d5d-4763-4d97-b03f-641d44ccdfb0', '3c1e7d5d-4763-4d97-b03f-641d44ccdfb0.jpg', 'userProfile.jpg', '', '22', '2023-10-19 12:34:04', '2023-10-19 12:34:04', NULL);
INSERT INTO temp.tmp_upload VALUES (384, '04458b52-ceea-4208-a2a5-f535c200b021', '04458b52-ceea-4208-a2a5-f535c200b021.jpg', 'userProfile.jpg', '', '25', '2023-10-19 14:37:03', '2023-10-19 14:37:03', NULL);
INSERT INTO temp.tmp_upload VALUES (385, 'b6abe053-d3de-41c4-9530-5c119d10f489', 'b6abe053-d3de-41c4-9530-5c119d10f489.jpg', 'userProfile.jpg', '', '25', '2023-10-19 14:37:43', '2023-10-19 14:37:43', NULL);
INSERT INTO temp.tmp_upload VALUES (386, 'b52014ed-50fb-43bc-bba3-bbd5b0da495d', 'b52014ed-50fb-43bc-bba3-bbd5b0da495d.jpg', 'userProfile.jpg', '', '25', '2023-10-19 14:37:58', '2023-10-19 14:37:58', NULL);
INSERT INTO temp.tmp_upload VALUES (387, 'a00f9fb3-70f0-4282-aec9-7704002e6936', 'a00f9fb3-70f0-4282-aec9-7704002e6936.jpg', 'userProfile.jpg', '', '24', '2023-10-19 15:01:30', '2023-10-19 15:01:30', NULL);
INSERT INTO temp.tmp_upload VALUES (388, '66a7ea09-7e29-4077-bab2-e0439ea25b8f', '66a7ea09-7e29-4077-bab2-e0439ea25b8f.jpg', 'userProfile.jpg', '', '24', '2023-10-20 07:03:25', '2023-10-20 07:03:25', NULL);
INSERT INTO temp.tmp_upload VALUES (389, 'e01637de-7d0a-422a-bbf4-5cf90c5909b5', 'e01637de-7d0a-422a-bbf4-5cf90c5909b5.jpg', 'userProfile.jpg', '', '24', '2023-10-20 08:01:27', '2023-10-20 08:01:27', NULL);
INSERT INTO temp.tmp_upload VALUES (390, 'f3d5e532-a605-4cca-a3d0-f8b3c0c88710', 'f3d5e532-a605-4cca-a3d0-f8b3c0c88710.jpg', 'JajtusehE6aZsjlRyj3h.jpg', '', '14', '2023-10-21 09:11:22', '2023-10-21 09:11:22', NULL);
INSERT INTO temp.tmp_upload VALUES (391, 'a43a9a70-0d12-4772-b285-a79cf839046e', 'a43a9a70-0d12-4772-b285-a79cf839046e.jpg', '6iI8rLn5pvsXVvtTLUoh.jpg', '', '14', '2023-10-21 09:14:36', '2023-10-21 09:14:36', NULL);
INSERT INTO temp.tmp_upload VALUES (392, '9d167194-98ae-4882-85bd-617286903326', '9d167194-98ae-4882-85bd-617286903326.png', 'Riwayat.png', '', '14', '2023-10-22 13:32:49', '2023-10-22 13:32:49', NULL);
INSERT INTO temp.tmp_upload VALUES (393, '66ef23c1-31f3-4223-8068-6fbba03499da', '66ef23c1-31f3-4223-8068-6fbba03499da.jpg', '41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg', '', '14', '2023-10-22 20:03:48', '2023-10-22 20:03:48', NULL);
INSERT INTO temp.tmp_upload VALUES (394, '04a3a841-bac0-4035-9798-f5ac6d5282f3', '04a3a841-bac0-4035-9798-f5ac6d5282f3.jpg', '41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg', '', '14', '2023-10-22 20:04:01', '2023-10-22 20:04:01', NULL);
INSERT INTO temp.tmp_upload VALUES (395, '208c172e-5d7d-4732-a27c-529fe773b66c', '208c172e-5d7d-4732-a27c-529fe773b66c.jpg', '41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg', '', '14', '2023-10-22 20:06:10', '2023-10-22 20:06:10', NULL);
INSERT INTO temp.tmp_upload VALUES (396, '5a4be2f7-2a00-4a1a-8f3b-6620fd012d32', '5a4be2f7-2a00-4a1a-8f3b-6620fd012d32.jpg', '41TLuMg2bNL._UXNaN_FMjpg_QL85_.jpg', '', '14', '2023-10-22 20:06:12', '2023-10-22 20:06:12', NULL);
INSERT INTO temp.tmp_upload VALUES (397, '0fb8c96e-cde0-4ee2-bfd9-da75e1f80c94', '0fb8c96e-cde0-4ee2-bfd9-da75e1f80c94.jpg', '2k-blue-audi-r8-85fsyuechvr6mjxw.jpg', '', '14', '2023-10-22 22:03:24', '2023-10-22 22:03:24', NULL);
INSERT INTO temp.tmp_upload VALUES (398, '340a4fe0-195e-4255-9c65-2c3e433cb156', '340a4fe0-195e-4255-9c65-2c3e433cb156.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:23:21', '2023-10-22 22:23:21', NULL);
INSERT INTO temp.tmp_upload VALUES (399, '2a82d71c-9958-499e-bc6b-a22012da937f', '2a82d71c-9958-499e-bc6b-a22012da937f.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:30:50', '2023-10-22 22:30:50', NULL);
INSERT INTO temp.tmp_upload VALUES (400, '1ee8fede-95d1-4166-9190-c0449e25f851', '1ee8fede-95d1-4166-9190-c0449e25f851.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:31:40', '2023-10-22 22:31:40', NULL);
INSERT INTO temp.tmp_upload VALUES (401, 'ef217809-538b-4ce7-a71e-fd97a1502dd3', 'ef217809-538b-4ce7-a71e-fd97a1502dd3.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:33:07', '2023-10-22 22:33:07', NULL);
INSERT INTO temp.tmp_upload VALUES (402, 'e5b4070b-3330-444c-95fa-088d9ee812fb', 'e5b4070b-3330-444c-95fa-088d9ee812fb.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:33:20', '2023-10-22 22:33:20', NULL);
INSERT INTO temp.tmp_upload VALUES (403, '6b25e931-ac7d-4402-95a0-f7868cdbcb17', '6b25e931-ac7d-4402-95a0-f7868cdbcb17.jpg', 'userProfile.jpg', '', '14', '2023-10-22 22:35:37', '2023-10-22 22:35:37', NULL);
INSERT INTO temp.tmp_upload VALUES (404, '7ecd3acf-dae1-40c5-8f76-e7a05dc620b5', '7ecd3acf-dae1-40c5-8f76-e7a05dc620b5.jpg', 'userProfile.jpg', '', '14', '2023-10-22 23:15:54', '2023-10-22 23:15:54', NULL);
INSERT INTO temp.tmp_upload VALUES (405, '8b87bb47-75e6-4c34-93d3-65349b4d2bf9', '8b87bb47-75e6-4c34-93d3-65349b4d2bf9.jpg', 'userProfile.jpg', '', '14', '2023-10-22 23:21:12', '2023-10-22 23:21:12', NULL);
INSERT INTO temp.tmp_upload VALUES (406, 'e9a690c0-b5e5-4080-8cee-8e34d0bab0f5', 'e9a690c0-b5e5-4080-8cee-8e34d0bab0f5.jpg', 'userProfile.jpg', '', '14', '2023-10-22 23:21:29', '2023-10-22 23:21:29', NULL);
INSERT INTO temp.tmp_upload VALUES (407, '471dfd47-221b-4a3a-9183-41e0df075f39', '471dfd47-221b-4a3a-9183-41e0df075f39.jpg', 'userProfile.jpg', '', '14', '2023-10-22 23:21:43', '2023-10-22 23:21:43', NULL);
INSERT INTO temp.tmp_upload VALUES (408, 'dca586c5-836c-4c70-9c59-dcc3f1730b74', 'dca586c5-836c-4c70-9c59-dcc3f1730b74.jpg', 'userProfile.jpg', '', '24', '2023-10-23 10:13:46', '2023-10-23 10:13:46', NULL);
INSERT INTO temp.tmp_upload VALUES (409, '790774a2-8852-41c9-ab41-9efbda38f3a9', '790774a2-8852-41c9-ab41-9efbda38f3a9.jpg', 'userProfile.jpg', '', '25', '2023-10-23 10:15:19', '2023-10-23 10:15:19', NULL);
INSERT INTO temp.tmp_upload VALUES (410, '8d674818-184a-4e31-860a-4d370933b64f', '8d674818-184a-4e31-860a-4d370933b64f.jpg', 'userProfile.jpg', '', '14', '2023-10-23 11:56:59', '2023-10-23 11:56:59', NULL);
INSERT INTO temp.tmp_upload VALUES (411, '2418aca9-5fcd-449b-962c-8234d6b44412', '2418aca9-5fcd-449b-962c-8234d6b44412.jpg', 'userProfile.jpg', '', '14', '2023-10-24 08:55:15', '2023-10-24 08:55:15', NULL);
INSERT INTO temp.tmp_upload VALUES (412, 'ecf996c6-544a-4ab4-af8a-fa97a0c9521d', 'ecf996c6-544a-4ab4-af8a-fa97a0c9521d.jpg', 'userProfile.jpg', '', '14', '2023-10-24 09:02:07', '2023-10-24 09:02:07', NULL);
INSERT INTO temp.tmp_upload VALUES (413, 'f8e0809c-6181-4be8-bcab-9b06b25b33d8', 'f8e0809c-6181-4be8-bcab-9b06b25b33d8.jpg', 'userProfile.jpg', '', '23', '2023-10-24 10:24:43', '2023-10-24 10:24:43', NULL);
INSERT INTO temp.tmp_upload VALUES (414, '8067033c-71d8-478f-8eaf-b0ba552e8568', '8067033c-71d8-478f-8eaf-b0ba552e8568.jpg', 'userProfile.jpg', '', '14', '2023-10-24 11:20:55', '2023-10-24 11:20:55', NULL);
INSERT INTO temp.tmp_upload VALUES (415, '0bb40ad2-965c-4077-83eb-623c7eda8bf7', '0bb40ad2-965c-4077-83eb-623c7eda8bf7.jpg', 'userProfile.jpg', '', '27', '2023-10-24 12:23:18', '2023-10-24 12:23:18', NULL);
INSERT INTO temp.tmp_upload VALUES (416, '22a8893e-b1bf-42f0-b2f3-ea41ef794a2c', '22a8893e-b1bf-42f0-b2f3-ea41ef794a2c.jpg', 'userProfile.jpg', '', '27', '2023-10-24 12:23:42', '2023-10-24 12:23:42', NULL);
INSERT INTO temp.tmp_upload VALUES (417, '25bbdff2-9354-4f34-8351-10dcb901497d', '25bbdff2-9354-4f34-8351-10dcb901497d.jpg', 'userProfile.jpg', '', '27', '2023-10-24 14:58:39', '2023-10-24 14:58:39', NULL);
INSERT INTO temp.tmp_upload VALUES (418, '7795c7e6-f9c7-4344-b80b-8452a60a5db0', '7795c7e6-f9c7-4344-b80b-8452a60a5db0.jpg', 'userProfile.jpg', '', '27', '2023-10-24 14:58:55', '2023-10-24 14:58:55', NULL);
INSERT INTO temp.tmp_upload VALUES (419, 'c140c620-ca6f-4723-a3b7-c8f42f3453c0', 'c140c620-ca6f-4723-a3b7-c8f42f3453c0.jpg', 'userProfile.jpg', '', '28', '2023-10-24 15:01:06', '2023-10-24 15:01:06', NULL);
INSERT INTO temp.tmp_upload VALUES (420, '00ce2d2d-7c90-47f4-bddd-de1abe590b74', '00ce2d2d-7c90-47f4-bddd-de1abe590b74.jpg', 'userProfile.jpg', '', '28', '2023-10-24 15:02:07', '2023-10-24 15:02:07', NULL);
INSERT INTO temp.tmp_upload VALUES (421, '964bed60-d123-4694-af59-f3a93e370265', '964bed60-d123-4694-af59-f3a93e370265.jpg', 'userProfile.jpg', '', '28', '2023-10-24 15:02:28', '2023-10-24 15:02:28', NULL);
INSERT INTO temp.tmp_upload VALUES (422, '411b71db-d6e1-4b0a-b651-f914b74b710e', '411b71db-d6e1-4b0a-b651-f914b74b710e.jpg', 'userProfile.jpg', '', '14', '2023-10-24 15:03:16', '2023-10-24 15:03:16', NULL);
INSERT INTO temp.tmp_upload VALUES (423, '5b4ea489-e599-48e1-920a-7caec8e61a3b', '5b4ea489-e599-48e1-920a-7caec8e61a3b.jpg', 'userProfile.jpg', '', '29', '2023-10-24 15:06:49', '2023-10-24 15:06:49', NULL);
INSERT INTO temp.tmp_upload VALUES (424, 'a48d6942-999e-4d65-8e4f-1822e68c5e8b', 'a48d6942-999e-4d65-8e4f-1822e68c5e8b.jpg', 'userProfile.jpg', '', '29', '2023-10-24 15:07:06', '2023-10-24 15:07:06', NULL);
INSERT INTO temp.tmp_upload VALUES (425, '338d9e1a-2fa3-4bbd-8026-64f426456755', '338d9e1a-2fa3-4bbd-8026-64f426456755.jpg', 'userProfile.jpg', '', '29', '2023-10-24 15:08:07', '2023-10-24 15:08:07', NULL);
INSERT INTO temp.tmp_upload VALUES (426, 'e4dc12e4-9710-45ef-8367-09b926403f4c', 'e4dc12e4-9710-45ef-8367-09b926403f4c.jpg', 'userProfile.jpg', '', '30', '2023-10-24 15:09:58', '2023-10-24 15:09:58', NULL);
INSERT INTO temp.tmp_upload VALUES (427, '26a9c449-2668-4d9c-b2d2-70068f060463', '26a9c449-2668-4d9c-b2d2-70068f060463.jpg', 'userProfile.jpg', '', '30', '2023-10-24 15:10:17', '2023-10-24 15:10:17', NULL);
INSERT INTO temp.tmp_upload VALUES (428, 'a393df3b-930b-4e8a-a270-4d091bc67f52', 'a393df3b-930b-4e8a-a270-4d091bc67f52.jpg', 'userProfile.jpg', '', '28', '2023-10-24 16:33:24', '2023-10-24 16:33:24', NULL);
INSERT INTO temp.tmp_upload VALUES (429, 'f0c59ff9-0338-47cd-a663-36018ba105ec', 'f0c59ff9-0338-47cd-a663-36018ba105ec.jpg', 'userProfile.jpg', '', '31', '2023-10-24 16:35:14', '2023-10-24 16:35:14', NULL);
INSERT INTO temp.tmp_upload VALUES (430, '48d9cce1-2d83-4ba4-9ffe-7a63af956dd0', '48d9cce1-2d83-4ba4-9ffe-7a63af956dd0.jpg', 'userProfile.jpg', '', '31', '2023-10-24 16:35:42', '2023-10-24 16:35:42', NULL);
INSERT INTO temp.tmp_upload VALUES (431, 'b3507785-5e2d-40fc-b385-4b19c2af2453', 'b3507785-5e2d-40fc-b385-4b19c2af2453.jpg', 'userProfile.jpg', '', '31', '2023-10-24 16:36:00', '2023-10-24 16:36:00', NULL);
INSERT INTO temp.tmp_upload VALUES (432, 'a14fb6b7-136f-4672-971e-c81a141d764e', 'a14fb6b7-136f-4672-971e-c81a141d764e.jpg', 'userProfile.jpg', '', '31', '2023-10-24 16:54:26', '2023-10-24 16:54:26', NULL);
INSERT INTO temp.tmp_upload VALUES (433, '2be57bb0-183a-416f-8454-82633d1cd4a4', '2be57bb0-183a-416f-8454-82633d1cd4a4.jpg', 'userProfile.jpg', '', '30', '2023-10-24 16:57:21', '2023-10-24 16:57:21', NULL);
INSERT INTO temp.tmp_upload VALUES (434, '19da208c-3a96-4be1-acd6-4dd0387d4e7d', '19da208c-3a96-4be1-acd6-4dd0387d4e7d.jpg', 'userProfile.jpg', '', '14', '2023-10-24 17:17:27', '2023-10-24 17:17:27', NULL);
INSERT INTO temp.tmp_upload VALUES (435, '08a4239c-cece-4bfe-b788-9371dd0b994a', '08a4239c-cece-4bfe-b788-9371dd0b994a.jpg', 'userProfile.jpg', '', '14', '2023-10-24 17:17:32', '2023-10-24 17:17:32', NULL);
INSERT INTO temp.tmp_upload VALUES (436, '592fb488-f2b6-44d2-9373-31d898fdc243', '592fb488-f2b6-44d2-9373-31d898fdc243.jpg', 'userProfile.jpg', '', '14', '2023-10-24 17:35:58', '2023-10-24 17:35:58', NULL);
INSERT INTO temp.tmp_upload VALUES (437, '6fd51c27-82ad-474b-a70c-e64e78261004', '6fd51c27-82ad-474b-a70c-e64e78261004.jpg', 'userProfile.jpg', '', '14', '2023-10-26 13:39:54', '2023-10-26 13:39:54', NULL);
INSERT INTO temp.tmp_upload VALUES (438, 'bdb70c3a-a795-44a5-9fcb-be9a0438fc35', 'bdb70c3a-a795-44a5-9fcb-be9a0438fc35.jpg', 'userProfile.jpg', '', '14', '2023-10-26 13:44:56', '2023-10-26 13:44:56', NULL);
INSERT INTO temp.tmp_upload VALUES (439, '0ba8f569-e0a7-4641-9077-32f4ecee22ad', '0ba8f569-e0a7-4641-9077-32f4ecee22ad.jpg', 'userProfile.jpg', '', '14', '2023-10-26 13:45:56', '2023-10-26 13:45:56', NULL);
INSERT INTO temp.tmp_upload VALUES (440, 'ae3d585d-5f84-473f-88bf-e04f69ffd607', 'ae3d585d-5f84-473f-88bf-e04f69ffd607.jpg', 'userProfile.jpg', '', '31', '2023-10-26 13:56:52', '2023-10-26 13:56:52', NULL);
INSERT INTO temp.tmp_upload VALUES (441, '04bb824b-c4e5-4beb-9330-54c4079effc4', '04bb824b-c4e5-4beb-9330-54c4079effc4.png', 'unnamed.png', '', '2', '2023-10-31 13:33:44', '2023-10-31 13:33:44', NULL);
INSERT INTO temp.tmp_upload VALUES (442, '3e800993-c81a-4850-9e96-8d4cd5e28779', '3e800993-c81a-4850-9e96-8d4cd5e28779.png', 'unnamed.png', '', '2', '2023-10-31 13:34:35', '2023-10-31 13:34:35', NULL);
INSERT INTO temp.tmp_upload VALUES (443, '7bbe87cf-4273-4d71-8bb7-5288e33bc6b2', '7bbe87cf-4273-4d71-8bb7-5288e33bc6b2.png', 'unnamed.png', '', '2', '2023-10-31 13:39:21', '2023-10-31 13:39:21', NULL);
INSERT INTO temp.tmp_upload VALUES (444, '051df262-19b1-4a30-a7d3-a0f29c040ea8', '051df262-19b1-4a30-a7d3-a0f29c040ea8.jpg', 'userProfile.jpg', '', '31', '2023-11-01 16:23:25', '2023-11-01 16:23:25', NULL);
INSERT INTO temp.tmp_upload VALUES (445, '3d2785f1-ffa0-4729-b87b-d5a96c492cfd', '3d2785f1-ffa0-4729-b87b-d5a96c492cfd.jpg', 'userProfile.jpg', '', '14', '2023-11-02 09:48:02', '2023-11-02 09:48:02', NULL);
INSERT INTO temp.tmp_upload VALUES (446, '0f20f2c3-ea53-4656-9562-539577d60d5e', '0f20f2c3-ea53-4656-9562-539577d60d5e.jpg', 'userProfile.jpg', '', '14', '2023-11-02 10:45:24', '2023-11-02 10:45:24', NULL);
INSERT INTO temp.tmp_upload VALUES (447, '6b979d8e-4d51-4120-943d-e8f90d3d4d8d', '6b979d8e-4d51-4120-943d-e8f90d3d4d8d.jpg', 'userProfile.jpg', '', '20', '2023-11-02 11:21:27', '2023-11-02 11:21:27', NULL);
INSERT INTO temp.tmp_upload VALUES (448, 'b8e69bf1-ea95-42ec-8f78-7a16910b5944', 'b8e69bf1-ea95-42ec-8f78-7a16910b5944.jpg', 'userProfile.jpg', '', '14', '2023-11-06 12:56:57', '2023-11-06 12:56:57', NULL);
INSERT INTO temp.tmp_upload VALUES (449, '5f2cca5d-14ad-4f10-87c5-0a1999ac4f86', '5f2cca5d-14ad-4f10-87c5-0a1999ac4f86.jpg', 'userProfile.jpg', '', '14', '2023-11-06 12:57:41', '2023-11-06 12:57:41', NULL);
INSERT INTO temp.tmp_upload VALUES (450, 'e7bf2858-137f-497b-b7fd-08aaa0c4f197', 'e7bf2858-137f-497b-b7fd-08aaa0c4f197.jpg', 'userProfile.jpg', '', '14', '2023-11-06 12:58:53', '2023-11-06 12:58:53', NULL);
INSERT INTO temp.tmp_upload VALUES (451, '5ce6e72d-b37d-4548-946d-c2da3be3c14d', '5ce6e72d-b37d-4548-946d-c2da3be3c14d.jpg', 'userProfile.jpg', '', '14', '2023-11-06 13:01:15', '2023-11-06 13:01:15', NULL);
INSERT INTO temp.tmp_upload VALUES (452, '96aee439-2fd2-4bf6-bee3-0757e783ddd8', '96aee439-2fd2-4bf6-bee3-0757e783ddd8.png', 'logo.png', '', '14', '2023-11-06 13:24:41', '2023-11-06 13:24:41', NULL);
INSERT INTO temp.tmp_upload VALUES (453, '7e2bf93e-53ae-4afa-b9fc-bd8b4225475c', '7e2bf93e-53ae-4afa-b9fc-bd8b4225475c.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:20:03', '2023-11-06 14:20:03', NULL);
INSERT INTO temp.tmp_upload VALUES (454, '8f5613f0-80e3-4202-b185-1d14fc922699', '8f5613f0-80e3-4202-b185-1d14fc922699.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:21:41', '2023-11-06 14:21:41', NULL);
INSERT INTO temp.tmp_upload VALUES (455, '15b3c2dc-60ce-4a3d-a08a-6eeb493329f3', '15b3c2dc-60ce-4a3d-a08a-6eeb493329f3.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:31:13', '2023-11-06 14:31:13', NULL);
INSERT INTO temp.tmp_upload VALUES (456, '0e8f5729-2d4c-4d6f-8d64-165300c0dea8', '0e8f5729-2d4c-4d6f-8d64-165300c0dea8.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:31:37', '2023-11-06 14:31:37', NULL);
INSERT INTO temp.tmp_upload VALUES (457, '4bfbbf76-5f82-472f-b122-75c8b3255a71', '4bfbbf76-5f82-472f-b122-75c8b3255a71.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:31:50', '2023-11-06 14:31:50', NULL);
INSERT INTO temp.tmp_upload VALUES (458, 'f72ee6b3-5fb0-4b27-8d5b-6ae4a836817b', 'f72ee6b3-5fb0-4b27-8d5b-6ae4a836817b.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:33:50', '2023-11-06 14:33:50', NULL);
INSERT INTO temp.tmp_upload VALUES (459, '29386082-1ffe-46f7-bdcf-896e702787e2', '29386082-1ffe-46f7-bdcf-896e702787e2.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:36:00', '2023-11-06 14:36:00', NULL);
INSERT INTO temp.tmp_upload VALUES (460, 'b3d670aa-6481-4cdb-b655-4e73ed407c55', 'b3d670aa-6481-4cdb-b655-4e73ed407c55.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:38:03', '2023-11-06 14:38:03', NULL);
INSERT INTO temp.tmp_upload VALUES (461, 'd1ded3b6-4665-4a53-8050-775853478e65', 'd1ded3b6-4665-4a53-8050-775853478e65.jpg', 'userProfile.jpg', '', '20', '2023-11-06 14:43:52', '2023-11-06 14:43:52', NULL);
INSERT INTO temp.tmp_upload VALUES (462, '354189ff-62e0-4f8a-9819-d59859de4fd1', '354189ff-62e0-4f8a-9819-d59859de4fd1.jpg', 'userProfile.jpg', '', '20', '2023-11-06 15:16:14', '2023-11-06 15:16:14', NULL);
INSERT INTO temp.tmp_upload VALUES (463, 'a7502875-7662-40b8-b57a-e8df15271f8d', 'a7502875-7662-40b8-b57a-e8df15271f8d.jpg', 'userProfile.jpg', '', '20', '2023-11-06 15:16:37', '2023-11-06 15:16:37', NULL);
INSERT INTO temp.tmp_upload VALUES (464, '6c37bcca-19c3-470d-bd29-c47e57e89b0d', '6c37bcca-19c3-470d-bd29-c47e57e89b0d.jpg', 'userProfile.jpg', '', '20', '2023-11-06 15:17:29', '2023-11-06 15:17:29', NULL);
INSERT INTO temp.tmp_upload VALUES (465, '327f2e0e-b471-41aa-9b41-96c8877590ba', '327f2e0e-b471-41aa-9b41-96c8877590ba.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:18:22', '2023-11-06 15:18:22', NULL);
INSERT INTO temp.tmp_upload VALUES (466, '65c2eb2b-6d64-4593-ada3-bf40af317b0d', '65c2eb2b-6d64-4593-ada3-bf40af317b0d.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:21:41', '2023-11-06 15:21:41', NULL);
INSERT INTO temp.tmp_upload VALUES (467, 'c4050a72-76d8-42ae-af56-e80ef80637bc', 'c4050a72-76d8-42ae-af56-e80ef80637bc.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:22:07', '2023-11-06 15:22:07', NULL);
INSERT INTO temp.tmp_upload VALUES (468, 'd98828b9-7c65-4759-8c65-edf79d177001', 'd98828b9-7c65-4759-8c65-edf79d177001.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:22:25', '2023-11-06 15:22:25', NULL);
INSERT INTO temp.tmp_upload VALUES (469, '8d8e5396-6198-4616-a8b8-6902090848ef', '8d8e5396-6198-4616-a8b8-6902090848ef.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:23:53', '2023-11-06 15:23:53', NULL);
INSERT INTO temp.tmp_upload VALUES (470, 'd4399b2c-ab5a-402d-ac1f-a47e40734850', 'd4399b2c-ab5a-402d-ac1f-a47e40734850.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:24:15', '2023-11-06 15:24:15', NULL);
INSERT INTO temp.tmp_upload VALUES (471, 'c930d2ab-a646-4823-9266-ec267bb718a2', 'c930d2ab-a646-4823-9266-ec267bb718a2.jpg', 'userProfile.jpg', '', '14', '2023-11-06 15:24:31', '2023-11-06 15:24:31', NULL);
INSERT INTO temp.tmp_upload VALUES (472, '0756faae-1532-4ba3-96dd-387be1beb5c4', '0756faae-1532-4ba3-96dd-387be1beb5c4.jpg', 'userProfile.jpg', '', '32', '2023-11-06 15:39:07', '2023-11-06 15:39:07', NULL);
INSERT INTO temp.tmp_upload VALUES (473, '4da58e73-982e-4752-99d8-7bda91188749', '4da58e73-982e-4752-99d8-7bda91188749.jpg', 'userProfile.jpg', '', '32', '2023-11-07 09:19:42', '2023-11-07 09:19:42', NULL);
INSERT INTO temp.tmp_upload VALUES (474, '410cdc80-2be7-4752-a76c-a49a324e22d6', '410cdc80-2be7-4752-a76c-a49a324e22d6.jpg', 'userProfile.jpg', '', '32', '2023-11-07 10:23:50', '2023-11-07 10:23:50', NULL);
INSERT INTO temp.tmp_upload VALUES (475, '311fef0a-925d-4c0e-8a43-24f3be318c66', '311fef0a-925d-4c0e-8a43-24f3be318c66.jpg', 'userProfile.jpg', '', '14', '2023-11-07 11:13:40', '2023-11-07 11:13:40', NULL);
INSERT INTO temp.tmp_upload VALUES (476, 'd26aff01-945f-44b8-b4cf-bc56858d35e8', 'd26aff01-945f-44b8-b4cf-bc56858d35e8.jpg', 'userProfile.jpg', '', '14', '2023-11-07 12:52:13', '2023-11-07 12:52:13', NULL);
INSERT INTO temp.tmp_upload VALUES (477, '735a54f5-c075-4a2d-9a4c-ef368ade9068', '735a54f5-c075-4a2d-9a4c-ef368ade9068.jpg', 'userProfile.jpg', '', '14', '2023-11-07 12:52:25', '2023-11-07 12:52:25', NULL);
INSERT INTO temp.tmp_upload VALUES (478, '469b0d99-cabd-4b5a-b1ad-a2e5ba4b3782', '469b0d99-cabd-4b5a-b1ad-a2e5ba4b3782.jpg', 'userProfile.jpg', '', '20', '2023-11-07 12:53:18', '2023-11-07 12:53:18', NULL);
INSERT INTO temp.tmp_upload VALUES (479, '710a419b-06e8-4249-a036-1000fbb54427', '710a419b-06e8-4249-a036-1000fbb54427.jpg', 'userProfile.jpg', '', '20', '2023-11-07 12:53:59', '2023-11-07 12:53:59', NULL);
INSERT INTO temp.tmp_upload VALUES (480, '68a2231c-2f61-499a-8c7c-2ed9cb436e5c', '68a2231c-2f61-499a-8c7c-2ed9cb436e5c.jpg', 'userProfile.jpg', '', '20', '2023-11-07 12:54:10', '2023-11-07 12:54:10', NULL);
INSERT INTO temp.tmp_upload VALUES (481, 'af44fd47-b613-4303-a564-54ac7e7e26e7', 'af44fd47-b613-4303-a564-54ac7e7e26e7.jpg', 'userProfile.jpg', '', '20', '2023-11-07 12:55:26', '2023-11-07 12:55:26', NULL);
INSERT INTO temp.tmp_upload VALUES (482, '1f115e5d-f57e-438d-897c-e987d498b3c1', '1f115e5d-f57e-438d-897c-e987d498b3c1.jpg', 'userProfile.jpg', '', '19', '2023-11-07 12:56:58', '2023-11-07 12:56:58', NULL);
INSERT INTO temp.tmp_upload VALUES (483, '91234377-ab0e-447f-9cd0-e083da4bf268', '91234377-ab0e-447f-9cd0-e083da4bf268.jpg', 'userProfile.jpg', '', '19', '2023-11-08 13:10:04', '2023-11-08 13:10:04', NULL);
INSERT INTO temp.tmp_upload VALUES (484, '1e402edd-ba21-45fc-a85c-d657bf7ce8e7', '1e402edd-ba21-45fc-a85c-d657bf7ce8e7.jpg', 'userProfile.jpg', '', '19', '2023-11-09 09:18:39', '2023-11-09 09:18:39', NULL);
INSERT INTO temp.tmp_upload VALUES (485, '528ec2ca-6e1d-497b-b5e5-f22c9f6be08e', '528ec2ca-6e1d-497b-b5e5-f22c9f6be08e.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:02:56', '2023-11-09 10:02:56', NULL);
INSERT INTO temp.tmp_upload VALUES (486, 'eb8fea1e-ddcc-4c46-b5d5-562b00850d74', 'eb8fea1e-ddcc-4c46-b5d5-562b00850d74.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:06:13', '2023-11-09 10:06:13', NULL);
INSERT INTO temp.tmp_upload VALUES (487, 'e2816fa1-5153-4aa4-94ad-f2ed5729ab44', 'e2816fa1-5153-4aa4-94ad-f2ed5729ab44.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:06:28', '2023-11-09 10:06:28', NULL);
INSERT INTO temp.tmp_upload VALUES (488, '95e3f758-256a-47a4-979d-776bf2f0349e', '95e3f758-256a-47a4-979d-776bf2f0349e.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:06:53', '2023-11-09 10:06:53', NULL);
INSERT INTO temp.tmp_upload VALUES (489, 'd605c13a-de17-4250-b514-51d69aad1cc5', 'd605c13a-de17-4250-b514-51d69aad1cc5.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:07:24', '2023-11-09 10:07:24', NULL);
INSERT INTO temp.tmp_upload VALUES (490, 'fcca2476-14da-4030-9e29-ce800041173b', 'fcca2476-14da-4030-9e29-ce800041173b.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:08:08', '2023-11-09 10:08:08', NULL);
INSERT INTO temp.tmp_upload VALUES (491, '1baa779b-2fa5-46eb-a1dc-d244b072413f', '1baa779b-2fa5-46eb-a1dc-d244b072413f.jpg', 'userProfile.jpg', '', '14', '2023-11-09 10:48:32', '2023-11-09 10:48:32', NULL);
INSERT INTO temp.tmp_upload VALUES (492, 'b0495f1b-54f4-42c4-8712-039c49a20530', 'b0495f1b-54f4-42c4-8712-039c49a20530.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:04:08', '2023-11-10 10:04:08', NULL);
INSERT INTO temp.tmp_upload VALUES (493, '38d758ba-c6f3-42d3-9a00-5c3ce43c554a', '38d758ba-c6f3-42d3-9a00-5c3ce43c554a.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:23:36', '2023-11-10 10:23:36', NULL);
INSERT INTO temp.tmp_upload VALUES (494, '448744a3-086f-4501-9a43-aa7da0d73320', '448744a3-086f-4501-9a43-aa7da0d73320.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:23:49', '2023-11-10 10:23:49', NULL);
INSERT INTO temp.tmp_upload VALUES (495, 'a4596899-76f5-49ee-bfdb-ec2ab46ee29f', 'a4596899-76f5-49ee-bfdb-ec2ab46ee29f.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:24:28', '2023-11-10 10:24:28', NULL);
INSERT INTO temp.tmp_upload VALUES (496, 'd072cc23-7c1f-4f5e-ae3c-b502ed58c4b3', 'd072cc23-7c1f-4f5e-ae3c-b502ed58c4b3.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:31:24', '2023-11-10 10:31:24', NULL);
INSERT INTO temp.tmp_upload VALUES (497, '948e2c12-c0bb-476e-a14a-70f57502c5fb', '948e2c12-c0bb-476e-a14a-70f57502c5fb.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:31:56', '2023-11-10 10:31:56', NULL);
INSERT INTO temp.tmp_upload VALUES (498, '274f0936-bc55-4caf-beb9-2c7ac410615c', '274f0936-bc55-4caf-beb9-2c7ac410615c.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:33:49', '2023-11-10 10:33:49', NULL);
INSERT INTO temp.tmp_upload VALUES (499, '6bf46413-0aeb-43a1-8b9e-a3147679e0d2', '6bf46413-0aeb-43a1-8b9e-a3147679e0d2.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:34:23', '2023-11-10 10:34:23', NULL);
INSERT INTO temp.tmp_upload VALUES (500, '413c218a-a927-4f8c-9343-4919cf0c1691', '413c218a-a927-4f8c-9343-4919cf0c1691.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:39:06', '2023-11-10 10:39:06', NULL);
INSERT INTO temp.tmp_upload VALUES (501, '2da7679d-c208-4a37-b967-53eecac38da5', '2da7679d-c208-4a37-b967-53eecac38da5.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:41:23', '2023-11-10 10:41:23', NULL);
INSERT INTO temp.tmp_upload VALUES (502, 'a0033f0e-7fd1-46fe-8686-1cdaf4415bdf', 'a0033f0e-7fd1-46fe-8686-1cdaf4415bdf.jpg', 'userProfile.jpg', '', '14', '2023-11-10 10:42:06', '2023-11-10 10:42:06', NULL);
INSERT INTO temp.tmp_upload VALUES (503, '406bc284-1bf7-4a0d-857d-de0b3750d869', '406bc284-1bf7-4a0d-857d-de0b3750d869.jpg', 'userProfile.jpg', '', '14', '2023-11-10 12:51:42', '2023-11-10 12:51:42', NULL);
INSERT INTO temp.tmp_upload VALUES (504, '2b13adf7-a050-4ac9-b7df-07afce119dac', '2b13adf7-a050-4ac9-b7df-07afce119dac.jpg', 'userProfile.jpg', '', '14', '2023-11-10 12:53:34', '2023-11-10 12:53:34', NULL);
INSERT INTO temp.tmp_upload VALUES (505, '7c49a807-c090-4b67-9f71-04ec5bf77f84', '7c49a807-c090-4b67-9f71-04ec5bf77f84.jpg', 'userProfile.jpg', '', '14', '2023-11-10 12:57:50', '2023-11-10 12:57:50', NULL);
INSERT INTO temp.tmp_upload VALUES (506, 'f21e1417-2f75-4661-bf99-dbe07c9ee989', 'f21e1417-2f75-4661-bf99-dbe07c9ee989.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:01:10', '2023-11-10 13:01:10', NULL);
INSERT INTO temp.tmp_upload VALUES (507, '3fa9907a-2f2d-45ef-b135-59d379d9dd59', '3fa9907a-2f2d-45ef-b135-59d379d9dd59.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:01:47', '2023-11-10 13:01:47', NULL);
INSERT INTO temp.tmp_upload VALUES (508, '0fe30177-70b5-4cd9-852a-06948bb97101', '0fe30177-70b5-4cd9-852a-06948bb97101.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:02:17', '2023-11-10 13:02:17', NULL);
INSERT INTO temp.tmp_upload VALUES (509, '1c3f135e-28a6-4b5b-b4d1-34ba519cea8f', '1c3f135e-28a6-4b5b-b4d1-34ba519cea8f.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:05:37', '2023-11-10 13:05:37', NULL);
INSERT INTO temp.tmp_upload VALUES (510, '6287ba65-fcf4-49aa-8395-0865432ae7ae', '6287ba65-fcf4-49aa-8395-0865432ae7ae.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:07:46', '2023-11-10 13:07:46', NULL);
INSERT INTO temp.tmp_upload VALUES (511, '4fd7fdf9-61c4-4ed6-b4d2-bf57367d72d6', '4fd7fdf9-61c4-4ed6-b4d2-bf57367d72d6.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:09:32', '2023-11-10 13:09:32', NULL);
INSERT INTO temp.tmp_upload VALUES (512, '15f42b71-cd42-4761-ba36-8fdab074f692', '15f42b71-cd42-4761-ba36-8fdab074f692.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:09:59', '2023-11-10 13:09:59', NULL);
INSERT INTO temp.tmp_upload VALUES (513, 'a59b65b6-389f-42a6-a0fb-3044dd5926fd', 'a59b65b6-389f-42a6-a0fb-3044dd5926fd.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:10:32', '2023-11-10 13:10:32', NULL);
INSERT INTO temp.tmp_upload VALUES (514, 'fd2c9a70-7943-43af-817d-8690983226e9', 'fd2c9a70-7943-43af-817d-8690983226e9.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:10:48', '2023-11-10 13:10:48', NULL);
INSERT INTO temp.tmp_upload VALUES (515, '389f38ff-35d8-42d2-93fc-ec836ac46b9a', '389f38ff-35d8-42d2-93fc-ec836ac46b9a.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:11:26', '2023-11-10 13:11:26', NULL);
INSERT INTO temp.tmp_upload VALUES (516, '95a8dd7b-9260-47c2-bb38-1a5eba8c0144', '95a8dd7b-9260-47c2-bb38-1a5eba8c0144.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:11:45', '2023-11-10 13:11:45', NULL);
INSERT INTO temp.tmp_upload VALUES (517, 'ae67495a-3bf6-4cc0-86e1-56b005e05e4e', 'ae67495a-3bf6-4cc0-86e1-56b005e05e4e.jpg', 'userProfile.jpg', '', '14', '2023-11-10 13:12:59', '2023-11-10 13:12:59', NULL);
INSERT INTO temp.tmp_upload VALUES (518, 'a1b62aaf-fb40-474d-a0ac-735ce96e8419', 'a1b62aaf-fb40-474d-a0ac-735ce96e8419.jpg', 'userProfile.jpg', '', '14', '2023-11-10 17:13:45', '2023-11-10 17:13:45', NULL);
INSERT INTO temp.tmp_upload VALUES (519, 'a3abb38c-7855-49ba-8d39-6d6eaec38b7e', 'a3abb38c-7855-49ba-8d39-6d6eaec38b7e.jpg', 'userProfile.jpg', '', '14', '2023-11-10 17:19:00', '2023-11-10 17:19:00', NULL);
INSERT INTO temp.tmp_upload VALUES (520, '4608f987-6ff8-40fc-9997-f829819bcbe1', '4608f987-6ff8-40fc-9997-f829819bcbe1.jpg', 'userProfile.jpg', '', '14', '2023-11-13 20:44:22', '2023-11-13 20:44:22', NULL);
INSERT INTO temp.tmp_upload VALUES (521, 'a2f27162-420f-4584-835a-e3db16c9d698', 'a2f27162-420f-4584-835a-e3db16c9d698.jpg', 'userProfile.jpg', '', '14', '2023-11-13 21:41:19', '2023-11-13 21:41:19', NULL);
INSERT INTO temp.tmp_upload VALUES (522, '750876f5-0eeb-44d1-af11-651653296a50', '750876f5-0eeb-44d1-af11-651653296a50.jpg', 'userProfile.jpg', '', '14', '2023-11-14 09:29:25', '2023-11-14 09:29:25', NULL);
INSERT INTO temp.tmp_upload VALUES (523, '21a64736-d3c4-4ae6-b514-0a13dc538a63', '21a64736-d3c4-4ae6-b514-0a13dc538a63.jpg', 'userProfile.jpg', '', '14', '2023-11-14 09:47:04', '2023-11-14 09:47:04', NULL);
INSERT INTO temp.tmp_upload VALUES (524, '3908d44a-4de9-43f0-af0c-551e7aee397f', '3908d44a-4de9-43f0-af0c-551e7aee397f.jpg', 'userProfile.jpg', '', '14', '2023-11-14 11:16:18', '2023-11-14 11:16:18', NULL);
INSERT INTO temp.tmp_upload VALUES (525, '18cf93ce-20e3-44d9-bfbf-183e42d7b63d', '18cf93ce-20e3-44d9-bfbf-183e42d7b63d.jpg', 'userProfile.jpg', '', '14', '2023-11-14 11:22:32', '2023-11-14 11:22:32', NULL);
INSERT INTO temp.tmp_upload VALUES (526, '741fb780-486b-4acd-bfe8-2741b97930f1', '741fb780-486b-4acd-bfe8-2741b97930f1.jpg', 'userProfile.jpg', '', '14', '2023-11-14 11:24:12', '2023-11-14 11:24:12', NULL);
INSERT INTO temp.tmp_upload VALUES (527, 'af26cbb9-85ee-45b4-b9ee-30315104c269', 'af26cbb9-85ee-45b4-b9ee-30315104c269.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:04:54', '2023-11-14 14:04:54', NULL);
INSERT INTO temp.tmp_upload VALUES (528, '097c8c75-8fc2-40a6-bd02-4de49a843600', '097c8c75-8fc2-40a6-bd02-4de49a843600.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:08:59', '2023-11-14 14:08:59', NULL);
INSERT INTO temp.tmp_upload VALUES (529, '594013f7-9d90-4b9c-8605-8709dd7be36a', '594013f7-9d90-4b9c-8605-8709dd7be36a.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:10:30', '2023-11-14 14:10:30', NULL);
INSERT INTO temp.tmp_upload VALUES (530, '5d7a08b7-2730-4974-a5e7-93142bd01411', '5d7a08b7-2730-4974-a5e7-93142bd01411.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:10:43', '2023-11-14 14:10:43', NULL);
INSERT INTO temp.tmp_upload VALUES (531, '38950abf-4192-4ed5-bad8-13038c053fed', '38950abf-4192-4ed5-bad8-13038c053fed.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:11:00', '2023-11-14 14:11:00', NULL);
INSERT INTO temp.tmp_upload VALUES (532, 'aad29e32-d40a-4bdd-8637-347960f50b11', 'aad29e32-d40a-4bdd-8637-347960f50b11.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:11:12', '2023-11-14 14:11:12', NULL);
INSERT INTO temp.tmp_upload VALUES (533, '651e85a5-219b-4a02-8dcf-abd3fb3104b8', '651e85a5-219b-4a02-8dcf-abd3fb3104b8.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:11:26', '2023-11-14 14:11:26', NULL);
INSERT INTO temp.tmp_upload VALUES (534, '17cb86ef-dfbe-48c3-88a2-c630044bf143', '17cb86ef-dfbe-48c3-88a2-c630044bf143.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:11:38', '2023-11-14 14:11:38', NULL);
INSERT INTO temp.tmp_upload VALUES (535, '3b9b8b90-9fad-4052-83e5-adb6cd514e89', '3b9b8b90-9fad-4052-83e5-adb6cd514e89.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:13:14', '2023-11-14 14:13:14', NULL);
INSERT INTO temp.tmp_upload VALUES (536, 'f7f8a1d2-2a46-4426-8de3-c6f145e1331b', 'f7f8a1d2-2a46-4426-8de3-c6f145e1331b.jpg', 'userProfile.jpg', '', '14', '2023-11-14 14:13:38', '2023-11-14 14:13:38', NULL);
INSERT INTO temp.tmp_upload VALUES (537, '1bc6cdaf-0a8f-4141-8466-a1ea70ee69e4', '1bc6cdaf-0a8f-4141-8466-a1ea70ee69e4.jpg', 'userProfile.jpg', '', '14', '2023-11-15 08:27:30', '2023-11-15 08:27:30', NULL);
INSERT INTO temp.tmp_upload VALUES (538, 'babf98d8-f62e-4f18-a10f-e2bf8cf2a639', 'babf98d8-f62e-4f18-a10f-e2bf8cf2a639.jpg', 'userProfile.jpg', '', '14', '2023-11-15 09:27:14', '2023-11-15 09:27:14', NULL);
INSERT INTO temp.tmp_upload VALUES (539, 'c429c9b0-a00f-4ae3-a669-4b5852f103fe', 'c429c9b0-a00f-4ae3-a669-4b5852f103fe.jpg', 'userProfile.jpg', '', '20', '2023-11-15 09:32:07', '2023-11-15 09:32:07', NULL);
INSERT INTO temp.tmp_upload VALUES (540, '71350e32-d39c-4855-bb9d-7f04b1ec8330', '71350e32-d39c-4855-bb9d-7f04b1ec8330.jpg', 'userProfile.jpg', '', '20', '2023-11-15 10:18:25', '2023-11-15 10:18:25', NULL);
INSERT INTO temp.tmp_upload VALUES (541, '7aa0d966-ae24-4b6a-aacc-dd8f07de8473', '7aa0d966-ae24-4b6a-aacc-dd8f07de8473.jpg', 'userProfile.jpg', '', '32', '2023-11-15 10:35:51', '2023-11-15 10:35:51', NULL);
INSERT INTO temp.tmp_upload VALUES (542, '942928a1-7052-4553-aea9-b9312bb9aaba', '942928a1-7052-4553-aea9-b9312bb9aaba.jpg', 'userProfile.jpg', '', '32', '2023-11-15 10:37:21', '2023-11-15 10:37:21', NULL);
INSERT INTO temp.tmp_upload VALUES (543, '9e668eee-9a2d-4edb-9bb9-5d4ca92ff38c', '9e668eee-9a2d-4edb-9bb9-5d4ca92ff38c.jpg', 'userProfile.jpg', '', '34', '2023-11-15 12:56:31', '2023-11-15 12:56:31', NULL);
INSERT INTO temp.tmp_upload VALUES (544, '22617006-a973-4fc6-8d5c-edf53fc0a6e9', '22617006-a973-4fc6-8d5c-edf53fc0a6e9.jpg', 'userProfile.jpg', '', '34', '2023-11-15 13:10:51', '2023-11-15 13:10:51', NULL);
INSERT INTO temp.tmp_upload VALUES (545, 'f21291fa-0652-427e-be43-7f0d2f54fc67', 'f21291fa-0652-427e-be43-7f0d2f54fc67.jpg', 'userProfile.jpg', '', '34', '2023-11-15 13:11:29', '2023-11-15 13:11:29', NULL);
INSERT INTO temp.tmp_upload VALUES (546, '66010428-960a-4ed3-9c88-f37dd08cf4cc', '66010428-960a-4ed3-9c88-f37dd08cf4cc.jpg', 'userProfile.jpg', '', '34', '2023-11-15 13:17:08', '2023-11-15 13:17:08', NULL);
INSERT INTO temp.tmp_upload VALUES (547, '6341c5a5-7a1a-44ec-b112-4f2455a1c60b', '6341c5a5-7a1a-44ec-b112-4f2455a1c60b.jpg', 'userProfile.jpg', '', '35', '2023-11-15 13:19:14', '2023-11-15 13:19:14', NULL);
INSERT INTO temp.tmp_upload VALUES (548, '1f9541df-dcfd-458c-859a-87a25b4e3f81', '1f9541df-dcfd-458c-859a-87a25b4e3f81.jpg', 'userProfile.jpg', '', '35', '2023-11-15 17:49:11', '2023-11-15 17:49:11', NULL);
INSERT INTO temp.tmp_upload VALUES (549, 'e73f63e2-0480-48ec-96c5-6c6aa796f101', 'e73f63e2-0480-48ec-96c5-6c6aa796f101.jpg', 'userProfile.jpg', '', '14', '2023-11-16 12:46:57', '2023-11-16 12:46:57', NULL);
INSERT INTO temp.tmp_upload VALUES (550, '5c3ab511-8bd9-4bdb-9559-c58f7f7d510b', '5c3ab511-8bd9-4bdb-9559-c58f7f7d510b.jpg', 'userProfile.jpg', '', '14', '2023-11-16 12:53:56', '2023-11-16 12:53:56', NULL);
INSERT INTO temp.tmp_upload VALUES (551, '9ca1a062-ef18-4c8a-9d1d-70f85a9cbc96', '9ca1a062-ef18-4c8a-9d1d-70f85a9cbc96.jpg', 'userProfile.jpg', '', '14', '2023-11-16 12:55:02', '2023-11-16 12:55:02', NULL);
INSERT INTO temp.tmp_upload VALUES (552, '4408f37a-34dd-4df5-8d03-58791e21a780', '4408f37a-34dd-4df5-8d03-58791e21a780.jpg', 'userProfile.jpg', '', '33', '2023-11-16 13:12:28', '2023-11-16 13:12:28', NULL);
INSERT INTO temp.tmp_upload VALUES (553, '02c5b850-9201-4be6-b6a3-e4326863d62e', '02c5b850-9201-4be6-b6a3-e4326863d62e.jpg', 'userProfile.jpg', '', '33', '2023-11-16 13:13:24', '2023-11-16 13:13:24', NULL);
INSERT INTO temp.tmp_upload VALUES (554, 'b15bf3dd-df90-40e4-a3d5-f698426364b7', 'b15bf3dd-df90-40e4-a3d5-f698426364b7.jpg', 'userProfile.jpg', '', '20', '2023-11-16 13:36:22', '2023-11-16 13:36:22', NULL);
INSERT INTO temp.tmp_upload VALUES (555, '356b72a0-e7e6-4f2b-83a5-b6f939807a96', '356b72a0-e7e6-4f2b-83a5-b6f939807a96.jpg', 'userProfile.jpg', '', '20', '2023-11-16 19:26:07', '2023-11-16 19:26:07', NULL);
INSERT INTO temp.tmp_upload VALUES (556, 'c2903317-9b0d-4735-8463-feb02874eb68', 'c2903317-9b0d-4735-8463-feb02874eb68.jpg', 'userProfile.jpg', '', '20', '2023-11-16 19:28:36', '2023-11-16 19:28:36', NULL);
INSERT INTO temp.tmp_upload VALUES (557, '4fe07ccf-1372-4f72-87ca-612d27f64850', '4fe07ccf-1372-4f72-87ca-612d27f64850.jpg', 'userProfile.jpg', '', '20', '2023-11-17 11:10:28', '2023-11-17 11:10:28', NULL);
INSERT INTO temp.tmp_upload VALUES (558, 'dfe55905-f0a5-4556-a4c6-8836fb3eafa4', 'dfe55905-f0a5-4556-a4c6-8836fb3eafa4.jpg', 'userProfile.jpg', '', '14', '2023-11-22 10:57:47', '2023-11-22 10:57:47', NULL);
INSERT INTO temp.tmp_upload VALUES (559, 'e7773fd1-e568-4da1-92d4-af049fc43adc', 'e7773fd1-e568-4da1-92d4-af049fc43adc.jpg', 'userProfile.jpg', '', '14', '2023-11-27 18:49:20', '2023-11-27 18:49:20', NULL);
INSERT INTO temp.tmp_upload VALUES (560, '66092186-8a36-46a7-83c6-847345b6fabb', '66092186-8a36-46a7-83c6-847345b6fabb.jpg', 'WhatsApp Image 2023-12-06 at 13.19.57.jpeg', '', '14', '2023-12-15 21:10:24', '2023-12-15 21:10:24', NULL);
INSERT INTO temp.tmp_upload VALUES (561, '289f1eaa-1cde-4d87-98f4-7668a8692073', '289f1eaa-1cde-4d87-98f4-7668a8692073.jpg', 'userProfile.jpg', '', '14', '2023-12-29 15:55:05', '2023-12-29 15:55:05', NULL);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 207
-- Name: tb_logs_id_seq; Type: SEQUENCE SET; Schema: logs; Owner: postgres
--

SELECT pg_catalog.setval('logs.tb_logs_id_seq', 2077, true);


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 229
-- Name: ms_koordinat_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('master.ms_koordinat_id_seq', 4, true);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 209
-- Name: ms_setting_id_seq; Type: SEQUENCE SET; Schema: master; Owner: postgres
--

SELECT pg_catalog.setval('master.ms_setting_id_seq', 1, true);


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 211
-- Name: ps_master_permission_id_seq; Type: SEQUENCE SET; Schema: permissions; Owner: postgres
--

SELECT pg_catalog.setval('permissions.ps_master_permission_id_seq', 103, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 213
-- Name: ps_permission_id_seq; Type: SEQUENCE SET; Schema: permissions; Owner: postgres
--

SELECT pg_catalog.setval('permissions.ps_permission_id_seq', 163, true);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 215
-- Name: ps_role_id_seq; Type: SEQUENCE SET; Schema: permissions; Owner: postgres
--

SELECT pg_catalog.setval('permissions.ps_role_id_seq', 8, true);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 217
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 222
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 627, true);


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 224
-- Name: presensi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presensi_id_seq', 99, true);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 35, true);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 228
-- Name: tmp_upload_id_seq; Type: SEQUENCE SET; Schema: temp; Owner: postgres
--

SELECT pg_catalog.setval('temp.tmp_upload_id_seq', 561, true);


--
-- TOC entry 2897 (class 2606 OID 16490)
-- Name: tb_logs tb_logs_pkey; Type: CONSTRAINT; Schema: logs; Owner: postgres
--

ALTER TABLE ONLY logs.tb_logs
    ADD CONSTRAINT tb_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 16796)
-- Name: ms_koordinat ms_koordinat_pk; Type: CONSTRAINT; Schema: master; Owner: postgres
--

ALTER TABLE ONLY master.ms_koordinat
    ADD CONSTRAINT ms_koordinat_pk PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16492)
-- Name: ps_role ms_role_pk; Type: CONSTRAINT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_role
    ADD CONSTRAINT ms_role_pk PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 16494)
-- Name: ps_master_permission ps_master_permission_pk; Type: CONSTRAINT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_master_permission
    ADD CONSTRAINT ps_master_permission_pk PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 16496)
-- Name: ps_permission ps_permission_pk; Type: CONSTRAINT; Schema: permissions; Owner: postgres
--

ALTER TABLE ONLY permissions.ps_permission
    ADD CONSTRAINT ps_permission_pk PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 16498)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 16500)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2909 (class 2606 OID 16502)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 16504)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2914 (class 2606 OID 16506)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2917 (class 2606 OID 16508)
-- Name: presensi presensi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presensi
    ADD CONSTRAINT presensi_pk PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 16510)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 16512)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 2923 (class 2606 OID 16514)
-- Name: tmp_upload tmp_upload_pk; Type: CONSTRAINT; Schema: temp; Owner: postgres
--

ALTER TABLE ONLY temp.tmp_upload
    ADD CONSTRAINT tmp_upload_pk PRIMARY KEY (id, uuid);


--
-- TOC entry 2895 (class 1259 OID 16515)
-- Name: tb_logs_index; Type: INDEX; Schema: logs; Owner: postgres
--

CREATE INDEX tb_logs_index ON logs.tb_logs USING btree (created_at, id, type, updated_at, user_id, data);


--
-- TOC entry 2910 (class 1259 OID 16516)
-- Name: password_resets_username_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_username_index ON public.password_resets USING btree (username);


--
-- TOC entry 2915 (class 1259 OID 16517)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 11
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-01-04 20:44:04

--
-- PostgreSQL database dump complete
--

