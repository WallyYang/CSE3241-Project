SELECT Isbn, Title
  FROM (BOOK LEFT OUTER JOIN DISCOUNT)
 WHERE Percentage IS NOT NULL
 GROUP BY Isbn, Title
HAVING Price*Percentage = MAX(Price*Percentage);
