SELECT A.Name
FROM AUTHOR AS A, WRITES AS W, PURCHASE AS P, CUSTOMER AS C, 
(SELECT C1.Email AS Email, sum(P1.Actual_Price) AS Spent
FROM PURCHASE P1, CUSTOMER C1
WHERE P1.Customer = C1.Email
GROUP BY P1.Customer) AS personal_sum
WHERE A.AuthorId = W.AuthorId
AND W.Isbn = B.Isbn
AND C.Email = personal_sum.Email
AND personal_sum.Spent > avg(personal_sum.Spent)
AND P.Customer = C.Email
AND P.Book = B.Isbn
