CREATE TABLE IF NOT EXISTS  customer(
    id SERIAL PRIMARY KEY ,
    email VARCHAR(128) NOT NULL,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL
);


CREATE TABLE IF NOT EXISTS artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL UNIQUE,
    birthate timestamp NOT NULL
);



CREATE TABLE IF NOT EXISTS album(
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);




CREATE TABLE IF NOT EXISTS track_deliveries (
    id SERIAL PRIMARY KEY , 
    album_stock_id SERIAL NOT NULL ,
    amount int,
    delivery_date timestamp NOT NULL

);



CREATE TABLE IF NOT EXISTS album_rent(
    album_id SERIAL PRIMARY KEY ,
    customer_id INT,
    borrow_date timestamp,
    return_date timestamp,
    CONSTRAINT FK_customer FOREIGN KEY (customer_id) REFERENCES customer(id) 
);

CREATE TABLE IF NOT EXISTS album_stock (
    id SERIAL PRIMARY KEY,
    album_id SERIAL,
    stock int,
    CONSTRAINT FK_album FOREIGN KEY (album_id) REFERENCES album(id) 
);

CREATE TABLE IF NOT EXISTS song (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(128),
    duration integer NOT NULL,
    artist_id INT,
    CONSTRAINT FK_artist FOREIGN KEY (artist_id) REFERENCES artist(id) 
);

CREATE TABLE IF NOT EXISTS album_song (
    album_id INT NOT NULL ,
    song_id INT NOT NULL ,
    track int,
    PRIMARY KEY (album_id , song_id) ,
    CONSTRAINT FK_song FOREIGN KEY (song_id) REFERENCES song(id) 
);