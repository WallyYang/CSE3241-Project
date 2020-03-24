SELECT Customer, Num
FROM PURCHASE AS P, CUSTOMER AS C,
(SELECT P.Customer AS Customer, COUNT(BOOK) AS Num
FROM PURCHASE AS P, CUSTOMER AS C
WHERE P.Customer = C.Email) AS L
HAVING MAX(L.Num)
