-- a
SELECT Title, A.Name
  FROM BOOK AS B, WRITES AS W, AUTHOR AS A
 WHERE B.Price < 10 AND A.Name LIKE 'Terry Pratchett'
   AND (B.Isbn = W.Isbn AND W.AuthorId = A.AuthorId);

-- b
SELECT B.Title, P.Date
  FROM BOOK AS B, PURCHASE AS P, CUSTOMER AS C
 WHERE B.Isbn = P.Book AND P.Customer = C.Email;

-- c
SELECT B.Title, B.Isbn
  FROM BOOK AS B, INVENTORY AS I
 WHERE B.Isbn = I.Isbn
 GROUP BY B.Title, B.Isbn
HAVING sum(I.Quantity) < 5;

-- d
SELECT C.Email, C.Name, B.Title
  FROM CUSTOMER AS C, BOOK AS B, PURCHASE AS PUR,
       WRITES AS W, AUTHOR AS A
 WHERE PUR.Book = B.Isbn AND PUR.Customer = C.Email
   AND W.AuthorId = A.AuthorId
   AND A.Name = 'Terry Pratchett';

-- e
SELECT P.Customer, COUNT(Book)
  FROM PURCHASE AS P, CUSTOMER AS C
 WHERE P.Customer = C.Email
 GROUP BY C.Email;

-- f
SELECT L.Customer, MAX(L.Num)
  FROM PURCHASE AS P, CUSTOMER AS C,
       (SELECT P.Customer AS Customer, COUNT(Book) AS Num
          FROM PURCHASE AS P, CUSTOMER AS C
         WHERE P.Customer = C.Email
         GROUP BY P.Customer) AS L;

-- g
SELECT C.Email, Name, MAX(A.Reward_point)
  FROM CUSTOMER C, ACCOUNT A
 WHERE C.Email = A.Email;

-- h
SELECT BOOK.Isbn, Title, MAX(Price*Percentage)
  FROM (BOOK LEFT OUTER JOIN DISCOUNT)
 WHERE BOOK.Isbn = DISCOUNT.Isbn;

-- i
SELECT Isbn, SUM(Quantity * Price)
  FROM BOOK NATURAL JOIN INVENTORY
 GROUP BY Isbn;


-- j
SELECT C.Name, SUM(P.Actual_Price)
  FROM PURCHASE AS P, CUSTOMER AS C
 WHERE P.Customer = C.Email
 GROUP BY P.Customer;

-- k
SELECT C.Customer, C.Total_amount
  FROM (SELECT P.Customer, SUM(Actual_Price) AS Total_amount
          FROM PURCHASE AS P
         GROUP BY P.Customer) AS C,
       (SELECT AVG(T.Total_amount) AS Avg_amount
          FROM (SELECT SUM(Actual_Price) AS Total_amount
                  FROM PURCHASE AS P
                 GROUP BY P.Customer) AS T) AS A
 WHERE C.Total_amount > A.Avg_amount;

-- l
SELECT B.Title, COUNT(P.Book)
  FROM PURCHASE AS P, BOOK AS B
 WHERE P.Book = B.Isbn
 GROUP BY P.Book
 ORDER BY COUNT(P.Book) DESC;

-- m
SELECT B.Title, COUNT(P.Book)
  FROM PURCHASE AS P, BOOK AS B
 WHERE P.Book = B.Isbn
 GROUP BY P.Book
 ORDER BY COUNT(P.Book) DESC;

-- n
SELECT A.Name, MAX(Total)
  FROM AUTHOR AS A,
       (SELECT A.AuthorId, COUNT(P.Book) AS Total
          FROM PURCHASE AS P, BOOK AS B,
               WRITES AS W, AUTHOR AS A
         WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn
         GROUP BY W.AuthorId) AS R1
 WHERE R1.AuthorId = A.AuthorId
 GROUP BY A.AuthorId, A.Name;

-- o
SELECT A.Name, MAX(Total)
  FROM AUTHOR AS A, (
    SELECT A.AuthorId, P.Actual_Price * COUNT(P.Book) AS Total
      FROM PURCHASE AS P, BOOK AS B, WRITES AS W, AUTHOR AS A
     WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn
     GROUP BY W.AuthorId) AS R1
 WHERE R1.AuthorId = A.AuthorId
 GROUP BY A.AuthorId, A.Name;

-- p
SELECT C.Name, C.Email, C.Phone, C.Address
  FROM (SELECT A.AuthorId, MAX(Total)
          FROM (SELECT A.AuthorId, P.Actual_Price * COUNT(P.Book) AS Total
                  FROM PURCHASE AS P, BOOK AS B,
                       WRITES AS W, AUTHOR AS A
                 WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn
                 GROUP BY W.AuthorId) AS R1,
               AUTHOR AS A
         WHERE R1.AuthorId = A.AuthorId
         GROUP BY A.AuthorId) AS R2,
       CUSTOMER AS C, PURCHASE AS P, BOOK AS B, WRITES AS W
 WHERE P.Book = B.Isbn AND B.Isbn = W.Isbn AND W.AuthorId = R2.AuthorId;

-- q
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
