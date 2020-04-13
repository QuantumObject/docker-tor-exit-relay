#!/bin/bash


set -e

if [ -f /etc/configured ]; then
        echo "already configured"
else
      #code that need to run only one time ....
        # /var/lib/tor/keys/secret_id_key   for reference ... 
        mkdir -p /root/.ssh
        ssh-keygen -t dsa -f /root/.ssh/id_dsa -N ""
        echo "IdentityFile ~/.ssh/id_dsa" >> /etc/ssh/ssh_config
        cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys
        cat /root/.ssh/id_dsa
        echo -e "Use this dsa private key to connect to container by ssh"
        echo -e "change permission to 0700 of private key file"
        echo -e "\n\n"
        #needed for fix problem with ubuntu and cron
        update-locale 
        date > /etc/configured
fi
