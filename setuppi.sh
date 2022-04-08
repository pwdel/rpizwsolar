#!/usr/bin/env bash

# exit the script if nonzero status
set -e

echo "Running automated raspi-config tasks"

#  ---------------- install python3 setuptools --------------------

sudo apt update
sudo apt install python3-setuptools

# install pip
sudo apt install python3-pip

#  ---------------- install python3 setuptools --------------------

sudo pip3 install python-daemon

# ---------------- install pigpiod --------------------------------

wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
make
sudo make install

# ---------------- install psycopg2 --------------------------------

sudo pip3 install psycopg2
# install libpq5 to solve dependency problems
sudo apt install libpq5 --fix-missing


<<<<<<< HEAD
# ---------------- install cron, pcregrep, systemctl  --------------------------------
=======
# ---------------- install  --------------------------------


>>>>>>> be9bb0d8be93593ecbb8fcb488cf8cd3ba950e7f

apt-get install -y cron

apt-get install -y pcregrep
<<<<<<< HEAD
=======

apt-get install -y systemctl
>>>>>>> be9bb0d8be93593ecbb8fcb488cf8cd3ba950e7f
