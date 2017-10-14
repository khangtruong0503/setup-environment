
#!/bin/bash

# NOTE: The commands here only applicable for Ubuntu 16.04 Xenial, do not use it for other distros

# Update server to latest packages
sudo apt update && sudo apt upgrade -y

# Install Fail2Ban: ban IP that login failure
# Reference: https://www.linode.com/docs/security/using-fail2ban-for-security
sudo apt-get install -y fail2ban
# Install Email: support send email to admin
sudo apt-get install -y sendmail
sudo ufw allow ssh
sudo ufw enable -y

# Install nginx and git
sudo apt install -y nginx git

# Install latest NodeJS LTS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt update && sudo apt install -y mongodb-org

# Start mongod service
sudo systemctl start mongod
# Enable mongod service auto restart
sudo systemctl enable mongod

# Install Bower
sudo npm install -g bower

# Install PM2 to manage Node JS Application (keep the app is running when close terminal on server,...)
# Run app with command: pm2 start your-server-file.js
# or: pm2 start npm -- start
sudo npm install pm2 -g

echo "Ubuntu system initialization complete!"
