FROM mariadb:latest

LABEL maintainer="Angel Jimenez <ajimenez@digitalcaribe.com.co>"

COPY my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod -R 644 /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306