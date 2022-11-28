CREATE OR REPLACE VIEW  VIEW_ARTISTS AS SELECT artist.name as artist, artist.birthate as birthdate, count(song.name) as songs 
FROM artist,song
WHERE artist.id = song.artist_id 
GROUP BY (artist,birthdate);