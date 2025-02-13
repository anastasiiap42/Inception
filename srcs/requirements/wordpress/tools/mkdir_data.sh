#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
        mkdir ~/data/certs
        cd ~/data/certs
        mkcert apashkov.42.fr
        mv apashkov.42.fr-key.pem apashkov.42.fr.key
        mv apashkov.42.fr.pem apashkov.42.fr.crt
fi