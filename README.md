# docker-tor-exit-relay

Docker container for [Tor Exit Relay][3]

"Tor is free software and an open network that helps you defend against traffic analysis, a form of network surveillance that threatens personal freedom and privacy, confidential business activities and relationships, and state security."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 18.04 use the commands:

    sudo apt-get update
    sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    docker run -d -p 22 -p 80:80 -p 9050:9050 -p 9001:9001 -e Nickname=TorRelayNickName --name tor_exit_relay quantumobject/docker-tor-exit-relay

where Nickname vaule will appear in Relays publish server descriptors.

This container will generate dsa key for ssh the first time it is run , you need to add the private key to your  ~/.ssh/id_dsa to be able to ssh this container. You be able to check this dsa key with command :

    docker logs container-id

To access it and configured and used the container :

    docker exec -it container-id /bin/bash

Them you can use it by torify command

    torify ssh destination
    
To check if tor working correctly :

    torify lynx https://check.torproject.org/
  
To use ssh anonymous please read about limitation and security at [www.torproject.org][1]

You can create a new container everytime you need to use it and remove it when done with it but this is bad idea if you want to keep a stable exit relay. 

I added the  Reduced Exit Policy to the configuration to make sure to drastically reduces the odds that a bittorrent user will select your node and it will reduce the risk of getting DMCA takedowns.

Note: because you use it don't mean you are complete anonymous , please read about Tor at [www.torproject.org][1] before using it. This suppose to work like relay and it will use 80k/100k of your network bandwidth. 

## More Info

About Tor : [www.torproject.org][1]

To help improve this container [docker-tor-exit-relay][5]

[FAQ about Tor][6]

[Tor Exit Guidelines][7]

For additional info about us and our projects check our site [www.quantumobject.org][8]

[1]:https://www.torproject.org
[2]:https://www.docker.com
[3]:https://trac.torproject.org/projects/tor/wiki/TorRelayGuide
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-tor-exit-relay
[6]:https://www.torproject.org/docs/faq.html.en
[7]:https://trac.torproject.org/projects/tor/wiki//doc/TorExitGuidelines
[8]:https://www.quantumobject.org/
