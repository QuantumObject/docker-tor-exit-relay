#!/bin/bash
#this for reference only to create the backup scrips for each container ... the idea to use the same command for each container
#each container will have their own custum backup scritp for it ... 

#Backup important file ... of the configuration ...
cp  /etc/hosts  /var/backups/
# use to backup tor private key in case you need to move or restored yout tor relay
cp /var/lib/tor/keys/secret_id_key /secret_id_key
