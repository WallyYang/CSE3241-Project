SELECT Email, Name
  FROM CUSTOMR C, ACCOUNT A
 WHERE C.Email = A.Email
 GROUP BY C.Email, C.Name
HAVING A.Reward_point = MAX(A.Reward_point)
