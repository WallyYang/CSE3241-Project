SELECT Email, Name
FROM (CUSTOMER NATURAl JOIN ACCOUNT)
WHERE Reward_point=MAX(Reward_point);

SELECT Isbn, Title
FROM (BOOK LEFT OUTER JOIN DISCOUNT)
WHERE Percentage IS NOT NULL AND Price*Percentage=MAX(Price*Percentage);

SELECT Isbn, Stock*Price
FROM BOOK NATURAL JOIN INVENTORY
WHERE Stock=SUM(Quantity) ;
