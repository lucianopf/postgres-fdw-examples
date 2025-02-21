-- Sharding example --

CREATE TABLE temperatures_2017 (
    created_at      date,
    city            text,
    mintemp         integer,
    maxtemp         integer
);

-- External postgres datasource example --

CREATE TABLE users (
    id              serial PRIMARY KEY,
    name            text,
    email           text
);

-- Insert data exemple

INSERT INTO users (name, email) VALUES ('John Doe', 'john.doe@example.com');
INSERT INTO users (name, email) VALUES ('Jane Doe', 'jane.doe@example.com');
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');