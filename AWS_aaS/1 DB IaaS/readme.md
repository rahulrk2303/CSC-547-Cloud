### Part 1 - Setting up the Database Server


 1. Log in to your AWS account. Go to AWS Services and select EC2  
 2. Click Launch Instances  
 3. Name - `1 DB IaaS`  
 4. Application and OS Images - Amazon Linux (AWS) 
	 - AMI - Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type (Free tier eligible)  
     - Architecture - 64 bit (x86)  
 5. Instance type - t2.micro  
6. Key pair (login) - If you already have access to your .pem file, use the same. Otherwise, create new key pair  
     - Key pair name - `aws-<unityID>`  
     - Key pair type - RSA  
     - Private key file format - .pem  
     - Click Create Key pair and save it in your computer. Remember this .pem file's location as it will be required to SSH into the instance later. Do not lose this key pair file.  
7. Network settings  
     - Check Allow SSH traffic from Anywhere (0.0.0.0/0)  
     - Check Allow HTTP traffic from the internet (anywhere)  
     - Click Edit. Click "Add security group rule" add a new rule to accept connections of Type "MYSQL/Aurora" and source type "Anywhere".  
     - Add a Security Group Name and Description. 
	     - Name - `HTTP SSH MYSQL Security Group`
	     - Description - `Allows HTTP, SSH and MySQL requests from anywhere`
8. Leave other options to default settings.  
9. Click Launch Instance button. It will take a few minutes to launch the instance.   
10. Once it is successfully launched, you can see the Instance state as "Running" in the Instances page.  
11. SSH into the created instance:  
	- Find the path to your key pair file (.pem) that you downloaded.  
    - Find the `Public IPv4 address` of your instance from AWS console.  
    - In your computer, open command prompt or terminal and change directory to the key pair's location.  
    - To set permissions of your private key, enter the following command:  
          `chmod 400 <unityID>.pem`  
    - Use the following command in your terminal to connect to your instance.  
          `ssh -i /path/my-key-paip.pem my-instance-user-name@my-instance-public-IPv4-address`  
    - For example:  
          `ssh -i /Downloads/aws-csc547.pem ec2-user@55.66.77.88`
     - Type "yes" to continue connecting.  
     - Now, you are connected to your AWS instance from your terminal.  
12. To update all software packages, enter the following command:  
     - `sudo yum update -y`  
13. Install the lamp-mariadb10.2-php7.2 and php7.2 Amazon Linux Extras repositories to get the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2.  
     - `sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2`   
14. Install the Apache web server, MariaDB, and PHP software packages.  
     - `sudo yum install -y httpd mariadb-server`   
15. Start the Apache web server.  
     - `sudo systemctl start httpd`  
16. Use the systemctl command to configure the Apache web server to start at each system boot.  
     - `sudo systemctl enable httpd`  
17. Test your web server. Open a browser and go to the public DNS address (or the public IP address) of your instance.   
     - You should see a "Test Page" with APACHE logo.  
18. To allow the `ec2-user` to manipulate files in the `/var/www/html` directory, you should add `ec2-user` to the `apache` group.  
     - `sudo usermod -a -G apache ec2-user`  
19. Log out (use the exit command or close the terminal window)  
     - `exit`   
20. Log back in using the ssh command.
     - `ssh -i /path/my-key-paip.pem my-instance-user-name@my-instance-public-IPv4-address`  
21. To verify your membership in the apache group, reconnect to your instance, and then run the following command:  
     - `groups`  
     - Output should be `ec2-user adm wheel apache systemd-journal`  
22. Change the group ownership of /var/www and its contents to the apache group.  
     - `sudo chown -R ec2-user:apache /var/www`  
23. Add group write permissions and set the group ID.  
     - `sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;`  
     - `find /var/www -type f -exec sudo chmod 0664 {} \;`  
24. Once you have the required permissions, you can now create a PHP file in the /var/html/www directory.  
     - `echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php`  
25. To test the LAMP server, open a browser and enter the URL:  
     - `http://my.public.dns.amazonaws.com/phpinfo.php`  
     - For example,  
       `ec2-99-99-99-99.compute-1.amazonaws.com/phpinfo.php`  
     - You should see the PHP information page with PHP version and other details.  
26. Delete the phpinfo.php file.  
     - `rm /var/www/html/phpinfo.php`  
27. You have successfully setup a fully functional LAMP web server.  
28. Start the MariaDB server.  
     - `sudo systemctl start mariadb`  
29. Run mysql_secure_installation to secure the database server.  
     - `sudo mysql_secure_installation`  
30. When prompted, type a password for the root account.  
     - Type the current root password. By default, the root account does not have a password set. Press Enter.  
     - Type Y to set a password (say `1234`), and type a secure password twice.   
     - Type Y to remove the anonymous user accounts.- Type Y to disable the remote root login.  
     - Type Y to remove the test database. 
     - Type Y to reload the privilege tables and save your changes.  
31. Configure MariaDB server to start at every boot.  
     - `sudo systemctl enable mariadb`  
32. Install the required dependencies for phpMyAdmin.  
     - `sudo yum install php-mbstring php-xml -y`  
33. Restart Apache.  
     - `sudo systemctl restart httpd`  
34. Restart php-fpm.  
     - `sudo systemctl restart php-fpm`  
35. Navigate to the Apache document root at /var/www/html.  
     - `cd /var/www/html`  
36. Use wget to download phpMyAdmin release directly to your instance.  
     - `wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz`  
37. Create a `phpMyAdmin` folder and extract the downloaded package.  
     - `mkdir phpmyadmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpmyadmin --strip-components 1`  
38. Remove the downloaded tar file.  
     - `rm phpMyAdmin-latest-all-languages.tar.gz`  
39. If the MySQL server is not running, start it now.  
     - `sudo systemctl start mariadb`  
40. To open phpMyAdmin, open a browser and enter the URL:  
     - `ec2-99-99-99-99.compute-1.amazonaws.com/phpmyadmin`  
     - You should see the phpMyAdmin login page.  
41. Log into phpMyAdmin using the username `root` and password `1234` (or whatever password you set before)  
42. In phpMyAdmin, go to User accounts and create a new User account.   
     - Name - `csc547`   
     - Host  name - `%` (Any host)   
     - Password - `csc547cloud`   
     - Global privileges - `Check all`   
     - Click `Go`    
43. Creating Database and Tables using CLI   
      - In the `1 DB IaaS` terminal, run `mysql -u csc547 -p` and type password `csc547cloud`.    
      - You can find the required SQL commands [here](https://github.ncsu.edu/rrangar/AWS_aaS/blob/2d6e80e9f8a74ddda95f904c19bab513a37cb462/1%20DB%20IaaS/DatabaseSetup.sql). 
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
44. You can check the tables using phpMyAdmin.
