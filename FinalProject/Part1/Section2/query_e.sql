SELECT P.Customer, COUNT(Book)
  FROM PURCHASE AS P, CUSTOMER AS C
 WHERE P.Customer = C.Email
GROUP BY C.Email;
