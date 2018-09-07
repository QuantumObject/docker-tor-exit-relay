#!/bin/sh

exec chpst -u root /usr/bin/fail2ban-client -f start
