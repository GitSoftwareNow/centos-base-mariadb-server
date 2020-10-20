#
# MariaDB Dockerfile
#
# https://github.com/dockerfile/mariadb
#

# Pull base image.
FROM centos:8


ENV MARIADB_MAJOR 10.5
ENV MARIADB_VERSION 10.5.6
ENV MYSQL_ROOT_PASSWORD mysecretpassword
ENV MYSQL_DATADIR /var/lib/mysql

# Install build tools
COPY Mariadb.repo /etc/yum.repos.d

RUN \
  dnf update -y && \
  dnf install mariadb-server -y && \
  dnf clean all

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /

# Define default command.
CMD ["mysqld_safe"]

# Expose ports.
EXPOSE 3306
