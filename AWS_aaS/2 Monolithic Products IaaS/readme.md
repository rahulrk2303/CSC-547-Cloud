### 2. Setting up the Monolithic Server

The App server will be used to read/write from the database server for viewing the products and making purchases. The app server requires Linux, Apache, MySQL, and PHP. The only difference is that phpMyAdmin is not required as we will not host any database in this server. 

1. Create a new AWS EC2 Instance called `2 Monolithic Products IaaS` by following the database server steps [1 to 27](https://github.ncsu.edu/rrangar/AWS_aaS/tree/main/1%20DB%20IaaS#part-1---setting-up-the-database-server) again.  
2. Once the app server instance is up and running, you can connect to this instance using SSH from your terminal/command prompt by following step 11.   
	- Make sure to use the correct Public IPv4 DNS from the monolithic server instance.  
3. From this repo, copy the twwo scripts: `products.php`, `products.js` to the location `/var/www/html/` at the web server instance you created above. Now, you can send HTTP requests to `products.php` at over the Internet.  
4. Make the following modifications in products.php:  
	- Server name should be the Public IPv4 address of your Database server instance. You can find it from the AWS console.
	- `$servername = "<database-public-IPv4-address>";` 
	- `$username = "csc547"`  
	- `$password = "csc547cloud"`  
	- `$database = "Products"`  
	- `$port = '3306';`  
   
### Test the monolithic webstore

1. Make sure both the `1 DB IaaS` and `2 Monolithic Products IaaS` instances are started and running.  
2. Open a web browser, and enter the URL \<app-public-IP>/products.php to send an HTTP GET request to products.php.   
   - `http://55.66.77.88/products.php`  
3. Verify that the list of products are displayed correctly.  
4. Buy some products from the webstore  
5. Verify that the item quantities are updated correctly in the database by logging into phpMyAdmin from the database server instance.  Alternatively, you can also check this using the command line.
