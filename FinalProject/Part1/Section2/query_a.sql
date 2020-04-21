SELECT Title, A.Name
  FROM BOOK AS B, WRITES AS W, AUTHOR AS A
 WHERE B.Price < 10
   AND (B.Isbn = W.Isbn AND W.AuthorId = A.AuthorId);
