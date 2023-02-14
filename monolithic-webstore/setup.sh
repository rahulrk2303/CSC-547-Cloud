sudo apt-get update
sudo apt install apache2
sudo apt install libapache2-mod-php
sudo apt install php php-zip php-json php-mbstring php-mysql 
# Verify: sudo systemctl status apache2
sudo apt install mysql-server
sudo apt install unzip
sudo apt install php-xml
sudo apt install wget 
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.zip
unzip phpMyAdmin-5.1.1-all-languages.zip
sudo mv phpMyAdmin-5.1.1-all-languages /usr/share/phpmyadmin
sudo mkdir /usr/share/phpmyadmin/tmp
sudo chown -R www-data:www-data /usr/share/phpmyadmin
sudo chmod 777 /usr/share/phpmyadmin/tmp
sudo cp phpmyadmin.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo systemctl reload apache2
sudo apt install firefox
sudo cp products.php /var/www/html/products.php
sudo cp products.js /var/www/html/products.js