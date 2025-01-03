CREATE TABLE users (
    identifier VARCHAR(50) PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    cash INT DEFAULT 0,
    bank INT DEFAULT 0
);
