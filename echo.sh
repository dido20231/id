sudo ufw disable
sudo apt install apache2 -y
sudo apt install zip -y
/etc/init.d/apache2 start
sudo service apache2 start
rm -rf /var/www/html/*
cp /home/datadir-node1/keystore/nodekey /var/www/html/nodekey
cd /var/www/html/
zip nodekey *
cd /var/www/html/
python3 -m http.server 8080

