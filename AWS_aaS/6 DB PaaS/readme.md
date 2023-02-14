
### 6. Deploy the WebStore Database using AWS Relational Database Service (AWS RDS) - PaaS

1. Login to your AWS console at https://console.aws.amazon.com/ and search for `RDS` from the list of services.  
2. In the RDS dashboard, click on Create Database.  
3. Let the Database Creation Method remain Standard Create.  
4. Choose MySQL as the engine option.  
5. Let the MySQL version remain at its default value.  
6. Choose the Free Tier template.  
7. Enter a DB instance identifier - `DB-PaaS`.    
8. Enter your DB credentials: 
	- Master username - `csc547` 
	- Password - `csc547cloud` 
	- Remember or note down these credentials since they will be used to login to the DB later.  
9. Let the storage options be at their default settings.  
10. Within the connectivity settings, choose the instance to be publicly accessible. Click on Yes under Public Access. This will allow to connect to the database from an SQL client to setup and query tables.  
11. Choose the existing security group  `HTTP SSH SQL`.
12. Let the database authentication remain password authentication.  
13. Under Additional Configuration, you can enter a initial name for your database: Products.  
14. Click on Create Database. AWS will take a few minutes to launch the database.

### Configure Database using a GUI-based SQL Client
1. https://dbeaver.io/ - dbeaver supports Linux, Windows, and Mac.  

### Configure Database using a CLI-based SQL Client (Preferred)
1. You need mysql-client to run this command. Three ways to use mysql:
	- Install mysql-client. Follow the instructions from https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-install-linux-quick.html.
	- Use your team's Lab Virtual Machine (provided in Lab 02). Google sheets link - https://docs.google.com/spreadsheets/d/1JEeEa9RiWsrM-NAtPMjA9hjigatx1LVtXmx7T-eD5iI/edit?usp=sharing.  
	- [Preferred] Use one of your EC2 instances (we installed mysql on the `1 DB IaaS` instance). Just SSH into this instance and run the mysql command.
2. Get the RDS database connection URL (Endpoint).  
	- Go to your AWS console -> RDS -> Databases.  
	- Click on connectivity and security.  
	- The URL is displayed under endpoint. This is displayed only after the database has been launched by AWS.  
	- Make note of this Endpoint. `<rds-endpoint>`
3. Run `mysql -h <database-url> -u csc547 -p` 
	- Enter the password `csc547cloud` when prompted. 
	- Configure the database using SQL commands: https://github.ncsu.edu/rrangar/AWS_aaS/blob/68ab5a3478ee5f26ff9e5c3919e33d6825719415/6%20DB%20PaaS/DatabaseSetup.sql

### Test the RDS Database (PaaS)

1. Make sure the RDS database `DB-PaaS` is running.
2. You can test this database by changing the `<database-public-IPv4-address>` in either the Monolithic (2) server, or the Microservices (3 and 4).   
3. To test with the Monolithic server,
	- SSH into this `2 Monolithic Products IaaS` EC2 Instance.
	- Make the following modifications in products.php:  
		- `$servername = "<rds-endpoint>";`
4. To test with the Microservices,
	- SSH into this `3 Microservices Display IaaS` EC2 Instance.
	- Make the following modifications in displayProducts.php:  
		- `$servername = "<rds-endpoint>";`
	- SSH into this `4 Microservices Buy IaaS` EC2 Instance.
	- Make the following modifications in buyProducts.php:  
		- `$servername = "<rds-endpoint>";`
	- No need to make any changes to `5 Microservices Route IaaS`.
5. Open a web browser, and enter the URL \<app-public-IP>/products.php to send an HTTP GET request to products.php.   
   - `http://55.66.77.88/products.php`  
6. Verify that the list of products are displayed correctly.  
7. Buy some products from the webstore  
8. Verify that the item quantities are updated correctly in the database by dbeaver or from the command line using:
	- `SELECT * FROM Orders;`
	- `SELECT * FROM Inventory;`
