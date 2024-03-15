#!/bin/bash

apt update && apt upgrade;
apt install apache2 mariadb-server php  php-xml php-common php-json php-mysql php-mbstring php-curl php-gd php-intl php-zip php-bz2 php-imap php-apcu -y;
apt install php-ldap -y;
cd /tmp;
wget https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz;
tar -xzvf glpi-10.0.10.tgz -C /var/www/html;
chown www-data:www-data /var/www/html/ -R;
chmod 755 -R /var/www/html;
mysql -u root --password=root -Bse "CREATE DATABASE glpibdd";
mysql -u root --password=root -Bse "GRANT ALL PRIVILEGES ON glpibdd.* TO glpiuser@localhost IDENTIFIED BY \"glpipass\"";
mysql -u root --password=root -Bse "FLUSH PRIVILEGES";
mysql -u root --password=root -Bse "EXIT";
echo "#### INFORMATIONS DE LA BASE DE DONNEES GLPI####";
echo "##                                            ##";
echo "##  NOM DE LA BASE :   glpibdd                ##";
echo "##  UTILISATEUR :      glpiuser               ##";
echo "##  MOT DE PASSE :     glpipass               ##";
echo "##                                            ##";
echo "################################################";
sleep 5;
systemctl reload apache2;