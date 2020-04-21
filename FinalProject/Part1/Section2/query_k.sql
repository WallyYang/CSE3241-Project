SELECT Name, Email
  FROM CUSTOMER NATURAL JOIN (SELECT SUM Actural_Price AS Total_amount
                                FROM PURCHASE AS P
                               GROUP BY P.Customer ) AS TOTAL
HAVING TOTAL.Toal_amount > AVG (TOTAL.Total_amount)
