#!/bin/bash
#
# Setup for PostgreSQL


# Create the file repository configuration:
cd /tmp
wget https://deb.debian.org/debian/pool/main/p/postgresql-common/postgresql-common_248_all.deb
wget https://ftp.debian.org/debian/pool/main/libj/libjson-perl/libjson-perl_4.10000-1_all.deb
wget https://deb.debian.org/debian/pool/main/p/postgresql-common/postgresql-client-common_248_all.deb
dpkg -i libjson-perl_4.10000-1_all.deb postgresql-common_248_all.deb postgresql-client-common_248_all.deb
 
curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Update the package lists:
apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
apt-get -y install postgresql-15

systemctl enable postgresql
systemctl start postgresql
systemctl status postgresql
