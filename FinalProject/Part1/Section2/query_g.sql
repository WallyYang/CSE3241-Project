SELECT C.Email, Name, MAX(A.Reward_point)
  FROM CUSTOMER C, ACCOUNT A
 WHERE C.Email = A.Email
