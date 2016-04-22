#!/bin/sh

exec /chpst -u root usr/sbin/sshd -D 2>&1
