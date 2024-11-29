-- Tabel Series (Tabel Induk)
CREATE TABLE series (
    main_title VARCHAR(100) PRIMARY KEY,
    synopsis TEXT,
    rating_score FLOAT(2),
    rating_total_users INT,
    media_type VARCHAR(6),
    status VARCHAR(9),
    genres VARCHAR(255),
    themes VARCHAR(20),
    demographics VARCHAR(15),
    total_members INT,
    total_favorites INT,
    official_site VARCHAR(30),
);

CREATE TABLE series_alter_names (
    main_title VARCHAR(255),
    alternate_title VARCHAR(255),
    FOREIGN KEY (main_title) REFERENCES series(main_title)
);


-- Tabel Anime
CREATE TABLE anime (
    main_title VARCHAR(100) PRIMARY KEY,
    studio_company_name VARCHAR(255),
    type VARCHAR(5),
    total_episodes INT,
    date_first_episode_aired DATE,
    date_last_episode_aired DATE,
    premiered VARCHAR(12),
    source VARCHAR(100),
    duration INT,
    pg_rating VARCHAR(5),
    FOREIGN KEY (main_title) REFERENCES series(main_title),
    FOREIGN KEY (studio_company_name) REFERENCES studios(company_name)
);

-- Tabel Manga
CREATE TABLE manga (
    main_title VARCHAR(100) PRIMARY KEY,
    type VARCHAR(10),
    total_volumes INT,
    total_chapters INT,
    date_first_chapter_published DATE,
    date_last_chapter_published DATE,
    serializations VARCHAR(255),
    FOREIGN KEY (main_title) REFERENCES series(main_title)
);

-- Tabel Company (Induk)
CREATE TABLE companies (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50),
    date_established DATE,
    member_favorites INT  
);

-- Tabel Company Alternate Names
CREATE TABLE company_alter_names (
    company_name VARCHAR(255),
    alternate_name VARCHAR(255),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel Studios
CREATE TABLE studios (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'studios',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel Producers
CREATE TABLE producers (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'producers',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel Licensors
CREATE TABLE licensors (
    company_name VARCHAR(255) PRIMARY KEY,
    company_type VARCHAR(50) DEFAULT 'licensors',
    date_established DATE,
    member_favorites INT,
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

-- Tabel People (Induk)
CREATE TABLE people (
    name VARCHAR(255) PRIMARY KEY,
    birthday DATE,
    website VARCHAR(30),
    biography TEXT,
    member_favorites INT,
    nationality VARCHAR(50)
);

-- Tabel People Alternate Names
CREATE TABLE people_alter_names (
    people_name VARCHAR(255),
    alternate_name VARCHAR(255),
    FOREIGN KEY (people_name) REFERENCES people(name)
);

-- Tabel Staff
CREATE TABLE staff (
    name VARCHAR(255) PRIMARY KEY,
    roles VARCHAR(100),
    FOREIGN KEY (name) REFERENCES people(name)
);

-- Tabel Voice Actors
CREATE TABLE voice_actors (
    name VARCHAR(255) PRIMARY KEY,
    FOREIGN KEY (name) REFERENCES people(name)
);

-- Tabel Character
CREATE TABLE "character" (
    name VARCHAR(50) PRIMARY KEY,
    description TEXT,
    member_favorites INT
);

-- Tabel Series Characters
CREATE TABLE series_characters (
    series_main_title VARCHAR(255),
    character_name VARCHAR(255),
    PRIMARY KEY (series_main_title, character_name),
    FOREIGN KEY (series_main_title) REFERENCES series(main_title),
    FOREIGN KEY (character_name) REFERENCES "character"(name)
);

-- Tabel Character Voice Actors
CREATE TABLE character_va (
    character_name VARCHAR(255),
    people_name VARCHAR(255),
    character_role VARCHAR(8),
    PRIMARY KEY (character_name, people_name),
    FOREIGN KEY (character_name) REFERENCES character(name),
    FOREIGN KEY (people_name) REFERENCES voice_actors(name)
);

-- Tabel Anime Producers
CREATE TABLE anime_producers (
    company_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (company_name, anime_main_title),
    FOREIGN KEY (company_name) REFERENCES producers(company_name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Anime Licensors
CREATE TABLE anime_licensors (
    company_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (company_name, anime_main_title),
    FOREIGN KEY (company_name) REFERENCES licensors(company_name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Anime Staff
CREATE TABLE anime_staffs (
    people_name VARCHAR(255),
    anime_main_title VARCHAR(255),
    PRIMARY KEY (people_name, anime_main_title),
    FOREIGN KEY (people_name) REFERENCES staff(name),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

-- Tabel Published Manga
CREATE TABLE published_manga (
    people_name VARCHAR(255),
    manga_main_title VARCHAR(255),
    roles VARCHAR(50),
    year_published INT,
    PRIMARY KEY (people_name, manga_main_title, roles),
    FOREIGN KEY (people_name) REFERENCES staff(name),
    FOREIGN KEY (manga_main_title) REFERENCES manga(main_title)
);

-- Tabel User
CREATE TABLE "user" (
    username VARCHAR(255) PRIMARY KEY,
    birthday DATE,
    location VARCHAR(100),
    biography TEXT,
    date_joined DATE
);

-- Tabel Reviews
CREATE TABLE reviews (
    review_id VARCHAR(20) PRIMARY KEY,
    review_category VARCHAR(50),
    description TEXT,
    date_posted DATE
);

-- Tabel Reviewed
CREATE TABLE reviewed (
    user_username VARCHAR(50),
    series_main_title VARCHAR(255),
    review_id VARCHAR(20),
    PRIMARY KEY (user_username, series_main_title, review_id),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (series_main_title) REFERENCES series(main_title),
    FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);

-- Tabel Manga Stats
CREATE TABLE manga_stats (
    user_username VARCHAR(50),
    manga_main_title VARCHAR(255),
    read_status VARCHAR(50),
    rating INT,
    PRIMARY KEY (user_username, manga_main_title),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (manga_main_title) REFERENCES manga(main_title)
);

-- Tabel Anime Stats
CREATE TABLE anime_stats (
    user_username VARCHAR(50),
    anime_main_title VARCHAR(255),
    watch_status VARCHAR(50),
    episodes_watched INT,
    rating INT,
    PRIMARY KEY (user_username, anime_main_title),
    FOREIGN KEY (user_username) REFERENCES "user"(username),
    FOREIGN KEY (anime_main_title) REFERENCES anime(main_title)
);

