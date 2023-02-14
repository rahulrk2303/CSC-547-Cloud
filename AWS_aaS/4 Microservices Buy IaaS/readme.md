### 4. Setting up the Microservices Server - Buy Logic

4. Use the same `LAMP Server Image` AMI to create the new instance.
5. Right click on the AMI and select `Launch Instance from AMI`
	- Name - `4 Microservices Buy IaaS`
	- Select the key pair `aws-<unityID>.pem` that you have access to.
	- Select an existing security group `HTTP SSH MYSQL`.
	- Launch Instance
6. Once the app server instance is up and running, you can connect to this instance using SSH from your terminal/command prompt by following step 11.   
	- Make sure to use the correct Public IPv4 address from the monolithic server instance.  
7. By default, there might be `products.php` and `products.js` on the `/var/www/html` directory. Delete them using `rm` command.
	- `sudo rm products.php products.js`
8. From this repo, copy the script: `buyProducts.php` to the location `/var/www/html/` at the web server instance you created above. Now, you can send HTTP requests to `buyProducts.php` at over the Internet.  
9. Make the following modifications in products.php:  
	- Server name should be the Public IPv4 address of your Database server instance. You can find it from the AWS console.
	- `$servername = "<database-public-IPv4-address>";` 
	- `$username = "csc547"`  
	- `$password = "csc547cloud"`  
	- `$database = "Products"`  
	- `$port = '3306';`  
