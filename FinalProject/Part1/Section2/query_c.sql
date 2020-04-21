SELECT B.Title, B.Isbn
  FROM BOOK AS B, INVENTORY AS I
 WHERE B.Isbn = I.Isbn
 GROUP BY B.Title, B.Isbn
HAVING sum(I.Quantity) < 5;
