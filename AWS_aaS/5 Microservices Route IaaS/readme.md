
### 5. Setting up the Microservices Server - Route Requests Logic

1. Use the same `LAMP Server Image` AMI to create the new instance.
2. Right click on the AMI and select `Launch Instance from AMI`
	- Name - `5 Microservices Route IaaS`
	- Select the key pair `aws-<unityID>.pem` that you have access to.
	- Select an existing security group `HTTP SSH MYSQL`.
	- Launch Instance
3. Once the app server instance is up and running, you can connect to this instance using SSH from your terminal/command prompt by following step 11.   
	- Make sure to use the correct Public IPv4 address from the monolithic server instance.  
4. By default, there might be `products.php` and `products.js` on the `/var/www/html` directory. You can reuse the `products.js` file or you can delete them using `rm` command.
	- `sudo rm products.php` 
	- (optional) `sudo rm products.js`
5. From this repo, copy the two scripts: `products.php` and `products.js` to the location `/var/www/html/` at the web server instance you created above. Now, you can send HTTP requests to `products.php` at over the Internet.  
6. Make the following modifications in products.php:  
	- The route request server basically determines the type of request and route it to either the display server or buy server. 
	- `$displayProductsMicroService = "<display-server-IPv4-address>";`
	- `$buyProductsMicroService = "<buy-server-IPv4-address>";`


### Test the microservices webstore
1. Make sure the following 4 instances are started and running: `1 DB IaaS` and `3 Microservices Display IaaS`, `4 Microservices Buy IaaS`, and `5 Microservices Route IaaS`.  
2. Open a web browser, and enter the URL \<5-route-server-IP>/products.php to send an HTTP GET request to products.php.   
   - `http://55.66.77.88/products.php`  
3. Verify that the list of products are displayed correctly.  
4. Buy some products from the webstore  
5. Verify that the item quantities are updated correctly in the database by logging into phpMyAdmin from the database server instance.  Alternatively, you can also check this using the command line.

