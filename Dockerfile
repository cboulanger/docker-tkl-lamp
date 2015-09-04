# A LAMP image based on Turnkeylinux
# forked from adminrezo/docker-lamp

FROM turnkeylinux/lamp-13.0
MAINTAINER Christian Boulanger "info@bibliograph.org"

ENV DEBIAN_FRONTEND noninteractive

# Repos, upgrades, installs Apache/PHP5, Maria

RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)

# Apache config is handled by TKL

# Starting services

RUN mkdir -p /var/log/supervisor
ADD supervisor-lamp.conf /etc/supervisor/conf.d/supervisor-lamp.conf
ADD start.sh /start.sh
EXPOSE 443 80
CMD ["/start.sh"]
