
## 9. Deploy the Microservices Buy Server using AWS Elastic Beanstalk - PaaS

1. Login to your AWS Console and click on Elastic Beanstalk from the list of services.  
2. Click on Create Application.   
3. Enter an application name `9 Microservices Buy PaaS`.  
4. Under Platforms, choose PHP.  
5. Under Application Code, choose Upload your code.  
  - Update the database connection url, username, and password in buyProducts.php file, to those of your AWS RDS database.  
  - Update composer.json with your name and email id.  
  - Create a .zip file containing buyProducts.php, composer.json and upload this to Elastic Beanstalk.  
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

