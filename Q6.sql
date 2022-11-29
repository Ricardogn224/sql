CREATE OR REPLACE FUNCTION RENT_ALBUM(CUSTOMER_EMAIL VARCHAR(128), ALBUM_NAME VARCHAR(128), BORROW_DATE
DATE)

RETURNS boolean AS $$

DECLARE 
    albumId int;
    customerId int;
BEGIN

  IF EXISTS (SELECT albumId=album.id  FROM album,album_stock  WHERE album.id = album_stock.id AND album.name = ALBUM_NAME  AND album_stock.stock > 0 
  AND (SELECT customerId = id FROM customer WHERE email = CUSTOMER_EMAIL ))

  THEN
    INSERT INTO album_rent VALUES (albumId, customerId, AMOUNT);
    RETURN TRUE;

  ELSE
    RETURN FALSE;
  END IF;

END;
$$ LANGUAGE plpgsql;

SELECT RENT_ALBUM('gaillad@myges.fr', 'Futur ', '2019-01-05');

http://10.192.0.69/