SELECT C.Email, C.Name, B.Title
  FROM CUSTOMER AS C, BOOK AS B, PUBLISHES AS P, PURCHASE AS PUR
 WHERE P.Isbn = B.Isbn AND P.Author = 'Pratchett' AND PUR.Book = B.Isbn;
