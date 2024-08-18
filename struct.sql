--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Документ; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Документ";


ALTER SCHEMA "Документ" OWNER TO dbmaster;

--
-- Name: Журналы; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Журналы";


ALTER SCHEMA "Журналы" OWNER TO dbmaster;

--
-- Name: Константа; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Константа";


ALTER SCHEMA "Константа" OWNER TO dbmaster;

--
-- Name: Настройки; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Настройки";


ALTER SCHEMA "Настройки" OWNER TO dbmaster;

--
-- Name: Перечисление; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Перечисление";


ALTER SCHEMA "Перечисление" OWNER TO dbmaster;

--
-- Name: ПланОбмена; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "ПланОбмена";


ALTER SCHEMA "ПланОбмена" OWNER TO dbmaster;

--
-- Name: Приложение; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Приложение";


ALTER SCHEMA "Приложение" OWNER TO dbmaster;

--
-- Name: Справочник; Type: SCHEMA; Schema: -; Owner: dbmaster
--

CREATE SCHEMA "Справочник";


ALTER SCHEMA "Справочник" OWNER TO dbmaster;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: История_ДифференцированнаяЦена(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ДифференцированнаяЦена"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ДифференцированнаяЦенаПоЧасам',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ДифференцированнаяЦена"() OWNER TO postgres;

--
-- Name: История_КоэффициентОМиИнфрПлатеж(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','КоэффициентОМиИнфрПлатеж',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"() OWNER TO postgres;

--
-- Name: История_НерегЦенаНаМощность(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_НерегЦенаНаМощность"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаМощность',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_НерегЦенаНаМощность"() OWNER TO postgres;

--
-- Name: История_НерегЦенаНаЭнергию(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_НерегЦенаНаЭнергию"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','НерегулируемаяЦенаНаЭнергию',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_НерегЦенаНаЭнергию"() OWNER TO postgres;

--
-- Name: История_ПачкаПоказаний(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПачкаПоказаний"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПоказаний',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПачкаПоказаний"() OWNER TO postgres;

--
-- Name: История_ПачкаПрофиляМощности(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПачкаПрофиляМощности"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПачкаПрофиляМощности',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПачкаПрофиляМощности"() OWNER TO postgres;

--
-- Name: История_ПерерасчетПродажи(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПерерасчетПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПерерасчетДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПерерасчетПродажи"() OWNER TO postgres;

--
-- Name: История_ПлановыеЧасы(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПлановыеЧасы"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПлановыеЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПлановыеЧасы"() OWNER TO postgres;

--
-- Name: История_Показания(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_Показания"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','Показания',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','Показания',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','Показания',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_Показания"() OWNER TO postgres;

--
-- Name: История_ПрофильМощности(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПрофильМощности"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПрофильМощности"() OWNER TO postgres;

--
-- Name: История_ПрофильМощностиГенерации(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПрофильМощностиГенерации"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиГенерацииРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПрофильМощностиГенерации"() OWNER TO postgres;

--
-- Name: История_ПрофильМощностиПотерь(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ПрофильМощностиПотерь"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ПрофильМощностиПотерьРегистр',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ПрофильМощностиПотерь"() OWNER TO postgres;

--
-- Name: История_РасчетДоговораПродажи(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_РасчетДоговораПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РасчетДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_РасчетДоговораПродажи"() OWNER TO postgres;

--
-- Name: История_РеализацияТоваровУслуг(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_РеализацияТоваровУслуг"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','РеализацияТоваровУслуг',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_РеализацияТоваровУслуг"() OWNER TO postgres;

--
-- Name: История_СбытоваяНадбавка(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_СбытоваяНадбавка"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СбытоваяНадбавка',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_СбытоваяНадбавка"() OWNER TO postgres;

--
-- Name: История_СкидкаТочкиПоставки(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_СкидкаТочкиПоставки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СкидкаТочкиПоставки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_СкидкаТочкиПоставки"() OWNER TO postgres;

--
-- Name: История_СчетНаОплатуПокупателю(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_СчетНаОплатуПокупателю"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','СчетНаОплатуПокупателю',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_СчетНаОплатуПокупателю"() OWNER TO postgres;

--
-- Name: История_ЧасыПиковойНагрузки(); Type: FUNCTION; Schema: Документ; Owner: postgres
--

CREATE FUNCTION "Документ"."История_ЧасыПиковойНагрузки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Документ','ЧасыПиковойНагрузки',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Документ"."История_ЧасыПиковойНагрузки"() OWNER TO postgres;

--
-- Name: Организации_Обновить(); Type: FUNCTION; Schema: Журналы; Owner: dbmaster
--

CREATE FUNCTION "Журналы"."Организации_Обновить"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO "Журналы"."ЖурналОбновления" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
(current_user,current_timestamp,NEW."id",'Настройки','Организации','UPDATE',NEW."ПометкаУдаления");
return NEW;

END;
$$;


ALTER FUNCTION "Журналы"."Организации_Обновить"() OWNER TO dbmaster;

--
-- Name: ПользовательБлокировки(uuid); Type: FUNCTION; Schema: Журналы; Owner: dbmaster
--

CREATE FUNCTION "Журналы"."ПользовательБлокировки"(doclink uuid) RETURNS TABLE(var1 timestamp without time zone, var2 text)
    LANGUAGE plpgsql
    AS $$

BEGIN
    RETURN QUERY 
    select "Дата","Пользователь" from "Журналы"."ЖурналОбновления" 

where "Дата" = (select max("Дата")  from "Журналы"."ЖурналОбновления" where "Ссылка" = doclink)

and "Ссылка" = doclink

         ;
END;
$$;


ALTER FUNCTION "Журналы"."ПользовательБлокировки"(doclink uuid) OWNER TO dbmaster;

--
-- Name: Организации_Добавить(); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."Организации_Добавить"()
    LANGUAGE plpgsql
    AS $$

begin



INSERT INTO "Настройки"."Организации" ( "НаименованиеКраткое" ) 

		    values ('Новая организация'); 



   -- commit;

end;$$;


ALTER PROCEDURE "Настройки"."Организации_Добавить"() OWNER TO dbmaster;

--
-- Name: Организации_Заполнить(uuid); Type: FUNCTION; Schema: Настройки; Owner: dbmaster
--

CREATE FUNCTION "Настройки"."Организации_Заполнить"(prof uuid) RETURNS TABLE(var1 boolean, var2 text, var3 text, var4 text, var5 text, var6 text, var7 text, var8 date, var9 text, var10 text, var11 text, var12 text, var13 text, var14 text, var15 text, var16 text, var17 text, var18 text, var19 text, var20 text, var21 text, var22 text, var23 text, var24 text, var25 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

    "ОрганизацияПоУмолчанию" ,

    "НаименованиеКраткое" ,

    "НаименованиеПолное" ,

    "НаименованиеДляПечати" ,	

	

    "ИНН" ,

    "КПП" ,

    "ОГРН" ,

    



    

    "ДатаРегистрации"  ,

    "Банк" ,

    

    "НомерСчета",

    "ЮридическийАдрес" ,

    "ПочтовыйАдрес" ,

    "ФактическийАдрес" ,

    "Телефон" ,    

	    "ЭлектроннаяПочта",

	

	    "РуководительФио" ,

	    "РуководительДолжность" ,

	    "РуководительДоверенность" ,



		    "БухгалтерФио",

	    "БухгалтерДолжность" ,

	    "БухгалтерДоверенность" ,

	    "КассирФио" ,

	    "КассирДолжность" ,

	    "КассирДоверенность" ,

	

	

   "Префикс" 	

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false

    and id = prof

         ;

END;

$$;


ALTER FUNCTION "Настройки"."Организации_Заполнить"(prof uuid) OWNER TO dbmaster;

--
-- Name: Организации_Обновить(boolean, text, text, text, text, text, text, date, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, uuid); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE  "Настройки"."Организации"  set 

    "ОрганизацияПоУмолчанию"    = var1,

    "НаименованиеКраткое"       = var2,

    "НаименованиеПолное"        = var3,

    "НаименованиеДляПечати"     = var4,	

    "ИНН"                       = var5,

    "КПП"                       = var6,

    "ОГРН"                      = var7,

    "ДатаРегистрации"           = var8,

    "Банк"                      = var9,

    "НомерСчета"                = var10,

    "ЮридическийАдрес"          = var11,

    "ПочтовыйАдрес"             = var12,

    "ФактическийАдрес"          = var13,

    "Телефон"                   = var14,    

    "ЭлектроннаяПочта"          = var15,

    "РуководительФио"           = var16,

    "РуководительДолжность"     = var17,

    "РуководительДоверенность"  = var18,

    "БухгалтерФио"              = var19,

    "БухгалтерДолжность"        = var20,

    "БухгалтерДоверенность"     = var21,

    "КассирФио"                 = var22,

    "КассирДолжность"           = var23,

    "КассирДоверенность"        = var24,

    "Префикс" 	                = var25

    WHERE "id" = var26	 

   ;

		   



end;$$;


ALTER PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid) OWNER TO dbmaster;

--
-- Name: Организации_Обновить(boolean, text, text, text, text, text, text, date, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, uuid, text, text); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid, IN var27 text, IN var28 text)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE  "Настройки"."Организации"  set 

    "ОрганизацияПоУмолчанию"    = var1,

    "НаименованиеКраткое"       = var2,

    "НаименованиеПолное"        = var3,

    "НаименованиеДляПечати"     = var4,	

    "ИНН"                       = var5,

    "КПП"                       = var6,

    "ОГРН"                      = var7,

    "ДатаРегистрации"           = var8,

    "Банк"                      = var9,

    "НомерСчета"                = var10,

    "ЮридическийАдрес"          = var11,

    "ПочтовыйАдрес"             = var12,

    "ФактическийАдрес"          = var13,

    "Телефон"                   = var14,    

    "ЭлектроннаяПочта"          = var15,

    "РуководительФио"           = var16,

    "РуководительДолжность"     = var17,

    "РуководительДоверенность"  = var18,

    "БухгалтерФио"              = var19,

    "БухгалтерДолжность"        = var20,

    "БухгалтерДоверенность"     = var21,

    "КассирФио"                 = var22,

    "КассирДолжность"           = var23,

    "КассирДоверенность"        = var24,

    "Префикс" 	                = var25,
    "Бик" 	                = var27,
    "КорСчет" 	                = var28
    

    WHERE "id" = var26	 

   ;

		   



end;$$;


ALTER PROCEDURE "Настройки"."Организации_Обновить"(IN var1 boolean, IN var2 text, IN var3 text, IN var4 text, IN var5 text, IN var6 text, IN var7 text, IN var8 date, IN var9 text, IN var10 text, IN var11 text, IN var12 text, IN var13 text, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 text, IN var20 text, IN var21 text, IN var22 text, IN var23 text, IN var24 text, IN var25 text, IN var26 uuid, IN var27 text, IN var28 text) OWNER TO dbmaster;

--
-- Name: Организации_Получить(); Type: FUNCTION; Schema: Настройки; Owner: dbmaster
--

CREATE FUNCTION "Настройки"."Организации_Получить"() RETURNS TABLE(var1 uuid, var2 text, var3 boolean)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select id,

 

    "НаименованиеКраткое" ,

     "ОрганизацияПоУмолчанию" 

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false



         ;

END;

$$;


ALTER FUNCTION "Настройки"."Организации_Получить"() OWNER TO dbmaster;

--
-- Name: Организации_Удалить(uuid); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."Организации_Удалить"(IN prof uuid)
    LANGUAGE plpgsql
    AS $$

begin



	UPDATE "Настройки"."Организации" set "ПометкаУдаления"=true WHERE "id" = prof;

	



end;$$;


ALTER PROCEDURE "Настройки"."Организации_Удалить"(IN prof uuid) OWNER TO dbmaster;

--
-- Name: Организации_Файлы(uuid); Type: FUNCTION; Schema: Настройки; Owner: dbmaster
--

CREATE FUNCTION "Настройки"."Организации_Файлы"(prof uuid) RETURNS TABLE(var1 bytea, var2 text, var3 bytea, var4 text, var5 bytea, var6 text, var7 bytea, var8 text, var9 bytea, var10 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

  	 "ЛоготипФайл" ,

     "ЛоготипНаименование" ,



	 "ЯрлыкФайл",

     "ЯрлыкНаименование" ,

	

     "ПечатьФайл" ,

     "ПечатьНаименование" ,

	

	 "ПодписьРукФайл" ,

     "ПодписьРукНаименование" ,



	 "ПодписьБухФайл" ,

     "ПодписьБухНаименование"

    	

           

    FROM "Настройки"."Организации"  where "ПометкаУдаления" = false

    and id = prof

         ;

END;

$$;


ALTER FUNCTION "Настройки"."Организации_Файлы"(prof uuid) OWNER TO dbmaster;

--
-- Name: Профиль_Получить(uuid); Type: FUNCTION; Schema: Настройки; Owner: dbmaster
--

CREATE FUNCTION "Настройки"."Профиль_Получить"(defprof uuid) RETURNS TABLE(var1 boolean, var2 text, var3 text, var4 text, var5 boolean, var6 text, var7 boolean, var8 text, var9 text, var10 text, var11 boolean, var12 boolean, var13 numeric, var14 text, var15 text, var16 text, var17 text, var18 text)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      select

       "ПрофильПоУмолчанию",

       "Наименование",

       "Тема",

       "КаталогОтчетов",

       "КаталогОтчетовИспользовать",

       "КаталогАктовИСчетов",

       "КаталогАктовИСчетовИспользовать",

       "ПрограммаXLSX",

       "ПрограммаDOCX",

       "ПрограммаPDF",

       "ПротоколPOP3",

       "ПротоколIMAP",

       "Порт",

       "МетодАутентификации",

       "ЗащитаСоединения",

       "ИмяДоступа",

       "ПарольДоступа" ,

       "Сервер" 

           

    FROM "Настройки"."ПрофильПользователя"  where "id" = defprof 



         ;

END;

$$;


ALTER FUNCTION "Настройки"."Профиль_Получить"(defprof uuid) OWNER TO dbmaster;

--
-- Name: ПрофильПользователя_Добавить(text, boolean, uuid); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."ПрофильПользователя_Добавить"(IN nameprof text, IN bydefault boolean, IN username uuid)
    LANGUAGE plpgsql
    AS $$
begin

INSERT INTO "Настройки"."ПрофильПользователя" (
            "Наименование" ,
            "ПрофильПоУмолчанию",
	        "Пользователь"
                       ) 
		    values (nameprof, bydefault,username); 

   -- commit;
end;$$;


ALTER PROCEDURE "Настройки"."ПрофильПользователя_Добавить"(IN nameprof text, IN bydefault boolean, IN username uuid) OWNER TO dbmaster;

--
-- Name: ПрофильПользователя_Заполнить(uuid); Type: FUNCTION; Schema: Настройки; Owner: dbmaster
--

CREATE FUNCTION "Настройки"."ПрофильПользователя_Заполнить"(defuser uuid) RETURNS TABLE(var1 uuid, var2 text, var3 boolean)
    LANGUAGE plpgsql
    AS $$

BEGIN

    RETURN QUERY 

      SELECT

         id,

         "Наименование",

         "ПрофильПоУмолчанию"  

         FROM "Настройки"."ПрофильПользователя"  

         where  "ПометкаУдаления" = false

         and "Пользователь" = defuser 

         ;

END;

$$;


ALTER FUNCTION "Настройки"."ПрофильПользователя_Заполнить"(defuser uuid) OWNER TO dbmaster;

--
-- Name: ПрофильПользователя_Обновить(text, boolean, text, text, boolean, text, boolean, text, text, text, boolean, boolean, integer, text, text, text, text, text, uuid); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."ПрофильПользователя_Обновить"(IN var1 text, IN var2 boolean, IN var3 text, IN var4 text, IN var5 boolean, IN var6 text, IN var7 boolean, IN var8 text, IN var9 text, IN var10 text, IN var11 boolean, IN var12 boolean, IN var13 integer, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 uuid)
    LANGUAGE plpgsql
    AS $$

begin

		   

	UPDATE "Настройки"."ПрофильПользователя" 

                               set "Наименование"                     = var1,

                                   "ПрофильПоУмолчанию"               = var2,

                                   "Тема"                             = var3,

                                   "КаталогОтчетов"                   = var4,

                                   "КаталогОтчетовИспользовать"       = var5,

                                   "КаталогАктовИСчетов"              = var6,

                                   "КаталогАктовИСчетовИспользовать"  = var7,

                                   "ПрограммаXLSX"                    = var8,

                                   "ПрограммаDOCX"                    = var9,

                                   "ПрограммаPDF"                     = var10,

                                   "ПротоколPOP3"                     = var11,

                                   "ПротоколIMAP"                     = var12,

                                   "Порт"                             = var13,

                                   "МетодАутентификации"              = var14,

                                   "ЗащитаСоединения"                 = var15,

                                   "ИмяДоступа"                       = var16,

                                   "ПарольДоступа"                    = var17,

                                   "Сервер"                           = var18

                                    WHERE "id"                        = var19	 

                                    

                                    ;

		   

		   

		   

		   -- commit;

end;$$;


ALTER PROCEDURE "Настройки"."ПрофильПользователя_Обновить"(IN var1 text, IN var2 boolean, IN var3 text, IN var4 text, IN var5 boolean, IN var6 text, IN var7 boolean, IN var8 text, IN var9 text, IN var10 text, IN var11 boolean, IN var12 boolean, IN var13 integer, IN var14 text, IN var15 text, IN var16 text, IN var17 text, IN var18 text, IN var19 uuid) OWNER TO dbmaster;

--
-- Name: ПрофильПользователя_Удалить(uuid); Type: PROCEDURE; Schema: Настройки; Owner: dbmaster
--

CREATE PROCEDURE "Настройки"."ПрофильПользователя_Удалить"(IN prof uuid)
    LANGUAGE plpgsql
    AS $$

begin



	UPDATE "Настройки"."ПрофильПользователя" set "ПометкаУдаления"=true WHERE "id" = prof;

	



end;$$;


ALTER PROCEDURE "Настройки"."ПрофильПользователя_Удалить"(IN prof uuid) OWNER TO dbmaster;

--
-- Name: addnewprofile(text); Type: PROCEDURE; Schema: Справочник; Owner: dbmaster
--

CREATE PROCEDURE "Справочник".addnewprofile(IN prname text)
    LANGUAGE plpgsql
    AS $$  

BEGIN         

   INSERT INTO "Настройки"."ПрофильПользователя" ("Наименование") VALUES   

    (prName) ;  

END  

$$;


ALTER PROCEDURE "Справочник".addnewprofile(IN prname text) OWNER TO dbmaster;

--
-- Name: История_ГП(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ГП"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	
    opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	
    opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ГарантирующиеПоставщики',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ГП"() OWNER TO postgres;

--
-- Name: История_ДоговорКонтрагента1С(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ДоговорКонтрагента1С"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорКонтрагента1С',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ДоговорКонтрагента1С"() OWNER TO postgres;

--
-- Name: История_ДоговорПродажи(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ДоговорПродажи"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ДоговорПродажи',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ДоговорПродажи"() OWNER TO postgres;

--
-- Name: История_ЗакрытыйПериодДПР(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	 opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	 opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ЗакрытыйПериодДоговораПродажи',opt_var,NEW."DeletionMark");

END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"() OWNER TO postgres;

--
-- Name: История_Контрагент(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_Контрагент"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF (TG_OP = 'DELETE') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Контрагенты','DELETE',false);
ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты','UPDATE',NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты','INSERT',NEW."DeletionMark");
END IF;

return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_Контрагент"() OWNER TO postgres;

--
-- Name: История_Контрагенты1С(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_Контрагенты1С"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Контрагенты1С',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_Контрагенты1С"() OWNER TO postgres;

--
-- Name: История_МодельПрибораУчета(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_МодельПрибораУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','МодельПрибораУчета',opt_var,NEW."DeletionMark");

END IF;




return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_МодельПрибораУчета"() OWNER TO postgres;

--
-- Name: История_ОбъектыУчета(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ОбъектыУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ОбъектыУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ОбъектыУчета"() OWNER TO postgres;

--
-- Name: История_ПремияПотребителю(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ПремияПотребителю"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителю',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ПремияПотребителю"() OWNER TO postgres;

--
-- Name: История_ПремияПотребителюАгента(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ПремияПотребителюАгента"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПремияПотребителюАгента',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ПремияПотребителюАгента"() OWNER TO postgres;

--
-- Name: История_ПриборыУчета(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ПриборыУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ПриборыУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ПриборыУчета"() OWNER TO postgres;

--
-- Name: История_Регион(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_Регион"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','Регион',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_Регион"() OWNER TO postgres;

--
-- Name: История_ТочкиПоставки(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ТочкиПоставки"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиПоставки',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ТочкиПоставки"() OWNER TO postgres;

--
-- Name: История_ТочкиУчета(); Type: FUNCTION; Schema: Справочник; Owner: postgres
--

CREATE FUNCTION "Справочник"."История_ТочкиУчета"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 

opt_var TEXT := '_';

BEGIN
IF (TG_OP = 'DELETE')    THEN 	opt_var := 'DELETE'; 
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,OLD."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'UPDATE') THEN 	opt_var := 'UPDATE';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

ELSIF (TG_OP = 'INSERT') THEN 	opt_var := 'INSERT';
    INSERT INTO "Журналы"."ИсторияИзменений" ("Пользователь","Дата","Ссылка","Схема","Таблица","Операция","ПометкаУдаления") values 
    (current_user,current_timestamp,NEW."id",'Справочник','ТочкиУчета',opt_var,NEW."DeletionMark");

END IF;



return NEW;

END;
$$;


ALTER FUNCTION "Справочник"."История_ТочкиУчета"() OWNER TO postgres;

--
-- Name: upg_roles_privs; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.upg_roles_privs AS
 SELECT db.type,
    db.objname,
    r1.rolname AS grantor,
    r2.rolname AS grantee,
    db.privilege_type
   FROM ((( SELECT 'database'::text AS type,
            pg_database.datname AS objname,
            pg_database.datistemplate,
            pg_database.datallowconn,
            (aclexplode(pg_database.datacl)).grantor AS grantori,
            (aclexplode(pg_database.datacl)).grantee AS granteei,
            (aclexplode(pg_database.datacl)).privilege_type AS privilege_type,
            (aclexplode(pg_database.datacl)).is_grantable AS is_grantable
           FROM pg_database) db
     JOIN pg_roles r1 ON ((db.grantori = r1.oid)))
     JOIN pg_roles r2 ON ((db.granteei = r2.oid)))
  WHERE (r2.rolname <> 'postgres'::name)
UNION ALL
 SELECT ns.type,
    ns.objname,
    r1.rolname AS grantor,
    r2.rolname AS grantee,
    ns.privilege_type
   FROM ((( SELECT 'schema'::text AS type,
            pg_namespace.nspname AS objname,
            (aclexplode(pg_namespace.nspacl)).grantor AS grantori,
            (aclexplode(pg_namespace.nspacl)).grantee AS granteei,
            (aclexplode(pg_namespace.nspacl)).privilege_type AS privilege_type,
            (aclexplode(pg_namespace.nspacl)).is_grantable AS is_grantable
           FROM pg_namespace) ns
     JOIN pg_roles r1 ON ((ns.grantori = r1.oid)))
     JOIN pg_roles r2 ON ((ns.granteei = r2.oid)))
  WHERE (r2.rolname <> 'postgres'::name)
UNION ALL
 SELECT 'tables'::text AS type,
    ((((role_table_grants.table_name)::text || ' ('::text) || (role_table_grants.table_schema)::text) || ')'::text) AS objname,
    role_table_grants.grantor,
    role_table_grants.grantee,
    role_table_grants.privilege_type
   FROM information_schema.role_table_grants
  WHERE (((role_table_grants.grantee)::name <> 'postgres'::name) AND ((role_table_grants.table_schema)::name <> ALL (ARRAY['information_schema'::name, 'pg_catalog'::name])) AND ((role_table_grants.grantor)::name <> (role_table_grants.grantee)::name))
UNION ALL
 SELECT 'columns'::text AS type,
    ((((role_column_grants.column_name)::text || ' ('::text) || (role_column_grants.table_name)::text) || ')'::text) AS objname,
    role_column_grants.grantor,
    role_column_grants.grantee,
    role_column_grants.privilege_type
   FROM information_schema.role_column_grants
  WHERE (((role_column_grants.table_schema)::name <> ALL (ARRAY['information_schema'::name, 'pg_catalog'::name])) AND ((role_column_grants.grantor)::name <> (role_column_grants.grantee)::name))
UNION ALL
 SELECT 'routine'::text AS type,
    role_routine_grants.routine_name AS objname,
    role_routine_grants.grantor,
    role_routine_grants.grantee,
    role_routine_grants.privilege_type
   FROM information_schema.role_routine_grants
  WHERE (((role_routine_grants.grantor)::name <> (role_routine_grants.grantee)::name) AND ((role_routine_grants.routine_schema)::name <> ALL (ARRAY['information_schema'::name, 'pg_catalog'::name])))
UNION ALL
 SELECT 'object'::text AS type,
    ((((role_usage_grants.object_name)::text || '( '::text) || (role_usage_grants.object_type)::text) || ')'::text) AS objname,
    role_usage_grants.grantor,
    role_usage_grants.grantee,
    role_usage_grants.privilege_type
   FROM information_schema.role_usage_grants
  WHERE (((role_usage_grants.object_type)::text <> 'COLLATION'::text) AND ((role_usage_grants.object_type)::text <> 'DOMAIN'::text));


ALTER TABLE public.upg_roles_privs OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Агент; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."Агент" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Code" bigint NOT NULL,
    "Договор" uuid,
    "ОбъектУчета" uuid,
    "ТочкаПоставки" uuid,
    "РасчетДоговора" uuid,
    "ДопСоглашение" uuid,
    "ЦК1" numeric(14,9) DEFAULT 0,
    "ЦК2" numeric(14,9) DEFAULT 0,
    "ЦК3" numeric(14,9) DEFAULT 0,
    "ЦК4" numeric(14,9) DEFAULT 0,
    "пСБН" numeric(14,9) DEFAULT 0,
    "СуммарныйОбъем" numeric DEFAULT 0,
    "Объем" numeric DEFAULT 0,
    "ЦенаГП" numeric DEFAULT 0,
    "ПремияСумма" numeric DEFAULT 0,
    "Цена" numeric DEFAULT 0,
    "ЦенаСоСкидкой" numeric DEFAULT 0,
    "Коэффициент" numeric DEFAULT 0,
    "Скидка" numeric DEFAULT 0,
    "ПоДоговору" boolean,
    "Формула" text
);


ALTER TABLE "Документ"."Агент" OWNER TO dbmaster;

--
-- Name: Агент_Code_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."Агент" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."Агент_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ДифференцированнаяЦенаПоЧасам; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ДифференцированнаяЦенаПоЧасам" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ПериодРасчета" timestamp without time zone,
    "ГарантирующийПоставщик" uuid,
    "Параметры" jsonb
);


ALTER TABLE "Документ"."ДифференцированнаяЦенаПоЧасам" OWNER TO dbmaster;

--
-- Name: ЖурналЗаписи; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ЖурналЗаписи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "НомерОбъекта" uuid,
    "КодОбъекта" text,
    "СхемаОбъекта" text,
    "НазваниеОбъекта" text,
    "Данные" jsonb,
    "Пользователь" text
);


ALTER TABLE "Документ"."ЖурналЗаписи" OWNER TO dbmaster;

--
-- Name: КоэффициентОМиИнфрПлатеж; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."КоэффициентОМиИнфрПлатеж" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ДатаПериода" timestamp without time zone,
    "КоэффициентОплатыМощности" numeric(21,17),
    "ИнфраструктурныйПлатеж" numeric(14,4),
    "ГарантирующийПоставщик" uuid,
    "ВеличинаИзмененияЦК1" numeric DEFAULT 0
);


ALTER TABLE "Документ"."КоэффициентОМиИнфрПлатеж" OWNER TO dbmaster;

--
-- Name: НерегулируемаяЦенаНаМощность; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."НерегулируемаяЦенаНаМощность" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаПериода" timestamp without time zone,
    "Цена" numeric(15,4)
);


ALTER TABLE "Документ"."НерегулируемаяЦенаНаМощность" OWNER TO dbmaster;

--
-- Name: НерегулируемаяЦенаНаЭнергию; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."НерегулируемаяЦенаНаЭнергию" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаПериода" timestamp without time zone,
    "Цена" numeric(15,4)
);


ALTER TABLE "Документ"."НерегулируемаяЦенаНаЭнергию" OWNER TO dbmaster;

--
-- Name: ОбъемПоставщика; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ОбъемПоставщика" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Объем" numeric(14,5),
    "ПриборУчета" uuid,
    "Комментарий" text
);


ALTER TABLE "Документ"."ОбъемПоставщика" OWNER TO dbmaster;

--
-- Name: ПачкаПоказаний; Type: TABLE; Schema: Документ; Owner: postgres
--

CREATE TABLE "Документ"."ПачкаПоказаний" (
    id uuid NOT NULL,
    "DeletionMark" boolean,
    "Номер" bigint NOT NULL,
    "Дата" timestamp without time zone,
    "ПериодРасчета" timestamp without time zone
);


ALTER TABLE "Документ"."ПачкаПоказаний" OWNER TO postgres;

--
-- Name: ПачкаПоказаний_Номер_seq; Type: SEQUENCE; Schema: Документ; Owner: postgres
--

ALTER TABLE "Документ"."ПачкаПоказаний" ALTER COLUMN "Номер" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПачкаПоказаний_Номер_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПачкаПрофиляМощности; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПачкаПрофиляМощности" (
    id uuid NOT NULL,
    "DeletionMark" boolean,
    "Номер" bigint NOT NULL,
    "Дата" timestamp without time zone,
    "ПериодРасчета" timestamp without time zone,
    "ТипПрофиля" text
);


ALTER TABLE "Документ"."ПачкаПрофиляМощности" OWNER TO dbmaster;

--
-- Name: ПачкаПрофиляМощности_Номер_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."ПачкаПрофиляМощности" ALTER COLUMN "Номер" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПачкаПрофиляМощности_Номер_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПерерасчетДоговораПродажи; Type: TABLE; Schema: Документ; Owner: postgres
--

CREATE TABLE "Документ"."ПерерасчетДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПродажи" text,
    "ДоговорПродажи" uuid,
    "ОбъектыУчета" jsonb,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "СуммаПерерасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "НовыйТипДоговора" text DEFAULT ''::text,
    "ФормаВедомости" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "НоваяСтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ИтогоНовыйОбъем" numeric,
    "ПремияПоДоговору" boolean,
    "ПремияДоп" uuid,
    "ПремияКоэффициент" numeric DEFAULT 0,
    "ПремияФормула" text,
    "ПремияПримечание" text,
    "АгентПоДоговору" boolean,
    "АгентДоп" uuid,
    "АгентКоэффициент" numeric DEFAULT 0,
    "АгентФормула" text,
    "АгентПримечание" text
);


ALTER TABLE "Документ"."ПерерасчетДоговораПродажи" OWNER TO postgres;

--
-- Name: ПерерасчетДоговораПродажи_Number_seq; Type: SEQUENCE; Schema: Документ; Owner: postgres
--

ALTER TABLE "Документ"."ПерерасчетДоговораПродажи" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."ПерерасчетДоговораПродажи_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПлановыеЧасыПиковойНагрузки; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПлановыеЧасыПиковойНагрузки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ДатаПериода" timestamp without time zone,
    "ЦеноваяЗона" text,
    "Интервал1_ЧасОт" numeric(15,4),
    "Интервал1_ЧасДо" numeric(15,4),
    "Интервал2_ЧасОт" numeric(15,4),
    "Интервал2_ЧасДо" numeric(15,4)
);


ALTER TABLE "Документ"."ПлановыеЧасыПиковойНагрузки" OWNER TO dbmaster;

--
-- Name: Показания; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."Показания" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "ПоказанияНачала" numeric(14,5) DEFAULT 0,
    "ПоказанияОкончание" numeric(14,5) DEFAULT 0,
    "УсловноПостоянныеПотери" numeric(14,5) DEFAULT 0,
    "НагрузочныеПотери" numeric(14,5) DEFAULT 0,
    "ПриборУчета" uuid,
    "Коэффициент" integer DEFAULT 0,
    "ДеньНачало" numeric(14,5) DEFAULT 0,
    "ДеньКонец" numeric(14,5) DEFAULT 0,
    "НочьНачало" numeric(14,5) DEFAULT 0,
    "НочьКонец" numeric(14,5) DEFAULT 0,
    "ПикНачало" numeric(14,5) DEFAULT 0,
    "ПикКонец" numeric(14,5) DEFAULT 0,
    "ПолуПикНачало" numeric(14,5) DEFAULT 0,
    "ПолуПикКонец" numeric(14,5) DEFAULT 0,
    "Пачка" uuid,
    "НагрузочныеПокупка" numeric(14,5) DEFAULT 0,
    "УсловноПостоянныеПокупка" numeric(14,5) DEFAULT 0,
    "НагрузочныеПокупкаДОУП" numeric(14,5) DEFAULT 0,
    "ПостоянныеПокупкаДОУП" numeric(14,5) DEFAULT 0,
    "ДопНачисление" numeric(14,5) DEFAULT 0
);


ALTER TABLE "Документ"."Показания" OWNER TO dbmaster;

--
-- Name: Премия; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."Премия" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "Code" bigint NOT NULL,
    "Договор" uuid,
    "ОбъектУчета" uuid,
    "ТочкаПоставки" uuid,
    "РасчетДоговора" uuid,
    "ДопСоглашение" uuid,
    "ЦК1" numeric(14,9) DEFAULT 0,
    "ЦК2" numeric(14,9) DEFAULT 0,
    "ЦК3" numeric(14,9) DEFAULT 0,
    "ЦК4" numeric(14,9) DEFAULT 0,
    "пСБН" numeric(14,9) DEFAULT 0,
    "СуммарныйОбъем" numeric DEFAULT 0,
    "Объем" numeric DEFAULT 0,
    "ЦенаГП" numeric DEFAULT 0,
    "ПремияСумма" numeric DEFAULT 0,
    "Цена" numeric DEFAULT 0,
    "ЦенаСоСкидкой" numeric DEFAULT 0,
    "Коэффициент" numeric DEFAULT 0,
    "Скидка" numeric DEFAULT 0,
    "ПоДоговору" boolean,
    "Формула" text
);


ALTER TABLE "Документ"."Премия" OWNER TO dbmaster;

--
-- Name: Премия_Code_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."Премия" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."Премия_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПрофильДКП; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильДКП" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильДКП" OWNER TO dbmaster;

--
-- Name: ПрофильДКПРГ; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильДКПРГ" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильДКПРГ" OWNER TO dbmaster;

--
-- Name: ПрофильДОУП; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильДОУП" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильДОУП" OWNER TO dbmaster;

--
-- Name: ПрофильДЭС; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильДЭС" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильДЭС" OWNER TO dbmaster;

--
-- Name: ПрофильДопНачисление; Type: TABLE; Schema: Документ; Owner: postgres
--

CREATE TABLE "Документ"."ПрофильДопНачисление" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean DEFAULT false,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильДопНачисление" OWNER TO postgres;

--
-- Name: ПрофильМощностиГенерацииРегистр; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильМощностиГенерацииРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильМощностиГенерацииРегистр" OWNER TO dbmaster;

--
-- Name: ПрофильМощностиПотерьРегистр; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильМощностиПотерьРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильМощностиПотерьРегистр" OWNER TO dbmaster;

--
-- Name: ПрофильМощностиРегистр; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильМощностиРегистр" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильМощностиРегистр" OWNER TO dbmaster;

--
-- Name: ПрофильОРЭМ; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ПрофильОРЭМ" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ПериодРасчета" timestamp without time zone,
    "Объем" numeric(15,5) DEFAULT 0,
    "Количество" numeric(15,0) DEFAULT 0,
    "ПриборУчета" uuid,
    "ПрофильМощности" jsonb,
    "Пачка" uuid
);


ALTER TABLE "Документ"."ПрофильОРЭМ" OWNER TO dbmaster;

--
-- Name: РасчетДоговораПокупки; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."РасчетДоговораПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПокупки" text,
    "ДоговорПокупки" uuid,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ПрименитьСкидкуКДоговору" boolean DEFAULT false,
    "СуммироватьПрофиль" boolean DEFAULT false,
    "СуммироватьПрофильПоДоговору" boolean DEFAULT false
);


ALTER TABLE "Документ"."РасчетДоговораПокупки" OWNER TO dbmaster;

--
-- Name: РасчетДоговораПокупки_number_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."РасчетДоговораПокупки" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РасчетДоговораПокупки_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: РасчетДоговораПродажи; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."РасчетДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "DeletionMark" boolean,
    "НачалоПериода" timestamp without time zone,
    "ОкончаниеПериода" timestamp without time zone,
    "НаименованиеДоговораПродажи" text,
    "ДоговорПродажи" uuid,
    "ОбъектыУчета" jsonb,
    "ТочкиПоставки" jsonb,
    "ТочкиУчета" jsonb,
    "ПриборыУчета" jsonb,
    "РезультатРасчета" jsonb,
    "Ошибки" jsonb,
    "СуммаРасчета" numeric,
    "Статус" boolean,
    "НаличиеОшибок" text,
    "Number" bigint NOT NULL,
    "ТипДоговора" text DEFAULT ''::text,
    "ФормаВедомости" text DEFAULT ''::text,
    "СтавкаНДС" numeric DEFAULT 0,
    "ИтогоОбъем" numeric,
    "ПремияПоДоговору" boolean,
    "ПремияДоп" uuid,
    "ПремияКоэффициент" numeric DEFAULT 0,
    "ПремияФормула" text,
    "ПремияПримечание" text,
    "АгентПоДоговору" boolean,
    "АгентДоп" uuid,
    "АгентКоэффициент" numeric DEFAULT 0,
    "АгентФормула" text,
    "АгентПримечание" text
);


ALTER TABLE "Документ"."РасчетДоговораПродажи" OWNER TO dbmaster;

--
-- Name: РасчетДоговораПродажи_number_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."РасчетДоговораПродажи" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РасчетДоговораПродажи_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: РеализацияТоваровУслуг; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."РеализацияТоваровУслуг" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Контрагент" uuid,
    "ДоговорКонтрагента" uuid,
    "СуммаВключаетНДС" boolean,
    "СчетНаОплатуПокупателю" uuid,
    "СуммаДокумента" numeric(22,5),
    "Комментарий" text,
    "РучнаяКорректировка" boolean,
    "Руководитель" text,
    "ГлавныйБухгалтер" text,
    "ДокументБезНДС" boolean,
    "ЗаРуководителяНаОсновании" text,
    "ЗаГлавногоБухгалтераНаОсновании" text,
    "Товары" jsonb,
    "ДоговорПродажи" uuid,
    "ДокументРасчета" uuid,
    "Number" bigint NOT NULL,
    "РуководительДолжность" text,
    "БухгалтерДолжность" text,
    "Date" timestamp without time zone,
    "СтавкаНДС" numeric,
    "ПодписьРуководителя" text,
    "ПодписьБухгалтера" text,
    "ПечатьПредприятия" text
);


ALTER TABLE "Документ"."РеализацияТоваровУслуг" OWNER TO dbmaster;

--
-- Name: РеализацияТоваровУслуг_Number_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."РеализацияТоваровУслуг" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."РеализацияТоваровУслуг_Number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: СбытоваяНадбавка; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."СбытоваяНадбавка" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "ГарантирующийПоставщик" uuid,
    "ДатаНачалоПериода" timestamp without time zone,
    "ДатаОкончанияПериода" timestamp without time zone,
    "До670кВт" numeric(15,4),
    "От670кВтДо10МВт" numeric(15,4),
    "От10МВт" numeric(15,4)
);


ALTER TABLE "Документ"."СбытоваяНадбавка" OWNER TO dbmaster;

--
-- Name: СкидкаТочкиПоставки; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."СкидкаТочкиПоставки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "СсылкаНаТочкуПоставки" uuid,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "ВеличинаСкидкиНадбавки" numeric(15,5),
    "Примечание" text,
    "Формула" text
);


ALTER TABLE "Документ"."СкидкаТочкиПоставки" OWNER TO dbmaster;

--
-- Name: СчетНаОплатуПокупателю; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."СчетНаОплатуПокупателю" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Ответственный" uuid,
    "Комментарий" text,
    "СуммаВключаетНДС" boolean,
    "СуммаДокумента" numeric(22,5),
    "Руководитель" text,
    "ГлавныйБухгалтер" text,
    "РуководительДолжность" text,
    "БухгалтерДолжность" text,
    "ДокументБезНДС" boolean,
    "ЗаГлавногоБухгалтераНаОсновании" text,
    "ЗаРуководителяНаОсновании" text,
    "Товары" jsonb,
    "ДоговорПродажи" uuid,
    "РасчетДоговораПродажи" uuid,
    "ТипДоговораПродажи" text,
    "СуммаКОплате" numeric,
    "СтавкаНДС" numeric,
    "ПодписьРуководителя" text,
    "ПодписьБухгалтера" text,
    "ПечатьПредприятия" text,
    "ТипСчета" text,
    "Number" bigint NOT NULL,
    "СрокОплаты" timestamp without time zone
);


ALTER TABLE "Документ"."СчетНаОплатуПокупателю" OWNER TO dbmaster;

--
-- Name: СчетНаОплатуПокупателю_number_seq; Type: SEQUENCE; Schema: Документ; Owner: dbmaster
--

ALTER TABLE "Документ"."СчетНаОплатуПокупателю" ALTER COLUMN "Number" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Документ"."СчетНаОплатуПокупателю_number_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: СчетФактураВыданный; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."СчетФактураВыданный" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Date" timestamp without time zone,
    "Number" text,
    "Posted" boolean,
    "ВидСчетаФактуры" text,
    "Организация" uuid,
    "Контрагент" uuid,
    "ДоговорКонтрагента" uuid,
    "Исправление" boolean,
    "НомерИсправления" numeric(15,0),
    "ИсправляемыйСчетФактура" uuid,
    "НомерИсправляемогоКорректировоч" text,
    "ДатаИсправляемогоКорректировочн" timestamp without time zone,
    "НомерИсходногоДокумента" text,
    "ДатаИсходногоДокумента" timestamp without time zone,
    "УдалитьУчитыватьИсправлениеИсхо" boolean,
    "УдалитьНомерИсправленияИсходног" text,
    "УдалитьДатаИсправленияИсходного" timestamp without time zone,
    "Комитент" uuid,
    "Продавец" uuid,
    "ДокументОснование" text,
    "ДатаПлатежноРасчетногоДокумента" timestamp without time zone,
    "НомерПлатежноРасчетногоДокумент" text,
    "ДатаДокументаАвансаКомитента" timestamp without time zone,
    "НомерДокументаАвансаКомитента" text,
    "СчетНаОплату" uuid,
    "КодВидаОперации" text,
    "СчетФактураНеВыставляется" boolean,
    "Выставлен" boolean,
    "ДатаВыставления" timestamp without time zone,
    "КодСпособаВыставления" text,
    "СчетФактураБезНДС" boolean,
    "Под0" boolean,
    "СтавкаНДС" text,
    "Сумма" numeric(15,4),
    "СуммаНДС" numeric(15,4),
    "СуммаДокумента" numeric(15,4),
    "СуммаУвеличение" numeric(15,4),
    "СуммаУменьшение" numeric(15,4),
    "СуммаНДСДокумента" numeric(15,4),
    "СуммаНДСУвеличение" numeric(15,4),
    "СуммаНДСУменьшение" numeric(15,4),
    "ВалютаДокумента" uuid,
    "Ответственный" uuid,
    "Комментарий" text,
    "РучнаяКорректировка" boolean,
    "СформированПриВводеНачальныхОст" boolean,
    "Руководитель" uuid,
    "ГлавныйБухгалтер" uuid,
    "КППКонтрагента" text,
    "СводныйКорректировочный" boolean,
    "ПредставлениеНомера" text,
    "НомерСчетаФактурыПродавца" text,
    "СуммаДокументаКомиссия" numeric(15,4),
    "СуммаНДСДокументаКомиссия" numeric(15,4),
    "СуммаУвеличениеКомиссия" numeric(15,4),
    "СуммаУменьшениеКомиссия" numeric(15,4),
    "СуммаНДСУвеличениеКомиссия" numeric(15,4),
    "СуммаНДСУменьшениеКомиссия" numeric(15,4),
    "СводныйКомиссионный" boolean,
    "КодВидаОперацииНаУменьшение" text,
    "КПППродавца" text,
    "ИдентификаторГосКонтракта" text,
    "ДоговорКомитента" uuid,
    "СчетРасчетов" uuid,
    "ДатаСчетаФактурыПродавца" timestamp without time zone,
    "ЕстьПрослеживаемыеТовары" boolean,
    "ОтредактированыДокументыОтгрузк" boolean,
    "ОтредактированыНомераКорректиру" boolean,
    "ДокументыОснования" jsonb,
    "КорректируемыеНомераСтрок" jsonb
);


ALTER TABLE "Документ"."СчетФактураВыданный" OWNER TO dbmaster;

--
-- Name: ТарифНаУслугиПоПередаче; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ТарифНаУслугиПоПередаче" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Регион" uuid,
    "СтавкаНаПотери" numeric(15,5),
    "ТарифнаяГруппа" text,
    "ДатаНачалаПериода" timestamp without time zone,
    "СтавкаНаТранспорт" numeric(15,5),
    "УровеньНапряжения" text,
    "СтавкаЗаСодержание" numeric(15,5),
    "ДатаОкончанияПериода" timestamp without time zone
);


ALTER TABLE "Документ"."ТарифНаУслугиПоПередаче" OWNER TO dbmaster;

--
-- Name: Файлы; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."Файлы" (
    "Файл" bytea,
    "Наименование" text
);


ALTER TABLE "Документ"."Файлы" OWNER TO dbmaster;

--
-- Name: ЧасыПиковойНагрузки; Type: TABLE; Schema: Документ; Owner: dbmaster
--

CREATE TABLE "Документ"."ЧасыПиковойНагрузки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Number" text,
    "ПериодРасчета" timestamp without time zone,
    "ГарантирующийПоставщик" uuid,
    "Параметры" jsonb
);


ALTER TABLE "Документ"."ЧасыПиковойНагрузки" OWNER TO dbmaster;

--
-- Name: ЖурналОбновления; Type: TABLE; Schema: Журналы; Owner: dbmaster
--

CREATE TABLE "Журналы"."ЖурналОбновления" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Схема" text,
    "Таблица" text,
    "Ссылка" uuid,
    "Операция" text,
    "ПометкаУдаления" boolean
);


ALTER TABLE "Журналы"."ЖурналОбновления" OWNER TO dbmaster;

--
-- Name: ИсторияИзменений; Type: TABLE; Schema: Журналы; Owner: dbmaster
--

CREATE TABLE "Журналы"."ИсторияИзменений" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Схема" text,
    "Таблица" text,
    "Ссылка" uuid,
    "Операция" text,
    "ПометкаУдаления" boolean
);


ALTER TABLE "Журналы"."ИсторияИзменений" OWNER TO dbmaster;

--
-- Name: ВерсияБД; Type: TABLE; Schema: Константа; Owner: dbmaster
--

CREATE TABLE "Константа"."ВерсияБД" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text
);


ALTER TABLE "Константа"."ВерсияБД" OWNER TO dbmaster;

--
-- Name: ВерсияПО; Type: TABLE; Schema: Константа; Owner: dbmaster
--

CREATE TABLE "Константа"."ВерсияПО" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "ДатаПубликации" timestamp without time zone,
    "Наименование" text,
    "СсылкаНаСкачивание" text
);


ALTER TABLE "Константа"."ВерсияПО" OWNER TO dbmaster;

--
-- Name: Организации; Type: TABLE; Schema: Настройки; Owner: dbmaster
--

CREATE TABLE "Настройки"."Организации" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "ОрганизацияПоУмолчанию" boolean DEFAULT false,
    "НаименованиеКраткое" text DEFAULT '-'::text,
    "НаименованиеПолное" text DEFAULT '-'::text,
    "НаименованиеДляПечати" text DEFAULT '-'::text,
    "ИНН" text DEFAULT '-'::text,
    "КПП" text DEFAULT '-'::text,
    "ОГРН" text DEFAULT '-'::text,
    "ДатаРегистрации" date DEFAULT '2000-01-01'::date,
    "Банк" text DEFAULT '-'::text,
    "Префикс" text DEFAULT '00'::text,
    "НомерСчета" text DEFAULT '-'::text,
    "ЮридическийАдрес" text DEFAULT '-'::text,
    "ПочтовыйАдрес" text DEFAULT '-'::text,
    "ФактическийАдрес" text DEFAULT '-'::text,
    "Телефон" text DEFAULT '-'::text,
    "ЭлектроннаяПочта" text DEFAULT '-'::text,
    "РуководительФио" text DEFAULT '-'::text,
    "РуководительДолжность" text DEFAULT '-'::text,
    "РуководительДоверенность" text DEFAULT '-'::text,
    "БухгалтерФио" text DEFAULT '-'::text,
    "БухгалтерДолжность" text DEFAULT '-'::text,
    "БухгалтерДоверенность" text DEFAULT '-'::text,
    "КассирФио" text DEFAULT '-'::text,
    "КассирДолжность" text DEFAULT '-'::text,
    "КассирДоверенность" text DEFAULT '-'::text,
    "ЛоготипФайл" bytea,
    "ЛоготипНаименование" text,
    "ЯрлыкФайл" bytea,
    "ЯрлыкНаименование" text,
    "ПечатьФайл" bytea,
    "ПечатьНаименование" text,
    "ПодписьРукФайл" bytea,
    "ПодписьРукНаименование" text,
    "ПодписьБухФайл" bytea,
    "ПодписьБухНаименование" text,
    "ПометкаУдаления" boolean DEFAULT false,
    "Бик" text,
    "КорСчет" text
);


ALTER TABLE "Настройки"."Организации" OWNER TO dbmaster;

--
-- Name: Пользователи; Type: TABLE; Schema: Настройки; Owner: dbmaster
--

CREATE TABLE "Настройки"."Пользователи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" text,
    "Наименование" text,
    "СуперПользователь" boolean,
    "Удаление" boolean DEFAULT false
);


ALTER TABLE "Настройки"."Пользователи" OWNER TO dbmaster;

--
-- Name: ПрофильПользователя; Type: TABLE; Schema: Настройки; Owner: dbmaster
--

CREATE TABLE "Настройки"."ПрофильПользователя" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Дата" timestamp without time zone,
    "Пользователь" uuid,
    "ПрофильПоУмолчанию" boolean DEFAULT false,
    "Наименование" text DEFAULT '-'::text,
    "Тема" text DEFAULT '-'::text,
    "КаталогОтчетов" text DEFAULT '-'::text,
    "КаталогОтчетовИспользовать" boolean DEFAULT false,
    "КаталогАктовИСчетов" text DEFAULT '-'::text,
    "КаталогАктовИСчетовИспользовать" boolean DEFAULT false,
    "ПрограммаXLSX" text DEFAULT '-'::text,
    "ПрограммаDOCX" text DEFAULT '-'::text,
    "ПрограммаPDF" text DEFAULT '-'::text,
    "ПротоколPOP3" boolean DEFAULT false,
    "ПротоколIMAP" boolean DEFAULT false,
    "Порт" numeric(10,0) DEFAULT 0,
    "МетодАутентификации" text DEFAULT '-'::text,
    "ЗащитаСоединения" text DEFAULT '-'::text,
    "ИмяДоступа" text DEFAULT '-'::text,
    "ПарольДоступа" text,
    "Сервер" text DEFAULT '-'::text,
    "ПометкаУдаления" boolean DEFAULT false
);


ALTER TABLE "Настройки"."ПрофильПользователя" OWNER TO dbmaster;

--
-- Name: ВидДоговора; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ВидДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ВидДоговора" OWNER TO dbmaster;

--
-- Name: ВидКонтрагента; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ВидКонтрагента" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ВидКонтрагента" OWNER TO dbmaster;

--
-- Name: ДокументПодписанта; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ДокументПодписанта" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ДокументПодписанта" OWNER TO dbmaster;

--
-- Name: ОтчетыДоговора; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ОтчетыДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ОтчетыДоговора" OWNER TO dbmaster;

--
-- Name: ТипАванса; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ТипАванса" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ТипАванса" OWNER TO dbmaster;

--
-- Name: ТипДоговора; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ТипДоговора" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ТипДоговора" OWNER TO dbmaster;

--
-- Name: ФормаВедомости; Type: TABLE; Schema: Перечисление; Owner: dbmaster
--

CREATE TABLE "Перечисление"."ФормаВедомости" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Наименование" text,
    "Псевдоним" text
);


ALTER TABLE "Перечисление"."ФормаВедомости" OWNER TO dbmaster;

--
-- Name: ДанныеИсточника; Type: TABLE; Schema: ПланОбмена; Owner: dbmaster
--

CREATE TABLE "ПланОбмена"."ДанныеИсточника" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "ИдентификаторБазы" text,
    "НаименованиеБазы" text,
    "ИдентификаторОбъекта" uuid,
    "НаименованиеОбъекта" text,
    "ДатаЗагрузки" timestamp without time zone,
    "Данные" jsonb
);


ALTER TABLE "ПланОбмена"."ДанныеИсточника" OWNER TO dbmaster;

--
-- Name: ФайлыИнтерфейс; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыИнтерфейс" (
    "Файл" bytea,
    "Наименование" text
);


ALTER TABLE "Приложение"."ФайлыИнтерфейс" OWNER TO dbmaster;

--
-- Name: ФайлыИсходники; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыИсходники" (
    "Файл" bytea,
    "Наименование" text,
    "Система" text
);


ALTER TABLE "Приложение"."ФайлыИсходники" OWNER TO dbmaster;

--
-- Name: ФайлыКартинки; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыКартинки" (
    "Файл" bytea,
    "Наименование" text
);


ALTER TABLE "Приложение"."ФайлыКартинки" OWNER TO dbmaster;

--
-- Name: ФайлыОтчетов; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыОтчетов" (
    "Файл" bytea,
    "Наименование" text
);


ALTER TABLE "Приложение"."ФайлыОтчетов" OWNER TO dbmaster;

--
-- Name: ФайлыПриложения; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыПриложения" (
    "Файл" bytea,
    "Наименование" text,
    "Система" text
);


ALTER TABLE "Приложение"."ФайлыПриложения" OWNER TO dbmaster;

--
-- Name: ФайлыСтиля; Type: TABLE; Schema: Приложение; Owner: dbmaster
--

CREATE TABLE "Приложение"."ФайлыСтиля" (
    "Файл" bytea,
    "Наименование" text
);


ALTER TABLE "Приложение"."ФайлыСтиля" OWNER TO dbmaster;

--
-- Name: ГарантирующиеПоставщики; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ГарантирующиеПоставщики" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Регион" uuid,
    "ОРЭМ" boolean,
    "ИдентификаторСубъекта" text
);


ALTER TABLE "Справочник"."ГарантирующиеПоставщики" OWNER TO dbmaster;

--
-- Name: ДинамическиеОтчеты; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ДинамическиеОтчеты" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Code" bigint NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "ДатаСоздания" timestamp without time zone,
    "Отчет" jsonb
);


ALTER TABLE "Справочник"."ДинамическиеОтчеты" OWNER TO dbmaster;

--
-- Name: ДинамическиеОтчеты_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ДинамическиеОтчеты" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДинамическиеОтчеты_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ДоговорКонтрагента1С; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ДоговорКонтрагента1С" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Owner" uuid,
    "ВалютаВзаиморасчетов" uuid,
    "Комментарий" text,
    "Организация" uuid,
    "ПроцентКомиссионногоВознагражде" numeric(14,5),
    "СпособРасчетаКомиссионногоВозна" text,
    "ТипЦен" uuid,
    "ВидДоговора" text,
    "УчетАгентскогоНДС" boolean,
    "ВидАгентскогоДоговора" text,
    "РасчетыВУсловныхЕдиницах" boolean,
    "УдалитьРеализацияНаЭкспорт" boolean,
    "ВидВзаиморасчетов" uuid,
    "Дата" timestamp without time zone,
    "Номер" text,
    "СрокДействия" timestamp without time zone,
    "УстановленСрокОплаты" boolean,
    "СрокОплаты" numeric(10,0),
    "НаименованиеДляСчетаФактурыНаАв" uuid,
    "ПорядокРегистрацииСчетовФактурН" text,
    "Валютный" boolean,
    "ОплатаВВалюте" boolean,
    "ИспользуетсяПриОбменеДанными" boolean,
    "УдалитьПредъявляетНДС" boolean,
    "НДСПоСтавкам4и2" boolean,
    "Руководитель" uuid,
    "ЗаРуководителяПоПриказу" text,
    "ДолжностьРуководителя" uuid,
    "РуководительКонтрагента" text,
    "ЗаРуководителяКонтрагентаПоПрик" text,
    "ДолжностьРуководителяКонтрагент" text,
    "ФайлДоговора" uuid,
    "ДоговорПодписан" boolean,
    "ПолРуководителяКонтрагента" text,
    "ПлатежныйАгент" boolean,
    "ТелефонПоставщика" text,
    "НаименованиеОператораПеревода" text,
    "ИННОператораПеревода" text,
    "АдресОператораПеревода" text,
    "ТелефонОператораПеревода" text,
    "ТелефонПлатежногоАгента" text,
    "ТелефонОператораПоПриемуПлатеже" text,
    "ОперацияПлатежногоАгента" text,
    "ГосударственныйКонтракт" uuid,
    "КодРаздел7ДекларацииНДС" uuid,
    "ПризнакАгента" text,
    "УчетАгентскогоНДСПокупателем" boolean,
    "СчетаФактурыОтИмениОрганизации" boolean,
    "СпособЗаполненияСтавкиНДС" text,
    "ЭлектронныеУслуги" boolean,
    "ВидОбеспеченияОбязательствИПлат" text,
    "ОбеспечениеПредоставил" boolean,
    "ОбеспечениеПолучил" boolean,
    "ОбеспечениеВыданоЗа" boolean,
    "СпособВыставленияДокументов" text,
    "ДатаОплаты" timestamp without time zone,
    "ВидАктива" text,
    "Сумма" numeric(14,5),
    "СуммаВключаетНДС" boolean,
    "СтавкаНДС" text,
    "СуммаНДС" numeric(14,5)
);


ALTER TABLE "Справочник"."ДоговорКонтрагента1С" OWNER TO dbmaster;

--
-- Name: ДоговорПокупки; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ДоговорПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "НомерДоговора1С" uuid,
    "ПаспортНомер" text,
    "ДатаВыдачиПаспорта" date,
    "КемВыданПаспорт" text,
    "КодПодразделения" text,
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "Примечание" text,
    "ДатаПервогоПромежуточного" integer DEFAULT 0,
    "РазмерПервогоПромежуточного" integer DEFAULT 0,
    "ДатаВторогоПромежуточного" integer DEFAULT 0,
    "РазмерВторогоПромежуточного" integer DEFAULT 0,
    "ДатаВыставленияАвансовых" integer DEFAULT 0,
    "ДатаВыставленияОкончательных" integer DEFAULT 0,
    "ДатаОкончательногоПлатежа" integer DEFAULT 0,
    "ДатаДоговора" date,
    "ДатаНачалаДействияДоговора" date,
    "ДатаОкончанияДействияДоговора" date,
    "ФИОПодписанта" text,
    "ОснованиеПодписанта" text,
    "ПролонгацияДоговора" boolean,
    "Контрагент" uuid,
    "ТипДоговора" text,
    "ЮридическийАдрес" text,
    "ПочтовыйАдрес" text,
    "НаличиеЭДО" boolean,
    "ПервыйАванс" boolean,
    "ВторойАванс" boolean,
    "ФормаВедомости" text,
    "Пеня" integer DEFAULT 0,
    "ДоговорРасторгнут" boolean,
    "АвансПоПрошломуМесяцу" boolean,
    "ПроцентАвансаПоПрошломуМесяцу" integer DEFAULT 0,
    "РучноеВыставлениеАвансов" boolean,
    "ДатаОплатыПоПрошломуМесяцу" integer DEFAULT 0,
    "ДатаОплатыПоПрошломуМВторой" integer DEFAULT 0,
    "ПроцентАвансаПоПрошломуМВторой" integer DEFAULT 0,
    "АвансПоПрошломуМесяцуВторой" boolean,
    "ОбъемПервогоРучногоАванса" numeric DEFAULT 0,
    "ОбъемВторогоРучногоАванса" numeric DEFAULT 0,
    "ФСКПервогоРучногоАванса" numeric DEFAULT 0,
    "ФСКВторогоРучногоАванса" numeric DEFAULT 0,
    "ПроцентПервогоРучногоАванса" integer DEFAULT 0,
    "ПроцентВторогоРучногоАванса" integer DEFAULT 0,
    "ТипАванса" text,
    "КомментарийПервогоАванса" text,
    "КомментарийВторогоАванса" text,
    "ДопСоглашение" uuid,
    "ПрименитьКДоговору" boolean,
    "НаРасторжение" boolean,
    "НаРасторжениеПримечание" text,
    "ДопСоглашениеАгента" uuid,
    "ПрименитьКДоговоруАгента" boolean,
    "НачислятьПеню" boolean,
    "СоздаватьСчетНаПеню" boolean,
    "СоздаватьДокументНаПеню" boolean,
    "ДоговорПерезаключен" boolean,
    "ДокументПодписанта" text,
    "ДатаДоверенности" date,
    "НомерДоверенности" text,
    "СтавкаНДС" numeric DEFAULT 0,
    "Code" bigint NOT NULL,
    "ДолжностьПодписанта1С" text,
    "Премия" jsonb,
    "Агент" jsonb,
    "Подтвержден" boolean DEFAULT false NOT NULL,
    "Подтверждающий" text DEFAULT 'Нет'::text NOT NULL,
    "СрочныйДоговор" boolean DEFAULT false NOT NULL,
    "Регион" uuid,
    "СкидкаПокупки" jsonb,
    "ПрименитьСкидкуКДоговору" boolean,
    "СуммироватьПрофиль" boolean,
    "ПараметрыПродажи" jsonb,
    "СуммироватьПрофильПоДоговору" boolean DEFAULT false
);


ALTER TABLE "Справочник"."ДоговорПокупки" OWNER TO dbmaster;

--
-- Name: ДоговорПокупки_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ДоговорПокупки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДоговорПокупки_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ДоговорПродажи; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ДоговорПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "НомерДоговора1С" uuid,
    "ПаспортНомер" text,
    "ДатаВыдачиПаспорта" date,
    "КемВыданПаспорт" text,
    "КодПодразделения" text,
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "Примечание" text,
    "ДатаПервогоПромежуточного" integer DEFAULT 0,
    "РазмерПервогоПромежуточного" integer DEFAULT 0,
    "ДатаВторогоПромежуточного" integer DEFAULT 0,
    "РазмерВторогоПромежуточного" integer DEFAULT 0,
    "ДатаВыставленияАвансовых" integer DEFAULT 0,
    "ДатаВыставленияОкончательных" integer DEFAULT 0,
    "ДатаОкончательногоПлатежа" integer DEFAULT 0,
    "ДатаДоговора" date,
    "ДатаНачалаДействияДоговора" date,
    "ДатаОкончанияДействияДоговора" date,
    "ФИОПодписанта" text,
    "ОснованиеПодписанта" text,
    "ПролонгацияДоговора" boolean,
    "Контрагент" uuid,
    "ТипДоговора" text,
    "ЮридическийАдрес" text,
    "ПочтовыйАдрес" text,
    "НаличиеЭДО" boolean,
    "ПервыйАванс" boolean,
    "ВторойАванс" boolean,
    "ФормаВедомости" text,
    "Пеня" integer DEFAULT 0,
    "ДоговорРасторгнут" boolean,
    "АвансПоПрошломуМесяцу" boolean,
    "ПроцентАвансаПоПрошломуМесяцу" integer DEFAULT 0,
    "РучноеВыставлениеАвансов" boolean,
    "ДатаОплатыПоПрошломуМесяцу" integer DEFAULT 0,
    "ДатаОплатыПоПрошломуМВторой" integer DEFAULT 0,
    "ПроцентАвансаПоПрошломуМВторой" integer DEFAULT 0,
    "АвансПоПрошломуМесяцуВторой" boolean,
    "ОбъемПервогоРучногоАванса" numeric DEFAULT 0,
    "ОбъемВторогоРучногоАванса" numeric DEFAULT 0,
    "ФСКПервогоРучногоАванса" numeric DEFAULT 0,
    "ФСКВторогоРучногоАванса" numeric DEFAULT 0,
    "ПроцентПервогоРучногоАванса" integer DEFAULT 0,
    "ПроцентВторогоРучногоАванса" integer DEFAULT 0,
    "ТипАванса" text,
    "КомментарийПервогоАванса" text,
    "КомментарийВторогоАванса" text,
    "ДопСоглашение" uuid,
    "ПрименитьКДоговору" boolean,
    "НаРасторжение" boolean,
    "НаРасторжениеПримечание" text,
    "ДопСоглашениеАгента" uuid,
    "ПрименитьКДоговоруАгента" boolean,
    "НачислятьПеню" boolean,
    "СоздаватьСчетНаПеню" boolean,
    "СоздаватьДокументНаПеню" boolean,
    "ДоговорПерезаключен" boolean,
    "ДокументПодписанта" text,
    "ДатаДоверенности" date,
    "НомерДоверенности" text,
    "СтавкаНДС" numeric DEFAULT 0,
    "Code" bigint NOT NULL,
    "ДолжностьПодписанта1С" text,
    "Премия" jsonb,
    "Агент" jsonb,
    "Подтвержден" boolean DEFAULT false NOT NULL,
    "Подтверждающий" text DEFAULT 'Нет'::text NOT NULL,
    "СрочныйДоговор" boolean DEFAULT false NOT NULL
);


ALTER TABLE "Справочник"."ДоговорПродажи" OWNER TO dbmaster;

--
-- Name: ДоговорПродажи_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ДоговорПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ДоговорПродажи_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ЗакрытыйПериодДоговораПродажи; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Code" bigint NOT NULL,
    "ДатаПериода" date,
    "ДоговорПродажи" uuid,
    "Использовать" boolean
);


ALTER TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи" OWNER TO dbmaster;

--
-- Name: ЗакрытыйПериодДоговораПрода_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ЗакрытыйПериодДоговораПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ЗакрытыйПериодДоговораПрода_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Контрагенты; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."Контрагенты" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент1С" uuid,
    "ФИОКонтрагента" text,
    "АдресПочтовый" text,
    "АдресФактический" text,
    "ОГРН" character varying(50),
    "ИНН" character varying(50),
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "РасчетныйСчет" text,
    "ОКВЭД" character varying(50),
    "БанкНаименование" text,
    "КоррСчетБанка" text,
    "БИКБанка" character varying(50),
    "Примечание" text,
    "ОрганизационнаяФорма" text,
    "НаименованиеПолное" text,
    "КПП" character varying(50),
    "ОКПО" character varying(50),
    "АдресЮридический" text,
    "ВидКонтрагента" character varying(50),
    "ГоловнойКонтрагент" uuid,
    "ОбособленноеПодразделение" boolean,
    "НеИП" boolean,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."Контрагенты" OWNER TO dbmaster;

--
-- Name: Контрагенты1С; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."Контрагенты1С" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "НаименованиеПолное" text,
    "ОбособленноеПодразделение" boolean,
    "ЮридическоеФизическоеЛицо" text,
    "СтранаРегистрации" uuid,
    "ГоловнойКонтрагент" uuid,
    "ИНН" text,
    "КПП" text,
    "КодПоОКПО" text,
    "ДокументУдостоверяющийЛичность" text,
    "ОсновнойБанковскийСчет" uuid,
    "ОсновноеКонтактноеЛицо" uuid,
    "Комментарий" text,
    "ДополнительнаяИнформация" text,
    "РасширенноеПредставлениеИНН" text,
    "РасширенноеПредставлениеКПП" text,
    "НалоговыйНомер" text,
    "РегистрационныйНомер" text,
    "ГосударственныйОрган" boolean,
    "ВидГосударственногоОргана" text,
    "КодГосударственногоОргана" text,
    "СвидетельствоСерияНомер" text,
    "СвидетельствоДатаВыдачи" timestamp without time zone,
    "ДатаРегистрации" timestamp without time zone,
    "ДатаСоздания" timestamp without time zone,
    "Самозанятый" boolean,
    "КонтактнаяИнформация" jsonb
);


ALTER TABLE "Справочник"."Контрагенты1С" OWNER TO dbmaster;

--
-- Name: Контрагенты_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."Контрагенты" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."Контрагенты_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: КонтрагентыПокупки; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."КонтрагентыПокупки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент1С" uuid,
    "ФИОКонтрагента" text,
    "АдресПочтовый" text,
    "АдресФактический" text,
    "ОГРН" character varying(50),
    "ИНН" character varying(50),
    "Телефон" text,
    "ЭлектроннаяПочта" text,
    "РасчетныйСчет" text,
    "ОКВЭД" character varying(50),
    "БанкНаименование" text,
    "КоррСчетБанка" text,
    "БИКБанка" character varying(50),
    "Примечание" text,
    "ОрганизационнаяФорма" text,
    "НаименованиеПолное" text,
    "КПП" character varying(50),
    "ОКПО" character varying(50),
    "АдресЮридический" text,
    "ВидКонтрагента" character varying(50),
    "ГоловнойКонтрагент" uuid,
    "ОбособленноеПодразделение" boolean,
    "НеИП" boolean,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."КонтрагентыПокупки" OWNER TO dbmaster;

--
-- Name: КонтрагентыПокупки_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."КонтрагентыПокупки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."КонтрагентыПокупки_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ЛичныйКабинет; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ЛичныйКабинет" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Контрагент" uuid,
    "Логин" text,
    "Пароль" text,
    "Блокировать" boolean,
    "БлокироватьДокументы" boolean,
    "БлокироватьПриборы" boolean,
    "БлокироватьФинансы" boolean,
    "БлокироватьОтчеты" boolean,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."ЛичныйКабинет" OWNER TO dbmaster;

--
-- Name: ЛичныйКабинет_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ЛичныйКабинет" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ЛичныйКабинет_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: МодельПрибораУчета; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."МодельПрибораУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "IsFolder" boolean,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text
);


ALTER TABLE "Справочник"."МодельПрибораУчета" OWNER TO dbmaster;

--
-- Name: ОбъектыУчета; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ОбъектыУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" character varying(100),
    "АдресОбъекта" text,
    "НомерДоговора" uuid,
    "МаксимальнаяМощность" numeric(15,2),
    "Контрагент" uuid,
    "Примечание" text,
    "Регион" uuid,
    "ОбщаяМощность" boolean,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "МаксимальнаяМощностьПокупки" numeric(15,2),
    "ОбщаяМощностьПокупки" boolean,
    "Идентификатор" text,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."ОбъектыУчета" OWNER TO dbmaster;

--
-- Name: ОбъектыУчета_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ОбъектыУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ОбъектыУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ОтветственныеЛица; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ОтветственныеЛица" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "Пользователь" uuid,
    "Руководитель" uuid,
    "Должность" uuid,
    "Подразделение" uuid,
    "ФИОДляДокументов" text DEFAULT '-'::text,
    "Почта" text DEFAULT '-'::text,
    "Телефон" text DEFAULT '-'::text
);


ALTER TABLE "Справочник"."ОтветственныеЛица" OWNER TO dbmaster;

--
-- Name: ПремияПотребителю; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ПремияПотребителю" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "ИнформацияДляОтображения" jsonb,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."ПремияПотребителю" OWNER TO dbmaster;

--
-- Name: ПремияПотребителю_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ПремияПотребителю" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПремияПотребителю_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПремияПотребителюАгента; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ПремияПотребителюАгента" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Description" text,
    "КонтрагентАгента" uuid,
    "ДоговорАгента" uuid,
    "АдресПочтыАгента" text,
    "ИнформацияДляОтображения" jsonb,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."ПремияПотребителюАгента" OWNER TO dbmaster;

--
-- Name: ПремияПотребителюАгента_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ПремияПотребителюАгента" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПремияПотребителюАгента_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ПриборыУчета; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ПриборыУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "МодельПрибора" uuid,
    "КлассТочности" text,
    "ДатаПоверки" timestamp without time zone,
    "ВсоставеАСКУЭ" boolean,
    "ДатаСледующейПоверки" timestamp without time zone,
    "МежповерочныйИнтервал" numeric(10,0),
    "РасчетныйКоэффициент" numeric(14,2),
    "ЗначностьСчетчика" numeric(10,0),
    "Учитывать" boolean,
    "НомерПоставщика" text,
    "Автоматизация" boolean,
    "Статусы" uuid,
    "Примечание" text,
    "ДЭСНомерПрибораПоставщика" text,
    "ДКПНомерПрибораПоставщика" text,
    "ДКПОРЭМНомерПрибораПоставщика" text,
    "ДКПРГНомерПрибораПоставщика" text,
    "ДОУПНомерПрибораПоставщика" text,
    "ДЭСАЛНомерПрибораПоставщика" text,
    "ДатаСоздания" timestamp without time zone,
    "Code" bigint NOT NULL
);


ALTER TABLE "Справочник"."ПриборыУчета" OWNER TO dbmaster;

--
-- Name: ПриборыУчета_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ПриборыУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ПриборыУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Регион; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."Регион" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "Ref" uuid,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "ТарифНаУслугиПоПередаче" jsonb,
    "ВременнаяЗона" uuid
);


ALTER TABLE "Справочник"."Регион" OWNER TO dbmaster;

--
-- Name: СпособСбораДанных; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."СпособСбораДанных" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Code" text,
    "Description" text,
    "СтатусПрибораУчета" text
);


ALTER TABLE "Справочник"."СпособСбораДанных" OWNER TO dbmaster;

--
-- Name: ТочкиПоставки; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ТочкиПоставки" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" text,
    "АдресТочкиПоставки" text,
    "ГраницаБалансовойПринадлежности" text,
    "ОбъектУчета" uuid,
    "Договор" uuid,
    "ТочкиИзмерения" jsonb,
    "ПериодПродажи" jsonb,
    "Code" bigint NOT NULL,
    "Премия" jsonb,
    "Агент" jsonb,
    "ПитающийЦентр" text DEFAULT '-'::text NOT NULL,
    "ВНФСК" jsonb,
    "ПокупкаДЭС" jsonb,
    "СкидкаПокупки" jsonb,
    "ПокупкаДКП" jsonb,
    "ПокупкаДОУП" jsonb
);


ALTER TABLE "Справочник"."ТочкиПоставки" OWNER TO dbmaster;

--
-- Name: ТочкиПоставки_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ТочкиПоставки" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ТочкиПоставки_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ТочкиУчета; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."ТочкиУчета" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "Наименование" text,
    "МестоРасположения" text,
    "Примечание" text,
    "ДЭСУникальныйКодПокупки" text,
    "ДКПУникальныйКодПокупки" text,
    "ДКПОРЭМУникальныйКодПокупки" text,
    "ДКПРГУникальныйКодПокупки" text,
    "ДОУПУникальныйКодПокупки" text,
    "ДЭСАЛУникальныйКодПокупки" text,
    "ДЭСНаименование" text,
    "ДКПНаименование" text,
    "ДКПОРЭМНаименование" text,
    "ДКПРГНаименование" text,
    "ДОУПНаименование" text,
    "ДЭСАЛНаименование" text,
    "ОписаниеПотерь" text,
    "ОтветственныйЗаПоказания" uuid,
    "ДатаСоздания" timestamp without time zone,
    "ДопКиловатты" jsonb,
    "ДопКиловаттыПокупка" jsonb,
    "ДатаНачала" timestamp without time zone,
    "ДатаОкончания" timestamp without time zone,
    "ПриборыУчета" jsonb,
    "Code" bigint NOT NULL,
    "ПотериПроцент" numeric DEFAULT 0,
    "ПотериКвт" numeric DEFAULT 0,
    "ПотериНачисляются" boolean DEFAULT false NOT NULL,
    "ПрофильДЭС" text,
    "ПрофильДКП" text,
    "ПрофильДКПРГ" text,
    "ПрофильДОУП" text,
    "ПрофильОРЭМ" text,
    "ПрофильПокупки" text
);


ALTER TABLE "Справочник"."ТочкиУчета" OWNER TO dbmaster;

--
-- Name: ТочкиУчета_code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."ТочкиУчета" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."ТочкиУчета_code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: УдалениеДоговораПродажи; Type: TABLE; Schema: Справочник; Owner: dbmaster
--

CREATE TABLE "Справочник"."УдалениеДоговораПродажи" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "DeletionMark" boolean,
    "Description" text,
    "ДоговорПродажи" uuid,
    "Code" bigint NOT NULL,
    "Примечание" text,
    "Удален" boolean
);


ALTER TABLE "Справочник"."УдалениеДоговораПродажи" OWNER TO dbmaster;

--
-- Name: УдалениеДоговораПродажи_Code_seq; Type: SEQUENCE; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE "Справочник"."УдалениеДоговораПродажи" ALTER COLUMN "Code" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Справочник"."УдалениеДоговораПродажи_Code_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ЖурналЗаписи ЖурналЗаписи_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."ЖурналЗаписи"
    ADD CONSTRAINT "ЖурналЗаписи_pkey" PRIMARY KEY (id);


--
-- Name: КоэффициентОМиИнфрПлатеж КоэффициентОМиИнфрПлатеж_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."КоэффициентОМиИнфрПлатеж"
    ADD CONSTRAINT "КоэффициентОМиИнфрПлатеж_pkey" PRIMARY KEY (id);


--
-- Name: НерегулируемаяЦенаНаМощность НерегулируемаяЦенаНаМощность_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаМощность"
    ADD CONSTRAINT "НерегулируемаяЦенаНаМощность_pkey" PRIMARY KEY (id);


--
-- Name: НерегулируемаяЦенаНаЭнергию НерегулируемаяЦенаНаЭнергию_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."НерегулируемаяЦенаНаЭнергию"
    ADD CONSTRAINT "НерегулируемаяЦенаНаЭнергию_pkey" PRIMARY KEY (id);


--
-- Name: ОбъемПоставщика ОбъемПоставщика_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."ОбъемПоставщика"
    ADD CONSTRAINT "ОбъемПоставщика_pkey" PRIMARY KEY (id);


--
-- Name: ПерерасчетДоговораПродажи ПерерасчетДоговораПродажи_pkey; Type: CONSTRAINT; Schema: Документ; Owner: postgres
--

ALTER TABLE ONLY "Документ"."ПерерасчетДоговораПродажи"
    ADD CONSTRAINT "ПерерасчетДоговораПродажи_pkey" PRIMARY KEY (id);


--
-- Name: Показания Показания_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."Показания"
    ADD CONSTRAINT "Показания_pkey" PRIMARY KEY (id);


--
-- Name: РасчетДоговораПродажи РасчетДоговораПродажи_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."РасчетДоговораПродажи"
    ADD CONSTRAINT "РасчетДоговораПродажи_pkey" PRIMARY KEY (id);


--
-- Name: РеализацияТоваровУслуг РеализацияТоваровУслуг_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."РеализацияТоваровУслуг"
    ADD CONSTRAINT "РеализацияТоваровУслуг_pkey" PRIMARY KEY (id);


--
-- Name: СбытоваяНадбавка СбытоваяНадбавка_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."СбытоваяНадбавка"
    ADD CONSTRAINT "СбытоваяНадбавка_pkey" PRIMARY KEY (id);


--
-- Name: СкидкаТочкиПоставки СкидкаТочкиПоставки_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."СкидкаТочкиПоставки"
    ADD CONSTRAINT "СкидкаТочкиПоставки_pkey" PRIMARY KEY (id);


--
-- Name: СчетНаОплатуПокупателю СчетНаОплатуПокупателю_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."СчетНаОплатуПокупателю"
    ADD CONSTRAINT "СчетНаОплатуПокупателю_pkey" PRIMARY KEY (id);


--
-- Name: СчетФактураВыданный СчетФактураВыданный_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."СчетФактураВыданный"
    ADD CONSTRAINT "СчетФактураВыданный_pkey" PRIMARY KEY (id);


--
-- Name: ТарифНаУслугиПоПередаче ТарифНаУслугиПоПередаче_pkey; Type: CONSTRAINT; Schema: Документ; Owner: dbmaster
--

ALTER TABLE ONLY "Документ"."ТарифНаУслугиПоПередаче"
    ADD CONSTRAINT "ТарифНаУслугиПоПередаче_pkey" PRIMARY KEY (id);


--
-- Name: ВидДоговора ВидДоговора_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ВидДоговора"
    ADD CONSTRAINT "ВидДоговора_pkey" PRIMARY KEY (id);


--
-- Name: ВидКонтрагента ВидКонтрагента_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ВидКонтрагента"
    ADD CONSTRAINT "ВидКонтрагента_pkey" PRIMARY KEY (id);


--
-- Name: ДокументПодписанта ДокументПодписанта_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ДокументПодписанта"
    ADD CONSTRAINT "ДокументПодписанта_pkey" PRIMARY KEY (id);


--
-- Name: ОтчетыДоговора ОтчетыДоговора_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ОтчетыДоговора"
    ADD CONSTRAINT "ОтчетыДоговора_pkey" PRIMARY KEY (id);


--
-- Name: ТипАванса ТипАванса_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ТипАванса"
    ADD CONSTRAINT "ТипАванса_pkey" PRIMARY KEY (id);


--
-- Name: ТипДоговора ТипДоговора_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ТипДоговора"
    ADD CONSTRAINT "ТипДоговора_pkey" PRIMARY KEY (id);


--
-- Name: ФормаВедомости ФормаВедомости_pkey; Type: CONSTRAINT; Schema: Перечисление; Owner: dbmaster
--

ALTER TABLE ONLY "Перечисление"."ФормаВедомости"
    ADD CONSTRAINT "ФормаВедомости_pkey" PRIMARY KEY (id);


--
-- Name: ДанныеИсточника ДанныеИсточника_pkey; Type: CONSTRAINT; Schema: ПланОбмена; Owner: dbmaster
--

ALTER TABLE ONLY "ПланОбмена"."ДанныеИсточника"
    ADD CONSTRAINT "ДанныеИсточника_pkey" PRIMARY KEY (id);


--
-- Name: ГарантирующиеПоставщики ГарантирующиеПоставщики_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ГарантирующиеПоставщики"
    ADD CONSTRAINT "ГарантирующиеПоставщики_pkey" PRIMARY KEY (id);


--
-- Name: ДоговорКонтрагента1С ДоговорКонтрагента1С_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ДоговорКонтрагента1С"
    ADD CONSTRAINT "ДоговорКонтрагента1С_pkey" PRIMARY KEY (id);


--
-- Name: ДоговорПродажи ДоговорПродажи_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ДоговорПродажи"
    ADD CONSTRAINT "ДоговорПродажи_pkey" PRIMARY KEY (id);


--
-- Name: Контрагенты1С Контрагенты1С_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."Контрагенты1С"
    ADD CONSTRAINT "Контрагенты1С_pkey" PRIMARY KEY (id);


--
-- Name: Контрагенты Контрагенты_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."Контрагенты"
    ADD CONSTRAINT "Контрагенты_pkey" PRIMARY KEY (id);


--
-- Name: МодельПрибораУчета МодельПрибораУчета_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."МодельПрибораУчета"
    ADD CONSTRAINT "МодельПрибораУчета_pkey" PRIMARY KEY (id);


--
-- Name: ОбъектыУчета ОбъектыУчета_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ОбъектыУчета"
    ADD CONSTRAINT "ОбъектыУчета_pkey" PRIMARY KEY (id);


--
-- Name: ПриборыУчета ПриборыУчета_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ПриборыУчета"
    ADD CONSTRAINT "ПриборыУчета_pkey" PRIMARY KEY (id);


--
-- Name: Регион Регион_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."Регион"
    ADD CONSTRAINT "Регион_pkey" PRIMARY KEY (id);


--
-- Name: ТочкиПоставки ТочкиПоставки_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ТочкиПоставки"
    ADD CONSTRAINT "ТочкиПоставки_pkey" PRIMARY KEY (id);


--
-- Name: ТочкиУчета ТочкиУчета_pkey; Type: CONSTRAINT; Schema: Справочник; Owner: dbmaster
--

ALTER TABLE ONLY "Справочник"."ТочкиУчета"
    ADD CONSTRAINT "ТочкиУчета_pkey" PRIMARY KEY (id);


--
-- Name: ДифференцированнаяЦенаПоЧасам ДифференцированнаяЦена; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ДифференцированнаяЦена" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ДифференцированнаяЦенаПоЧасам" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ДифференцированнаяЦена"();


--
-- Name: КоэффициентОМиИнфрПлатеж КоэффициентОМиИнфрПлатеж; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "КоэффициентОМиИнфрПлатеж" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."КоэффициентОМиИнфрПлатеж" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_КоэффициентОМиИнфрПлатеж"();


--
-- Name: НерегулируемаяЦенаНаМощность НерегЦенаНаМощность; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "НерегЦенаНаМощность" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."НерегулируемаяЦенаНаМощность" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_НерегЦенаНаМощность"();


--
-- Name: НерегулируемаяЦенаНаЭнергию НерегЦенаНаЭнергию; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "НерегЦенаНаЭнергию" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."НерегулируемаяЦенаНаЭнергию" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_НерегЦенаНаЭнергию"();


--
-- Name: ПачкаПоказаний ПачкаПоказаний; Type: TRIGGER; Schema: Документ; Owner: postgres
--

CREATE TRIGGER "ПачкаПоказаний" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПачкаПоказаний" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПачкаПоказаний"();


--
-- Name: ПачкаПрофиляМощности ПачкаПрофиляМощности; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ПачкаПрофиляМощности" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПачкаПрофиляМощности" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПачкаПрофиляМощности"();


--
-- Name: ПерерасчетДоговораПродажи ПерерасчетПродажи; Type: TRIGGER; Schema: Документ; Owner: postgres
--

CREATE TRIGGER "ПерерасчетПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПерерасчетДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПерерасчетПродажи"();


--
-- Name: ПлановыеЧасыПиковойНагрузки ПлановыеЧасы; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ПлановыеЧасы" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПлановыеЧасыПиковойНагрузки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПлановыеЧасы"();


--
-- Name: Показания Показания; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "Показания" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."Показания" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_Показания"();


--
-- Name: ПрофильМощностиРегистр ПрофильМощности; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ПрофильМощности" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощности"();


--
-- Name: ПрофильМощностиГенерацииРегистр ПрофильМощностиГенерации; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ПрофильМощностиГенерации" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиГенерацииРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощностиГенерации"();


--
-- Name: ПрофильМощностиПотерьРегистр ПрофильМощностиПотерь; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ПрофильМощностиПотерь" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ПрофильМощностиПотерьРегистр" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ПрофильМощностиПотерь"();


--
-- Name: РасчетДоговораПродажи РасчетДоговораПродажи; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "РасчетДоговораПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."РасчетДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_РасчетДоговораПродажи"();


--
-- Name: РеализацияТоваровУслуг РеализацияТоваровУслуг; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "РеализацияТоваровУслуг" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."РеализацияТоваровУслуг" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_РеализацияТоваровУслуг"();


--
-- Name: СбытоваяНадбавка СбытоваяНадбавка; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "СбытоваяНадбавка" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СбытоваяНадбавка" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СбытоваяНадбавка"();


--
-- Name: СкидкаТочкиПоставки СкидкаТочкиПоставки; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "СкидкаТочкиПоставки" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СкидкаТочкиПоставки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СкидкаТочкиПоставки"();


--
-- Name: СчетНаОплатуПокупателю СчетНаОплатуПокупателю; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "СчетНаОплатуПокупателю" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."СчетНаОплатуПокупателю" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_СчетНаОплатуПокупателю"();


--
-- Name: ЧасыПиковойНагрузки ЧасыПиковойНагрузки; Type: TRIGGER; Schema: Документ; Owner: dbmaster
--

CREATE TRIGGER "ЧасыПиковойНагрузки" AFTER INSERT OR DELETE OR UPDATE ON "Документ"."ЧасыПиковойНагрузки" FOR EACH ROW EXECUTE FUNCTION "Документ"."История_ЧасыПиковойНагрузки"();


--
-- Name: Организации ОрганизацииОбновить; Type: TRIGGER; Schema: Настройки; Owner: dbmaster
--

CREATE TRIGGER "ОрганизацииОбновить" AFTER UPDATE ON "Настройки"."Организации" FOR EACH ROW EXECUTE FUNCTION "Журналы"."Организации_Обновить"();


--
-- Name: ГарантирующиеПоставщики ГарантирующиеПоставщики; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ГарантирующиеПоставщики" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ГарантирующиеПоставщики" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ГП"();


--
-- Name: ДоговорКонтрагента1С ДоговорКонтрагента1С; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ДоговорКонтрагента1С" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ДоговорКонтрагента1С" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ДоговорКонтрагента1С"();


--
-- Name: ДоговорПродажи ДоговорПродажи; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ДоговорПродажи" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ДоговорПродажи" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ДоговорПродажи"();


--
-- Name: ЗакрытыйПериодДоговораПродажи ЗакрытыйПериодДПР; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ЗакрытыйПериодДПР" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ЗакрытыйПериодДоговораПродажи" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ЗакрытыйПериодДПР"();


--
-- Name: Контрагенты Контрагенты; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "Контрагенты" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Контрагенты" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Контрагент"();


--
-- Name: Контрагенты1С Контрагенты1С; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "Контрагенты1С" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Контрагенты1С" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Контрагенты1С"();


--
-- Name: МодельПрибораУчета МодельПрибораУчета; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "МодельПрибораУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."МодельПрибораУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_МодельПрибораУчета"();


--
-- Name: ОбъектыУчета ОбъектыУчета; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ОбъектыУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ОбъектыУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ОбъектыУчета"();


--
-- Name: ПремияПотребителю ПремияПотребителю; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ПремияПотребителю" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПремияПотребителю" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПремияПотребителю"();


--
-- Name: ПремияПотребителюАгента ПремияПотребителюАгента; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ПремияПотребителюАгента" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПремияПотребителюАгента" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПремияПотребителюАгента"();


--
-- Name: ПриборыУчета ПриборыУчета; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ПриборыУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ПриборыУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ПриборыУчета"();


--
-- Name: Регион Регион; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "Регион" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."Регион" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_Регион"();


--
-- Name: ТочкиПоставки ТочкиПоставки; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ТочкиПоставки" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ТочкиПоставки" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ТочкиПоставки"();


--
-- Name: ТочкиУчета ТочкиУчета; Type: TRIGGER; Schema: Справочник; Owner: dbmaster
--

CREATE TRIGGER "ТочкиУчета" AFTER INSERT OR DELETE OR UPDATE ON "Справочник"."ТочкиУчета" FOR EACH ROW EXECUTE FUNCTION "Справочник"."История_ТочкиУчета"();


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

