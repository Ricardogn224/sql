CREATE OR REPLACE FUNCTION
public.ADD_ARTIST(NAME VARCHAR(128), BIRTHDATE DATE)
 RETURNS integer
 LANGUAGE plpgsql
 STRICT
 AS $function$
 DECLARE
 v_id_artist int;

 BEGIN
  -- L'artiste existe t'il ?
  SELECT NAME 
  FROM artist
  WHERE NAME = NAME;

  -- Sinon on le crée :
  IF NOT FOUND THEN
    INSERT INTO artist (NAME,BIRTHDATE)
    VALUES (NAME,BIRTHDATE)
    RETURNING id_artist INTO v_id_artist;
  END IF;

  return v_id_artist;

END;
$function$ ;
RETURNS boolean