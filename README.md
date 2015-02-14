# LAMP

Debian Gnu/**L**inux
**A**pache 2
**M**ariaDB
**P**HP 5

## Start :

No more, no less :
`docker run -d adminrezo/lamp`

## MariaDB password

The default MariaDB root password is the marvellous 'MariaDBIsGoodForYou!'.
`docker run -d adminrezo/lamp`

You can change it if you don't like this one :
`docker run -e "mariapw=AsTrOnGpAsSwOrD" -d adminrezo/lamp`
