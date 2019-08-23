CREATE KEYSPACE IF NOT EXISTS pets WITH REPLICATION = { 'class' : 'SimpleStrategy' , 'replication_factor' : 2 };

USE pets;

CREATE TABLE IF NOT EXISTS dogs (
    name text,
    breed text,
    weight float,
    colors list<text>,
    PRIMARY KEY ((name, breed), weight)
);

INSERT INTO dogs (name, breed, weight, colors)
VALUES ('Grendal', 'Biewer Terrier', 13.0, ['black', 'white', 'brown']);
