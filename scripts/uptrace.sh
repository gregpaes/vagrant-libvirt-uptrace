#!/bin/bash
#
# Setup for Uptrace

cd /tmp/
wget https://github.com/uptrace/uptrace/releases/download/v1.6.1/uptrace_1.6.1_amd64.deb
dpkg -i uptrace_1.6.1_amd64.deb

systemctl enable uptrace

systemctl start uptrace
systemctl status uptrace