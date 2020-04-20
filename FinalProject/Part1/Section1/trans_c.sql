BEGIN TRANSACTION NEW_GIFT;

UPDATE ACCOUNT
   SET Reward_point =  Reward_point - 100
 WHERE Email = 'Finnegan.1@osu.edu';

INSERT INTO GIFT
VALUES ('Finnegan.1@osu.edu', 'keychain');

COMMIT;
