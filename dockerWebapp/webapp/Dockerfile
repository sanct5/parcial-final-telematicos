FROM ubuntu/apache2

WORKDIR /webapp
COPY . .
RUN echo "installing python3 and pip3"
RUN apt update
RUN apt install openssl -y
RUN apt install python3-dev default-libmysqlclient-dev build-essential pkg-config mysql-client python3-pip -y
RUN pip3 install Flask==2.3.3 flask-cors Flask-MySQLdb Flask-SQLAlchemy --break-system-packages
RUN echo "installing webapp on apache2 with ssl"
RUN cp -r . /var/www/webapp
RUN cp apache-selfsigned.crt /etc/ssl/certs
RUN cp apache-selfsigned.key /etc/ssl/private
RUN cp apache2.conf /etc/apache2
RUN cp 000-default.conf /etc/apache2/sites-available
RUN apt install libapache2-mod-wsgi-py3 -y
RUN a2enmod ssl
RUN a2enmod wsgi
RUN a2enmod rewrite
RUN cd /etc/apache2/sites-available
RUN a2ensite 000-default.conf
CMD ["apachectl", "-D", "FOREGROUND"]