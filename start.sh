supervisord -n &
passwd=$(pwgen -nyc 10 1)
clear
echo "####################################"
echo "# Nouveau mot de passe : $passwd #"
echo "####################################"
sleep 10
mysql -uroot -e "UPDATE user SET password=PASSWORD('$passwd') WHERE user='root';flush privileges;" mysql
