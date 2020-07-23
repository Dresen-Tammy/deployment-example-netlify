CREATE TABLE person (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE post (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT now(),
  content TEXT,
  published BOOLEAN NOT NULL DEFAULT false,
  authorId INTEGER NOT NULL,
  FOREIGN KEY (authorId) REFERENCES person(id)
);

CREATE TABLE profile (
  id SERIAL PRIMARY KEY NOT NULL,
  bio TEXT,
  personId INTEGER UNIQUE NOT NULL,
  FOREIGN KEY (personId) REFERENCES person(id)
);