SELECT B.Title, P.Date
  FROM BOOK AS B, PURCHASE AS P, CUSTOMER AS C
 WHERE B.Isbn = P.Book AND P.Customer = C.Email;
