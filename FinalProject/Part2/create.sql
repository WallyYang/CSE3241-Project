-- BOOK table
CREATE TABLE BOOK(
  Isbn CHAR(13) NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Year INT NOT NULL,
  Price DECIMAL(5,2) NOT NULL,
  Category VARCHAR(100) NOT NULL,
  PRIMARY KEY (Isbn)
);

-- INVENTORY table, specify where the books are stored
CREATE TABLE INVENTORY(
  Isbn CHAR(13) NOT NULL,
  Location VARCHAR(100) NOT NULL,
  Quantity INT,
  PRIMARY KEY (Isbn),
  FOREIGN KEY (Isbn) REFERENCES BOOK(Isbn)
);

-- AUTHOR table
CREATE TABLE AUTHOR(
  AuthorID INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  PRIMARY KEY(AuthorID)
);

-- PUBLISHER table
CREATE TABLE PUBLISHER(
  Name VARCHAR(100) NOT NULL,
  Phone CHAR(11),
  Address VARCHAR(100) NOT NULL,
  PRIMARY KEY(Name)
);

-- CUSTOMER table
CREATE TABLE CUSTOMER(
  Email VARCHAR(100) NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Phone CHAR(11),
  Address VARCHAR(100) NOT NULL,
  PRIMARY KEY(Email)
);

-- DISCOUNT table, specify the current discounts on books
CREATE TABLE DISCOUNT(
  Isbn CHAR(13) NOT NULL,
  Buy_limit INT,
  Percentage REAL NOT NULL,
  PRIMARY KEY(Isbn),
  FOREIGN KEY(Isbn) REFERENCES BOOK(Isbn)
);

-- ACCOUNT table, stores customers with member accounts
CREATE TABLE ACCOUNT(
  Email VARCHAR(100) NOT NULL,
  Reward_point INT,
  Recommendation_list VARCHAR(500),
  Membership INT,
  PRIMARY KEY(Email),
  FOREIGN KEY(Email) REFERENCES CUSTOMER(Email)
);

-- GIFT table, specify gifts for customers
CREATE TABLE GIFT(
  Email VARCHAR(100) NOT NULL,
  Type VARCHAR,
  FOREIGN KEY(Email) REFERENCES CUSTOMER(Email)
);

-- WRITES table, specify the writting author of the books
CREATE TABLE WRITES(
  Isbn CHAR(13) NOT NULL,
  AuthorId VARCHAR(100) NOT NULL,
  PRIMARY KEY(Isbn, AuthorId),
  FOREIGN KEY(Isbn) REFERENCES BOOK(Isbn),
  FOREIGN KEY(AuthorId) REFERENCES AUTHOR(AuthorId)
);

-- PUBLISHES table, specify the publisher of each book
CREATE TABLE PUBLISHES(
  Isbn CHAR(13) NOT NULL,
  Publisher VARCHAR(100) NOT NULL,
  PRIMARY KEY(Isbn, Publisher),
  FOREIGN KEY(Isbn) REFERENCES BOOK(Isbn),
  FOREIGN KEY(Publisher) REFERENCES PUBLISHER(Name)
);

-- PURCHASE table, stores each book sale
CREATE TABLE PURCHASE(
  Transaction_id INT NOT NULL,
  Customer VARCHAR(100) NOT NULL,
  Book CHAR(13) NOT NULL,
  Actual_Price DECIMAL(5,2) NOT NULL,
  Date DATE,
  Card_type VARCHAR(100),
  PRIMARY KEY(Transaction_id),
  FOREIGN KEY(Customer) REFERENCES CUSTOMER(Email),
  FOREIGN KEY(Book) REFERENCES BOOK(Isbn)
);
