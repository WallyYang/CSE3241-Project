SELECT C.Name, C.Email
  FROM CUSTOMER AS C,
       (SELECT SUM(P.Actual_Price) AS Total
          FROM PURCHASE AS P
         GROUP BY P.Customer) AS R1
 WHERE R1.Customer = C.Email AND R1.Total > AVG(R1.Customer)
 GROUP BY R1.Customer
