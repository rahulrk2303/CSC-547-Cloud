
## 7. Deploy the Application Server using AWS Elastic Beanstalk - PaaS

1. Login to your AWS Console and click on Elastic Beanstalk from the list of services.  
2. Click on Create Application.   
3. Enter an application name `7 Monolithic Products PaaS`.  
4. Under Platforms, choose PHP.  
5. Under Application Code, choose Upload your code.  
  - Update the database connection url, username, and password in products.php file, to those of your AWS RDS database.  
  - Update composer.json with your name and email id.  
  - Create a .zip file containing products.php, products.js, composer.json, inedx.php and upload this to Elastic Beanstalk.  
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

## Test the Web Store

1. Navigate to the web store url
2. Verify that the products are displayed correctly.  
3. Update the count of the products, enter your email id (can be fictitious), and click on Buy.  
4. View the data in the Orders table, using dBeaver, to confirm that orders were logged.  
5. You can also verify that the corresponding item counts were reduced in the Inventory table.
