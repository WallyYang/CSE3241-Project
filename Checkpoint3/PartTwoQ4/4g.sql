SELECT C.Name, C.Email
  FROM (SELECT A.AuthorId, MAX(Total)
          FROM (SELECT A.AuthorId, P.Actual_Price * COUNT(P.Book) AS Total
                  FROM PURCHASE AS P, BOOK AS B, WRITES AS W
                 WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn
                 GROUP BY W.AuthorId) AS R1,
               AUTHOR AS A
         WHERE R1.AuthorId = A.AuthorId
         GROUP BY A.AuthorId) AS R2, CUSTOMER AS C
 WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn AND W.AuthorId = R2.AuthorId
