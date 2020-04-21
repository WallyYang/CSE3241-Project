-- Insert a new BOOK
INSERT INTO BOOK
VALUES ('782140661',                        -- ISBN
        'OCP: Oracle9i Certification Kit',  -- Title
        2002,                               -- Year
        104.97,                             -- Price
        'Computer'                          -- Category
);

-- Insert the AUTHOR of the BOOK, give a unique author ID
INSERT INTO AUTHOR
VALUES (1, 'Chip Dawes');                   -- AuthorID & Author Name

INSERT INTO AUTHOR
VALUES (2, 'Biju Thomas');

INSERT INTO AUTHOR
VALUES (3, 'Doug Stuns');

INSERT INTO AUTHOR
VALUES (4, 'Matthew Weishan');

INSERT INTO AUTHOR
VALUES (5, 'Joseph C. Johnson');

-- Insert the WRITES relation between BOOK and AUTHOR

INSERT INTO WRITES
VALUES ('782140661', 1);                    -- ISBN & Author ID

INSERT INTO WRITES
VALUES ('782140661', 2);

INSERT INTO WRITES
VALUES ('782140661', 3);

INSERT INTO WRITES
VALUES ('782140661', 4);

INSERT INTO WRITES
VALUES ('782140661', 5);

-- Insert PUBLISHER information
INSERT INTO PUBLISHER
VALUES ('Sybex',                                -- Name
        '0000000000',                           -- Phone
        '123 North Ave, Columbus, Ohio, 43210'  -- Address
);

-- Insert PUBLISHES relation
INSERT INTO PUBLISHES
VALUES ('782140661', 'Sybex');              -- ISBN & Publisher

-- Insert BOOK discount
INSERT INTO DISCOUNT
VALUES ('782140661',                        -- ISBN
        10,                                 -- Buy Limit
        0.7                                 -- Discount Percentage
);

INSERT INTO BOOK
VALUES ('782140661',                        -- ISBN
        'OCP: Oracle9i Certification Kit',  -- Title
        2002,                               -- Year
        104.97,                             -- Price
        'Computer'                          -- Category
);

-- Insert CUSTOMER information
INSERT INTO CUSTOMER
VALUES ('brutus.1@osu.edu',                     -- Email
        'Buckeye Brutus',                       -- Name
        '0000000000',                           -- Phone
        '123 North Ave, Columbus, Ohio, 43210'  -- Address
);

-- Insert Customer ACCOUNT
INSERT INTO ACCOUNT
VALUES ('brutus.1@osu.edu',                 -- Email
        1000,                               -- Reward Point
        'Sci-fi, Novel',                    -- Recommendation List
        1                                   -- Membership
);

-- Insert GIFT information
INSERT INTO GIFT
VALUES ('brutus.1@osu.edu', 'Book')         -- Customer Email & Gift Type
