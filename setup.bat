SSH Login
http://docs.mongodb.org/manual/tutorial/install-mongodb-on-amazon/
ls
sudo touch /etc/yum.repos.d/mongodb-org-3.0.repo
sudo nano /etc/yum.repos.d/mongodb-org-3.0.repo
write:
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.0/x86_64/
gpgcheck=0
enabled=1

sudo yum install -y mongodb-org


You can specify any available version of MongoDB. However yum will upgrade the packages when a newer version becomes available. To prevent unintended upgrades, pin the package. To pin a package, add the following exclude directive to your /etc/yum.conf file:

sudo nano /etc/yum.conf 
Write:
exclude=mongodb-org,mongodb-org-server,mongodb-org-shell,mongodb-org-mongos,mongodb-org-tools

sudo service mongod start

Verify that MongoDB has started successfully
nano /var/log/mongodb/mongod.log

You can optionally ensure that MongoDB will start following a system reboot by issuing the following command:
sudo chkconfig mongod on



http://stackoverflow.com/questions/27350634/how-to-yum-install-node-js-on-amazon-linux
installing node:

sudo yum install nodejs npm --enablerepo=epel

Sorry version 0.10 node installed


Update needed:
https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

Install git:
sudo yum install git

now install nvm

nvm install v0.12.7
npm install sails -g

Create a www directory:
SSH Login:
cd /var
sudo mkdir www
cd /www

Ownership of this directory:
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html
ls -l /var/www

To set file permissions

Add the www group to your instance.

sudo groupadd www

Add your user (in this case, ec2-user) to the www group.
sudo usermod -a -G www ec2-user

Important
You need to log out and log back in to pick up the new group. You can use the exit command, or close the terminal window.

groups 
see output like this : ec2-user wheel www

Change the group ownership of /var/www and its contents to the www group.
sudo chown -R root:www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type f -exec sudo chmod 0664 {} +
