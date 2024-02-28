#!/bin/bash
#
# Setup for ClickHouse DB

groupadd -r clickhouse
useradd -r --shell /bin/false --home-dir /nonexistent -g clickhouse clickhouse

groupadd -r clickhouse-bridge
useradd -r --shell /bin/false --home-dir /nonexistent -g clickhouse-bridge clickhouse-bridge

# Install ClickHouse server and client

cd /tmp
wget https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-client_23.6.2.18_amd64.deb
wget https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-server_23.6.2.18_amd64.deb
wget https://packages.clickhouse.com/deb/pool/main/c/clickhouse/clickhouse-common-static_23.6.2.18_amd64.deb

dpkg -i clickhouse-server_23.6.2.18_amd64.deb clickhouse-client_23.6.2.18_amd64.deb clickhouse-common-static_23.6.2.18_amd64.deb

systemctl enable clickhouse-server
systemctl start clickhouse-server
systemctl status clickhouse-server

# create uptrace database
clickhouse-client -q "CREATE DATABASE uptrace"