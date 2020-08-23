CREATE DATABASE challengeapi

CREATE TABLE "user" (
  id               SERIAL PRIMARY KEY NOT NULL, 
  username         varchar(45) NOT NULL, 
  email            varchar(60) NOT NULL, 
  password         varchar(80) NOT NULL,
  CONSTRAINT uk_email 
    UNIQUE (email), 
  CONSTRAINT uk_username 
    UNIQUE (username)
);

CREATE TABLE "rol" (
  id       SERIAL PRIMARY KEY NOT NULL, 
  name_rol VARCHAR(45) NOT NULL, 
  CONSTRAINT uk_name_rol 
    UNIQUE (name_rol)
);

CREATE TABLE "rol_user" (
  id        SERIAL PRIMARY KEY NOT NULL, 
  id_rol    int4 NOT NULL, 
  id_user   int4 NOT NULL, 
  CONSTRAINT uk_rol_user 
    UNIQUE (id_rol, id_user)
);

CREATE TABLE "application" (
  id        SERIAL PRIMARY KEY NOT NULL,
  name      VARCHAR(80) NOT NULL,
  category  VARCHAR(80) NOT NULL,
  price     FLOAT4 NOT NULL,
  logo      BYTEA,
  CONSTRAINT uk_name 
    UNIQUE ("name")
);

CREATE TABLE "application_user" (
  id                 SERIAL PRIMARY KEY NOT NULL, 
  id_user            int4 NOT NULL, 
  id_application     int4 NOT NULL, 
  CONSTRAINT uk_project_team 
    UNIQUE (id_user, id_application)
);

ALTER TABLE rol_user ADD CONSTRAINT fk_rol_user FOREIGN KEY (id_rol) REFERENCES "rol" (id);
ALTER TABLE rol_user ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "user" (id);
ALTER TABLE application_user ADD CONSTRAINT fk_application FOREIGN KEY (id_application) REFERENCES "application" (id);
ALTER TABLE application_user ADD CONSTRAINT fk_application_user FOREIGN KEY (id_application) REFERENCES "application" (id);

INSERT INTO "rol" (name_rol) VALUES 
  ('Desarrollador'),
  ('Cliente');


/* SOME QUERIES */

SELECT username, email, name_rol FROM "user" a, "rol" b, "rol_user" c
WHERE a.id = c.id_user
AND b.id = c.id_rol;

SELECT * FROM "user" a, "application_user" b, "application" c
WHERE a.id = b.id_user
AND c.id = b.id_application;