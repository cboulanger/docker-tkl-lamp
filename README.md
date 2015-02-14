# LAMP

Debian Gnu/**L**inux
**A**pache 2
**M**ariaDB
**P**HP 5

## Start :

No more, no less :
`docker run -d adminrezo/lamp`

## MariaDB password

Maybe you should change MariaDB root password :

```
`docker run -e "mpwd=AsTrOnGpAsSwOrD" -d adminrezo/lamp`
passwd=`pwgen 8 1` && echo "Nouveau mot de passe : $passwd"
mysql -uroot -e "UPDATE user SET password=PASSWORD('$passwd') WHERE user='root';flush privileges;" mysql
```
