# Microservices Webstore Application

- Refer to https://github.ncsu.edu/rrangar/monolithic-webstore for setting up the database and required packages.
- Run `git clone https://github.ncsu.edu/rrangar/microservices-webstore.git` and login with your NCSU Github credentials.
- Run `cd microservices-webstore`
- Run `sudo bash copyfiles.sh` to copy the `products.php`, `buyProducts.php`, `displayProducts.php` and `products.js` to the `/var/www/html/` folder.
- Change directory `cd /var/www/html/`
- Edit `products.php`, `buyProducts.php`, `displayProducts.php` and verify/change the servername of the following:
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
  - `curl "localhost/products.php?action=buy&quantity=1&itemID=2&customerEmail=usermicro@ncsu.edu"`
