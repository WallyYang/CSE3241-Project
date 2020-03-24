SELECT B.Title, P.Actual_Price * COUNT(P.Book) AS Total_dollars
  FROM PURCHASE AS P, BOOK AS B
 WHERE P.Book = B.Isbn
 GROUP BY P.Book
 ORDER BY P.Actual_Price * COUNT(P.Book) DESC
