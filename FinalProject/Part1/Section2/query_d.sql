SELECT C.Email, C.Name, B.Title
  FROM CUSTOMER AS C, BOOK AS B, PURCHASE AS PUR,
       WRITES AS W, AUTHOR AS A
 WHERE PUR.Book = B.Isbn AND PUR.Customer = C.Email
   AND W.AuthorId = A.AuthorId
   AND A.Name = 'Terry Pratchett';
