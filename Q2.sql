CREATE OR REPLACE FUNCTION
public.ADD_ALBUM(NAME VARCHAR(128))
 RETURNS boolean
 LANGUAGE plpgsql
 STRICT
 AS $function$
 DECLARE
 v_id_album int;

 BEGIN
  -- L'artiste existe t'il ?
  SELECT NAME 
  FROM album
  WHERE name = NAME;

  -- Sinon on le crée :
  IF NOT FOUND THEN
    INSERT INTO album (name)
    VALUES (NAME)
    RETURNING id INTO v_id_album;
  END IF;

  return v_id_album;

END;
$function$ ;
RETURNS boolean