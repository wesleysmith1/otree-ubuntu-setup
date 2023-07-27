# otree-ubuntu-setup

### Note
Intended for ubuntu version 20.04

### Install
```
sudo apt-get update
sudo apt-get install python3-pip git
```

### Create and activate virtualenv
```
sudo apt install python3.8-venv
python3 -m venv venv
source ~/venv/bin/activate
```

### install database stuff
```
sudo apt-get install postgresql
sudo apt-get install libpq-dev python-dev
sudo pip install psycopg2
```

### create db
```
sudo su - postgres
  psql
    CREATE DATABASE django_db;
    alter user postgres password 'postgres';
    \q
   exit
   
echo 'export DATABASE_URL=postgres://postgres:postgres@localhost/django_db' >> ~/.bashrc
echo 'export REDIS_URL=redis://localhost:6379' >> ~/.bashrc
```

### install project requirements and reset database
```
git clone YOUR_PROJECT_URL.git
cd YOUR_PROJECT_URL.git
pip3 install -r requirements.txt
otree resetdb
```

### add environment variables
```
echo 'export OTREE_ADMIN_PASSWORD=my_password' >> ~/.bashrc
echo 'export OTREE_PRODUCTION=1' >> ~/.bashrc
echo 'export OTREE_AUTH_LEVEL=DEMO' >> ~/.bashrc
```

### start server
```
sudo -E env "PATH=$PATH" otree prodserver 80
```

### Additional details
- when starting server append & to run as background process
- add static ip

### Connecting to server
Here is a good resource for connecting to access server(putty) and view files(winscp)
https://support.plesk.com/hc/en-us/articles/12377247603223
