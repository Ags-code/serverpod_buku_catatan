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


