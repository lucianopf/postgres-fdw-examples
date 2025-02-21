-- Sharding example --

CREATE TABLE temperatures_2016 (
    created_at      date,
    city            text,
    mintemp         integer,
    maxtemp         integer
);

-- External postgres datasource example --

CREATE TABLE configurations (
    id              serial PRIMARY KEY,
    company_id      integer,
    config          jsonb
);

-- Insert data exemple

INSERT INTO configurations (company_id, config) VALUES (1, '{"balance_enabled": true, "webhooks_enabled": true}');
INSERT INTO configurations (company_id, config) VALUES (2, '{"balance_enabled": false, "webhooks_enabled": true}');
INSERT INTO configurations (company_id, config) VALUES (3, '{"balance_enabled": false, "webhooks_enabled": true}');