SELECT Isbn, Quantity*Price
  FROM BOOK NATURAL JOIN INVENTORY
 GROUP BY Isbn
HAVING Quantity*Price=SUM(Quantity);
