FROM  nextcloud:latest

LABEL maintainer="Angel Jimenez <ajimenez@digitalcaribe.com.co>"

RUN usermod -u 1000 www-data && \
    groupmod -g 1000 www-data

RUN curl -sS https://getcomposer.org/installer |php && \
	mv composer.phar /usr/local/bin/composer && \ 
	docker-php-ext-install sockets && \
	apt update && \
	apt install git git-flow -y

RUN apt install cron -y

COPY occ.cron /etc/cron.d/occ-cron

RUN chmod 0644 /etc/cron.d/occ-cron

RUN crontab /etc/cron.d/occ-cron

CMD cron