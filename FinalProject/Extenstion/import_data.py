import sqlite3
connection = sqlite3.connect('bookstore.sqlite')
cursor = connection.cursor()

Isbn = input("Enter the Isbn of the book: ")
title = input("Enter the title of the book: ")
year = input("Enter the year of the book: ")
price = input("Enter the price of the book: ")
categy = input("Enter the category of the book: ")

param = (Isbn,title,year,price,categy)
cursor.execute("SELECT Isbn FROM BOOK WHERE Isbn = ?",(Isbn,))
data = cursor.fetchall()

if not data:
    cursor.execute("INSERT INTO BOOK VALUES (?,?,?,?,?)",param)
    print("Successfully inserted book" + title)
else:
    print("Isbn is already in database")
        

connection.commit()
cursor.close()
connection.close()
