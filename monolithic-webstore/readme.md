# Monolithic Webstore application

- Login to a Linux Virtual Machine
- Run `git clone https://github.ncsu.edu/rrangar/monolithic-webstore.git` and login with your NCSU Github credentials.
- Run `cd monolithic-webstore`
- Run `sudo bash setup.sh` to install PHP, MySQL, and Apache and configure phpmyadmin. This script was tested on Ubuntu 20.04. Enter `Y` whenever prompted.
- Run `sudo mysql -u root`
- Add new user `CREATE USER 'csc547'@'localhost' IDENTIFIED by 'CsCEcE547@Cloud';`
- Grant all privileges to user `GRANT ALL PRIVILEGES ON *.* TO 'csc547'@'localhost' WITH GRANT OPTION;`
- Type `exit;`
<!-- - Creating Database and Tables using GUI
  - Navigate to http://localhost/phpmyadmin to verify that phpMyAdmin has been installed.  
  - Login and create a new database name with name `Products`.    
  - Create a new table `Orders`.  
  - Create three columns under `Orders` as follows:  
    - `ItemID` of datatype BigInt Unsigned.  
    - `CustomerEmail` of datatype varchar(1024).  
    - `Quantity` of datatype Int Unsigned.   
  - Similarly, create a new table `Footwear`, with the below columns:  
    - `ItemID` of datatype BigInt Unsigned.  
    - `Name` of datatype varchar(1024).  
    - `Description` of datatype Text.  
    - `Cost` of datatype Decimal.    
  
  - Similarly, create a new table `Inventory`, with the below columns:  
    - `ItemID` of datatype BigInt Unsigned and and constrained to be the Primary Key.  
    - `Count` of datatype BigInt Unsigned.  
  - Enter some data in the `Footwear` table.  
  - The database is now setup. -->

- Creating Database and Tables using CLI
  - Run `mysql -u csc547 -p` and type password `CsCEcE547@Cloud`
  - To create the Database, run `CREATE DATABASE Products;`
  - Run `use Products;`
  - To create the tables, run 
    - `CREATE TABLE Orders (ItemID bigint(20) unsigned, CustomerEmail varchar(1024), Quantity int(10) unsigned);`
    - `CREATE TABLE Footwear (ItemID bigint(20) unsigned, Name varchar(1024), Description text, Cost decimal);`
    - `CREATE TABLE Inventory (ItemID bigint(20) unsigned primary key, Count bigint(20) unsigned);`
  - To insert some values into the tables, run
    - `INSERT INTO Footwear (ItemID, Name, Description, Cost) VALUES (1, "Nike Air Max 270", "The Max Air 270 unit delivers unrivaled, all-day comfort.", 160.00);`
    - `INSERT INTO Footwear (ItemID, Name, Description, Cost) VALUES (2, "Adidas Ultraboost 4.0", "Ultraboost DNA carries the genetic information of one of our most popular performance runners, but it's born for the street", 179.99);`
    - `INSERT INTO Footwear (ItemID, Name, Description, Cost) VALUES (3, "Reebok Nano X2", "The Nano X2 invites you to be exactly who you are, wherever you are. It is one part performance and one part lifestyle.", 135.00);`
    - `INSERT INTO Inventory (ItemID, Count) VALUES (1, 25);`
    - `INSERT INTO Inventory (ItemID, Count) VALUES (2,40);`
    - `INSERT INTO Inventory (ItemID, Count) VALUES (3, 15);`
  - Run `exit;`
  - The database is now setup.

<!-- - Copy `products.php` and `products.js` from the Monolithic folder scripts to the `/var/www/html/` folder using the commands:
  - `sudo cp products.php /var/www/html/products.php`
  - `sudo cp products.js /var/www/html/products.js` -->
- Change directory `cd /var/www/html/`
- Edit `products.php` by typing `sudo nano products.php` and verify/change the following:
  - `$servername = "localhost";`
  - `$username = "csc547";`
  - `$password = "CsCEcE547@Cloud";`
- In a new session, Log in to mysql as csc547. Select the database and check the table content by typing the following sql commands:
  - `use Products;`
  - `select * from Footwear;`
  - `select * from Inventory;`
  - `select * from Orders;`
- In your VM, make sure you have enabled X11 forwarding or have a display. Open firefox GUI by typing `firefox -no-remote`. Then, navigate to http://localhost/products.php, buy some products and verify that the orders show up in the database in the `Orders` table. Also, check if the count has been updated in the `Inventory` table.
  - You can also send requests using CLI
  - `curl "localhost/products.php?action=buy&quantity=1&itemID=2&customerEmail=user@ncsu.edu"`
- Check out https://github.ncsu.edu/rrangar/microservices-webstore for implementing this application using Microservices architecture.


