SELECT ADD_STOCK('L''Ecole des points vitaux ', 5);

CREATE OR REPLACE FUNCTION ADD_STOCK(ALBUM VARCHAR(128), AMOUNT INT )

RETURNS boolean
AS
$$
BEGIN

  DECLARE albumId ;

  IF EXISTS (SELECT id INTO albumId FROM album a WHERE a.name = ALBUM ) THEN

    INSERT INTO album_stock VALUES (DEFAULT,albumId, AMOUNT);
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;