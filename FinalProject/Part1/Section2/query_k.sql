SELECT C.Customer, C.Total_amount
FROM (SELECT P.Customer, SUM(Actual_Price) AS Total_amount
        FROM PURCHASE AS P
       GROUP BY P.Customer) AS C
WHERE C.Total_amount > 50;
