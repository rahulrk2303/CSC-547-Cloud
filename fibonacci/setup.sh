sudo yum install git -y
sudo yum remove httpd httpd-tools
sudo yum install -y httpd24 php72
sudo service httpd start
