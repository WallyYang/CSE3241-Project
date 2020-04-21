SELECT C.Name, SUM(P.Actual_Price)
  FROM PURCHASE AS P, CUSTOMER AS C
 WHERE P.Customer = C.Email
 GROUP BY P.Customer
