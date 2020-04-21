SELECT A.Name, MAX(Total)
  FROM AUTHOR AS A, (
    SELECT A.AuthorId, P.Actual_Price * COUNT(P.Book) AS Total
      FROM PURCHASE AS P, BOOK AS B, WRITES AS W
     WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn
     GROUP BY W.AuthorId) AS R1
 WHERE R1.AuthorId = A.AuthorId
 GROUP BY A.AuthorId, A.Name
