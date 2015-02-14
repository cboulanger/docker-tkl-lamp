passwd=$(pwgen 8 1)
echo "Nouveau mot de passe : $passwd"
sleep 10
mysql -uroot -e "UPDATE user SET password=PASSWORD('$passwd') WHERE user='root';flush privileges;" mysql
supervisord -n
