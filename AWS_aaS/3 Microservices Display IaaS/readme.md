### 3. Setting up the Microservices Server - Display Logic

The infrastructure and environment for the monolithic application and the microservices are the same. So, we can make use of the AMIs (Amazon Machine Images) to save the configurations of an instance and launch multiple instances easily.

1. Go to EC2 Instances page on AWS. 
2. Right click on  `2 Monolithic Products IaaS` instance and select `Image and templates` --> `Create Image`.
	- Image name - `LAMP Server Image`
	- Create Image
3. Wait for a couple of minutes while it saves the instance as an image. You can check the status under AMIs in AWS. 
4. Once the AMI becomes available, right click on the AMI and select `Launch Instance from AMI`
	- Name - `3 Microservices Display IaaS`
	- Select the key pair `aws-<unityID>.pem` that you have access to.
	- Select an existing security group `HTTP SSH MYSQL`.
	- Launch Instance
5. Once the app server instance is up and running, you can connect to this instance using SSH from your terminal/command prompt by following step 11.   
	- Make sure to use the correct Public IPv4 address from the monolithic server instance.  
6. By default, there might be `products.php` and `products.js` on the `/var/www/html` directory. Delete them using `rm` command.
	- `sudo rm products.php products.js`
8. From this repo, copy the script: `displayProducts.php` to the location `/var/www/html/` at the web server instance you created above. Now, you can send HTTP requests to `displayProducts.php` at over the Internet.  
9. Make the following modifications in products.php:  
	- Server name should be the Public IPv4 address of your Database server instance. You can find it from the AWS console.
	- `$servername = "<database-public-IPv4-address>";` 
	- `$username = "csc547"`  
	- `$password = "csc547cloud"`  
	- `$database = "Products"`  
	- `$port = '3306';`  
