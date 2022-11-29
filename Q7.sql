CREATE OR REPLACE FUNCTION auditstock() RETURNS TRIGGER AS $track_stock$
   BEGIN
      INSERT INTO "track_deliveries" ("album_stock_id", "amount", "delivery_date")
      VALUES (NEW.album_stock_id,NEW.amount, now());
      RETURN NEW;
   END;
$track_stock$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER track_stock AFTER INSERT ON album_stock
FOR EACH ROW EXECUTE PROCEDURE auditstock();