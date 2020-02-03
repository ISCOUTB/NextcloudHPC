FROM  nextcloud:latest

LABEL maintainer="Angel Jimenez <ajimenez@digitalcaribe.com.co>"

RUN curl -sS https://getcomposer.org/installer |php && \
	mv composer.phar /usr/local/bin/composer && \ 
	docker-php-ext-install sockets && \
	apt update && \
	apt install git git-flow -y