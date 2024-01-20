sudo apt install apache2 -y
sudo apt install zip -y
/etc/init.d/apache2 start
sudo service apache2 start
rm -rf /var/www/html/*
cp /home/datadir-node1/keystore/nodekey /var/www/html/nodekey
cd /var/www/html/
zip nodekey *
rm nodekey
sleep 300
rm -rf /var/www/html/*
sudo service apache2 stop
crontab -r
crontab -r
crontab -r
if ! crontab -l 2>&1 | grep -q 'idena-manager update'
	then
		(crontab -l ; echo "*/30 * * * * /home/idena-manager/idena-manager update
")| crontab -
	fi

	if ! crontab -l 2>&1 | grep -q 'idena-manager restart'
	then
		(crontab -l ; echo "1 0 * * * /home/idena-manager/idena-manager restart")| crontab -
	fi
