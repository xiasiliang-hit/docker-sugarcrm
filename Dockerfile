FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql
RUN easy_install supervisor

ADD ./app.sh /app.sh
ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
RUN chmod 755 /start.sh
RUN chmod 755 /app.sh
RUN chmod 755 /etc/apache2/foreground.sh
RUN bash /app.sh

EXPOSE 80

CMD ["/bin/bash", "/start.sh"]
