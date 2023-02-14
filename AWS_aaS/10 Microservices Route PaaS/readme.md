
## 10. Deploy the Microservices Route Server using AWS Elastic Beanstalk - PaaS

1. Login to your AWS Console and click on Elastic Beanstalk from the list of services.  
2. Click on Create Application.   
3. Enter an application name `10 Microservices Route PaaS`.  
4. Under Platforms, choose PHP.  
5. Under Application Code, choose Upload your code.  
  - Make the following modifications in products.php:  
    - The route request server basically determines the type of request and route it to either the display server or buy server. 
    - `$displayProductsMicroService = "<8-elastic-beanstalk-display-server-IP>";`
    - `$buyProductsMicroService = "<9-elastic-beanstalk-buy-server-IP>";`
  - Update composer.json with your name and email id.  
  - Create a .zip file containing products.php, products.js, index.php, composer.json and upload this to Elastic Beanstalk.  
6. Click on Configure more options button.
7. Edit Instances and check the security group `HTTP SSH SQL`. Save.
8. Edit Security
	- Service role - `Lab role`
	- EC2 key pair - `<aws-unityId>`
	- IAM Instance profile - `LabInstanceProfile`
	- Save.
9. Create app. AWS will take a few minutes to upload the code and deploy the App server.  
10. Once AWS has deployed the app, note down its url.
11. From the side bar on the left, select your application name. 
12. Open the URL provided and test the web store.
13. Note - If you want to make some changes to the application code, you have to edit it locally and upload the .zip file again as a new version of the application.
  - Try connecting to the `1 DB IaaS` database server instead of RDS.

### Test the microservices webstore
1. Make sure the following 4 instances are started and running: `DB-PaaS` (RDS), `8 Microservices Display PaaS`, `8 Microservices Buy PaaS`, and `10 Microservices Route PaaS`.  
2. Open a web browser, and enter the URL \<10-elastic-beanstalk-route-server-IP>/products.php to send an HTTP GET request to products.php.   
   - `http://<app-environment-name>.us-east-1.elasticbeanstalk.com/products.php`  
3. Verify that the list of products are displayed correctly.  
4. Buy some products from the webstore  
5. Verify that the item quantities are updated correctly in the database by logging into phpMyAdmin from the database server instance.  Alternatively, you can also check this using the command line.
