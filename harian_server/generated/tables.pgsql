--
-- Class Crud as table crud
--

CREATE TABLE "crud" (
  "id" serial,
  "tittle" text NOT NULL,
  "description" text NOT NULL
);

ALTER TABLE ONLY "crud"
  ADD CONSTRAINT crud_pkey PRIMARY KEY (id);


--
-- Class Harian as table harian
--

CREATE TABLE "harian" (
  "id" serial,
  "name" text NOT NULL,
  "deskripsi" text NOT NULL,
  "isPrime" boolean NOT NULL
);

ALTER TABLE ONLY "harian"
  ADD CONSTRAINT harian_pkey PRIMARY KEY (id);


--
-- Class User as table users
--

CREATE TABLE "users" (
  "id" serial,
  "name" text NOT NULL,
  "image" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


