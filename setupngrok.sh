#!/bin/bash


# need to add another user to work with this, as well as a different password to obscure ngrok capability!


# install ngrok with appropriate link to ARM version


# unzip to folder within designated path


set PATH variable

/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

# ensure Ngrok is in one of the folders in path


# read environmental variable file for ngrok

# export the environmental variable for ngrok

export NGROK_AUTHTOKEN

# alternatively, putting everything into ngrok.yml
# ngrok.yml sits in same folder parallel to ngrok
# authtoken:
# log: /var/log/ngrok.log
# etc



# run ngrok authtoken $NGROK_AUTHTOKEN after exported


# start on startup

sudo systemctl daemon-reload

sudo systemctl enable ngrok

sudo systemctl start ngrok

sudo systemctl enable ssh

sudo systemctl start sshd


./ngrok tcp 22


# on the login side, need to 
