# lamp (where M means Maria)
# Pour Debian Wheezy
#
# VERSION               140215
#


FROM     debian:latest
MAINTAINER Nico Dewaele "nico@adminrezo.fr"

ENV DEBIAN_FRONTEND noninteractive

# Repos, upgrades, installs Apache/PHP5

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
RUN apt-get update && apt-get install -y -q pwgen inotify-tools python-software-properties apache2 libapache2-mod-php5 php5-cli php5-mysql supervisor


# Install MariaDB & Adminer

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirror6.layerjet.com/mariadb/repo/10.0/debian wheezy main'
RUN apt-get update && apt-get install -y mariadb-server mariadb-common adminer

# Apache config

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ADD security /etc/apache2/conf.d/security
ADD ssl.conf /etc/apache2/mods-available/ssl.conf


# PHP info

ADD info.php /var/www/info.php
ADD index.html /var/www/index.html
RUN chown www-data.www-data -R /var/www/


# Starting services

RUN mkdir -p /var/log/supervisor
ADD supervisor-lamp.conf /etc/supervisor/conf.d/supervisor-lamp.conf
ADD start.sh /start.sh
EXPOSE 443 80
CMD ["/start.sh"]
