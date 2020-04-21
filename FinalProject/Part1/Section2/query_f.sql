SELECT L.Customer, MAX(L.Num)
  FROM PURCHASE AS P, CUSTOMER AS C,
       (SELECT P.Customer AS Customer, COUNT(Book) AS Num
          FROM PURCHASE AS P, CUSTOMER AS C
         WHERE P.Customer = C.Email
         GROUP BY P.Customer) AS L
