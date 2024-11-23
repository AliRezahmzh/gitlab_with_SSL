#!/bin/bash


certbot renew --quiet


cp /etc/letsencrypt/live/git.bahamtech.com/fullchain.pem /srv/gitlab/ssl/git.bahamtech.com.crt
cp /etc/letsencrypt/live/git.bahamtech.com/privkey.pem /srv/gitlab/ssl/git.bahamtech.com.key
chmod 600 /srv/gitlab/ssl/*


docker restart $(docker ps -q --filter "name=gitlab")
