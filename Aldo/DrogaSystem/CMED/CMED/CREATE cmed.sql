-- Active: 1698355710028@@127.0.0.1@5432@cmed@public

DROP TABLE IF EXISTS cmed CASCADE;
CREATE TABLE cmed (
    id SERIAL PRIMARY KEY,
    substancia    VARCHAR(255),
    cnpj          VARCHAR(255),
    laboratorio   VARCHAR(255),
    ggerm         VARCHAR(255),
    registro      VARCHAR(255),
    produto       VARCHAR(255),
    apresenta     VARCHAR(255),
    classe        VARCHAR(255),
    tipo          VARCHAR(255),
    pf            VARCHAR(255),
    pmc           VARCHAR(255),
    comer_2022    VARCHAR(255),
    tarja         VARCHAR(255)
);


