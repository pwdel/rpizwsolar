#!/bin/bash


# need to add another user to work with this, as well as a different password to obscure ngrok capability!

# ---------- Setting Up Folder Structure ----------
# create our structure, folder and set PATH
# make a /home/bin directory for infrequently changed home binaries and executables
sudo mkdir /home/bin
# make a /home/app directory for any applications
sudo mkdir /home/app


# ---------- Setting PATH Variable ----------
# set path variable to include /home/app and /home/bin, as well as put within bash profile.
# PATH = /home/app:/home/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games
# export /home/app:/home/bin into default $ PATH
sudo echo export PATH="/home/app:/home/bin/:$PATH" >> ~/.bashrc
# restart and source bash profile. We have to use interactive mode to run this command because /.bashrc in raspbian has a conditional
# which explicitly stops processing if the shell is found to be non-interactive.
# https://stackoverflow.com/questions/43659084/source-bashrc-in-a-script-not-working 

. ~/.bashrc

# otherwise the following has to be appended to ~/.bashrc
# load user specific BASH configuration files
# if [ -f $HOME/.bash_profile ]; then
#   . $HOME/.bash_profile
# fi
# see https://raspberrypi.stackexchange.com/questions/59048/raspberry-pi-not-loading-bashrc


# ---------- Setting Up Environment ----------
# read environmental variable file for ngrok
# note - in future, we should put this into a /home/source/rpizwsolar folder as our official git read source
# cd /home/pi/Projects/rpizwsolar
# while loop to read .env file and export


# ---------- Installing ngrok to Desired Location ----------
# install ngrok to /home/bin
# Update 
sudo apt-get update -y && sudo apt-get upgrade -y
# go to tmp folder
cd /tmp/
# download ngrok zip file for arm version 
sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
# unzip file
sudo unzip ngrok-stable-linux-arm.zip
# move ngrok to /home/bin. Note, ~/ is root, which is set to /home/pi
sudo mv /tmp/ngrok /home/bin/ngrok
# delete ngrok zip file
sudo rm /tmp/ngrok-stable-linux-arm.zip

# -----> Set ngrok settings

# export NGROK_AUTHTOKEN included above
# alternatively, putting everything into ngrok.yml
# ngrok.yml sits in same folder parallel to ngrok
# authtoken:
# log: /var/log/ngrok.log
# etc
# run ngrok authtoken $NGROK_AUTHTOKEN after exported


# ---------- Ngrok System Control Commands ----------

# start on startup

# sudo systemctl daemon-reload

# sudo systemctl enable ngrok

# sudo systemctl start ngrok

# sudo systemctl enable ssh

# sudo systemctl start sshd

# call ngrok keepalive script
