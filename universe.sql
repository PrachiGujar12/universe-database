--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: celestial_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_object (
    celestial_object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    object_type character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.celestial_object OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_object_celestial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_object_celestial_object_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_object_celestial_object_id_seq OWNED BY public.celestial_object.celestial_object_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric(12,2),
    number_of_stars integer NOT NULL,
    is_visible boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    orbital_period numeric(10,3),
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    diameter integer NOT NULL,
    has_rings boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    mass numeric(10,3),
    is_spherical boolean NOT NULL
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
-- Name: celestial_object celestial_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object ALTER COLUMN celestial_object_id SET DEFAULT nextval('public.celestial_object_celestial_object_id_seq'::regclass);


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
-- Data for Name: celestial_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_object VALUES (1, 'Halley', 'Comet', 'A famous periodic comet');
INSERT INTO public.celestial_object VALUES (2, 'Ceres', 'Dwarf Planet', 'A dwarf planet in the asteroid belt');
INSERT INTO public.celestial_object VALUES (3, 'Orion Nebula', 'Nebula', 'A star-forming region in the Milky Way');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, 100000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000.00, 40000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000.00, 100000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 29350000.00, 80000, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000.00, 30000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.322, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.319, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.263, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.769, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.551, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.155, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.689, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 15.945, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1.370, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396, 0.942, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1528, 4.518, true);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 1469, 79.321, true);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1123, 2.737, true);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, 1.888, true);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1578, 8.706, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1523, 13.463, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 4.144, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158, 2.520, true);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2707, 5.877, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 340, 360.136, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, false, 'Smallest planet in the Solar System');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, false, 'Second planet from the Sun');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, false, 'Home to known life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, false, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 139820, true, 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 116460, true, 'Famous for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 50724, true, 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 49244, true, 'A distant blue planet');
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 'Hypothetical Example', 12000, false, 'Example planet record for database practice');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Terrestrial Candidate', 12000, false, 'Exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Vega b', 5, 'Hypothetical Example', 15000, false, 'Example planet record for database practice');
INSERT INTO public.planet VALUES (12, 'Rigel b', 6, 'Hypothetical Example', 18000, false, 'Example planet record for database practice');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main sequence', 1.000, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type main sequence', 2.063, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'Red dwarf', 0.122, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 16.500, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A-type main sequence', 2.135, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Blue supergiant', 21.000, true);


--
-- Name: celestial_object_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_object_celestial_object_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_object celestial_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_name_key UNIQUE (name);


--
-- Name: celestial_object celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_object
    ADD CONSTRAINT celestial_object_pkey PRIMARY KEY (celestial_object_id);


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

