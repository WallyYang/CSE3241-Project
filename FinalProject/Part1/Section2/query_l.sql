SELECT B.Title, COUNT(P.Book)
  FROM PURCHASE AS P, BOOK AS B
 WHERE P.Book = B.Isbn
 GROUP BY P.Book
 ORDER BY COUNT(P.Book) DESC