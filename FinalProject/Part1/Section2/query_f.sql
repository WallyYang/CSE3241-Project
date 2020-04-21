SELECT L.Customer, L.Num
  FROM PURCHASE AS P, CUSTOMER AS C,
       (SELECT P.Customer AS Customer, COUNT(Book) AS Num
          FROM PURCHASE AS P, CUSTOMER AS C
         WHERE P.Customer = C.Email) AS L
 WHERE L.Num = MAX(L.Num);
