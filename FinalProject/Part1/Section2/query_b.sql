SELECT B.Title, P.Date
  FROM BOOK AS B, PURCHASE AS P, C AS CUSTOMER
 WHERE B.Isbn = P.Book AND P.Customer = C.Email;
