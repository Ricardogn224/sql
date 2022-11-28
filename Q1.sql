CREATE OR REPLACE FUNCTION ADD_ARTIST(NEW_NAME VARCHAR(128), BIRTHDATE DATE)
RETURNS boolean
AS
$$
BEGIN
  IF EXISTS (SELECT FROM artist a WHERE a.name = NEW_NAME) THEN
    RETURN FALSE;
  ELSE
    INSERT INTO artist VALUES (DEFAULT, NEW_NAME, BIRTHDATE);
    RETURN TRUE;
  END IF;
END;
$$ LANGUAGE plpgsql;