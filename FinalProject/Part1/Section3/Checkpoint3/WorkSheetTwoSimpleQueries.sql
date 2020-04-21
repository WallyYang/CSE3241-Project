-- a
SELECT Title
FROM BOOK AS B, PUBLISHES AS P
WHERE B.Isbn = P.Isbn AND B.Price < 10 AND P.Author = 'Pratchett';

-- b
SELECT B.Title, P.Date
FROM BOOK AS B, PURCHASE AS P, C AS CUSTOMER
WHERE B.Isbn = P.Book AND P.Customer = C.Email;

-- c
SELECT B.Title, B.Isbn
FROM BOOK AS B, INVENTORY AS I
WHERE B.Isbn = I.Isbn
GROUP BY B.Title, B.Isbn
HAVING sum(I.Quantity) < 5;

-- d
SELECT C.Email, C.Name, B.Title
FROM CUSTOMER AS C, BOOK AS B, PUBLISHES AS P, PURCHASE AS PUR
WHERE P.Isbn = B.Isbn AND P.Author = 'Pratchett' AND PUR.Book = B.Isbn;

-- e
SELECT P.Customer, COUNT(Book)
FROM PURCHASE AS P, CUSTOMER AS C
WHERE P.Customer = C.Email;

-- f
SELECT L.Customer, L.Num
FROM PURCHASE AS P, CUSTOMER AS C,
(SELECT P.Customer AS Customer, COUNT(Book) AS Num
FROM PURCHASE AS P, CUSTOMER AS C
WHERE P.Customer = C.Email) AS L
WHERE L.Num = MAX(L.Num);
