import sqlite3
connection = sqlite3.connect('bookstore.sqlite')
cursor = connection.cursor()

#promote book info
Isbn = input("Enter the Isbn of the book: ")
title = input("Enter the title of the book: ")
year = input("Enter the year of the book: ")
price = input("Enter the price of the book: ")
categy = input("Enter the category of the book: ")
    
cursor.execute("SELECT Isbn FROM BOOK WHERE Isbn = ?",(Isbn,))
data = cursor.fetchall()

param_book = (Isbn,title,year,price,categy)

if not data:
    cursor.execute("INSERT INTO BOOK VALUES (?,?,?,?,?)",param_book)
    print("Successfully inserted book " + title+"!\n")

    #promote author info
    author = input("Enter author of book "+title+": ")
    authorID = input("Enter authorID of the author: ")
    cursor.execute("SELECT authorID FROM AUTHOR WHERE AuthorID = ?",(authorID,))
    data = cursor.fetchall()
    if not data:
        cursor.execute("INSERT INTO AUTHOR VALUES (?,?)",(authorID,author))
        print("Successfully inserted " + author + " as the author of book "+title+"!\n")
    else:
        print("The author is already in database!\n")

    #promote publisher info
    publisher = input("Enter the publisher of book "+title+": ")
    pub_phone = input("Enter the phone of "+publisher +" if there is any: ")
    pub_address= input("Enter the address of "+publisher +": ")
    param_pub = (publisher,pub_phone,pub_address)
    cursor.execute("SELECT Name FROM PUBLISHER WHERE Name = ?",(publisher,))
    data = cursor.fetchall()
    if not data:
        cursor.execute("INSERT INTO PUBLISHER VALUES (?,?,?)",param_pub)
        cursor.execute("INSERT INTO PUBLISHES VALUES (?,?)", (Isbn,publisher))
        print("Successfully inserted publisher "+publisher+" of book "+title+"!\n")
    else:
        print("The publisher "+publisher+" is already in database!\n")
    

    #promote inventory info
    location = input("Enter location of the inventory: ")
    quantity = input("Enter the number of book "+ title+" you want to add into "+location+": ")
    param_inventory = (Isbn,location,quantity)
    cursor.execute("INSERT INTO INVENTORY VALUES (?,?,?)",param_inventory)
    print("Successfully inserted book "+title+" to inventory "+location+"! \n")
    print("You have imported data of book "+title+" into database!")
        
else:
    print("Isbn is already in database")


connection.commit()
cursor.close()
connection.close()
