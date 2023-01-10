#!/bin/sh

# install python, git
sudo apt-get update
sudo apt-get install python3-pip git -y

# setup venv
sudo apt install python3.8-venv
python3 -m venv venv
source ~/venv/bin/activate

# install database
sudo apt-get install postgresql -y
sudo apt-get install libpq-dev python-dev-y
sudo pip install psycopg2 -y

# setup database
sudo -u postgres psql -c "CREATE DATABASE django_db;"
sudo -u postgres psql -c "ALTER user postgres password 'postgres';"

# add database environment variables
echo 'export DATABASE_URL=postgres://postgres:postgres@localhost/django_db' >> ~/.bashrc
echo 'export REDIS_URL=redis://localhost:6379' >> ~/.bashrc

# add otree environment variables
echo 'export OTREE_ADMIN_PASSWORD=my_password' >> ~/.bashrc
echo 'export OTREE_PRODUCTION=1' >> ~/.bashrc
echo 'export OTREE_AUTH_LEVEL=DEMO' >> ~/.bashrc
