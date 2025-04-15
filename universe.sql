--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter_km numeric NOT NULL,
    is_potentially_hazardous boolean,
    discovery_date date,
    orbital_period_days numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    width integer NOT NULL,
    number_of_planets numeric,
    has_life boolean,
    age_in_billions_of_years integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    is_tidally_locked boolean,
    discovery_year integer,
    surface_description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    has_rings boolean,
    orbital_period_days numeric NOT NULL,
    is_habitable boolean,
    diameter_km integer,
    atmosphere_type character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer NOT NULL,
    is_main_sequence boolean,
    mass_in_solar_masses numeric,
    spectral_class character varying(10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.4, false, '1801-01-01', 1680.15);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.4, false, '1807-03-29', 1325.75);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, false, '1802-03-28', 1686.04);
INSERT INTO public.asteroid VALUES (4, 'Eros', 16.84, false, '1898-08-13', 642.99);
INSERT INTO public.asteroid VALUES (5, 'Apophis', 0.37, true, '2004-06-19', 323.59);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 1000000000000, true, 14, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 1000000000000, false, 10, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, 400000000000, false, 6, 'Third-largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 120000, 500000000000, false, 12, 'Famous for supermassive black hole');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, 300000000000, false, 9, 'Resembles a Mexican hat');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 60000, 200000000000, false, 13, 'Interacting grand-design spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.3, true, -5000, 'Rocky with impact craters');
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 0.3189, true, 1877, 'Irregular, heavily cratered');
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 1.2624, true, 1877, 'Small and smooth');
INSERT INTO public.moon VALUES (4, 'Io', 2, 1.7691, true, 1610, 'Volcanically active');
INSERT INTO public.moon VALUES (5, 'Europa', 2, 3.5512, true, 1610, 'Icy with subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2, 7.1546, true, 1610, 'Largest moon in solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 2, 16.689, true, 1610, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Titan', 5, 15.945, true, 1655, 'Thick atmosphere, liquid methane lakes');
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 1.3702, true, 1789, 'Icy with subsurface ocean');
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 0.942, true, 1789, 'Death Star appearance');
INSERT INTO public.moon VALUES (11, 'Tethys', 5, 1.8878, true, 1684, 'Large impact crater');
INSERT INTO public.moon VALUES (12, 'Dione', 5, 2.7369, true, 1684, 'Bright with wispy terrain');
INSERT INTO public.moon VALUES (13, 'Rhea', 5, 4.5175, true, 1672, 'Heavily cratered');
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, 79.3215, true, 1671, 'Two-tone coloration');
INSERT INTO public.moon VALUES (15, 'Miranda', 8, 1.4135, true, 1948, 'Cliff faces 20 km high');
INSERT INTO public.moon VALUES (16, 'Ariel', 8, 2.52, true, 1851, 'Youngest surface');
INSERT INTO public.moon VALUES (17, 'Umbriel', 8, 4.144, true, 1851, 'Dark and cratered');
INSERT INTO public.moon VALUES (18, 'Titania', 8, 8.706, true, 1787, 'Largest Uranian moon');
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 13.463, true, 1787, 'Ancient, heavily cratered');
INSERT INTO public.moon VALUES (20, 'Triton', 7, -5.877, true, 1846, 'Geysers of nitrogen');
INSERT INTO public.moon VALUES (21, 'Nereid', 7, 360.13, false, 1949, 'Highly eccentric orbit');
INSERT INTO public.moon VALUES (22, 'Charon', 9, 6.387, true, 1978, 'Half Pluto''s size');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, false, 365.25, true, 12742, 'Nitrogen-Oxygen');
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, true, 4332.59, false, 139820, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (3, 'Mars', 1, false, 686.98, false, 6779, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (4, 'Venus', 1, false, 224.7, false, 12104, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, true, 10759.22, false, 116460, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, 87.97, false, 4879, 'Trace');
INSERT INTO public.planet VALUES (7, 'Neptune', 1, true, 60190.03, false, 49244, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (8, 'Uranus', 1, true, 30685.4, false, 50724, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, false, 11.186, true, 14000, 'Unknown');
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 1, false, 112.305, true, 12000, 'Unknown');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 1, false, 3.52474, false, 171600, 'Hydrogen');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 1, false, 6.099, true, 7700, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.0, 'G2V');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 2.02, 'A1V');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, false, 11.6, 'M2Iab');
INSERT INTO public.star VALUES (4, 'Vega', 1, 9602, true, 2.135, 'A0V');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 5790, true, 1.1, 'G2V');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 3042, true, 0.1221, 'M5.5Ve');
INSERT INTO public.star VALUES (7, 'Andromeda Star 1', 2, 8000, true, 1.5, 'F5V');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

