CREATE OR REPLACE VIEW "view_albums" AS
SELECT album.name AS album,
    count(song.name) AS songs,
    sum(song.duration) AS duration
   FROM album,
    song,
    album_song
  WHERE ((album.id = album_song.album_id) AND (album_song.song_id = song.id))
  GROUP BY album ;