BEGIN TRANSACTION MOVE;

UPDATE Inventory
   SET Quantity = Quantity + 10
 WHERE Isbn = '782140661' AND Location = 'warehouse';

UPDATE Inventory
   SET Quantity = Quantity - 10
 WHERE Isbn = '782140661' AND Location = 'in-store';

COMMIT;
