BEGIN TRANSACTION NEW_P;

  INSERT INTO PURCHASE
  VALUES (22,
          'Finnegan.1@osu.edu',
          '782140661',
          104.97,
          DATE(),
          'AMEX');

UPDATE Inventory
   SET Quantity = Quantity - 1
  WHERE Isbn = '782140661' AND Location = 'warehouse';

COMMIT;
