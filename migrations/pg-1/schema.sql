CREATE EXTENSION postgres_fdw;


-- Sharding example --

CREATE SERVER db2
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres-2', dbname 'postgres', port '5432');
CREATE SERVER db3
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres-3', dbname 'postgres', port '5432');

CREATE USER MAPPING FOR user
        SERVER db2
        OPTIONS (user 'postgres', password 'password');
CREATE USER MAPPING FOR user
        SERVER db3
        OPTIONS (user 'postgres', password 'password');

-- Partitioning example --

CREATE TABLE temperatures (
    created_at      date,
    city            text,
    mintemp         integer,
    maxtemp         integer
)
PARTITION BY RANGE (created_at);

CREATE FOREIGN TABLE temperatures_2016
    PARTITION OF temperatures
    FOR VALUES FROM ('2016-01-01') TO ('2017-01-01')
    SERVER db2;

CREATE FOREIGN TABLE temperatures_2017
    PARTITION OF temperatures
    FOR VALUES FROM ('2017-01-01') TO ('2018-01-01')
    SERVER db3;

CREATE TABLE temperatures_default PARTITION OF temperatures DEFAULT;

-- External postgres datasource example --
SELECT pg_sleep(10);

CREATE TABLE companies (
    id              serial PRIMARY KEY,
    name            text,
    user_id         integer
);

CREATE SCHEMA db2;
CREATE SCHEMA db3;

IMPORT FOREIGN SCHEMA public FROM SERVER db2 INTO db2;
IMPORT FOREIGN SCHEMA public FROM SERVER db3 INTO db3;

-- Insert data exemple
INSERT INTO companies (name, user_id) VALUES ('Company 1', 1);
INSERT INTO companies (name, user_id) VALUES ('Company 2', 2);
INSERT INTO companies (name, user_id) VALUES ('Company 3', 3);


-- Insert external data example

INSERT INTO temperatures (created_at, city, mintemp, maxtemp) VALUES ('2016-02-03', 'London', 08, 13);
INSERT INTO temperatures (created_at, city, mintemp, maxtemp) VALUES ('2017-05-05', 'New York', 13, 21);
INSERT INTO temperatures (created_at, city, mintemp, maxtemp) VALUES ('2018-09-12', 'Sao Paulo', 24, 31);
