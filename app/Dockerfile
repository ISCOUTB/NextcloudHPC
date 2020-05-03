FROM  nextcloud:latest

LABEL maintainer="Angel Jimenez <ajimenez@digitalcaribe.com.co>"

RUN usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

RUN curl -sS https://getcomposer.org/installer |php && \
	mv composer.phar /usr/local/bin/composer && \ 
	docker-php-ext-install sockets && \
	apt-get update && \
	apt-get install git git-flow -y

RUN apt-get install cron nano -y