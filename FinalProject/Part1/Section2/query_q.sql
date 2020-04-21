SELECT A.Name
FROM (SELECT C.Customer, C.Total_amount
        FROM (SELECT P.Customer, SUM(Actual_Price) AS Total_amount
          FROM PURCHASE AS P
               GROUP BY P.Customer) AS C,
             (SELECT AVG(T.Total_amount) AS Avg_amount
          FROM (SELECT SUM(Actual_Price) AS Total_amount
                  FROM PURCHASE AS P
                 GROUP BY P.Customer) AS T) AS A
       WHERE C.Total_amount > A.Avg_amount) AS C,
     AUTHOR AS A, WRITES AS W, PURCHASE AS P
 WHERE A.AuthorId = W.AuthorId
   AND P.Book = W.Isbn AND P.Customer = C.Customer
